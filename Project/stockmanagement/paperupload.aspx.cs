using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class stockmanagement_paperupload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void upload_Click(object sender, EventArgs e)
    {
        DataSet dst1 = new DataSet();
        DataSet dst2 = new DataSet();
        DataSet dst3 = new DataSet();
        DataSet dst4 = new DataSet();
        DataSet dst5 = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptpt = new SqlDataAdapter("select ptid from paper_type where ptname='" + papertype.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptmajor = new SqlDataAdapter("select mid from major where mname='" + major.SelectedItem.Text + "'", cnn);
        //SqlDataAdapter adptbindingtype = new SqlDataAdapter("select bitid from binding_type where bitname='" + bindingtype.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptlanguage = new SqlDataAdapter("select lid from language where lname='" + language.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptnum = new SqlDataAdapter("select number from paper where name='" + txtname.Text + "'", cnn);
        SqlCommand cmd = cnn.CreateCommand();
        adptpt.Fill(dst1);
        adptmajor.Fill(dst2);
        //adptbindingtype.Fill(dst3);
        adptlanguage.Fill(dst4);
        adptnum.Fill(dst5);
        int ptid = (int)dst1.Tables[0].Rows[0]["ptid"];
        int majorid = (int)dst2.Tables[0].Rows[0]["mid"];
        //int bitid = (int)dst3.Tables[0].Rows[0]["bitid"];
        int lid = (int)dst4.Tables[0].Rows[0]["lid"];
        int num;
        if (dst5.Tables[0].Rows.Count > 0)
        {
            num = (int)dst5.Tables[0].Rows[0]["number"] + 1;
            cmd.CommandText = "update paper set number='" + num + "' where name='" + txtname.Text + "'";
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
        }
        else
        {
            num = 1;
        }

        cmd.CommandText = "INSERT INTO paper(name, adviser,paper_type_id, major_id, QR_code, direction, write_dt, author, stock_dt, shenhe, dabian_dt, xuezhi, status, number, format, number_of_page,language,note,zhicheng) VALUES ('" + txtname.Text + "'," +txtadviser+","+ ptid + "," + majorid + ",'" + "1111111" + "','" + txtdirection.Text + "','" + txtwritedt.Text + "','" + txtauthor.Text + "','" + txtstockdt.Text + "','" + "待审核" + "','" + txtdabiandt.Text + "','" + xuezhi.SelectedItem.Value + "'," +  "'库存'," + num + ",'" + txtformat.Text + "','" + txtnumberofpage.Text + "',"  + lid + ",'" + txtnote.Text +"','"+zhicheng.SelectedItem.Value+ "')";
        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();
    }
}