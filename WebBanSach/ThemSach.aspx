<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ThemSach.aspx.cs" Inherits="WebBanSach.ThemSach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <h2>TRANG THÊM SÁCH MỚI</h2>
    <hr />

    <div class=" m-auto w-75" >
    <div class="row mb-2">
        <div class="col-md-2"> Tên sách</div>
            <div class="col-md-10">
                <asp:TextBox ID="txtTenSach" CssClass="form-control" TextMode="MultiLine"   runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTenSach" runat="server" ControlToValidate="txtTenSach" 
            ErrorMessage="Tên sách không được rỗng (*)"  ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
       </div>
    </div>
    <div class="row mb-2">
        <div class="col-md-2"> Gía bán</div>
            <div class="col-md-10">
                <asp:TextBox ID="txtGia" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvGia" runat="server" ControlToValidate="txtGia" 
            ErrorMessage="Giá bán không được rỗng (*)"  ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvGia" runat="server" ErrorMessage="Giá bán Không hợp lệ (>0) (*)" ForeColor="Red"
                    ControlToValidate="txtGia" Operator="GreaterThanEqual" ValueToCompare="0" Type="Double" ></asp:CompareValidator>
       </div>
    </div>
        <div class="row mb-2">
        <div class="col-md-2"> Ảnh bìa</div>
            <div class="col-md-10">
                <asp:FileUpload ID="FHinh" Font-Size="20px" Height="20px" runat="server" />
       </div>
    </div>
        <div class="row mb-2">
        <div class="col-md-2"> Chủ đề</div>
            <div class="col-md-10">
                <asp:DropDownList ID="ddlChuDe" CssClass="form-control" runat="server" AutoPostBack="True" 
                    DataSourceID="sdsChuDe" DataTextField="TenCD" DataValueField="MaCD"></asp:DropDownList>
       </div>
    </div>
        <div class="row mb-2">
        <div class="col-md-2"> Nhà Xuất Bản</div>
            <div class="col-md-10">
                <asp:DropDownList ID="ddlNhaXB" CssClass="form-control" runat="server" AutoPostBack="True" 
                    DataSourceID="sdNhaXB" DataTextField="TenNXB" DataValueField="MaNXB"></asp:DropDownList>
       </div>
    </div>
        <div class="row mb-2">
        <div class="col-md-2"> Ngày Cập Nhật</div>
            <div class="col-md-10">
                <asp:TextBox ID="txtNgayCapNhat" CssClass="form-control" TextMode="Date"  runat="server"></asp:TextBox>
       </div>
    </div>
        
        <div class="row mb-2">
            <div class="col-md-2"></div>
            <div class="col-md-10">
                <asp:Button ID="btThem" runat="server" Text="Thêm Sách" CssClass="btn btn-danger" OnClick="btThem_Click" />
                
            </div>
        </div>
        </div>
    <a href="QTSach.aspx" class="btn btn-info">Tiếp Tục Xem Sách </a>
    <asp:SqlDataSource ID="sdsChuDe" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" 
        SelectCommand="SELECT * FROM [ChuDe]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdNhaXB" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" 
        SelectCommand="SELECT * FROM [NhaXuatBan]"></asp:SqlDataSource>

    

</asp:Content>
