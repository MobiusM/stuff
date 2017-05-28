<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="End.Gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type ="text/javascript" language="javascript">

        function showPic(pic) {
            document.getElementById("bigPic").src = pic.src;
        }
    </script>

    <style type="text/css">
        .picture
        {
            height : 90px;
            width : 160px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <table>
        <!------Row #1-------->
        <tr>
            <td><img src ="pics/cat.jpg" alt="cat" onmouseover = "showPic(this)" class ="picture"/></td>
            <td><img src ="pics/rainbow.jpg" alt="rainbow" onmouseover = "showPic(this)" class ="picture"/></td>
            <td><img src ="pics/sunset.jpg" alt="sunset" onmouseover = "showPic(this)" class ="picture"/></td>
            <td><img src ="pics/pokemon.png" alt="pokemon" onmouseover = "showPic(this)" class ="picture"/></td>
        </tr>

        <!------Row #2-------->
        <tr>
            <td><img src ="pics/earth.jpg" alt="cat" onmouseover = "showPic(this)" class ="picture"/></td>
            <td rowspan ="2" colspan ="2"><img id ="bigPic" src="pics/earth.jpg" alt="bigPic" width ="320px" height ="180px"/></td>
            <td class ="picture"><img src ="pics/bridge.jpg" alt="cat" onmouseover = "showPic(this)" class ="picture" /></td>
        </tr>

        <!------Row #3-------->
        <tr>
            <td><img class ="picture" alt="dragon" src="pics/dragon.jpg" onmouseover="showPic(this)"/></td>
            <td class ="picture"><img class ="picture" alt="tiger" src="pics/tiger.jpg" onmouseover="showPic(this)"/></td>
        </tr>

        <!------Row #4-------->
        <tr>
            <td><img class ="picture" alt ="rubik" src="pics/rubik.jpg" onmouseover="showPic(this)"/></td>
            <td><img class ="picture" alt ="car" src="pics/car.jpg" onmouseover="showPic(this)"/></td>
            <td><img class ="picture" alt ="lamborghini" src="pics/lamborghini.jpg" onmouseover="showPic(this)"/></td>
            <td><img class ="picture" alt ="special" src="pics/special.jpg" onmouseover="showPic(this)"/></td>
        </tr>
    </table>
</asp:Content>
