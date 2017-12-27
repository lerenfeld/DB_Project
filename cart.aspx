<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        #cart {
            background-color: black;
        }

        #cart a {
            color: white;
        }

        h2 {
            color: white;
        }
        .alert {
        color:red;
        }
        img {
        max-height:130px;
        }

    </style>
<%--    <script>
        body.addEventListener("onkeydown", EnterKeyFilter(), false);
        function EnterKeyFilter() {
            if (window.event.keyCode == 13) {
                event.returnValue = false;
                event.cancel = true;
            }
        }

        </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="CartMessageArea" runat="server" Text=""></asp:Label>
    <asp:Label ID="tatalCartPrice" runat="server" Text=""></asp:Label>
    <asp:PlaceHolder ID="cartPh" runat="server"></asp:PlaceHolder>
    <asp:Button ID="CartSubmitButton" runat="server" Text="Submit & pay" onkeydown = "return (event.keyCode!=13);"/>

</asp:Content>

