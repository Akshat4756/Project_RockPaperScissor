<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ROCK_PAPER_SCISSOR.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title></title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Croissant+One&family=Permanent+Marker&display=swap" rel="stylesheet" />
    <link href="Utitlites/Bootstrap%20v5.2/bootstrap-5.2.1/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" style="background-color:#e2c2b3;height:100vh">
        <div class="container-fluid" >
           
            <div class="row justify-content-center align-items-center" >
                <div class="col-md-6 mt-5">
                     <div class="card pt-5 mt-5 " style="color:#e2c2b3;background-color:#403234"><%--style="border-radius: 2rem;background:linear-gradient(to right,#CD5C5C,lightpink,#CD5C5C) "--%>
                    <h3 class="text-center mt-3" style="font-family: 'Croissant One', cursive;opacity:500">Welcome to The Rock Paper Scissor Game</h3>
                        <center> <div class="mt-3" style="border-radius:100%;background-color:antiquewhite;display:inline-block;height:300px;width:300px">
                             <img src="Utitlites/images/GroupSign.png" style="height:250px;width:280px"/>
                         </div></center>
                         
                    <div class="card-body mt-2">
                        <div class="row ">
                            <div class="col-md-4">
                                <label class="form-label" for="txt_Name">Name</label>
                            </div>
                            <div class="col-md-8">
                                <asp:TextBox ID="txt_Name" runat="server" CssClass="form-control form-control-sm col-md-8" placeholder="Please Enter your Name To Proceed"></asp:TextBox>
                            </div>

                        </div>
                        <div class="row justify-content-center align-items-center mt-5">
                            <center>
                                <asp:LinkButton CssClass="btn btn-outline-danger btn-sm " ID="btn2Game" runat="server" OnClick="btn2Game_Click">Play</asp:LinkButton></center>
                        </div>
                     
                    </div>
                </div>
                </div>
               
            </div>
        </div>


    </form>
    <script src="Utitlites/Bootstrap%20v5.2/bootstrap-5.2.1/js/bootstrap.min.js"></script>
    <script src="Utitlites/Bootstrap%20v5.2/bootstrap-5.2.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>
