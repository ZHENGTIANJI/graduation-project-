using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 首页 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["class"] == null||(int)Session["class"] !=0)
        {
            Response.Redirect("/login1.aspx");
        }
        user.Text = "当前用户:" + Session["name"].ToString();
    }
    
    protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("stockmanagement/paperstock.aspx");
    }
    protected void ImageButton2_Click1(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("QueryAndModify/paperQueryAndModify.aspx");
    }
    protected void ImageButton3_Click1(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("delete/datadelete.aspx");
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("statistics/bookstatistics.aspx");
    }
    protected void home_Click(object sender, EventArgs e)
    {
        Response.Redirect("login1.aspx");
    }
}