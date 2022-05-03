<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="ManageStation.aspx.cs" Inherits="M_Indicator_System.ManageStation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       .modal-backdrop.fade 
       {
           background:none;
       }
       .hiddencol 
       {
            display: none;
       }   

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <h2 style="color:Red; font-weight:bold" >Manage Stations</h2>
    </div>
    <div align="center">        
        <br />
        <table width="60%">
            <tr>
                <asp:Label ID="label1" runat="server" ForeColor="Red" Font-Bold="true" Text="Select The Train Line : " Font-Size="Medium"></asp:Label>
                <asp:DropDownList ID="ddlTrainLine" AutoPostBack="true" runat="server" width="200px" height="25px" OnSelectedIndexChanged="ddlTrainLine_SelectedIndexChanged">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>Western</asp:ListItem>
                    <asp:ListItem>Central</asp:ListItem>
                    <asp:ListItem>Harbour</asp:ListItem>
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
    <div align="center">
        <asp:Panel ID="Panel1" runat="server" Visible="false">
        <table width="60%">
            <tr>
                <td align="right"><asp:Label ID="lbStat" runat="server" Text="Station Name :" Font-Size="Medium"></asp:Label></td>
                <td align="left">&nbsp;&nbsp;<asp:TextBox ID="txtstat" runat="server" Width="200px" Height="25px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>                       
            <tr>
                <td>&nbsp;</td>
                <td align="left"><asp:Button ID="btnAdd" runat="server" Text="Add" Font-Bold="True" Font-Size="Medium" Width="67px" OnClick="btnAdd_Click" /></td>
            </tr>
        </table>
        </asp:Panel>
    </div>
    <div>
        <br />
        <asp:GridView ID="GridView1" runat="server" Width="40%" OnRowEditing="OnRowEditing" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Height="232px" DataKeyNames="StatId" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>

                <asp:BoundField DataField="StatId" HeaderText="Id" HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol">
                <HeaderStyle Height="30px" Width="30px" />
                <ItemStyle CssClass="hiddencol"></ItemStyle>
                </asp:BoundField>

                <asp:BoundField DataField="StationName" HeaderText="Station Name" >
                </asp:BoundField>

                <asp:BoundField DataField="Date" HeaderText="Date" HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol">
                <HeaderStyle Height="30px" Width="30px" />
                <ItemStyle CssClass="hiddencol"></ItemStyle>
                </asp:BoundField>

                <asp:CommandField ButtonType="Image" ShowEditButton="True" CancelImageUrl="~/Images/Cross.jpg" EditImageUrl="~/Images/A.png" UpdateImageUrl="~/Images/t.jpg" />              
                               
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtndelete" runat="server" OnClick="lbtndelete_Click"><i class="fa fa-solid fa-trash"></i></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Height="50px" Width="50px" />
                </asp:TemplateField>

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

   
</asp:Content>
