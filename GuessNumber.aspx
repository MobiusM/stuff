<%@ Page Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="GuessNumber.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript" language ="javascript">
    var globalRandom;
    var currentGuess;

    function deleteText(text) 
    {
        text.value = "";
    }

    function beginGame() 
    {
        // First game function
        globalRandom = Math.floor(Math.random() * 100) + 1;
        var input = document.getElementById("guess");
        document.getElementById("guesses").innerHTML = ""; // Empty the guesses paragraph
        document.getElementById("guess").value = ""; // Empty the guess
        generateInput();
    }

    function generateInput() 
    {
        // Generating the input & buttom labels
        document.getElementById("guess").disabled = false; // Enable the input tag
        document.getElementById("submitGuess").disabled = false; // Enable the buttom tag
    }

    function guess() 
    {
        var guess = document.getElementById("guess").value;
        if (guess > globalRandom) {
            document.getElementById("guesses").innerHTML += guess + " - " + "the original number is smaller" + "<br />";
            return;
        }
        else if (guess < globalRandom) {
            document.getElementById("guesses").innerHTML += guess + " - " + "the original number is bigger" + "<br />";
            return;
        }
        document.getElementById("guesses").innerHTML += "You're Right!!!!<br />";
        document.getElementById("guess").disabled = true; // Disable the text label
        document.getElementById("submitGuess").disabled = true; //Disable button
    }

    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <center><h2>Welcome To.. <br />
        <span style ="font-style : italic; color : red; text-align :center; font-family : 'Guttman Yad-Brush'">Guess Number!</span>

    </h2></center>

    <p style ="text-align : center; font-size : larger;">Your goal : Guessing the number chosen by the computer in the lowest number of attempts<br /><br />
        After your guess you are told if the number you chose is bigger, smaller or equal to the computer's number
    </p>

    <center><input id ="beginGame" type ="button" onclick ="beginGame()" value = "Begin" style ="width : 150px; height : 75px;" /></center><br />
    <center><input type="button" id="submitGuess" onclick ="guess()" value ="Submit Guess" disabled="disabled"/><input id ="guess" type="text" disabled="disabled" onclick="deleteText(this)"/></center>
    <br />
    
    <p id="guesses"></p>
</asp:Content>
