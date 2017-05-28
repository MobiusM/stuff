<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="End.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function testForm() 
        {
            var category1 = document.getElementById("category1");
            var category2 = document.getElementById("category2");
            if (category1.selectedIndex == 0 || category2.selectedIndex == 0) 
            {
                alert("Catagories weren't selected");
                return false;
            }
            var value1 = document.getElementById("firstCategoryValue").value;
            var value2 = document.getElementById("secondCategoryValue").value;
            return testCategory(category1, value1) && testCategory(category2, value2);
        }

        function testCategory(category, value) 
        {
            if (value == "") 
            {
                alert("Empty input");
                return false;
            }
            var categoriesForBoolean = ["Gender", "Football", "Basketball", "Dancing", "Computers"];
            var categoriesForInt = ["Day", "Month", "Year", "Prefix", "Phone"];
            var chosen = category.options[category.selectedIndex].value;

            if (categoriesForInt.indexOf(chosen) != -1) 
            {
                if (isNaN(value)) 
                {

                    alert("Invalid number");
                    return false;
                }
            }

            else if (categoriesForBoolean.indexOf(chosen) != -1) 
            {
                var listOfBooleans = ['true', 'false', 'True', 'False', 'TRUE', 'FALSE'];
                if (listOfBooleans.indexOf(value) == -1)
                {
                    alert("Invalid boolean value");
                    return false;
                }
            }

            return true;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <% = result %><br />
    <b><% = question %></b>
    <% = str %>

</asp:Content>
