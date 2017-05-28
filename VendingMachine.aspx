<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="VendingMachine.aspx.cs" Inherits="End.VendingMachine" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" language="javascript">

        // Script for Vending Machine
        function deleteText(element) {
            element.value = "";
        }

        // Main script function
        function machine() {
            // Erase the previous machine output
            document.getElementById("machineOutput").innerHTML = "";

            // Test if the product ID is valid
            var productName = parseInt(document.getElementById("productName").value);
            switch (productName) {
                case 1:
                    // Price is 6.00
                    printDescription(6);
                    break;
                case 2:
                    // Price is 5.00
                    printDescription(5);
                    break;

                case 3:
                    // Price is 6.80
                    printDescription(6.8);
                    break;
                case 4:
                    // Price is 4.30
                    printDescription(4.3);
                    break;
                case 5:
                    // Price is 7.50
                    printDescription(7.50);
                    break;
                default:
                    // Unknown ID
                    document.getElementById("machineOutput").innerHTML = "מספר מוצר לא מזוהה";
                    break;
            }

            function printDescription(price) {
                // Testing what was entered in "money" input tag and the price for the specific products
                // Chooses what to print to the user

                var money = document.getElementById("money").value;
                if (money <= 0 || isNaN(money)) {
                    document.getElementById("machineOutput").innerHTML = "סכום כסף לא תקין<br />"; // price lower than 0 or Nan(not a number)
                    return;
                }
                if (money < price) {
                    document.getElementById("machineOutput").innerHTML = "הכנסת מעט מדי כסף<br />"; // not enough money
                    return;
                }

                // No "else" needed - the money is now valid
                document.getElementById("machineOutput").innerHTML += "הכנסת " + money + " שקלים<br />";
                document.getElementById("machineOutput").innerHTML += "העודף שלך הוא " + (money - price) + " שקלים<br />";
                parsePrice(money - price);

            }
            function parsePrice(price) {
                var tempPrice = price;
                var count10 = 0, count5 = 0, count2 = 0, count1 = 0, countHalf = 0, countTenth = 0;

                // Parsing the number into counts
                while (tempPrice >= 10) {
                    tempPrice -= 10;
                    count10++;
                }

                while (tempPrice >= 5) {
                    tempPrice -= 5;
                    count5++;
                }

                while (tempPrice >= 2) {
                    tempPrice -= 2;
                    count2++;
                }

                while (tempPrice >= 1) {
                    tempPrice -= 1;
                    count1++;
                }

                while (tempPrice >= 0.5) {
                    tempPrice -= 0.5;
                    countHalf++;
                }

                while (tempPrice >= 0.1) {
                    tempPrice -= 0.1;
                    countTenth++;
                }

                if (count10 != 0) {
                    if (count10 == 1)
                        machineOutput.innerHTML += "1 coin of 10 NIS ,";
                    else {
                        machineOutput.innerHTML += count10 + " coins of 10 NIS,";
                    }
                }

                if (count5 != 0) {
                    if (count5 == 1)
                        machineOutput.innerHTML += "1 coint of 5 NIS,";
                    else {
                        machineOutput.innerHTML += count5 + " coins of 5 NIS";
                    }
                }

                if (count2 != 0) {
                    if (count2 == 1)
                        machineOutput.innerHTML += " one coin of 2 NIS,";
                    else {
                        machineOutput.innerHTML += count2 + " coins of 2 NIS,";
                    }
                }

                if (count1 != 0) {
                    if (count1 == 1)
                        machineOutput.innerHTML += " one coin of 1 NIS,";
                    else {
                        machineOutput.innerHTML += count1 + " coins of 1 NIS,";
                    }
                }

                if (countHalf != 0) {
                    if (countHalf == 1)
                        machineOutput.innerHTML += " one coin of 0.5 NIS,";
                    else {
                        machineOutput.innerHTML += countHalf + " coins of 0.5 NIS,";
                    }
                }

                if (countTenth != 0) {
                    if (countTenth == 1)
                        machineOutput.innerHTML += " one coint of 0.1 NIS,";
                    else {
                        machineOutput.innerHTML += countTenth + " coins of 0.1 NIS,";
                    }
                }
            }
        }

    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
<table style ="border : 1px solid red; border-style :double;">
        
        <tr>
            <!------First and only row------>
            <td style="border : 1px solid red;">
                <img src="pics/VendingMachine.png" alt="machine" height ="500px" width ="350px"/>
            </td>

            <td style="text-align : center; border: 1px solid red; height : 500px ;width : 350px;">
                <!--------Machine Header------->
                <h1 style="color :blue; text-align: center; text-decoration : double;">Welcome to my vending machine</h1>
                
                <!-------Content & Prices------>
                <p style ="text-align:right;">
                    Coca-Cola can - 6 NIS .(1<br />
                    Water Bottle - 5 NIS .(2<br />
                    Fanta bottle - 6.80 NIS.(3<br />
                    Soda bottle - 4.30 NIS .(4<br />
                    Cola bottle - 7.50 NIS .(5<br />
                </p>

                <!------Input Values------>
                <b><span style ="text-align:center;">Insert product ID:</span></b>
                <input id="productName" type="text" value="Choose product ID" onclick ="deleteText(this)"/>
                <br />
                <b><span style ="text-align:center;">Insert money:</span></b>
                <input id="money" type="text" value="Insert money:" onclick ="deleteText(this)"/>
                <br />

                <!------Submit Button----->
                <input type="button" value="Buy Product" onclick ="machine()"/>

                <p id="machineOutput"></p>
            </td>
        </tr>



    </table>
</asp:Content>
