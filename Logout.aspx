<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs"  Inherits="End.Logout"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1 style="color: Red; font-size : 300%;">You have been logged out</h1><br />
    <a href="HomePage.aspx">Back to Home Page</a><br />
    <a href="Login.aspx">Login</a>
</asp:Content>
