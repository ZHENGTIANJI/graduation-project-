using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class QueryAndModify_dataQueryAndModify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int num = e.RowIndex;
        txtname.Text = GridView1.Rows[num].Cells[0].Text.ToString();
        dt.SelectedIndex = -1;
        dt.Items.FindByText(GridView1.Rows[num].Cells[1].Text.ToString()).Selected = true;
        txtQR.Text = GridView1.Rows[num].Cells[2].Text.ToString();
        txtunit.Text = GridView1.Rows[num].Cells[3].Text.ToString();
        txtstockdt.Text = GridView1.Rows[num].Cells[4].Text.ToString();
        txtlocation.Text = GridView1.Rows[num].Cells[5].Text.ToString();
        txtnumber.Text = GridView1.Rows[num].Cells[6].Text.ToString();
        txtcn.Text = GridView1.Rows[num].Cells[7].Text.ToString();
        language.SelectedIndex = -1;
        language.Items.FindByText(GridView1.Rows[num].Cells[8].Text.ToString()).Selected = true;
        txtcompiledt.Text = GridView1.Rows[num].Cells[9].Text.ToString();
        txtformat.Text = GridView1.Rows[num].Cells[10].Text.ToString();
        txtnumberofpage.Text = GridView1.Rows[num].Cells[11].Text.ToString();
        txtauthor.Text = GridView1.Rows[num].Cells[12].Text.ToString();
        major.SelectedIndex = -1;
        major.Items.FindByText(GridView1.Rows[num].Cells[13].Text.ToString()).Selected = true;
        status.SelectedIndex = -1;
        status.Items.FindByText(GridView1.Rows[num].Cells[14].Text.ToString()).Selected = true;
        txtnote.Text = GridView1.Rows[num].Cells[15].Text.ToString();
        Session["dataid"] = GridView1.Rows[num].Cells[16].Text.ToString();
    }
    protected void query_Click(object sender, EventArgs e)
    {
        ExecuteQuery();
    }
    void ExecuteQuery()
    {
        String strmajor = majortype.SelectedItem.Text.ToString();
        String strdatatype = datatype.SelectedItem.Text.ToString();
        String strdataname = dataname.Text.ToString().Trim();

        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [compile_dt], [unit], [format], [location], [stock_dt], [number], [name], [dtname], [mname], [QR_code], [class_number], [author], [status], [note], [lname] FROM [data] left join data_type on data.data_type_id=data_type.dtid left join major on data.major_id=major.mid left join language on data.language=language.lid where name like '%" + strdataname + "%' and mname like '%" + strmajor + "%' and dtname like '%" + strdatatype + "%'", cnn);
        adpt.Fill(dst);
        GridView1.DataSource = dst.Tables[0];
        GridView1.DataBind();
    }
    protected void btok_Click(object sender, EventArgs e)
    {
        DataSet dst1 = new DataSet();
        DataSet dst2 = new DataSet();
        DataSet dst3 = new DataSet();
        DataSet dst4 = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptdt = new SqlDataAdapter("select dtid from data_type where dtname='" + dt.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptmajor = new SqlDataAdapter("select mid from major where mname='" + major.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptlanguage = new SqlDataAdapter("select lid from language where lname='" + language.SelectedItem.Text + "'", cnn);
        SqlCommand cmd = cnn.CreateCommand();
        adptdt.Fill(dst1);
        adptmajor.Fill(dst2);
        adptlanguage.Fill(dst4);
        int dtid = (int)dst1.Tables[0].Rows[0]["dtid"];
        int majorid = (int)dst2.Tables[0].Rows[0]["mid"];
        int lid = (int)dst4.Tables[0].Rows[0]["lid"];
        int id = Convert.ToInt32(Session["dataid"]);

        cmd.CommandText = "update data set name='" + txtname.Text + "',data_type_id='" + dtid +"',major_id='" + majorid + "',QR_code='" + txtQR.Text + "',unit='" + txtunit.Text + "',compile_dt='" + txtcompiledt.Text + "',author='" + txtauthor.Text + "',stock_dt='" + txtstockdt.Text + "',class_number='" + txtcn.Text + "',number='" + txtnumber.Text + "',location='" + txtlocation.Text + "',status='" + status.SelectedItem.Text + "',format='" + txtformat.Text + "',number_of_page='" + int.Parse(txtnumberofpage.Text) +"',language='" + lid + "',note='" + txtnote.Text + "' where id='" + id + "'";
        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();
        ExecuteQuery();
    }
}