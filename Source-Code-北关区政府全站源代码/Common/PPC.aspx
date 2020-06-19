<%@ page language="C#" autoeventwireup="true" inherits="Common_Ppc, App_Web_rjy0ij2p" masterpagefile="~/Common/Master/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>多级选择</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="three_div" runat="server" visible="true">
<script type="text/javascript" src="http://code.zoomla.cn/Area.js"></script><!--http://code.zoomla.cn/Area.js-->
	<select id="tbProvince"></select>
	<select id="tbCity"></select>
	<select ID="tbCounty"></select>
    <script type="text/javascript">
        $().ready(function () {
            var pcc = new ZL_PCC("tbProvince", "tbCity", "tbCounty");
            $("#address").val('<%=Request.QueryString["FValue"] %>');
            if ($("#address").val() != "") {
                var defdata = $("#address").val().split(',');
                pcc.SetDef(defdata[0], defdata[1], defdata[2]);
            }
            pcc.ProvinceInit();
            $("select").change(function () {
                parent.SetCitys('<%=Request.QueryString["FieldName"] %>', $("#tbProvince").val() + ',' + $("#tbCity").val() + ',' + $("#tbCounty").val())
        });
        });
</script>
</div>
<div id="four_div" runat="server" visible="false">
    <script type="text/javascript" src="http://code.zoomla.cn/four.js"></script>
    <select id="tbProvince"></select>
	<select id="tbCity"></select>
	<select ID="tbCounty"></select>
    <select id="tbSTown"></select>
     <script type="text/javascript">
         $().ready(function () {
             var pcc = new ZL_PCC("tbProvince", "tbCity", "tbCounty", "tbSTown");
             $("#address").val('<%=Request.QueryString["FValue"] %>');
             if ($("#address").val() != "") {
                 var defdata = $("#address").val().split(',');
                 pcc.SetDef(defdata[0], defdata[1], defdata[2], defdata[3]);
             }
             pcc.ProvinceInit();
             $("select").change(function () {
                 parent.SetCitys('<%=Request.QueryString["FieldName"] %>', $("#tbProvince").val() + ',' + $("#tbCity").val() + ',' + $("#tbCounty").val() + ',' + $("#tbSTown").val())
             });
         });
</script>
</div>
<input id="address" runat="server" type="hidden" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <script type="text/javascript" src="/JS/Controls/ZL_PCC.js"></script>
</asp:Content>
