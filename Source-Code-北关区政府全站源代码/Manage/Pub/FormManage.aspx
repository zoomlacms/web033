<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Pub_FormManage, App_Web_nsadxgpt" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>互动表单管理</title>
    <style>
        #AllID_Chk{display:none;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
      <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False" 
                CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" 
                OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" >
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="PubID"/>
                    <asp:TemplateField HeaderText="表单名">
                        <ItemTemplate><a href="FormDesign.aspx?ID=<%#Eval("PubID") %>" target="_blank"><%#Eval("PubName") %></a></ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="数据表" DataField="PubTableName" />
                    <asp:BoundField HeaderText="创建时间" DataField="PubCreateTime" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandName="Del2" CommandArgument='<%#Eval("PubID") %>' OnClientClick="return confirm('你确定要删除吗!');" ToolTip="删除" CssClass="option_style"><i class="fa fa-trash-o" title="删除"></i></asp:LinkButton>
                            <a href="Pubinfo.aspx?menu=edit&ID=<%#Eval("PubID") %>" title="修改配置" class="option_style"><i class="fa fa-gear" title="配置"></i>配置</a>
                            <a href="FormDesign.aspx?ID=<%#Eval("PubID") %>" target="_blank" title="设计表单" class="option_style"><i class="fa fa-pencil-square-o" title="设计"></i>设计</a>
                            <a href="/Rss/FormView.aspx?Pid=<%#Eval("PubID") %>" target="_blank" title="前台浏览"  class="option_style"><%#lang.LF("<i class='fa fa-globe'></i>浏览")%></a>
                            <a href="FormResult.aspx?ID=<%#Eval("PubID") %>" title="查看统计"  class="option_style"><i class="fa fa-pie-chart" title="统计"></i>统计</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                   </Columns>
                    <PagerStyle HorizontalAlign="Center" />
                    <RowStyle Height="24px" HorizontalAlign="Center"  />
            </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

    <script>
        $("body").ready(function () {
            $("#EGV").find("tr").dblclick(function () {
                var id = $(this).children().first().text();
                window.location = "Pubinfo.aspx?menu=edit&ID=" + id;
            });
        });
    </script>
</asp:Content>