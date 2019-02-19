<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="SQL_Binding_UI_Test.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>EMT Movement</h3>
    <p>Use this area to provide additional information.</p>
    <div>
        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
        <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
    </div>
    <br>
</asp:Content>
