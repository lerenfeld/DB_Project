﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="addCategory.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #addCategory {
            background-color: black;
        }

         #addCategory a {
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <asp:Button ID="ButtonReadDB" runat="server" Text="show categories" OnClick="ButtonReadDB_Click" />
    <asp:TextBox ID="TextBoxcategory" runat="server"></asp:TextBox>
    <asp:Button ID="Buttoncategory" runat="server" Text="Add category" OnClick="Buttoncategory_Click" />
    <asp:Label ID="Labelcategory" runat="server" Text="" style="color:red"></asp:Label>
</div>
    <div>
        <asp:PlaceHolder ID="tablePH" runat="server"></asp:PlaceHolder>
    </div>
</asp:Content>

