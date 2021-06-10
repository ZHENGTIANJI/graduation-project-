using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class renew : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string sql = "select borrow.id,borrow.QR_code,books.name,borrow_type.name,borrow_dt, return_dt, case is_return when 0 then '未归还' when '1' then '已归还' end is_return, deadline,renew_times from borrow left join borrow_type on borrow_type_id=borrow_type.id left join (select QR_code,name from book union select QR_code,name from paper union select QR_code,name from journal union select QR_code,name from data) books on books.QR_code=borrow.QR_code where borrower_id='"+Session["id"].ToString()+"' and is_return=0 order by borrow_dt desc";
        SqlDataSource1.SelectCommand = sql;   
    }

    protected void btrenew_Click(object sender, EventArgs e)
    {
        bool flag = Flag();
        LinkButton btn = sender as LinkButton;
        GridViewRow row = (GridViewRow)btn.NamingContainer;
        int[] renew = GetRenewRules();
        int renew_times = renew[0];
        int renew_days = renew[1];

        if (flag)
        {
            if (renew_times > Convert.ToInt32(row.Cells[6].Text))
            {
                SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cnn;
                cnn.Open();

                cmd.CommandText = "update borrow set renew_times=renew_times+1,deadline=CONVERT(varchar(10),DATEADD(DAY," + renew_days + ",deadline),120) where borrower_id='" + Session["id"].ToString() + "' and QR_code='" + row.Cells[1].Text + "' and is_return=0";
                cmd.ExecuteNonQuery();
                //资源续借时资源状态仍处于借出
                //ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('续借成功！');", true);
                GridView1.DataBind();

            }
            else
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('续借次数已达上限，续借失败！');", true);
        }
    }

    //取出续借次数
    private int[] GetRenewRules()
    {
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adp = new SqlDataAdapter("select * from user_class where user_class='"+Session["user_class"].ToString()+"'", cnn);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        int renew_times = Convert.ToInt32(ds.Tables[0].Rows[0]["renew_times"].ToString());
        int renew_days = Convert.ToInt32(ds.Tables[0].Rows[0]["renew_days"].ToString());
        int[] renew = {renew_times,renew_days};
        return renew;
    }

    //判断是否存在超期未还图书
    private bool Flag()
    {
        bool flag = true;
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adp = new SqlDataAdapter("select * from borrow where is_return=0 and GETDATE()>deadline and borrower_id='" + Session["id"] + "'", cnn);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            flag = false;
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('存在超期未还资源，续借失败');", true);
        }
        return flag;
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
}