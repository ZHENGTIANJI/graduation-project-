using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class bookstock : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null || (int)Session["uid"] != 0)
        {
            Response.Redirect("../login1.aspx");
        }
    }
    protected void btok_Click(object sender, EventArgs e)
    {
        DataSet dst1 = new DataSet();
        DataSet dst2 = new DataSet();
        DataSet dst3 = new DataSet();
        DataSet dst4 = new DataSet();
        DataSet dst5 = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptbt = new SqlDataAdapter("select btid from book_type where btname='"+bt.SelectedItem.Text+"'", cnn);
        SqlDataAdapter adptmajor = new SqlDataAdapter("select mid from major where mname='" + major1.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptbindingtype = new SqlDataAdapter("select bitid from binding_type where bitname='" + bindingtype.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptlanguage = new SqlDataAdapter("select lid from language where lname='" + language.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptnum = new SqlDataAdapter("select number from book where name='"+txtname.Text+"'", cnn);
        SqlCommand cmd = cnn.CreateCommand();
        adptbt.Fill(dst1);
        adptmajor.Fill(dst2);
        adptbindingtype.Fill(dst3);
        adptlanguage.Fill(dst4);
        adptnum.Fill(dst5);
        int btid = (int)dst1.Tables[0].Rows[0]["btid"];
        String majorid = dst2.Tables[0].Rows[0]["mid"].ToString();
        int bitid = (int)dst3.Tables[0].Rows[0]["bitid"];
        int lid = (int)dst4.Tables[0].Rows[0]["lid"];
        int num;
        if (dst5.Tables[0].Rows.Count > 0)
        {
            num = (int)dst5.Tables[0].Rows[0]["number"]+1;
            cmd.CommandText = "update book set number='" + num + "' where name='" + txtname.Text + "'";
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
        }
        else
        {
            num = 1;
        }
        if(txtname.Text==""||txtQR.Text==""){
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('保存失败！');", true);
        }else{
            String stockdt = DateTime.Now.ToString("yyyy-MM-dd");
            cmd.CommandText = "INSERT INTO book(name, book_type_id, major_type_id, QR_code, publisher, publish_dt, author, stock_dt, teacher, CD, location, book_number, status, number, format, price, number_of_page, binding_type_id,language,note) VALUES ('" + txtname.Text + "'," + btid + "," + majorid + ",'"+txtQR.Text+"','"+txtpub.Text+"','"+pub_year.Text+"-"+pub_month.Text+"-"+pub_day.Text+"','"+txtauthor.Text+"','"+stockdt+"','"+txtteacher.Text+"','"+CD.SelectedItem.Text+"','"+txtlocation.Text+"','"+txtbooknumber.Text+"','库存',"+num+",'"+txtformat.Text+"','"+txtprice.Text+"','"+txtnumberofpage.Text+"',"+bitid+","+lid+",'"+txtnote.Text+"')";
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
        txtpub.Text = "";
        pub_year.Text = "";
        pub_month.Text = "";
        pub_day.Text = "";
        txtprice.Text = "";
        txtauthor.Text = "";
        txtteacher.Text = "";
        txtlocation.Text = "";
        txtbooknumber.Text = "";
        txtformat.Text = "";
        txtnumberofpage.Text = "";
        txtnote.Text = "";

;    }
}