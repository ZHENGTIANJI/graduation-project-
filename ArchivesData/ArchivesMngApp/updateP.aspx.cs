using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class users_updateP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string sql = "select id,psw,user_class.user_class,name,sex,cn,mname,grade,class,telephone,email,shenhe from users left join major on major.mid=users.major left join campus on campus.cid=major.cid left join user_class on user_class.utid=users.user_class where id='" + Session["id"].ToString() + "'";
            SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
            SqlDataAdapter adp = new SqlDataAdapter(sql,cnn);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            
            lbn.Text = ds.Tables[0].Rows[0]["name"].ToString();
            lbid.Text = ds.Tables[0].Rows[0]["id"].ToString();
            txtemail.Text = ds.Tables[0].Rows[0]["email"].ToString();
            txtphone.Text = ds.Tables[0].Rows[0]["telephone"].ToString();
            lbsex.Text = ds.Tables[0].Rows[0]["sex"].ToString();
            lbc.Text = ds.Tables[0].Rows[0]["cn"].ToString();
            lbm.Text = ds.Tables[0].Rows[0]["mname"].ToString();
            lbg.Text = ds.Tables[0].Rows[0]["grade"].ToString();
            lbclass.Text = ds.Tables[0].Rows[0]["class"].ToString();
            lbut.Text = ds.Tables[0].Rows[0]["user_class"].ToString();

            txtovernum.Text = FindNum().ToString();
        }
    }
    protected void btedit_Click(object sender, EventArgs e)
    {
        txtemail.Enabled = true;
        txtphone.Enabled = true;
    }
    protected void btok_Click(object sender, EventArgs e)
    {

        if (txtemail.Text.Trim() == "" || txtphone.Text.Trim() == "")
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('信息不完整！');", true);
        else
        {
            SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;
            cnn.Open();

            cmd.CommandText = "update users set email='" + txtemail.Text + "',telephone='" + txtphone.Text + "' where id='" + Session["id"] + "'";
            cmd.ExecuteNonQuery();

            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('修改成功！');", true);

            txtemail.Enabled = false;
            txtphone.Enabled = false;
        }

    }

    //查找超期图书
    private int FindNum()
    {
        int num;
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adp = new SqlDataAdapter("select borrower_id,COUNT(*) num from borrow where is_return=0 and deadline<GETDATE() and borrower_id='"+Session["id"].ToString()+"' group by borrower_id", cnn);
        DataSet ds = new DataSet();
        adp.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
            num = Convert.ToInt32(ds.Tables[0].Rows[0]["num"].ToString());
        else
            num = 0;
        return num;
    }
}