<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<html>
	<head>
		<title>之江信用</title>
		<base href="${basePath}/" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta name="renderer" content="webkit" />
		<meta name="renderer" content="webkit|ie-comp|ie-stand" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="" />
		<meta http-equiv="description" content="" />
		<script src="${basePath }/js/lib/jquery-1.11.3.min.js"></script>
	</head>
	<body>
		<div id="contentHolder">
			<video id="localVideo" style="width:300px;" autoplay></video>
			<video id="remoteVideo" style="width:200px;" autoplay></video>
		</div>
		<script>
		
			/* function decodeByCamera() {
				var video = document.getElementById("localVideo");
				navigator.getUserMedia
						|| (navigator.getUserMedia = navigator.mozGetUserMedia
								|| navigator.webkitGetUserMedia
								|| navigator.msGetUserMedia);
				if (navigator.getUserMedia) {
					navigator.getUserMedia({
						video : true,
						audio : false
					}, success, onError);
				} else {
					alert('您的浏览器不支持getUserMedia');
				}
				//获取视频流成功！
				function success(stream) {
					if (window.URL) {
						video.src = window.URL.createObjectURL(stream);
					} else {
						video.src = stream;
						console.info(stream);
					}
					video.onloadedmetadata = function(e) {
						$("#info").html(localMediaStream.getVideoTracks());
			            console.log("Label: " + localMediaStream.label);
			            console.log("AudioTracks" , localMediaStream.getAudioTracks());
			            console.log("VideoTracks" , localMediaStream.getVideoTracks());
			        };
					video.autoplay = true;
				}
				//获取视频流失败！
				function onError() {
					console.error('捕获视频失败！');
				}
			} */
			socket = new WebSocket('ws://192.168.108.191:8887');
			socket.onopen = function(event) {
				webRtc();
				//socket.close() 
			};
			
			function webRtc(){
				// 仅仅用于控制哪一端的浏览器发起offer，#号后面有值的一方发起
		        var isCaller = window.location.href.split('#')[1];

		        // 与信令服务器的WebSocket连接

		        // stun和turn服务器
		        var iceServer = {
		            "iceServers": [{
		                "url": "stun:stun.l.google.com:19302"
		            }, {
		                "url": "turn:numb.viagenie.ca",
		                "username": "webrtc@live.com",
		                "credential": "muazkh"
		            }]
		        };

		        // 创建PeerConnection实例 (参数为null则没有iceserver，即使没有stunserver和turnserver，仍可在局域网下通讯)
		        var pc = new webkitRTCPeerConnection(iceServer);

		        // 发送ICE候选到其他客户端
		        pc.onicecandidate = function(event){
		            if (event.candidate !== null) {
		                socket.send(JSON.stringify({
		                    "event": "_ice_candidate",
		                    "data": {
		                        "candidate": event.candidate
		                    }
		                }));
		            }
		        };

		        // 如果检测到媒体流连接到本地，将其绑定到一个video标签上输出
		        pc.onaddstream = function(event){
		            document.getElementById('remoteVideo').src = URL.createObjectURL(event.stream);
		        };

		        // 发送offer和answer的函数，发送本地session描述
		        var sendOfferFn = function(desc){
		            pc.setLocalDescription(desc);
		            socket.send(JSON.stringify({ 
		                "event": "_offer",
		                "data": {
		                    "sdp": desc
		                }
		            }));
		        },
		        sendAnswerFn = function(desc){
		            pc.setLocalDescription(desc);
		            socket.send(JSON.stringify({
		                "event": "_answer",
		                "data": {
		                    "sdp": desc
		                }
		            }));
		        };

		        // 获取本地音频和视频流
		        navigator.webkitGetUserMedia({
		            "audio": true,
		            "video": true
		        }, function(stream){
			        console.info(stream)
		            //绑定本地媒体流到video标签用于输出
		            document.getElementById('localVideo').src = URL.createObjectURL(stream);
		            //向PeerConnection中加入需要发送的流
		            pc.addStream(stream);
		            //如果是发起方则发送一个offer信令
		            if(isCaller){
		                pc.createOffer(sendOfferFn, function (error) {
		                    console.log('Failure callback: ' + error);
		                });
		            }
		        }, function(error){
		            //处理媒体流创建失败错误
		            console.log('getUserMedia error: ' + error);
		        });

		        //处理到来的信令
		        socket.onmessage = function(event){
	            	var json = JSON.parse(event.data);
		            console.log('onmessage: ', event);
		            //如果是一个ICE的候选，则将其加入到PeerConnection中，否则设定对方的session描述为传递过来的描述
		            if( json.event === "_ice_candidate" ){
		                pc.addIceCandidate(new RTCIceCandidate(json.data.candidate));
		            } else {
		                pc.setRemoteDescription(new RTCSessionDescription(json.data.sdp));
		                // 如果是一个offer，那么需要回复一个answer
		                if(json.event === "_offer") {
		                    pc.createAnswer(sendAnswerFn, function (error) {
		                        console.`log('Failure callback: ' + error);
		                    });
		                }
		            }
		        };
				
			}
		</script>
	</body>
</html>
