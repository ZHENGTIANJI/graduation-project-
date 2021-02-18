using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class QueryAndModify_paperQueryAndModify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    void ExecuteQuery()
    {
        String strmajor = majortype.SelectedItem.Text.ToString();
        String strpapertype = papertype.SelectedItem.Text.ToString();
        String strpapername = papername.Text.ToString().Trim();

        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [dabian_dt], [xuezhi], [format],[write_dt],[zhicheng],[adviser], [location], [stock_dt], [number], [name], [ptname], [mname], [QR_code], [class_number],[shenhe],[direction], [author], [status], [note], [lname] FROM [paper] left join paper_type on paper.paper_type_id=paper_type.ptid left join major on paper.major_id=major.mid left join language on paper.language=language.lid where name like '%" + strpapername + "%' and mname like '%" + strmajor + "%' and ptname like '%" + strpapertype + "%'", cnn);
        adpt.Fill(dst);
        GridView1.DataSource = dst.Tables[0];
        GridView1.DataBind();
    }
    protected void query_Click(object sender, EventArgs e)
    {
        ExecuteQuery();
    }
    protected void btok_Click(object sender, EventArgs e)
    {
        DataSet dst1 = new DataSet();
        DataSet dst2 = new DataSet();
        DataSet dst3 = new DataSet();
        DataSet dst4 = new DataSet();
        DataSet dst5 = new DataSet();

        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptdt = new SqlDataAdapter("select ptid from paper_type where ptname='" + pt.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptmajor = new SqlDataAdapter("select mid from major where mname='" + mj.SelectedItem.Text + "'", cnn);
        //SqlDataAdapter adptorgan = new SqlDataAdapter("select organid from organization where organname='" + organ.SelectedItem.Value + "'", cnn);
        SqlDataAdapter adptlanguage = new SqlDataAdapter("select lid from language where lname='" + language.SelectedItem.Text + "'", cnn);
        //SqlDataAdapter adptgrade = new SqlDataAdapter("select gid from journal_grade where gradename='" + grade.SelectedItem.Text + "'", cnn);
        SqlCommand cmd = cnn.CreateCommand();
        adptdt.Fill(dst1);
        adptmajor.Fill(dst2);
        //adptorgan.Fill(dst3);
        adptlanguage.Fill(dst4);
        //adptgrade.Fill(dst5);
        int ptid = (int)dst1.Tables[0].Rows[0]["ptid"];
        int majorid = (int)dst2.Tables[0].Rows[0]["mid"];
        //int or = (int)dst3.Tables[0].Rows[0]["organid"];
        int lid = (int)dst4.Tables[0].Rows[0]["lid"];
        //int gid = (int)dst5.Tables[0].Rows[0]["gid"];
        int id = Convert.ToInt32(Session["paperid"]);

        cmd.CommandText = "update paper set name='" + txtname.Text +"',zhicheng='"+zhicheng.SelectedItem.Text+ "',shenhe='" + shenhe.SelectedItem.Text  + "',paper_type_id='" + ptid + "',major_id='" + majorid + "',QR_code='" + txtQR.Text + "',write_dt='" + txtwritedt.Text + "',xuezhi='" + xuezhi.SelectedItem.Text+"',dabian_dt='" + txtdabiandt.Text  + "',adviser='" + txtadviser.Text + "',direction='" + txtdirection.Text + "',stock_dt='" + txtstockdt.Text + "',class_number='" + txtcn.Text + "',number='" + txtnumber.Text + "',location='" + txtlocation.Text + "',status='" + status.SelectedItem.Text + "',format='" + txtformat.Text + "',number_of_page='" + int.Parse(txtnumberofpage.Text) + "',language='" + lid + "',note='" + txtnote.Text +  "' where id='" + id + "'";
        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();
        ExecuteQuery();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int num = e.RowIndex;
        txtname.Text = GridView1.Rows[num].Cells[0].Text.ToString();
        pt.SelectedIndex = -1;
        pt.Items.FindByText( GridView1.Rows[num].Cells[1].Text.ToString()).Selected = true;
        txtauthor.Text=GridView1.Rows[num].Cells[2].Text.ToString();
        xuezhi.SelectedIndex = -1;
        xuezhi.Items.FindByText(GridView1.Rows[num].Cells[3].Text.ToString()).Selected=true;
        mj.SelectedIndex = -1;
        mj.Items.FindByText(GridView1.Rows[num].Cells[4].Text.ToString()).Selected = true;
        txtdirection.Text = GridView1.Rows[num].Cells[5].Text.ToString();
        txtstockdt.Text = GridView1.Rows[num].Cells[6].Text.Trim().ToString();
        txtQR.Text = GridView1.Rows[num].Cells[7].Text.ToString();
        txtlocation.Text = GridView1.Rows[num].Cells[8].Text.ToString();
        status.SelectedIndex = -1;
        status.Items.FindByText(GridView1.Rows[num].Cells[9].Text.ToString()).Selected = true;
        txtadviser.Text= GridView1.Rows[num].Cells[10].Text.ToString();
        zhicheng.SelectedIndex = -1;
        zhicheng.Items.FindByText(GridView1.Rows[num].Cells[11].Text.ToString()).Selected = true;
        txtdabiandt.Text = GridView1.Rows[num].Cells[12].Text.ToString();
        txtcn.Text = GridView1.Rows[num].Cells[13].Text.ToString();
        shenhe.SelectedIndex = -1;
        shenhe.Items.FindByText(GridView1.Rows[num].Cells[14].Text.ToString()).Selected = true;
        txtwritedt.Text = GridView1.Rows[num].Cells[15].Text.ToString();
        language.SelectedIndex = -1;
        language.Items.FindByText(GridView1.Rows[num].Cells[16].Text.ToString()).Selected = true;
        txtformat.Text = GridView1.Rows[num].Cells[17].Text.ToString();
        txtnumberofpage.Text = GridView1.Rows[num].Cells[18].Text.ToString();
        txtnumber.Text = GridView1.Rows[num].Cells[19].Text.ToString();
        txtnote.Text = GridView1.Rows[num].Cells[20].Text.ToString();
        Session["paperid"] = GridView1.Rows[num].Cells[21].Text.ToString();
    }
}