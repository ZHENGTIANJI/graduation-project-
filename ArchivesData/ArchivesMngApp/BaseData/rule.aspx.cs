using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class managers_BaseData_rule : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btadd_Click(object sender, EventArgs e)
    {
        //判断信息输入完整
        if (!HaveUty(txtuty.Text))
        {
            if (txtrdays.Text.Trim() == "" || txtnum.Text.Trim() == "" || txtbdays.Text.Trim() == "")
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('请输入完整信息！');", true);
            else
            {
                SqlDataSource1.InsertParameters["utid"].DefaultValue = GenId();
                SqlDataSource1.InsertParameters["user_class"].DefaultValue = txtuty.Text.Trim();
                SqlDataSource1.InsertParameters["number_limit"].DefaultValue = txtnum.Text.Trim();
                SqlDataSource1.InsertParameters["borrow_days"].DefaultValue = txtbdays.Text.Trim();
                SqlDataSource1.InsertParameters["reserve_days"].DefaultValue = txtrdays.Text.Trim();
                SqlDataSource1.InsertParameters["renew_times"].DefaultValue = txtrenew_times.Text.Trim();
                SqlDataSource1.InsertParameters["renew_days"].DefaultValue = txtrenew_days.Text.Trim();

                SqlDataSource1.Insert();
            }
        }
        else
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('该用户类别已存在！');", true);
    }

    //生成utid
    private string GenId()
    {
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adp = new SqlDataAdapter("select max(utid) utid from user_class", cnn);
        DataSet ds = new DataSet();
        adp.Fill(ds);
        string id = (Convert.ToInt32(ds.Tables[0].Rows[0]["utid"].ToString()) + 1).ToString();
        return id;
    }
    protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete2")
        {
            SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
            cnn.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select * from users where user_class='" + e.CommandArgument.ToString() + "'", cnn);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('存在用户属于该类别！');", true);
            }
            else
            {
                SqlCommand cmd = new SqlCommand("delete user_class where utid='" + e.CommandArgument.ToString() + "'", cnn);
                cmd.ExecuteNonQuery();
                GridView1.DataBind();
            }
        }
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow gr = GridView1.Rows[e.RowIndex];
        SqlDataSource1.UpdateParameters["user_class"].DefaultValue = ((Label)gr.FindControl("lbuty")).Text;
    }

    //判断该用户类型名是否存在
    private bool HaveUty(string user_class)
    {
        bool flag;
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adp = new SqlDataAdapter("select * from user_class where user_class='"+user_class+"'", cnn);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
            flag = true;
        else
            flag = false;
        return flag;
    }
}