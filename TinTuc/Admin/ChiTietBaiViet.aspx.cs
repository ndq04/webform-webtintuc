﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TinTuc.Admin
{
    public partial class ChiTietBaiViet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getDanhMuc();
                int Id = Convert.ToInt32(Request.QueryString["Id"]);
                if (Id != null)
                {
                    getData(Id);
                }
            }
        }
        public void getData(int Id)
        {
            TinTuc.Models.NewsEntities db = new Models.NewsEntities();
            TinTuc.Models.Post obj = db.Post.FirstOrDefault(x => x.Id == Id);
            if (obj == null)
            {
                Response.Redirect("QuanLyBaiViet.aspx");
            }
            else
            {
                txtMaBV.Text = Convert.ToString(Id);
                txtMaBV.Enabled = false;
                txtTenBV.Text = obj.TenBV;
                txtMoTa.Text = obj.MoTa;
                txtNoiDung.Text = obj.NoiDung;
                cmbDanhMuc.SelectedValue = Convert.ToString(obj.Id_Categories);
            }
        }

        public void getDanhMuc()
        {
            Models.NewsEntities db = new Models.NewsEntities();
            cmbDanhMuc.DataSource = db.Categories.ToList();
            cmbDanhMuc.DataValueField = "Id";
            cmbDanhMuc.DataTextField = "TenDM";
            cmbDanhMuc.DataBind();
        }
        protected void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                Models.NewsEntities db = new Models.NewsEntities();
                int Id = Convert.ToInt32(txtMaBV.Text);
                string tenbv = txtTenBV.Text;
                string mota = txtMoTa.Text;
                string noidung = txtNoiDung.Text;
                string tacgia = txtTacGia.Text;
                Models.Post obj = db.Post.FirstOrDefault(x => x.Id == Id);
                if (Id != null && tenbv != null && tenbv != "" && mota != null && mota != "" && noidung != null && noidung != "" && tacgia != null && tacgia != "")
                {

                    obj = new Models.Post();
                    obj.TenBV = txtTenBV.Text;
                    obj.MoTa = txtMoTa.Text;
                    obj.NoiDung = txtNoiDung.Text;
                    obj.TacGia = txtTacGia.Text;
                    db.Post.Add(obj);
                    db.SaveChanges();
                    Response.Redirect("QuanLyBaiViet.aspx");
                }
                else
                {
                    pnError.Visible = true;
                    lbError.Text = "Các trường không được để trống!";
                }
            }
            catch
            {
                pnError.Visible = true;
                lbError.Text = "Lỗi, không lưu lại được !";
            }
        }
    }
}