<%@ page language="C#" autoeventwireup="true" inherits="manage_Config_ViewList, App_Web_rfihykcf" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %> 
<%@ Register Src="~/Manage/I/ASCX/SPwd.ascx" TagPrefix="uc1" TagName="SPwd" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
        <title>视图列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
        <uc1:SPwd runat="server" ID="SPwd" Visible="false" />
    <div id="maindiv" runat="server" visible="false">
    <table class="table table-striped table-bordered table-hover">
        <tr class="tdbg" align="center" colspan="2">
            <td width="5%" class="title">全选
            </td>
            <td width="73%" align="left" valign="middle" class="spacingtitle">视图名称</td>
            <td width="20%" align="center" valign="middle" class="spacingtitle">操作</td>
        </tr>
        <ZL:ExRepeater ID="RPT" runat="server" OnItemDataBound="Repeater2_ItemDataBound" OnItemCommand="Repeater2_ItemCommand" PagePre="<tr><td colspan='3' class='text-center'><input type='checkbox' id='CheckAll' />" PageEnd="</td></tr>">
            <ItemTemplate>
                <tr>
                    <td height="22" align="center">
                        <input name="Item" type="checkbox" value='<%# Eval("ViewName")%>' />
                    </td>
                    <td align="left">
                        <%#Eval("ViewName") %>
                        <input type="hidden" runat="server" id="tN" value='<%#Eval("ViewName") %>' />
                    </td>
                    <td align="center">
                        <a href="ViewInfo.aspx?ViewName=<%#Eval("ViewName") %>">查看</a>
                        <a href="CreateView.aspx?ViewName=<%#Eval("ViewName") %>">编辑</a>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Del" OnClientClick="return confirm('你确认要删除该视图吗？')">删除</asp:LinkButton>
                    </td>

                </tr>
            </ItemTemplate>
            <FooterTemplate></FooterTemplate>
        </ZL:ExRepeater>
    </table>
    <asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" />全选
        <asp:Button ID="Button3" class="btn btn-primary" runat="server" OnClientClick="return confirm('此操作将删除现有站点数据，确认？');" Text="批量删除" OnClick="Button3_Click" />
    <%--<table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td align="center" class="title" style="width:25%">
                    <span class="tdbgleft">序号</span>
                </td>
                <td align="center" class="title" style="width:45%">
                    <span class="tdbgleft">视图名</span>
                </td>
                <td align="center" class="title" style="width:30%">
                    <span class="tdbgleft">操作</span>
                </td>
            </tr>
        </table>--%>
        </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function CheckAll(spanChk) {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++) if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                if (elm[i].checked != xState)
                    elm[i].click();
            }
        }
</script>
</asp:Content>