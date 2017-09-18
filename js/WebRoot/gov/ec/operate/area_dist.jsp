<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="protect" name="operate1" mark="operate">
    <div class="protect-distrib">
        <div class="protect-pad">
            <div class="gk-line">
                <p class="mbc_title">
                    <em class="mbc_line"></em>
                    <span class="mbc_title_warp"><em class="font_f_1">本省店铺区域分布<i></i></em></span>
                </p>
            </div>
            <div class="analysis analysis-bottom">
                <h4>本省B店、C店区域分布情况:</h4>

                <div class="distrib" style="padding-top:0;">
                    <div class="distrib-tb">
                        <table cellpadding="0" cellspacing="0" border="0" class="distrib-new-table">
                            <tr>
                                <th class="dt1"></th>
                                <th class="dt2"></th>
                                <th class="dt3 dt3-blue">交易额</th>
                                <th class="dt3 dt3-green">店铺数量</th>
                            </tr>
                            <tr>
                                <td class="dt1"><input name="checkShopType" type="radio" checked value="1"
                                                       id="Bstore"/></td>
                                <td class="dt2">B店</td>
                               <td class="dt3"><span class="s-blue" id="BAmount">?</span>亿元</td>
                                <td class="dt3"><span class="s-green" id="BQuantity">?</span>家</td>
                            </tr>
                            <tr>
                                <td class="dt1"><input name="checkShopType" type="radio" value="2" id="Cstore"/>
                                </td>
                                <td class="dt2">C店</td>
                                <td class="dt3"><span class="s-blue" id="CAmount">?</span>亿元</td>
                                <td class="dt3"><span class="s-green" id="CQuantity">?</span>家</td>
                            </tr>
                            <tr>
                                <td class="dt1"><input name="checkShopType" type="radio" value="3"
                                                       id="independentEcommerce"/></td>
                                <td class="dt2">独立电商</td>
                                <td class="dt3"><span class="s-blue">?</span>亿元</td>
                                <td class="dt3"><span class="s-green" id="independentQuantity">?</span>家</td>
                            </tr>
                        </table>
                    </div>
                    <div class="distrib-tb">
                        <div class="distrib-tb-pad">

                            <div id="shopZhejiangMap" style="width: 500px;height:400px;"></div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>