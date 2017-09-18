<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="utn.uzj.config.SysCfg" %>
<%
String basePath = request.getContextPath();
request.setAttribute("basePath",basePath);

SysCfg sysCfg=SysCfg.getInstance();
request.setAttribute("domain",sysCfg.domain);
request.setAttribute("domainName",sysCfg.domainName);
request.setAttribute("icp",sysCfg.icp);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%--<c:set var="companyDetailUrl" value="${basePath }${'/company_info_companyNo'}${'.html'}"></c:set>--%>
<c:set var="companyDetailUrl" value="${basePath }${'/company/professionalInfo?s=companyNo' }"></c:set>
<c:set var="govCompanyDetailUrl" value="${basePath }${'/gov/company/professionalInfo?s=companyNo' }"></c:set>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
