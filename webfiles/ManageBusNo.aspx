<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="ManageBusNo.aspx.cs" Inherits="M_Indicator_System.ManageBusNo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .hiddencol{
            display:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>     
        <h2 style="color:Red; font-weight:bold">Manage Bus Numbers</h2>
        <br />
    </div>
     <div align="center">        
        <br />
        <table width="60%">
            <tr>
                <td><asp:Label ID="label5" runat="server" ForeColor="Red" Font-Bold="true" Text="Select The Bus Line : " Font-Size="Medium"></asp:Label></td>
                <td><asp:DropDownList ID="ddlBusLine" AutoPostBack="true" runat="server" width="200px" height="25px" OnSelectedIndexChanged="ddlBusLine_SelectedIndexChanged">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>BEST</asp:ListItem>
                    <asp:ListItem>NMMT</asp:ListItem>
                    <asp:ListItem>TMT</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
         </table>
        
        <hr style="color:black; border-style:dotted; border-width:5px"/>
       
    </div>
    <div style="height: 32px">
        <asp:LinkButton ID="lbtnAddBusNo" runat="server" Visible="false" Font-Bold="True" Font-Size="large" ForeColor="#0066FF" OnClick="lbtnAddBusNo_Click" ><i class="fa fa-solid fa-plus"></i>Add New Bus</asp:LinkButton>
    </div>
    <div align="center">
        <br />

    <asp:Panel ID="Panel1" runat="server" Visible="false">
        <table width="505">
            <tr>
                <td align="right"><asp:Label ID="label1" runat="server" Text="Bus No. :"></asp:Label></td>
                <td align="left">&nbsp;&nbsp;<asp:TextBox ID="txtBusNo" runat="server"></asp:TextBox></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>            
            <tr>
                <td align="center"><asp:Label ID="label3" runat="server" Text="Source :"></asp:Label> &nbsp;&nbsp;<asp:TextBox ID="txtSrc" runat="server"></asp:TextBox></td>
                <td align="center"><asp:Label ID="label4" runat="server" Text="Destination :"></asp:Label>&nbsp;&nbsp;<asp:TextBox ID="txtDest" runat="server"></asp:TextBox></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>           
            <tr>
                <td align="right"><asp:Label ID="label2" runat="server" Text="Stop No. :"></asp:Label></td>
                <td align="left">&nbsp;&nbsp;<asp:DropDownList ID="ddlStopNo" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStopNo_SelectedIndexChanged"></asp:DropDownList></td>
                <td>&nbsp;</td>
            </tr>
           
            <tr>
                <td>&nbsp;</td>
                <td></td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    </div>
    <div>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        <br />
        <asp:Button ID="btnAddBusNo" runat="server" Text="Add" onclick="btnAddBusNo_Click" Font-Bold="True" Font-Size="Medium" Visible="False" />
    </div>
    <div>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" Width="50%" Visible="false"  Height="80px" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="BusNo" HeaderText="BusNo" HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol" >
                    <HeaderStyle CssClass="hiddencol"></HeaderStyle>

                    <ItemStyle CssClass="hiddencol"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="Bus No.">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtnBusNo" runat="server" OnClick="lbtnBusNo_Click"  Text='<%#Eval("BusNo")%>'><i class="fa fa-solid fa-pencil"></i></asp:LinkButton>
                    </ItemTemplate>
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
    </div>
    <div>
        <br />
        <br />
        <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="437px" AutoGenerateColumns="False" DataKeyNames="Bid" OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Bid" HeaderText="Bid"  HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol" />
                <asp:BoundField DataField="BusNo" HeaderText="BusNo" />
                <asp:BoundField DataField="HaltStops" HeaderText="Bus Stop" />
                <asp:CommandField ButtonType="Image" CancelImageUrl="~/Images/Cross.jpg" EditImageUrl="~/Images/A.png" ShowEditButton="True" UpdateImageUrl="~/Images/t.jpg" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbdelete" runat="server" OnClick="lbdelete_Click"><i class="fa fa-solid fa-trash"></i></asp:LinkButton>
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
    </div>
</asp:Content>
