<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!------------START------------------->

    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>    
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="Images/slider_bg_2334.jpg">
      <div class="carousel-caption" style="color:#000;">
       <h2> Cloth House</h2>
      </div>
    </div>
    <div class="item">
      <img src="Images/slider_bg_2wwe.png">
      <div class="carousel-caption" style="color:#000;">
        <H2>WE HAVE ALL</H2>
      </div>
    </div>    
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>




<!------------END--------------------->


    <div class="row">        
        <asp:Literal ID="lbl_featured" runat="server"></asp:Literal>
    </div>


    <div class="row">
        
        <asp:Literal ID="lbl_new" runat="server"></asp:Literal>
    </div>

</asp:Content>
