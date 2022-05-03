<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="M_Indicator_System.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <br />       
        <table width="50%" height="70%">
            <tr>
                <td style="height:30%;width:30%;">
                    <asp:ImageButton ID="ImgbtnTr" runat="server" ImageUrl="Images/LoT.jpg" Height="383px" Width="450px" OnClick="ImgbtnTr_Click" />                    
                </td>
                <td>
                    <asp:ImageButton ID="ImgbtnBs" runat="server" ImageUrl="Images/Bus.png" Height="383px" Width="522px" OnClick="ImgbtnBs_Click" />                    
                </td>
            </tr>
           
        </table>       
    </div>
</asp:Content>
