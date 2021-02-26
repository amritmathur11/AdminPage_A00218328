<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="Web.product" %>
<%@ Register src="UserControls/RelatedProducts.ascx" tagname="RelatedProducts" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/lightslider.css" rel="stylesheet" />
    <script src="js/lightslider.js"></script>

    <style>
    	ul{
			list-style: none outside none;
		    padding-left: 0;
            margin: 0;
		}
        .demo .item{
            margin-bottom: 60px;
        }
		.content-slider li{
		    background-color: #ed3020;
		    text-align: center;
		    color: #FFF;
		}
		.content-slider h3 {
		    margin: 0;
		    padding: 70px 0;
		}
		.demo{
			width: 100%;
		}
    </style>


    <script>
    	 $(document).ready(function() {
			$("#content-slider").lightSlider({
                loop:true,
                keyPress:true
            });
            $('#image-gallery').lightSlider({
                gallery:true,
                item:1,
                thumbItem:9,
                slideMargin: 0,
                speed:500,
                auto:true,
                loop:true,
                onSliderLoad: function() {
                    $('#image-gallery').removeClass('cS-hidden');
                }  
            });
		});
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <!----- ------>

<div id="lbl_msg" runat="server" visible="false" class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Product</strong> has been added sucessfully.
</div>

           <!-----     --->
    <div class="row">
        <div class="col-sm-5">
            <asp:Literal ID="lbl_images" runat="server"></asp:Literal>
           
        </div>

        <div class="col-sm-7">
           
            <h3>
            <asp:Label ID="lbl_title" runat="server" Text=""></asp:Label></h3>
            <h3 class="text-warning">
            <asp:Label ID="lbl_price" runat="server" Text=""></asp:Label></h3>
            <hr />
            <div class="row">
                <div class="col-sm-3">
                    <input runat="server" class="form-control" required="required" id="txt_number"  value="1" type="number" step="1" min="1" title="Quantity" />                   
                </div>               
                <div class="col-sm-9">
                    <asp:Button ID="btn_cart" CssClass="btn btn-danger" runat="server" Text="Add To Cart" OnClick="btn_cart_Click" />
                </div>
            </div>
            <hr />
<p><b>Categories: </b>
    <asp:Literal ID="lbl_category" runat="server"></asp:Literal></p>
            <p><b>Vendor: </b>
                <asp:Literal ID="lbl_vendor" runat="server"></asp:Literal></p>
        </div>

    </div>

    <div class="panel panel-warning">
        <div class="panel-heading">
            Description
        </div>

        <div class="panel-body">
            <asp:Literal ID="lbl_description" runat="server"></asp:Literal>
        </div>

    </div>
    

   <%-- <uc1:RelatedProducts ID="RelatedProducts1" runat="server" />--%>

</asp:Content>
