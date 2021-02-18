using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class QueryAndModify_bookQueryAndModify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void query_Click(object sender, EventArgs e)
    {
        ExecuteQuery();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int num = e.RowIndex;
        txtname.Text = GridView1.Rows[num].Cells[0].Text.ToString();
        bt.SelectedIndex = -1;
        bt.Items.FindByText(GridView1.Rows[num].Cells[1].Text.ToString()).Selected = true;
        txtbooknumber.Text = GridView1.Rows[num].Cells[2].Text.ToString();
        txtauthor.Text = GridView1.Rows[num].Cells[3].Text.ToString();
        txtstockdt.Text = GridView1.Rows[num].Cells[4].Text.ToString();
        txtformat.Text = GridView1.Rows[num].Cells[5].Text.ToString();
        txtnumberofpage.Text = GridView1.Rows[num].Cells[6].Text.ToString();
        txtlocation.Text = GridView1.Rows[num].Cells[7].Text.ToString();
        CD.SelectedIndex = -1;
        CD.Items.FindByText(GridView1.Rows[num].Cells[8].Text.ToString()).Selected = true;
        status.SelectedIndex = -1;
        status.Items.FindByText(GridView1.Rows[num].Cells[9].Text.ToString()).Selected = true;
        txtteacher.Text = GridView1.Rows[num].Cells[10].Text.ToString();
        txtnumber.Text = GridView1.Rows[num].Cells[11].Text.ToString();
        major1.SelectedIndex = -1;
        major1.Items.FindByText(GridView1.Rows[num].Cells[12].Text.ToString()).Selected = true;
        txtQR.Text = GridView1.Rows[num].Cells[13].Text.ToString();
        language.SelectedIndex = -1;
        language.Items.FindByText(GridView1.Rows[num].Cells[14].Text.ToString()).Selected = true;
        txtpub.Text = GridView1.Rows[num].Cells[15].Text.ToString();
        txtpubdt.Text = GridView1.Rows[num].Cells[16].Text.ToString();
        txtprice.Text = GridView1.Rows[num].Cells[17].Text.ToString();
        bindingtype.SelectedIndex = -1;
        bindingtype.Items.FindByText(GridView1.Rows[num].Cells[18].Text.ToString()).Selected = true;
        txtnote.Text = GridView1.Rows[num].Cells[19].Text.ToString();
        Session["bookid"] = GridView1.Rows[num].Cells[20].Text.ToString();
       
    }
    void ExecuteQuery()
    {
        String strmajor=major.SelectedItem.Text.ToString();
        String strbooktype=booktype.SelectedItem.Text.ToString();
        String strbookname = bookname.Text.ToString().Trim();

        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [book_number], [CD], [format], [location], [stock_dt], [teacher], [number], [name], [btname], [mname], [QR_code], [publisher], [publish_dt], [author], [price], [status], [note], [lname], [bitname] FROM [book] left join book_type on book.book_type_id=book_type.btid left join major on book.major_type_id=major.mid left join language on book.language=language.lid left join binding_type on book.binding_type_id=binding_type.bitid where name like '%"+strbookname+"%' and mname like '%"+strmajor+"%' and btname like '%"+strbooktype+"%'", cnn);
        adpt.Fill(dst);
        GridView1.DataSource=dst.Tables[0];
        GridView1.DataBind();
    }

    protected void btok_Click(object sender, EventArgs e)
    {
        DataSet dst1 = new DataSet();
        DataSet dst2 = new DataSet();
        DataSet dst3 = new DataSet();
        DataSet dst4 = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adptbt = new SqlDataAdapter("select btid from book_type where btname='"+bt.SelectedItem.Text+"'", cnn);
        SqlDataAdapter adptmajor = new SqlDataAdapter("select mid from major where mname='" + major1.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptbindingtype = new SqlDataAdapter("select bitid from binding_type where bitname='" + bindingtype.SelectedItem.Text + "'", cnn);
        SqlDataAdapter adptlanguage = new SqlDataAdapter("select lid from language where lname='" + language.SelectedItem.Text + "'", cnn);
        SqlCommand cmd = cnn.CreateCommand();
        adptbt.Fill(dst1);
        adptmajor.Fill(dst2);
        adptbindingtype.Fill(dst3);
        adptlanguage.Fill(dst4);
        int btid = (int)dst1.Tables[0].Rows[0]["btid"];
        int majorid = (int)dst2.Tables[0].Rows[0]["mid"];
        int bitid = (int)dst3.Tables[0].Rows[0]["bitid"];
        int lid = (int)dst4.Tables[0].Rows[0]["lid"];
        int id = Convert.ToInt32(Session["bookid"]);

        cmd.CommandText = "update book set name='" + txtname.Text + "',book_type_id='"+btid+"',book_number='"+txtbooknumber.Text+"',major_type_id='"+majorid+"',QR_code='"+txtQR.Text+"',publisher='"+txtpub.Text+"',publish_dt='"+txtpubdt.Text+"',author='"+txtauthor.Text+"',stock_dt='"+txtstockdt.Text+"',teacher='"+txtteacher.Text+"',number='"+txtnumber.Text+"',CD='"+CD.SelectedItem.Text+"',location='"+txtlocation.Text+"',status='"+status.SelectedItem.Text+"',format='"+txtformat.Text+"',price='"+int.Parse(txtprice.Text)+"',number_of_page='"+int.Parse(txtnumberofpage.Text)+"',binding_type_id='"+bitid+"',language='"+lid+"',note='"+txtnote.Text+"' where id='"+id+"'";
        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();
        ExecuteQuery();
    }
}