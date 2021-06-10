using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class managers_BaseData_office : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lkbc_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void lkbm_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }

   /// <summary>
   /// 删除学院
   /// </summary>
   /// <param name="sender"></param>
   /// <param name="e"></param>
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string cid=e.CommandArgument.ToString();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);

        //删除学院
        if(e.CommandName=="Delete1")
        {
            //判断该学院下是否有专业
            SqlDataAdapter adp = new SqlDataAdapter("select * from major where cid='"+cid+"'",cnn);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            if(ds.Tables[0].Rows.Count>0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('请先删除该学院中的专业！');", true);
            }
            else
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cnn;
                cnn.Open();
                cmd.CommandText = "delete campus where cid='"+cid+"'";
                cmd.ExecuteNonQuery();
                GridView1.DataBind();
            }
        }
    }
   /// <summary>
   /// 删除专业
   /// </summary>
   /// <param name="sender"></param>
   /// <param name="e"></param>
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string mid = e.CommandArgument.ToString();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);

        if (e.CommandName == "Delete2")
        {
            //判断该专业是否有用户
            SqlDataAdapter adp = new SqlDataAdapter("select * from users where major='" + mid + "'", cnn);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('请先删除该专业中的用户！');", true);
            }
            else
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cnn;
                cnn.Open();
                cmd.CommandText = "delete major where mid='" + mid + "'";
                cmd.ExecuteNonQuery();
                GridView2.DataBind();
            }
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        GridView2.DataBind();
    }
    protected void btok_Click(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        cnn.Open();
        SqlCommand cmd1 = new SqlCommand("GetC", cnn);
        cmd1.CommandType = CommandType.StoredProcedure;
        cmd1.Parameters.Add(new SqlParameter("@id", System.Data.SqlDbType.VarChar, 13));
        cmd1.Parameters["@id"].Direction = System.Data.ParameterDirection.Output;
        cmd1.ExecuteNonQuery();
        string cid = cmd1.Parameters["@id"].Value.ToString();

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        //cnn.Open();
        cmd.CommandText = "insert campus(cid,cn) values('" + cid + "','" + txtn.Text.Trim() + "')";
        cmd.ExecuteNonQuery();

        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('增加成功！');", true);
        GridView1.DataBind();
    }

    protected void btok1_Click(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        cnn.Open();
        SqlCommand cmd1 = new SqlCommand("GetM", cnn);
        cmd1.CommandType = CommandType.StoredProcedure;
        cmd1.Parameters.Add(new SqlParameter("@id", System.Data.SqlDbType.VarChar, 13));
        cmd1.Parameters["@id"].Direction = System.Data.ParameterDirection.Output;
        cmd1.ExecuteNonQuery();
        string mid = cmd1.Parameters["@id"].Value.ToString();

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        //cnn.Open();

        cmd.CommandText = "insert major(mid,mname,cid) values('" + mid + "','" + txtn1.Text.Trim() + "','" + dpc.SelectedItem.Value + "')";
        cmd.ExecuteNonQuery();

        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('增加成功！');", true);
        GridView2.DataBind();
    }
}