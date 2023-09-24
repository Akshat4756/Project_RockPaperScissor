<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Game.aspx.cs" Inherits="ROCK_PAPER_SCISSOR.Game" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
    <link href="Utitlites/Bootstrap%20v5.2/bootstrap-5.2.1/css/bootstrap.min.css" rel="stylesheet" />
     <link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Croissant+One&family=Permanent+Marker&display=swap" rel="stylesheet" />
</head>
<body>
   <style>
       body{
          
                         font-family: 'Croissant One', cursive;
                         
            }
   </style>
    <form id="form1" runat="server" style="background-color: #e2c2b3; height: 100vh">
        <div class="container-fluid">
            <div class="row justify-content-center align-items-center pt-3">
                <div class="col-md-12" style="background: none">
                    <h3 class="text-center" style="color: #403234;">
                        <asp:Label runat="server" ID="lblPlayerName"></asp:Label></h3>
                </div>
            </div>
            <div class="row justify-content-center align-items-center pt-5" id="gamePnl" runat="server" visible="true">
                <div class="card col-md-10 col-sm-12 mt-5 pt-5" style="color: #e2c2b3; background-color: #403234;">
                    <%--style="border-radius: 2rem; background: linear-gradient(to right,#CD5C5C,lightpink,#CD5C5C); visibility: visible"--%>
                    <div class="card-body mt-4" id="Main">
                        <div id="userQues" style="display: block">
                            <h4 class="text-center" style="">Please Select One Of These:</h4>
                            <div class="col-md-12 col-sm-12 mb-4">
                                <div class="row justify-content-center align-items-center mt-5">
                                    <div class="col-md-3 col-sm-12">
                                        <a role="button" id="Rock" onclick="calc('0')">
                                            <img src="Utitlites/images/RockSign.png" style="height: 180px" /></a>
                                    </div>
                                    <div class="col-md-3 col-sm-12">
                                        <a role="button" id="Paper" onclick="calc('1')">
                                            <img src="Utitlites/images/PaperSign.png" style="height: 180px" /></a>
                                    </div>
                                    <div class="col-md-3 col-sm-12">
                                        <a role="button" id="Scissor" onclick="calc('2')">
                                            <img src="Utitlites/images/ScissorSign.png" style="height: 180px" /></a>
                                    </div>
                                </div>
                            </div>
                             <center >
                            <asp:LinkButton ID="btnScoreboard"  OnClick="btnScoreboard_Click" runat="server" Style="background-color: #e2c2b3; color: #403234" CssClass="btn btn-sm mt-5">
                                       Check Your Scoreboard
                            </asp:LinkButton></center>
                        </div>
                        <div id="userRes" style="display: none">
                            <div class="row mt-3 mb-3">
                                <h2 class="text-center" id="matchResult"></h2>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <h4 class="text-center" style="">You Selected :</h4>
                                    <div class="row justify-content-center align-items-center">
                                        <div class="col-md-6 col-sm-12">
                                            <img src="#" id="userSign" style="height: 180px;" />

                                        </div>
                                    </div>

                                </div>
                                <div class="col-md-6">
                                    <h4 class="text-center" style="">Computer Selected :</h4>
                                    <div class="row justify-content-center align-items-center">
                                        <div class="col-md-6 col-sm-12">
                                            <img src="#" id="compSign" style="height: 180px; -webkit-transform: scaleX(-1); transform: scaleX(-1);" />

                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 mt-5">
                                <div class="row mt-3 justify-content-center align-items-center">
                                    <div class="col-md-4">
                                        <center>
                                            <h5>Total Won:<asp:Label ID="txtWon" runat="server" CssClass="form-label" ClientIDMode="Static"></asp:Label></h5>
                                            <input id="txt_Won" runat="server" style="display: none" value="0" /></center>
                                    </div>
                                    <div class="col-md-4">
                                        <center>
                                            <h5>Total Loss:<asp:Label ID="txtLoss" runat="server" CssClass="form-label" ClientIDMode="Static"></asp:Label></h5>
                                            <input id="txt_Loss" runat="server" style="display: none" value="0" /></center>
                                    </div>
                                    <div class="col-md-4">
                                        <center>
                                            <h5>Total Tie:<asp:Label ID="txtTie" runat="server" CssClass="form-label" ClientIDMode="Static"></asp:Label></h5>
                                            <input id="txt_Tie" runat="server" style="display: none" value="0" /></center>
                                    </div>
                                </div>
                            </div>

                            <div class="row justify-content-center align-items-center mt-5">
                                <div class="col-md-6">
                                    <center>
                                        <asp:LinkButton ID="LinkButton1" OnClick="btnExit_Click" runat="server" Style="background-color: #e2c2b3; color: #403234" CssClass="btn btn-sm">
                                        Exit
                                        </asp:LinkButton></center>
                                </div>
                                <div class="col-md-6 ">
                                    <center><a role="button" onclick="visibleUserQues(this)" id="btnPlayAgain" style="background-color: #e2c2b3; color: #403234" class="btn btn-sm">Play Again</a></center>
                                </div>

                            </div>


                        </div>
                       
                    </div>
                </div>

            </div>
            <div class="row justify-content-center align-items-center pt-5" id="scorePnl" runat="server" visible="false">
                <div class="card col-md-12 col-sm-12 mt-5 pt-5" style="color: #e2c2b3; background-color: #403234">
                    <%--style="border-radius: 2rem; background: linear-gradient(to right,#CD5C5C,lightpink,#CD5C5C); visibility: visible"--%>
                    <div class="card-body col-12 mt-4">
                        <asp:GridView ID="grd_Score" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-responsive">
                            <AlternatingRowStyle BackColor="#403234" ForeColor="#e2c2b3" />
                            <FooterStyle BackColor="#e2c2b3" Font-Bold="True" ForeColor="#403234" />
                            <HeaderStyle BackColor="#e2c2b3" Font-Bold="True" ForeColor="#403234" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#403234" ForeColor="#e2c2b3" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
                        <center>
                            <asp:LinkButton ID="btnGamePanel" OnClick="btnGamePanel_Click" runat="server" Style="background-color: #e2c2b3; color: #403234" CssClass="btn btn-sm">
                                        Back to The Game Page
                            </asp:LinkButton>
                        </center>
                    </div>


                </div>

            </div>
        </div>
    </form>
    <script>
        let userChoice = null, compChoice = null;
        let user = null, comp = null;
        let Won = 0;
        let Tie = 0;
        let Loss = 0;
        let TotalWon = document.getElementById('<%= txtWon.ClientID %>');
        let TotalTie = document.getElementById('<%= txtTie.ClientID %>');
        let TotalLoss = document.getElementById('<%= txtLoss.ClientID %>');
        let txt_Won = document.getElementById('<%= txt_Won.ClientID %>');
        let txt_Loss = document.getElementById('<%= txt_Loss.ClientID %>');
        let txt_Tie = document.getElementById('<%= txt_Tie.ClientID %>');
        let MainPanel = document.getElementById('Main');
        let userSign = document.getElementById('userSign');
        let compSign = document.getElementById('compSign');
        let resultPnl = document.getElementById('userRes');
        let userQuesPnl = document.getElementById('userQues');
        let matchResult = document.getElementById('matchResult');


        let visiblePnl = () => {
            resultPnl.style.display = 'block';
            userQuesPnl.style.display = 'none';
        }

        let visibleUserQues = () => {
            resultPnl.style.display = 'none';
            userQuesPnl.style.display = 'block';
        }
        visibleUserQues();
        function calc(userChoice) {
            visiblePnl();
            compChoice = Math.floor(Math.random() * 3);
            if (compChoice == 0) {
                comp = 'Rock';
                compSign.src = 'Utitlites/images/RockSign.png';


            } else if (compChoice == 1) {
                comp = 'Paper';
                compSign.src = 'Utitlites/images/PaperSign.png';


            } else if (compChoice == 2) {
                comp = 'Scissor';
                compSign.src = 'Utitlites/images/ScissorSign.png';
            }
            if (userChoice == 0) {
                user = 'Rock';
                userSign.src = "Utitlites/images/RockSign.png";
            }
            else if (userChoice == 1) {
                user = 'Paper';
                userSign.src = 'Utitlites/images/PaperSign.png';
            }
            else if (userChoice == 2) {
                user = 'Scissor';
                userSign.src = 'Utitlites/images/ScissorSign.png';
            }
            if (user == 'Rock') {
                if (comp == 'Scissor') {
                    matchResult.innerText = "You Won !";
                    Won = Won + 1;
                    console.log(Won);
                } else if (comp == 'Paper') {
                    matchResult.innerText = "You Lose !";
                    Loss = Loss + 1;
                    console.log(Loss);
                } else if (comp == 'Rock') {
                    matchResult.innerText = "Draw !";
                    Tie = Tie + 1;
                    console.log(Tie);
                }

            } else if (user == 'Paper') {
                if (comp == 'Scissor') {
                    matchResult.innerText = "You Lose !";
                    Loss = Loss + 1;
                    console.log(Loss);
                } else if (comp == 'Paper') {
                    matchResult.innerText = "Draw !";
                    Tie = Tie + 1;
                    console.log(Tie);
                } else if (comp == 'Rock') {
                    matchResult.innerText = "You Won !";
                    Won = Won + 1;
                    console.log(Won);
                }

            } else if (user == 'Scissor') {
                if (comp == 'Scissor') {
                    matchResult.innerText = "Draw !";
                    Tie = Tie + 1;
                    console.log(Tie);

                } else if (comp == 'Paper') {
                    matchResult.innerText = "You Won !";
                    Won = Won + 1;
                    console.log(Won);
                } else if (comp == 'Rock') {
                    matchResult.innerText = "You Lose !";
                    Loss = Loss + 1;
                    console.log(Loss);
                }
            }

            TotalWon.innerText = Won;
            TotalLoss.innerText = Loss;
            TotalTie.innerHTML = Tie;
            txt_Won.value = Won;
            txt_Loss.value = Loss;
            txt_Tie.value = Tie;
        }
    </script>
    <script src="Utitlites/Bootstrap%20v5.2/bootstrap-5.2.1/js/bootstrap.min.js"></script>
    <script src="Utitlites/Bootstrap%20v5.2/bootstrap-5.2.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>
