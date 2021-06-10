using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class main : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            Response.Redirect("login.aspx");
        }
        if(!IsPostBack)
        {
            Label1.Text = "当前用户："+Session["id"].ToString();
            Label2.Text = "当前时间："+DateTime.Now.ToString();

            SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
            SqlDataAdapter adp = new SqlDataAdapter("select fid,name,url,pid,user_class from user_power left join menus on fid=menus.id left join user_class on user_class.utid=user_power.utid where user_class='"+Session["user_class"].ToString()+"' and pid='0'", cnn);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            string html = "";

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string id = ds.Tables[0].Rows[i]["fid"].ToString();
                string name = ds.Tables[0].Rows[i]["name"].ToString();
                string url = ds.Tables[0].Rows[i]["url"].ToString();
                html += CreateMenu(name, url, id);
            }

            html = "<div class='middle'><div class='menu'>" + html + "</div></div>";
            html += "<div id='right' style='height:100%;width:85%;position:absolute;bottom:0px;right:0px;float:left;'><iframe id='iframe' name='frame' scrolling='auto' frameborder='0' height='100%' width='100%'></iframe></div>";

            Literal1.Text = html;
        }
    }

    private string CreateMenu(string name, string url, string id)
    {
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adp = new SqlDataAdapter("select fid,name,url,pid,user_class from user_power left join menus on fid=menus.id left join user_class on user_class.utid=user_power.utid where user_class='"+Session["user_class"].ToString()+"' and pid='" + id + "'", cnn);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        string html = "";

        if (ds.Tables[0].Rows.Count == 0)
        {
            html += "<li class='item' id='" + name + "'><a href='" + url + "' class='btn' target='frame'>" + name + "</a></li>";
        }
        else if (ds.Tables[0].Rows.Count > 0)
        {
            html = "<li class='item' id='" + name + "'><a href='#" + name + "' class='btn'>" + name + "</a><div class='smenu'>";
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                html += " <a href='" + ds.Tables[0].Rows[i]["url"].ToString() + "' target='frame'>" + ds.Tables[0].Rows[i]["name"].ToString() + "</a>";
            }
            html += "</div></li>";
        }

        return html;
    }
    protected void btback_Click(object sender, EventArgs e)
    {
        Session["id"] = "";
        Session["user_class"] = "";
        Session.Clear();
        Response.Redirect("main.aspx");
    }
}