<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="MultipicationBoard.aspx.cs" Inherits="End.MultipicationBoard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
        .MultipicationBoardTable
        {
            border-style : double;
            border-color : black;
            padding : 6px;
        }

        .MultipicationBoardCell
        {
            border-style : solid;
            border-color : black;
            border-width : medium;
            font-size : 35px;
            text-align : center;
            padding : 4px;
            font-family : FangSong;
        }

    </style>
    <script type="text/javascript">
    function testForm()
    {
        if (isNaN(document.getElementById("num").value))
        {
            alert("Invalid number");
            return false;
        }
        return true;
    }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1 style= "font-family : FangFong; font-size : 20px; font-style :italic; color : Red;">Multipication Board</h1>
    <form runat="server" method="post" onsubmit="return testForm()">
        <input type = "text" id = "num" name="num"/><div></div>
        <br />
        <input type="submit" name="submit" value="Multiply!"/>
    </form>
    <% = tableStr%>
</asp:Content>
