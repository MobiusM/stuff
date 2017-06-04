<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="TicTacToe.aspx.cs" Inherits="End.TicTacToe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
		<script>
		    var count = 0; // Counter
		    var board = [
				[' ', ' ', ' '],
				[' ', ' ', ' '],
				[' ', ' ', ' '],
			]; // Empty board

		    function press(position) {
		        var changed;
		        /*
		        Board ID's work like this:
		        1 2 3
		        4 5 6
		        7 8 9
		        */
		        if (count % 2 == 0) {
		            // X's turn
		            changed = 'x';
		        }
		        else {
		            // O's turn
		            changed = 'o';
		        }
		        switch (position) {
		            // Check which button was pressed, change backend board 
		            case 1:
		                board[0][0] = changed;
		                break;
		            case 2:
		                board[0][1] = changed;
		                break;
		            case 3:
		                board[0][2] = changed;
		                break;
		            case 4:
		                board[1][0] = changed;
		                break;
		            case 5:
		                board[1][1] = changed;
		                break;
		            case 6:
		                board[1][2] = changed;
		                break;
		            case 7:
		                board[2][0] = changed;
		                break;
		            case 8:
		                board[2][1] = changed;
		                break;
		            case 9:
		                board[2][2] = changed;
		                break;
		        }
		        var buttonToDelete = document.getElementById(position.toString());
		        var newImage = document.createElement("img");
		        newImage.setAttribute("class", "imgTic");

		        if (count % 2 == 0) {
		            // Put an 'X' on the board
		            newImage.src = "pics/X.jpg";
		            buttonToDelete.parentNode.replaceChild(newImage, buttonToDelete);
		        }
		        else {
		            // Put an 'X' on the board
		            newImage.src = "pics/O.jpg";
		            buttonToDelete.parentNode.replaceChild(newImage, buttonToDelete);
		        }
		        testVictory();
		        count++;
		    }
		    function testVictory() {
		        for (i = 0; i < 3; i++) {
		            // Testing victory by row
		            if (board[i][0] == board[i][1] && board[i][0] == board[i][2] && board[i][0] != ' ') {
		                document.getElementById("results").innerHTML = board[i][0] + " wins!";
		                return true;
		            }
		        }
		        for (j = 0; j < 3; j++) {
		            // Testing victory by collumns
		            if (board[0][j] == board[1][j] && board[0][j] == board[2][j] && board[0][j] != ' ') {
		                document.getElementById("results").innerHTML = board[0][j] + " wins!";
		                return true;
		            }
		        }
		        if (board[0][0] == board[1][1] && board[0][0] == board[2][2] && board[0][0] != ' ') {
		            document.getElementById("results").innerHTML = board[0][0] + " wins!";
		            return true;
		        }
		        else if (board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] != ' ') {
		            document.getElementById("results").innerHTML = board[0][2] + " wins!";
		            return true;
		        }
		        return false;
		    }
		</script>
        	<style type="text/css">
			.tdTic
			{
				border : 1px solid black;
				height : 150px;
				width : 150px;
				text-align: center;
			}
			.inputTic
			{
				height : 150px;
				width : 150px;	
			}
			.imgTic
			{
				height: 150px;
				width : 150px;	
			}
		</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
			<h1 style = "color : red;" id="results"></h1>
			<input type = "button" onclick="window.location.reload()" value="new game" style = "height :20px ;width : 80px"/>
			<table>
				<tr>
					<!--Row #1-->
					<td class="tdTic">
						<input class = "inputTic" type="button" value="Press to fill" onclick="press(1)" id= "1"/>
					</td>
					<td class="tdTic">
						<input class = "inputTic" type="button" value="Press to fill" onclick="press(2)" id= "2"/>
					</td>
					<td class="tdTic">
						<input class = "inputTic" type="button" value="Press to fill" onclick="press(3)" id= "3"/>
					</td>	
				</tr>
				
				<tr>
					<!--Row #2-->
					<td class="tdTic">
						<input class = "inputTic" type="button" value="Press to fill" onclick="press(4)" id= "4"/>	
					</td>
					<td class="tdTic">
						<input class = "inputTic" type="button" value="Press to fill" onclick="press(5)" id= "5"/>
					</td>
					<td class="tdTic">
						<input class = "inputTic" type="button" value="Press to fill" onclick="press(6)" id= "6"/>
					</td>	
				</tr>
				
				<tr>
					<!--Row #3-->
					<td class="tdTic">
						<input class = "inputTic" type="button" value="Press to fill" onclick="press(7)" id= "7"/>
					</td>
					<td class="tdTic">
						<input class = "inputTic" type="button" value="Press to fill" onclick="press(8)" id= "8"/>
					</td>
					<td class="tdTic">
						<input class = "inputTic" type="button" value="Press to fill" onclick="press(9)" id= "9"/>
					</td>
				</tr>	
			</table>
</asp:Content>
