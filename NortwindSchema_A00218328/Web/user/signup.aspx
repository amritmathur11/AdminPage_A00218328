<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="Web.user.signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Account Signup</title>
    <link href="../css/user.css" rel="stylesheet" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/bootstrap-theme.min.css" rel="stylesheet" />
    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container-fluid">
   <div class="row">
       <div class="col-sm-3 hidden-xs">
           &nbsp;
       </div>
       <div class="col-sm-6">

           <div class="panel panel-primary">
               <div class="panel-heading">
                   User Signup
               </div>

               <div class="panel-body">
                   <div class="form-group">
                       <label>Full Name</label>
                       <input class="form-control" required="required" id="txt_name" runat="server" />
                   </div>
                   <div class="form-group">
                       <label>Address</label>
                       <input class="form-control" required="required" id="Text1" runat="server" />
                   </div>
                   <div class="form-group">
                       <label>City</label>
                       <input class="form-control" required="required" id="Text2" runat="server" />
                   </div>
                   <div class="form-group">
                       <label>Email</label>
                       <input class="form-control" required="required" id="Text3" runat="server" />
                   </div>
                   <div class="form-group">
                       <label>Password</label>
                       <input class="form-control" required="required" id="Text4" runat="server" />
                   </div>
                   <div class="form-group">
                       <label>Confirm Password</label>
                       <input class="form-control" required="required" id="Text5" runat="server" />
                   </div>
                   <asp:Button ID="btn_submit" runat="server" CssClass="btn btn-primary" Text="Signup" />
                   <input class="btn btn-primary" type="reset" />

               </div>

           </div>

       </div>
       <div class="col-sm-3 hidden-xs">
           &nbsp;
       </div>
   </div>
    </div>
    </form>
</body>
</html>
