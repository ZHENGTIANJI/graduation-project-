using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class managers_user_manage_edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["sqlUF"] = SqlDataSource1.SelectCommand;
        }
        if(Session["EditSelect"]!=null)
        {
            SqlDataSource1.SelectCommand = Session["EditSelect"].ToString();
        }
    }
    protected void btinsert_Click(object sender, EventArgs e)
    {
        Response.Redirect("insertt.aspx");
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        #region
        //string[] estr = e.CommandArgument.ToString().Split(',');
        //string id = estr[0].ToString();
        //string psw = estr[1].ToString();
        //string user_class = estr[2].ToString();
        //string name = estr[3].ToString();
        //string sex = estr[4].ToString();
        //string cn = estr[5].ToString();
        //string mname = estr[6].ToString();
        //string telephone = estr[7].ToString();
        //string email = estr[8].ToString();
        //string grade = estr[9].ToString();
        //string clas = estr[10].ToString();    
        #endregion

        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        string id = e.CommandArgument.ToString();

        if(e.CommandName=="Edit2")
        {
            Response.Redirect("insertt.aspx?id="+id);
        }
        if(e.CommandName=="Delete2")
        {
            //判断该用户是否有未还书
            SqlDataAdapter adp2 = new SqlDataAdapter("select * from borrow where borrower_id='"+id+"' and is_return=0", cnn);
            DataSet ds2 = new DataSet();
            adp2.Fill(ds2);

            if (ds2.Tables[0].Rows.Count == 0)
            {
                SqlCommand cmd=new SqlCommand();
                cmd.Connection=cnn;
                cnn.Open();
                SqlTransaction tr=cnn.BeginTransaction();
                cmd.Transaction=tr;

                try
                {
                    cmd.CommandText="delete users where id='" + id + "'";
                    cmd.ExecuteNonQuery();

                    cmd.CommandText="delete borrow where borrower_id='" + id + "'";
                    cmd.ExecuteNonQuery();

                    cmd.CommandText ="delete reserve where no='" + id + "'";
                    cmd.ExecuteNonQuery();

                    tr.Commit();
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('删除成功！');", true);
                    GridView1.DataBind();
                }
                catch
                {
                    tr.Rollback();
                }             
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('该用户存在未归还资源，删除失败！');", true);
            }
        }
    }
    protected void btPrint_Click(object sender, EventArgs e)
    {
        //string sql=SqlDataSource1.SelectCommand;
        //Session["sqlUF"] = sql;
        Response.Redirect("UserInformationPrint/UserInformationPrint.aspx");
    }
    protected void btfind_Click(object sender, EventArgs e)
    {
        string sql = "select id,psw,user_class.user_class,name,sex,cn,mname,grade,class,telephone,email from users left join major on major.mid=users.major left join campus on campus.cid=major.cid left join user_class on user_class.utid=users.user_class  where shenhe=1";
        string uty = dputy.SelectedItem.Value, campus = dpc.SelectedItem.Value, major = dpm.SelectedItem.Value;
        uty = uty == "0" ? "" : uty; campus = campus == "0" ? "" : campus; major = major == "0" ? "" : major;
        if(txtid.Text.Trim()!="")
        {
            sql += "and id='"+txtid.Text.Trim()+"'";
        }
        else
        {
            sql += " and name like '%"+txtn.Text.Trim()+"%' and users.user_class like '%"+uty+"%' and major.cid like '%"+campus+"%' and major like '%"+major+"%'";
        }
        SqlDataSource1.SelectCommand = sql;
        Session["EditSelect"] = sql;
        Session["sqlUF"] = sql;
    }
}