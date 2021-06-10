using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class managers_user_manage_shenhe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["selectsql"]!=null)
        {
            SqlDataSource1.SelectCommand = Session["selectsql"].ToString();
        }
    }
    protected void btshenhe_Click(object sender, EventArgs e)
    {
        LinkButton btn = sender as LinkButton;
        GridViewRow row = (GridViewRow)btn.NamingContainer;
        string shenhe=row.Cells[11].Text;
        string sql="";
        if (shenhe == "未审核")
        {
            sql = "update users set shenhe=1 where id='" + ((LinkButton)sender).CommandArgument.ToString() + "'";
        }
        else
        {
            sql = "update users set shenhe=0 where id='" + ((LinkButton)sender).CommandArgument.ToString() + "'";
        }
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        cnn.Open();
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.ExecuteNonQuery();
        cnn.Close();

        GridView1.DataBind();
    }
    protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton btshenhe = (LinkButton)e.Row.FindControl("btshenhe");
            //DataRowView drv = (DataRowView)e.Row.DataItem;
            if (e.Row.Cells[11].Text == "0")
            {
                e.Row.Cells[11].Text = "未审核";
                btshenhe.Text = "审核";
            }
            else
            {
                e.Row.Cells[11].Text = "已审核";
                btshenhe.Text = "取消审核";
            }
        }
    }

    protected void dpcond_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sql = "select id,psw,user_class.user_class,name,sex,cn,mname,grade,class,telephone,email,shenhe from users left join major on major.mid=users.major left join campus on campus.cid=major.cid left join user_class on user_class.utid=users.user_class ";
        string cond = " where 1=1";
        if(dpcond.SelectedItem.Value=="1")
        {
            cond += " and shenhe=1 ";
        }
        if(dpcond.SelectedItem.Value=="2")
        {
            cond += " and shenhe=0 ";
        }
        sql += cond+" order by shenhe";
        SqlDataSource1.SelectCommand = sql;
        Session["selectsql"] = sql;
        GridView1.DataBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
}   
