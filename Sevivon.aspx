<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Sevivon.aspx.cs" Inherits="End.Sevivon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type ="text/javascript" language ="javascript">
         var spin0 = "pics/spinNG.png";
         var spin1 = "pics/spinGH.png";
         var spin2 = "pics/spinHP.png";
         var spin3 = "pics/spinPN.png";

         setInterval(start, 500);

         function show(str) {
             pic.src = str;
         }

         var i = 1;

         function start() {
             j = i % 4;
             switch (j) {
                 case 0: show(spin0); break;
                 case 1: show(spin1); break;
                 case 2: show(spin2); break;
                 case 3: show(spin3); break;
             }
             i++;
         }
   </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <img src = "pics/spinNG.png" name ="pic" alt ="spinner" />
</asp:Content>
