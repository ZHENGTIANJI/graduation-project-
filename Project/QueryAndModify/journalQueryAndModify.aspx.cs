using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class QueryAndModify_journalQueryAndModify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    void ExecuteQuery()
    {
        String strmajor = mt.SelectedItem.Text.ToString();
        String strdatatype = jt.SelectedItem.Text.ToString();
        String strdataname = journalname.Text.ToString().Trim();

        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[number_of_page], [compile_dt], [unit], [format], [location], [stock_dt], [number], [name], [dtname], [mname], [QR_code], [class_number], [author], [status], [note], [lname] FROM [journal] left join journal_type on journal.journal_type_id=journal_type.jtid left join major on data.major_id=major.mid left join language on data.language=language.lid where name like '%" + strdataname + "%' and mname like '%" + strmajor + "%' and dtname like '%" + strdatatype + "%'", cnn);
        adpt.Fill(dst);
        GridView1.DataSource = dst.Tables[0];
        GridView1.DataBind();
    }
    protected void btok_Click(object sender, EventArgs e)
    {

    }
    protected void query_Click(object sender, EventArgs e)
    {
        ExecuteQuery();
    }
}