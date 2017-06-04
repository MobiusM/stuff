<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Toyota.aspx.cs"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
<span style = "color : Red; font-size : 50; font-style : Italic">Toyota</span>
<br />
<center><img src = "../pics/toyota_logo.png" height = "175px"\></center>

<center><span style = "color : Blue; font-size : 125%;">We sell</span> <span style = "font-style : Italic">Toyota</span> cars</center>

<center><img src = "pics/auris.jpg" height = "175px"\> <img src = "../pics/corolla.jpg" height = "175px"\> <img src = "pics/prius.png" height = "175px"\></center>
<br />

<center><a href = "Cars.aspx"\>חזרה לאתר הראשי</a> <a href = "Honda.aspx">Honda</a> <a href = "SpecialCars.aspx">Cars</a> </center>
</asp:Content>
