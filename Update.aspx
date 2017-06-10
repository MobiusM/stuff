<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="End.Update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .cellStyle
        {
            border: 1px double red;
            width : 300px;
        }
    
    </style>
    
    <script type="text/javascript">

        function testForm() {
            var checkers = document.getElementsByName("Changes");
            var isCheck = false;

            for (var i = 0; i < checkers.length; i++) {
                if (checkers[i].checked) {
                    isCheck = true;
                }
            }

            if (!isCheck) {
                // No option chosen
                alert("No category was chosen");
                return false;
            }
            
            // Check Passowrd
            if (checkers[0].checked) {
                // The user wants to change the password
                var password = document.getElementById("Password").value;
                var confirm = document.getElementById("confirmPassword").value;
                
                if (password != confirm || password.length <= 2) {
                    alert("Passwords don't match or too short");
                    return false;
                }
            }


            // Check Email
            if (checkers[1].checked) {
                // The user wants to change the email
                var email = document.getElementById("Email").value;
                
                var re = /\S+@\S+\.\S+/;
                if (!re.test(email)) {
                    alert("Invalid Email");
                    return false;
                }
            }
      
            

            // Test phone
            if (checkers[3].checked) {
                // The user wants to change the phone
                var prefix = document.getElementById("Prefix").selectedIndex;
                var phone = document.getElementById("Phone").value;

                if (prefix == 0) {
                    alert("Prefix not chosen");
                    return false;
                }

                if (isNaN(phone) || phone.length != 7) {
                    alert("Invalid phone number");
                    return false;
                }
            }

            // Test first name
            if (checkers[4].checked) 
            {
                // The user wants to change the first name
                var firstName = document.getElementById("firstName").value;
                if (firstName.length <= 2) {
                    alert("Invalid First name");
                    return false;
                }
            }

            if (checkers[5].checked) {
                // The user wants to change the last name
                var lastName = document.getElementById("lastName").value;
                if (lastName.length <= 2) {
                    alert("Invalid Last name");
                    return false;
                }
            }
            // Username
            if (checkers[6].checked) {
                var username = document.getElementById("Username").value;
                if (username.length <= 2) {
                    alert("Too short username");
                    return false;
                }
            }

            // Birthday
            if (checkers[7].checked) {
                var dayObj = document.getElementById("Day");
                day = dayObj.options[dayObj.selectedIndex].value;
                var year = document.getElementById("Year").value;
                if (isNaN(day)) {
                    alert("Invalid birthday");
                    return false;
                }

                day = parseInt(day);
                if (day < 1 || day > 31) {
                    alert("Invalid birthday");
                    return false;
                }

                if (isNaN(year) || year == "") {
                    alert("Invalid birthday");
                    return false;
                }
            }
            return true;
        }
    
    </script>
    <script runat="server">
        
    
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <% =showDetails %>
    <% = showForm %>
    <% = result %>
</asp:Content>
