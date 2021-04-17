﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="QuanLyBaiViet.aspx.cs" Inherits="TinTuc.Admin.QuanLyBaiViet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container-fluid">
        <div class="row mt-4 mb-4">
            <div class="col-lg-4">
                <div class="row">
                    <div class="col-lg-8">
                        <asp:DropDownList class="form-control" runat="server" ID="ddlDanhMuc">
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-4">
                        <asp:Button runat="server" ID="btnLoc"
                            CssClass="btn btn-success" Text="Lọc Theo Danh Mục"
                            OnCommand="btnLoc_Command" />
                    </div>
                </div>
            </div>
            <%--<div class="col-lg-4">
                <!-- Navbar Search-->
                <div class="input-group">
                    <asp:TextBox runat="server" ID="txtTimKiem" type="text" class="form-control" placeholder="Tìm Kiếm..."/>
                    <div class="input-group-append">
                         <asp:Button runat="server" ID="btnTim"
                            CssClass="btn btn-primary" Text="Tìm Kiếm"
                            OnCommand="btnTim_Command" />
                    </div>
                </div>
                <!-- Navbar-->
            </div>--%>
        </div>
        <div class="card shadow">
            <div class="card-body">
                <div class="ibox-title mb-4">
                    <a runat="server" href="VietBai.aspx" class="btn btn-info">Thêm mới</a>
                </div>
                <asp:Panel runat="server" ID="pnError" Visible="false">
                    <div class="alert alert-danger">
                        <asp:Label runat="server" ID="lbError"></asp:Label><asp:HyperLink runat="server" ID="hpError" class="alert-link"></asp:HyperLink>.
                    </div>
                </asp:Panel>
                <asp:GridView runat="server"
                    AutoGenerateColumns="false"
                    ID="dgvBaiViet"
                    class="table table-bordered table-hover">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID Bài Viết" />
                        <asp:BoundField DataField="TenBV" HeaderText="Tên Bài Viết" />
                        <asp:BoundField DataField="MoTa" HeaderText="Mô Tả" />
                        <asp:BoundField DataField="TacGia" HeaderText="Tác Giả" />
                        <asp:BoundField DataField="NgayDang" HeaderText="Ngày Đăng" />
                        <asp:TemplateField>
                            <HeaderTemplate>Chức năng</HeaderTemplate>
                            <ItemTemplate>
                                <a href='<%# "SuaBaiViet.aspx?Idbv=" + Eval("Id").ToString()%>'>Sửa</a>
                                <a href='<%# "UploadAnh.aspx?Idbv=" + Eval("Id").ToString()%>'>Upload ảnh</a>
                                <asp:LinkButton runat="server" ID="btnXoa"
                                    CssClass="text-danger"
                                    OnClientClick="return check();"
                                    OnCommand="btnXoa_Command"
                                    CommandArgument='<%# Eval("Id") %>'><i class="fa fa-trash"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script>
        function check() {
            if (confirm("Bạn thực sự muốn xóa? Thao tác này sẽ không khôi phục lại được!") == true) {
                return true;
            }
            return false;
        }
    </script>
</asp:Content>
