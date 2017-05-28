<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="End.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>
        Login
    </title>
    <script type="text/javascript">

        function testForm() {
            var username = document.getElementById("username");
            var password = document.getElementById("password");

            if (username.value == "") 
            {
                alert("You haven't written a username");
                return false;
            }

            if (password.value == "") 
            {
                alert("You haven't written a password");
                return false;
            }
            return true;
        }    
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1 style="color : Red;">Login</h1>
    <form onsubmit = "return testForm()" runat="server" >
        Insert username: <input type="text" id="username" name="username"/><br />
        Insert password: <input type="text" id="password" name="password"/><br />
        <input type="submit" name="submit" value="Login"/><br />
    </form>
    <% = str%>
</asp:Content>
