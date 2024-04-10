using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanSach
{
    public partial class ThemSach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btThem_Click(object sender, EventArgs e)
        {
            //Mở kết nối CSDL
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BookStoreConnectionString"].ConnectionString);
            conn.Open();

            string sql = "INSERT INTO Sach (TenSach,MaCD,MaNXB,Dongia,Hinh,Ngaycapnhat) values(@TenSach,@MaCD,@MaNXB,@Dongia,@Hinh,@Ngaycapnhat)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@TenSach", txtTenSach.Text);
            cmd.Parameters.AddWithValue("@MaCD", ddlChuDe.SelectedValue);
            cmd.Parameters.AddWithValue("@MaNXB", ddlNhaXB.SelectedValue);
            cmd.Parameters.AddWithValue("@Dongia", txtGia.Text);
            cmd.Parameters.AddWithValue("@Ngaycapnhat", txtNgayCapNhat.Text);

            if (FHinh.HasFile)
            {
                //Xử lý uploads Hình
                string path = Server.MapPath("~/bia_sach/") + FHinh.FileName;
                FHinh.SaveAs(path);
                cmd.Parameters.AddWithValue("@Hinh", FHinh.FileName);
            } else
            {
                cmd.Parameters.AddWithValue("@Hinh", "no_imge.png");
            }

            if (cmd.ExecuteNonQuery() > 0) //Thêm thành công
            {
                Response.Write("<scipt> alert('Đã Thêm Sách Thành Công') </scipt>");
            } else
            { //Thêm Sách Thất Bại
                Response.Write("<scipt> alert('Thêm Sách Thất Bại') </scipt>");
            }
        }
    }
}