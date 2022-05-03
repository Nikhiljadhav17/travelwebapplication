<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="ManageBusStops.aspx.cs" Inherits="M_Indicator_System.ManageBusStops" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .hidddencol
        {
            display:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <h2 style="color:Red; font-weight:bold" >Manage Bus Stops</h2>
    </div>
    <div align="center">        
        <br />
        <table width="60%">
            <tr>
                <asp:Label ID="label1" runat="server" ForeColor="Red" Font-Bold="true" Text="Select The Bus Line : " Font-Size="Medium"></asp:Label>
                <asp:DropDownList ID="ddlBusLine" AutoPostBack="true" runat="server" width="200px" height="25px" OnSelectedIndexChanged="ddlBusLine_SelectedIndexChanged">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>BEST</asp:ListItem>
                    <asp:ListItem>NMMT</asp:ListItem>
                    <asp:ListItem>TMT</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
         </table>
        
        <hr style="color:black; border-style:dotted; border-width:5px"/>
       
    </div>
    <asp:Panel ID="Panel1" runat="server" Visible="false">
        <div>
            <table width="60%">
            <tr>
                <td align="right"><asp:Label ID="lbBstop" runat="server" Text="Bus Stop Name :" Font-Size="Medium"></asp:Label></td>
                <td align="left">&nbsp;&nbsp;<asp:TextBox ID="txtBstop" runat="server" Width="200px" Height="25px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>                       
            <tr>
                <td>&nbsp;</td>
                <td align="left"><asp:Button ID="btnAdd" runat="server" Text="Add" Font-Bold="True" Font-Size="Medium" Width="67px"  OnClick="btnAdd_Click" /></td>
            </tr>
        </table>
        </div>
   
    <div align="center">
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" Width="70%" ForeColor="#333333" Height="151px" GridLines="None" AutoGenerateColumns="False" DataKeyNames="BusId" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="BusId" HeaderText="Bus-Id" HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol">
                <HeaderStyle CssClass="hiddencol" />
                <ItemStyle CssClass="hiddencol" />
                </asp:BoundField>
                <asp:BoundField DataField="BusStop" HeaderText="Bus Stops" />
                <asp:BoundField DataField="Date" HeaderText="date" HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol">
                <HeaderStyle CssClass="hiddencol" />
                <ItemStyle CssClass="hiddencol" />
                </asp:BoundField>
                <asp:CommandField ButtonType="Image" CancelImageUrl="~/Images/Cross.jpg" EditImageUrl="~/Images/A.png" ShowEditButton="True" UpdateImageUrl="~/Images/t.jpg" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <br />
        <br />
    </div>
         </asp:Panel>
</asp:Content>
