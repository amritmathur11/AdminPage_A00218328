<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="ProductImages.aspx.cs" Inherits="Web.user.ProductImages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-md-8">
         <div class="panel panel-primary">

             <div class="panel-heading">
                 
                 Images
                 </div>

            <div class="panel-body">

        <asp:Literal ID="lbl_images" runat="server"></asp:Literal>        
            </div>

            </div>
        

    </div>

    <div class="col-md-4">
        <div class="panel panel-primary">

             <div class="panel-heading">
                 FILE UPLOAD
                 </div>

            <div class="panel-body">

                <div class="form-group">
                    <label>Select File (jpg,png)</label>
                <asp:FileUpload accept="image/jpeg,image/png" required CssClass="form-control" ID="FileUpload1" runat="server" />
                    </div>
                <asp:Button ID="Button1" runat="server" Text="Upload" CssClass="btn btn-primary" OnClick="Button1_Click" />
                
            </div>

            </div>
    </div>

</asp:Content>
