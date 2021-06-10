using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btlogin_Click(object sender, EventArgs e)
    {
        string id = txtid.Text.Trim().Replace("'", "").Replace("=", "").Replace(">", "").Replace("<", "");
        string psw = txtpsw.Text.Trim().Replace("'", "").Replace("=", "").Replace(">", "").Replace("<", "");
        string user_type="";

        //判断是否存在该用户
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adp = new SqlDataAdapter("select * from users where id='" + id + "' and psw='" + psw + "' and shenhe=1", cnn);
        DataSet ds = new DataSet();

        adp.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            user_type = GetUserType(id);
            Session["id"] = id;
            Session["majorid"] = ds.Tables[0].Rows[0]["major"].ToString();
            Session["name"] = ds.Tables[0].Rows[0]["name"].ToString();
            Session["user_class"] = user_type;

            /*
            if (user_type != "学生")
            {
                Response.Redirect("main.aspx");
            }
            else
            {
                Response.Redirect("arcs/paperupload.aspx");
            }*/


            Response.Redirect("main.aspx");

            //Response.Redirect(rbm.Checked ? "managers/" : "users/" + "main.aspx");
            //if (user_type=="管理员")
            //{ 
            //    Response.Redirect("main.aspx"); 
            //}
            //else
            //{
            //    Response.Redirect("user_main.aspx");
            //}


        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('用户名或密码错误！');", true);
        }
    }
    protected void btenrol_Click(object sender, EventArgs e)
    {
        Response.Redirect("enrol.aspx");
    }

    private string GetUserType(string id)
    {
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adp = new SqlDataAdapter("select id,user_class.user_class from users left join user_class on user_class.utid=users.user_class where id='" + id + "'", cnn);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        return ds.Tables[0].Rows[0]["user_class"].ToString();
    }
}