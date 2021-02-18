using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class stockmanagement_paperstock : System.Web.UI.Page
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

        cmd.CommandText = "update paper set name='" + txtname.Text + "',zhicheng='" + zhicheng.SelectedItem.Text + "',shenhe='" + "已审核" + "',paper_type_id='" + ptid + "',major_id='" + majorid + "',QR_code='" + txtQR.Text + "',write_dt='" + txtwritedt.Text + "',xuezhi='" + xuezhi.SelectedItem.Text + "',dabian_dt='" + txtdabiandt.Text + "',adviser='" + txtadviser.Text + "',direction='" + txtdirection.Text + "',stock_dt='" + txtstockdt.Text + "',class_number='" + txtcn.Text + "',location='" + txtlocation.Text +  "',format='" + txtformat.Text + "',number_of_page='" + int.Parse(txtnumberofpage.Text) + "',language='" + lid + "',note='" + txtnote.Text + "' where QR_code='" + txtQR.Text + "'";
        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();
    }
    protected void scan_Click(object sender, EventArgs e)
    {
        DataSet dst1 = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [dabian_dt], [xuezhi], [format],[write_dt],[zhicheng],[adviser], [location], [stock_dt], [number], [name], [ptname], [mname], [QR_code], [class_number],[shenhe],[direction], [author], [status], [note], [lname] FROM [paper] left join paper_type on paper.paper_type_id=paper_type.ptid left join major on paper.major_id=major.mid left join language on paper.language=language.lid where QR_code='"+txtQR.Text+"'",cnn);
        adpt.Fill(dst1);
        txtname.Text = (string)dst1.Tables[0].Rows[0]["name"];
        papertype.SelectedIndex = -1;
        papertype.Items.FindByText((string)dst1.Tables[0].Rows[0]["ptname"]).Selected = true;
        txtauthor.Text = (string)dst1.Tables[0].Rows[0]["author"];
        xuezhi.SelectedIndex = -1;
        xuezhi.Items.FindByText((string)dst1.Tables[0].Rows[0]["xuezhi"]).Selected = true;
        major.SelectedIndex = -1;
        major.Items.FindByText((string)dst1.Tables[0].Rows[0]["mname"]).Selected = true;
        txtdirection.Text = (string)dst1.Tables[0].Rows[0]["direction"];
        txtstockdt.Text = dst1.Tables[0].Rows[0]["stock_dt"].ToString();
        txtQR.Text = (string)dst1.Tables[0].Rows[0]["QR_code"];
        txtlocation.Text = (string)dst1.Tables[0].Rows[0]["location"];
        txtadviser.Text = (string)dst1.Tables[0].Rows[0]["adviser"];
        zhicheng.SelectedIndex = -1;
        zhicheng.Items.FindByText((string)dst1.Tables[0].Rows[0]["zhicheng"]).Selected = true;
        txtdabiandt.Text = dst1.Tables[0].Rows[0]["dabian_dt"].ToString();
        txtwritedt.Text = dst1.Tables[0].Rows[0]["write_dt"].ToString();
        language.SelectedIndex = -1;
        language.Items.FindByText((string)dst1.Tables[0].Rows[0]["lname"]).Selected = true;
        txtformat.Text = (string)dst1.Tables[0].Rows[0]["format"];
        txtnumberofpage.Text = dst1.Tables[0].Rows[0]["number_of_page"].ToString();
        txtnote.Text = (string)dst1.Tables[0].Rows[0]["note"];
        

    }
}