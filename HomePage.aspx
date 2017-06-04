<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="End.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Home Page</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1 style="font-family : FangSong; font-style:italic; color:Blue;">Written By Eran Shufaro</h1>
    <table>
        <tr>
            <td>
                <span style="font-family : FangSong; font-style: italic; color : Navy; font-size: 250%;">A little about me:</span>
                <br /><br /><br />
                17 years old from Jerusalem, Israel
                <br />
                Likes Programming, Gaming and hanging out with friends
                <br /><br />
                <b><span style="color : Red;">Final Project in Computer Science</span></b>
            
            </td>
        </tr>
            
        <tr>
            <td>
                <img src="pics/matrix.gif" alt="matrix"/>
            </td>
        </tr>
    </table>
</asp:Content>
