<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="End.Cars" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
<center><h1 style = "color : Black;">Welcome to <span style = "font-family : Bodoni MT Black;color : Aqua;">
    <a href = "SpecialCars.aspx">my Cars </a></span>website!</h1></center>

<!-------------תוכן הדף--------------->
<p style = "color : Black; font-size : 200%; font-family : FangSong;">
We have <span style = "font-family : Fantasy; color : Lime; font-style : italic;">fast</span> cars and <span style = "font-family : Cooper Black; color : Lime; font-style : italic;">slow</span> Cars<br />
We have <span style = "color : Red;">red </span>cars and <span style = "color :Blue;">blue</span> cars<br />
We have <span style = "font-size : 150%;">BIG </span>cars and <span style = "font-size : 62.5%;">small </span>cars<br />
And all of them are<span style = "font-size : 125%;"> Great!</span>
</p>

<br />

<center><h1>I hope You'll find the right car for you !</h1></center>
<center><h2 style = "color :Black;">We have <a href = "Toyota.aspx">Toyota</a> and <a href = "Honda.aspx">Honda</a> Cars</h2></center>

<center> <img src = "pics\speedy.jpg" height = "150px"/> <img src = "pics\ferrari.jpg" height = "150px"/> <img src = "pics\racing.jpg" height = "150px"/> <img src = "pics\lamborghini.jpg" height = "150px"/></center>
</asp:Content>
