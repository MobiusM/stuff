<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="End.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function changeInputMethod(id) 
        {
            var toChange = ["Month", "Prefix"];
            var select = document.getElementById(id); // Get the relevant select
            var category = document.getElementById(id == "category1" ? "category1" : "category2");
            var temp = document.getElementById(id == "category1" ? "firstCategoryValue" : "secondCategoryValue");
            var newList = document.createElement("select");

            if (category.options[category.selectedIndex].value == "Month" || category.options[category.selectedIndex].value == "Prefix" || category.options[category.selectedIndex].value == "Day") {
                var prefixOptions = ["050", "052", "053", "054", "055", "058"];
                var monthOptions = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"];
                var dayOptions = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"];
                
                var options = category.options[category.selectedIndex].value == "Month" ? monthOptions : prefixOptions;
                if (category.options[category.selectedIndex].value == "Day")
                    options = dayOptions;
                for (var i = 0; i < options.length; i++) {
                    var option = document.createElement("option");
                    option.value = options[i];
                    option.text = options[i];
                    if (i == 0) {
                        option.setAttribute("selected", "selected");
                    }
                    newList.appendChild(option);
                }
                newList.id = id == "category1" ? "firstCategoryValue" : "secondCategoryValue";
                newList.setAttribute("name", id == "category1" ? "firstCategoryValue" : "secondCategoryValue");
                temp.parentNode.replaceChild(newList, temp);
            }

            else if (category.options[category.selectedIndex].value == 'Gender') {
                var option1 = document.createElement("option");
                option1.value = "True";
                option1.text = "Male";

                var option2 = document.createElement("option");
                option2.value = "False";
                option2.text = "Female";
                
                
                newList.appendChild(option1);
                newList.appendChild(option2);

                newList.id = id == "category1" ? "firstCategoryValue" : "secondCategoryValue";
                newList.setAttribute("name", id == "category1" ? "firstCategoryValue" : "secondCategoryValue");
                temp.parentNode.replaceChild(newList, temp);
            }
            else {
                temp = document.getElementById(id == "category1" ? "firstCategoryValue" : "secondCategoryValue");
                var newTemp = document.createElement("input");
                newTemp.setAttribute("type", "text");
                newTemp.setAttribute("name", id == "category1" ? "firstCategoryValue" : "secondCategoryValue");
                newTemp.setAttribute("id", id == "category1" ? "firstCategoryValue" : "secondCategoryValue");
                temp.parentNode.replaceChild(newTemp, temp);
            }
            
        }
        function testForm() 
        {
            var category1 = document.getElementById("category1");
            var category2 = document.getElementById("category2");

            if (category1.selectedIndex == 0 || category2.selectedIndex == 0) 
            {
                alert("Catagories weren't selected");
                return false;
            }

            var value1 = document.getElementsByName("firstCategoryValue");
            var value2 = document.getElementsByName("secondCategoryValue");

            if (value1.tagName.toLowerCase() == "select") {
                value1 = value1.options[value1.selectedIndex];
            }
            else {
                value1 = value1.value;
            }

            if (value2.tagName.toLowerCase() == "select") {
                value2 = value2.options[value2.selectedIndex];
            }
            else {
                value2 = value2.value;
            }
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
