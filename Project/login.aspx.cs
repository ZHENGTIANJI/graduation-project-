using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class login1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btok_Click(object sender, EventArgs e)
    {
        if (havethisuser(txtuid.Text.Trim(), txtpsw.Text.Trim()))
        {
            if ((int)Session["uid"] == 0)
            {
                Response.Redirect("main_manager.aspx");
            }
            else
            {
                Response.Redirect("main_user.aspx");
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('用户名或密码错误！');", true);
        }
    }
    bool havethisuser(string uid, string psw)
    {

        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adpt = new SqlDataAdapter("select * from users where id='" + uid + "' and psw='" + psw + "'", cnn);
        adpt.Fill(dst);
        if (dst.Tables[0].Rows.Count > 0)
        {
            Session["uid"] = dst.Tables[0].Rows[0]["user_class"].ToString() == "管理员" ? 0 : 1;
        }

        return dst.Tables[0].Rows.Count > 0;
    }
}