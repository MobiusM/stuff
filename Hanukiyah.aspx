<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Hanukiyah.aspx.cs" Inherits="End.Hanukiyah" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <script type ="text/javascript" language ="javascript">
      var str;

      function start() {
          var day = prompt("Enter the number of the candles to light: ");
          var integer = parseInt(day);
          switch (integer) {
              case 0: pic.src = "pics/Hanukiyah0.gif"; break;
              case 1: pic.src = "pics/Hanukiyah1.gif"; break;
              case 2: pic.src = "pics/Hanukiyah2.gif"; break;
              case 3: pic.src = "pics/Hanukiyah3.gif"; break;
              case 4: pic.src = "pics/Hanukiyah4.gif"; break;
              case 5: pic.src = "pics/Hanukiyah5.gif"; break;
              case 6: pic.src = "pics/Hanukiyah6.gif"; break;
              case 7: pic.src = "pics/Hanukiyah7.gif"; break;
              case 8: pic.src = "pics/Hanukiyah8.gif"; break;
              default: pic.src = "pics/Hanukiyah0.gif"; break;
          }
      }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <br /><br />
        <img
            src ="pics/Hanukiyah0.gif"
            name ="pic"    
            alt = "hanukiyah"
            style ="height : 400px;"
            onclick ="start()"
        />
</asp:Content>
