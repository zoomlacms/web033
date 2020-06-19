<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.ShowMessage, App_Web_thnd4tca" enableviewstatemac="false" masterpagefile="~/Common/Master/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>信息提示</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="popup"> 
        <div class="popup_title text-center"><i class="fa fa-dollar"></i><asp:Label ID="LblMessageTitle" runat="server" Text="信息提示"></asp:Label></div>
        <div class="popup_cnt"><asp:Literal ID="LtrMessage" runat="server"></asp:Literal></div>
            <div class="popup_goon text-center"><asp:LinkButton ID="Link1"  OnClick="Link1_Click1" runat="server" Text="确定"></asp:LinkButton></div>
            <div class="popup_return">
                <ul class="list-inline pull-right">
                    <li><asp:HyperLink ID="LnkReturnUrl" runat="server"><i class="fa fa-arrow-circle-left"></i>返回上一页</asp:HyperLink></li>
                    <li><a href="/"><i class="fa fa-home"></i>首页</a></li>
                    <li><a href="/User/"><i class="fa fa-user"></i>会员中心</a></li>
                    </ul>
                </div>
            <div class="clearfix"></div>
        </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <link type="text/css" rel="stylesheet" href="/App_Themes/User.css" />
</asp:Content>