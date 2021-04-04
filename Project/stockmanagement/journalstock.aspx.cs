using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class stockmanagement_journalstock : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["class"] == null || (int)Session["class"] != 0)
        {
            Response.Redirect("../login1.aspx");
        }
        user.Text = "当前用户:" + Session["name"].ToString();
    }
    protected void btok_Click(object sender, EventArgs e)
    {
        DataSet dst1 = new DataSet();
        DataSet dst2 = new DataSet();
        DataSet dst3 = new DataSet();
        DataSet dst4 = new DataSet();
        DataSet dst5 = new DataSet();
        DataSet dst6 = new DataSet();
        DataSet dst7 = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptjt = new SqlDataAdapter("select jtid from journal_type where jtname='" + jt.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptmajor = new SqlDataAdapter("select mid from major where mname='" + major.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptjournalgrade = new SqlDataAdapter("select gid from journal_grade where gradename='" + grade.SelectedItem.Value + "'", cnn);
        SqlDataAdapter adptlanguage = new SqlDataAdapter("select lid from language where lname='" + language.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptnum = new SqlDataAdapter("select number from journal where name='" + txtname.Text + "'", cnn);
        SqlDataAdapter adptorgan = new SqlDataAdapter("select organid from organization where organname='" + organ.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptgrade = new SqlDataAdapter("select gid from journal_grade where gradename='" + grade.SelectedItem.Text + "'", cnn);
        SqlCommand cmd = cnn.CreateCommand();
        adptjt.Fill(dst1);
        adptmajor.Fill(dst2);
        adptjournalgrade.Fill(dst3);
        adptlanguage.Fill(dst4);
        adptnum.Fill(dst5);
        adptorgan.Fill(dst6);
        adptgrade.Fill(dst7);
        int jtid = (int)dst1.Tables[0].Rows[0]["jtid"];
        String majorid = dst2.Tables[0].Rows[0]["mid"].ToString();
        int grade1 = (int)dst3.Tables[0].Rows[0]["gid"];
        int lid = (int)dst4.Tables[0].Rows[0]["lid"];
        int organid = (int)dst6.Tables[0].Rows[0]["organid"];
        int gid = (int)dst7.Tables[0].Rows[0]["gid"];
        int num;
        if (dst5.Tables[0].Rows.Count > 0)
        {
            num = (int)dst5.Tables[0].Rows[0]["number"] + 1;
            cmd.CommandText = "update journal set number='" + num + "' where name='" + txtname.Text + "'";
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
        }
        else
        {
            num = 1;
        }
        if (txtname.Text == "" || txtQR.Text == "" )
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('保存失败！');", true);
        }
        else
        {
            String stockdt = DateTime.Now.ToString("yyyy-MM-dd");
            cmd.CommandText = "INSERT INTO journal(name, journal_type_id, major_id, QR_code, publish_dt, office_name, period_number, stock_dt, location, class_number, status, number, format, number_of_page,language,note,organizationid,period_type,address,gradeid) VALUES ('" + txtname.Text + "'," + jtid + "," + majorid + ",'" + txtQR.Text + "','" + pub_year.Text+"-"+pub_month.Text+"-"+pub_day.Text + "','" + txtoffname.Text + "','" + txtpn.Text + "','" + stockdt + "','" + txtlocation.Text + "','" + txtcn.Text + "','库存'," + num + ",'" + txtformat.Text + "','" + txtnumberofpage.Text + "'," + lid + ",'" + txtnote.Text + "','" + organid  + "','" + period.SelectedItem.Value + "','" + txtaddress.Text + "','" + gid + "')";
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('保存成功！');", true);
        }

        
    }
    protected void btclear_Click(object sender, EventArgs e)
    {
        txtname.Text = "";
        txtQR.Text = "";
        txtaddress.Text = "";
        pub_year.Text = "";
        pub_month.Text = "";
        pub_day.Text = "";
        txtprice.Text = "";
        txtcn.Text = "";
        txtlocation.Text = "";
        txtformat.Text = "";
        txtnumberofpage.Text = "";
        txtnote.Text = "";
        txtoffname.Text = "";
    }
}