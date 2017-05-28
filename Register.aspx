<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="End.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Register</title>
    <script type="text/javascript">
        
        function testForm() 
        {
            deleteAllErrors();
            return testUsername() && testPassword() && testConfirmPassword() && testFirstName() && testLastName() && testEmail() && testBirthDay() && testHobbies() && testPhone();
        }

        function testUsername() 
        {
            var username = document.getElementById("Username").value;
            if (username.length < 2) 
            {
                document.getElementById("UsernameError").innerHTML = "Too short username";
                return false;
            }
            return true;
        }

        function testPassword()
        {
            if(document.getElementById("Password").value == "")
            {
                document.getElementById("PasswordError").innerHTML = "No password Entered";
                return false;
            }
            return true;
        }

        function testConfirmPassword() 
        {
            if(document.getElementById("Password").value != document.getElementById("ConfirmPassword").value)
            {
                document.getElementById("ConfirmPasswordError").innerHTML = "Password not comfirmed";
                return false;
            }
            return true;
        }

        function testFirstName()
        {
            if(document.getElementById("Firstname").value == "")
            {
                document.getElementById("FirstnameError").innerHTML = "Invalid First name";
                return false;
            }
            return true;
        }

        function testLastName()
        {
            if(document.getElementById("Lastname").value == "")
            {
                document.getElementById("LastnameError").innerHTML = "Invalid Last name";
                return false;
            }
            return true;
        }

        function testEmail() 
        {
            var re = /\S+@\S+\.\S+/;
            if (re.test(document.getElementById("Email").value)) 
            {
                return true;
            }
            document.getElementById("EmailError").innerHTML = "Invalid email";
            return false;
        }

        function testBirthDay() 
        {
            var day = document.getElementById("Day").value;
            var year = document.getElementById("Year").value;
            if (isNaN(day) || isNaN(year) || day == "" || year == "" || parseInt(day) > 31 || parseInt(day) < 0) 
            {
                document.getElementById("BirthdayError").innerHTML = "Invalid year/date";
                return false;
            }
            var month = document.getElementById("Month");
            if (month.selectedIndex == 0) {
                document.getElementById("BirthdayError").innerHTML = "No month was chosen";
                return false;
            }
            return true;
        }

        function testHobbies() {
            var hobbies = document.getElementsByName("Hobbies");
            var testHobbies = false;

            for (var i = 0; i < hobbies.length; i++) {
                if (hobbies[i].checked) {
                    testHobbies = true;
                }
            }

            if (!testHobbies) {
                document.getElementById("HobbiesError").innerHTML = "No hobbies were selected";
                return false;
            }
            else
                return true;

        }

        function testPhone() 
        {
            var prefix = document.getElementById("Prefix");
            var number = document.getElementById("Phone").value;
            if (prefix.selectedIndex == 0 || isNaN(number) || number.length != 7) 
            {
                document.getElementById("PhoneError").innerHTML = "Invalid phone number";
                return false;
            }
            return true;
        }
        function deleteAllErrors() 
        {
            document.getElementById("UsernameError").innerHTML = "";
            document.getElementById("PasswordError").innerHTML = "";
            document.getElementById("ConfirmPasswordError").innerHTML = "";
            document.getElementById("FirstnameError").innerHTML = "";
            document.getElementById("LastnameError").innerHTML = "";
            document.getElementById("EmailError").innerHTML = "";
            document.getElementById("BirthdayError").innerHTML = "";
            document.getElementById("HobbiesError").innerHTML = "";
            document.getElementById("PhoneError").innerHTML = "";
        }
    
    </script>
    <style type="text/css">
        .formCell
        {
            height : 25px;
            width : 100px;
            border : 1px double red;
            text-align : center;   
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1 style="color : Red;">Register</h1>
    <% =str %>
    <form method="post" runat="server" onsubmit="return testForm()">
        <table style = "border : 1px solid black;">
            <tr>
                <!---Username--->
                <td class = "formCell">
                    Choose a Username: <input type="text" name="Username" id="Username"/>
                </td>
                <td class ="formCell">
                    <div id="UsernameError"></div>
                </td>
            </tr>
        
            <tr>
                <!-----Password------>
                <td class="formCell">
                    Choose a Password: <input type="text" name="Password" id="Password"/>
                </td>
                <td class="formCell">
                    <div id="PasswordError"></div>
                </td>
            </tr>
        
            <tr>
                <!------Confirm password-------->
                <td class="formCell">
                    Re-enter your Password: <input type="text" id="ConfirmPassword"/>
                </td>
                <td class="formCell">
                    <div id="ConfirmPasswordError"></div>
                </td>
            </tr>

            <tr>
                <!--First name--->
                <td class="formCell">
                    Enter Your first name: <input type="text" id="Firstname" name = "Firstname"/>
                </td>
                <td class="formCell">
                    <div id="FirstnameError"></div>
                </td>
            </tr>

            <tr>
                <!----Last name----->
                <td class="formCell">
                    Enter Your last name: <input type="text" id="Lastname" name="Lastname"/>
                </td>
                <td class="formCell">
                    <div id="LastnameError"></div>
                </td>
            </tr>

            <tr>
                <!-----Email----->
                <td class="formCell">
                    Enter Your Email: <input type="text" id="Email" name="Email"/>
                </td>
                <td class="formCell">
                    <div id="EmailError"></div>
                </td>
            </tr>

            <tr>
                <!---Birthday--->
                <td class="formCell">
                    Enter Your Birthday: <br />
                    <input type="text" id="Day" name="Day" style="width : 25px;"/>
                    <select id="Month" name="Month">
                        <option value="Month">Month</option>
                        <option value = "1">January</option>
                        <option value = "2">February</option>
                        <option value = "3">March</option>
                        <option value = "4">April</option>
                        <option value = "5">May</option>
                        <option value = "6">June</option>
                        <option value = "7">July</option>
                        <option value = "8">August</option>
                        <option value = "9">September</option>
                        <option value = "10">October</option>
                        <option value = "11">November</option>
                        <option value = "12">December</option>
                    </select>
                    <input type="text" id="Year" name="Year" style = "width : 40px;"/>
                </td>
                <td class="formCell">
                    <div id="BirthdayError"></div>
                </td>
            </tr>
            <tr>
                <!----Hobbies----->
                <td class="formCell">
                    Choose Your Hobbies:<br />
                    <input type="checkbox" value="Football" name="Hobbies"/>Football
                    <input type="checkbox" value ="Basketball" name="Hobbies"/>Basketball<br />
                    <input type="checkbox" value="Dancing" name="Hobbies"/>Dancing
                    <input type="checkbox" value="Computers" name="Hobbies"/>Computers<br />
                </td>
                <td class="formCell">
                    <div id="HobbiesError"></div>
                </td>
            </tr>
            <tr>
                <!----Phone Number---->
                <td class="formCell">
                    Enter Your Phone:<br />
                    <select name="Prefix" id="Prefix">
                        <option>Prefix</option>
                        <option value="050">050</option>
                        <option value="052">052</option>
                        <option value="053">053</option>
                        <option value="054">054</option>
                        <option value="055">055</option>
                        <option value="058">058</option>
                    </select>
                    <input type="text" id="Phone" name="Phone" style="width : 90px;"/>
                </td>
                <td class="formCell">
                    <div id="PhoneError"></div>
                </td>
            </tr>
            <tr>
                <td class="formCell" colspan="2">
                    Choose Your Gender:<br />
                    <input type="radio" value="Male" checked="checked" name="Gender"/>Male
                    <input type="radio" value="Female" name="Gender"/>Female
                </td>
            
            </tr>
        </table>
        <br />
        <input type="submit" name="submit" value="Register"/>
    </form>
</asp:Content>
