<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="M_Indicator_System.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div > 
    <div align="center">
        <br />
        <h2 style="color:Red; font-weight:bold">Login</h2>
    </div>
    <div align="center">
        <br />
        <br />
        <table width="50%">
            <tr>
                <td align="right"><asp:Label ID="lbId" runat="server"  Text="User-Id :" Font-Size="Medium"></asp:Label></td>
                <td align="left">&nbsp;&nbsp;<asp:TextBox ID="txtId" runat="server" Height="25px" Width="145px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td align="right"><asp:Label ID="lbPass" runat="server" Text="Password :" Font-Size="Medium"></asp:Label></td>
                <td align="left">&nbsp;&nbsp;<asp:TextBox ID="txtPass" runat="server" Height="25px" Width="145px" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td align="left"><asp:Button ID="btnLogin" runat="server" Text="Login" Font-Bold="True" Font-Italic="False" Font-Size="Medium" OnClick="btnLogin_Click" /></td>
            </tr>
        </table>
    </div>
        <div>
            <br />
            <asp:Label ID="Label1" Font-Size="Medium" runat="server" Text="Not Register Yet?"></asp:Label>&nbsp;<a href="UserRegister.aspx" style="font-size:medium">Register Here</a>
        </div>
    </div>
</asp:Content>
