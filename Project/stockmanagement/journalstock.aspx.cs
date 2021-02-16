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

    }
    protected void btok_Click(object sender, EventArgs e)
    {
        DataSet dst1 = new DataSet();
        DataSet dst2 = new DataSet();
        DataSet dst3 = new DataSet();
        DataSet dst4 = new DataSet();
        DataSet dst5 = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptjt = new SqlDataAdapter("select jtid from journal_type where jtname='" + jt.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptmajor = new SqlDataAdapter("select mid from major where mname='" + major.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptjournalgrade = new SqlDataAdapter("select gid from journal_grade where gradename='" + grade.SelectedItem.Value + "'", cnn);
        SqlDataAdapter adptlanguage = new SqlDataAdapter("select lid from language where lname='" + language.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptnum = new SqlDataAdapter("select number from journal where name='" + txtname.Text + "'", cnn);
        SqlCommand cmd = cnn.CreateCommand();
        adptjt.Fill(dst1);
        adptmajor.Fill(dst2);
        adptjournalgrade.Fill(dst3);
        adptlanguage.Fill(dst4);
        adptnum.Fill(dst5);
        int jtid = (int)dst1.Tables[0].Rows[0]["jtid"];
        int majorid = (int)dst2.Tables[0].Rows[0]["mid"];
        int grade1 = (int)dst3.Tables[0].Rows[0]["gid"];
        int lid = (int)dst4.Tables[0].Rows[0]["lid"];
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

        cmd.CommandText = "INSERT INTO journal(name, journal_type_id, major_id, QR_code, publish_dt, office_name, period_number, stock_dt, location, class_number, status, number, format, number_of_page,language,note,organization,period_type,address,grade) VALUES ('" + txtname.Text + "'," + jtid + "," + majorid + ",'" + txtQR.Text + "','" + txtpubdt.Text + "','" + txtoffname.Text + "','" + txtpn.Text + "','" + txtstockdt.Text + "','" + txtlocation.Text + "','" + txtcn.Text + "','库存'," + num + ",'" + txtformat.Text + "','" + txtnumberofpage.Text + "'," + lid + ",'" + txtnote.Text + "','" + txtorgan.Text +"','"+period.SelectedItem.Value+ "','"+txtaddress.Text+"','"+grade1+"')";
        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();
    }
    protected void btclear_Click(object sender, EventArgs e)
    {
        txtname.Text = "";
        txtQR.Text = "";
        txtaddress.Text = "";
        txtpubdt.Text = "";
        txtprice.Text = "";
        txtorgan.Text = "";
        txtstockdt.Text = "";
        txtcn.Text = "";
        txtlocation.Text = "";
        txtformat.Text = "";
        txtnumberofpage.Text = "";
        txtnote.Text = "";
        txtoffname.Text = "";
    }
}