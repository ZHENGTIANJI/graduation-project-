﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class login1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btok_Click(object sender, EventArgs e)
    {
        String uid = Request.Form["username"].ToString();
        String psw = Request.Form["password"].ToString();
        if (havethisuser(uid, psw))
        {
            if ((int)Session["class"] == 0)
            {
                Response.Redirect("main_manager.aspx");
            }
            else
            {
                Response.Redirect("paperupload.aspx");
            }
        }
        else
        {
            if (uid == "" || psw == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('用户名或密码不能为空！');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('用户名或密码错误！');", true);
            }
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
            Session["class"] = dst.Tables[0].Rows[0]["user_class"].ToString() == "管理员" ? 0 : 1;
            Session["id"] = dst.Tables[0].Rows[0]["id"].ToString();
            Session["name"] = dst.Tables[0].Rows[0]["name"].ToString();
            Session["majorid"] = dst.Tables[0].Rows[0]["major"].ToString();

        }

        return dst.Tables[0].Rows.Count > 0;
    }
}