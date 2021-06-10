using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class basicdata_basicdata : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_class"] == null || Session["user_class"] == "")
        {
            Response.Redirect("../../login.aspx");
        }
        //user.Text = "当前用户:" + Session["name"].ToString();
        freshbooktype();
        freshdatatype();
        freshjournaltype();
        freshpapertype();
        freshbindingtype();
        freshgrade();
        freshorgan();
        freshlanguage();
    }
    protected void btbook_Click(object sender, EventArgs e)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        
        SqlCommand cmd = cnn.CreateCommand();
        if (txtbtname.Text != "" && exist_book(txtbtname.Text))
        {
            cmd.CommandText = "insert into book_type(btname) values ('" + txtbtname.Text + "')";
            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
                cnn.Close();
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('添加成功！');", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('添加失败！');", true);
            }
        }
        else if (txtbtname.Text == "")
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('名称不能为空！');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('该名称已存在！');", true);
        }

        freshbooktype();
        
    }
    protected bool exist_book(string name)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adptbt = new SqlDataAdapter("select btname from book_type ", cnn);
        adptbt.Fill(dst);
        for (int i = 0; i < dst.Tables[0].Rows.Count; i++)
        {
            if (dst.Tables[0].Rows[i][0].ToString() == name)
            {
                return false;
            }
        }
        return true;
    }

    protected void freshbooktype()
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adptbt = new SqlDataAdapter("select * from book_type ", cnn);
        adptbt.Fill(dst);
        GridView1.DataSource = dst.Tables[0];
        GridView1.DataBind();
    }
    protected void btdata_Click(object sender, EventArgs e)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);

        SqlCommand cmd = cnn.CreateCommand();
        if (txtdtname.Text != "" && exist_data(txtdtname.Text))
        {
            cmd.CommandText = "insert into data_type(dtname) values ('" + txtdtname.Text + "')";
            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
                cnn.Close();
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('添加成功！');", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('添加失败！');", true);
            }
        }
        else if (txtdtname.Text == "")
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('名称不能为空！');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('该名称已存在！');", true);
        }

        freshdatatype();
    }
    protected void freshdatatype()
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adpt = new SqlDataAdapter("select * from data_type", cnn);
        adpt.Fill(dst);
        GridView2.DataSource = dst.Tables[0];
        GridView2.DataBind();
    }

    protected bool exist_data(string name)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adptbt = new SqlDataAdapter("select dtname from data_type ", cnn);
        adptbt.Fill(dst);
        for (int i = 0; i < dst.Tables[0].Rows.Count; i++)
        {
            if (dst.Tables[0].Rows[i][0].ToString() == name)
            {
                return false;
            }
        }
        return true;
    }
    protected void btjournal_Click(object sender, EventArgs e)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);

        SqlCommand cmd = cnn.CreateCommand();
        if (txtjtname.Text != "" && exist_journal(txtjtname.Text))
        {
            cmd.CommandText = "insert into journal_type(jtname) values ('" + txtjtname.Text + "')";
            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
                cnn.Close();
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('添加成功！');", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('添加失败！');", true);
            }
        }
        else if (txtjtname.Text == "")
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('名称不能为空！');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('该名称已存在！');", true);
        }

        freshjournaltype();
    }
    protected void freshjournaltype()
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adpt = new SqlDataAdapter("select * from journal_type", cnn);
        adpt.Fill(dst);
        GridView3.DataSource = dst.Tables[0];
        GridView3.DataBind();
    }

    protected bool exist_journal(string name)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adptbt = new SqlDataAdapter("select jtname from journal_type ", cnn);
        adptbt.Fill(dst);
        for (int i = 0; i < dst.Tables[0].Rows.Count; i++)
        {
            if (dst.Tables[0].Rows[i][0].ToString() == name)
            {
                return false;
            }
        }
        return true;
    }
    protected void btpaper_Click(object sender, EventArgs e)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);

        SqlCommand cmd = cnn.CreateCommand();
        if (txtptname.Text != "" && exist_paper(txtptname.Text))
        {
            cmd.CommandText = "insert into paper_type(ptname) values ('" + txtptname.Text + "')";
            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
                cnn.Close();
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('添加成功！');", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('添加失败！');", true);
            }
        }
        else if (txtptname.Text == "")
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('名称不能为空！');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('该名称已存在！');", true);
        }

        freshpapertype();
    }
    protected void freshpapertype()
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adpt = new SqlDataAdapter("select * from paper_type", cnn);
        adpt.Fill(dst);
        GridView4.DataSource = dst.Tables[0];
        GridView4.DataBind();
    }

    protected bool exist_paper(string name)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adptbt = new SqlDataAdapter("select ptname from paper_type ", cnn);
        adptbt.Fill(dst);
        for (int i = 0; i < dst.Tables[0].Rows.Count; i++)
        {
            if (dst.Tables[0].Rows[i][0].ToString() == name)
            {
                return false;
            }
        }
        return true;
    }
    protected void btbinding_Click(object sender, EventArgs e)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);

        SqlCommand cmd = cnn.CreateCommand();
        if (txtbitname.Text != "" && exist_bind(txtbitname.Text))
        {
            cmd.CommandText = "insert into binding_type(bitname) values ('" + txtbitname.Text + "')";
            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
                cnn.Close();
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('添加成功！');", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('添加失败！');", true);
            }
        }
        else if (txtbitname.Text == "")
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('名称不能为空！');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('该名称已存在！');", true);
        }

        freshbindingtype();
    }
    protected void freshbindingtype()
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adpt = new SqlDataAdapter("select * from binding_type", cnn);
        adpt.Fill(dst);
        GridView5.DataSource = dst.Tables[0];
        GridView5.DataBind();
    }
    protected bool exist_bind(string name)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adptbt = new SqlDataAdapter("select bitname from binding_type ", cnn);
        adptbt.Fill(dst);
        for (int i = 0; i < dst.Tables[0].Rows.Count; i++)
        {
            if (dst.Tables[0].Rows[i][0].ToString() == name)
            {
                return false;
            }
        }
        return true;
    }
    protected void btgrade_Click(object sender, EventArgs e)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);

        SqlCommand cmd = cnn.CreateCommand();
        if (txtgrade.Text != "" && exist_grade(txtgrade.Text))
        {
            cmd.CommandText = "insert into journal_grade(gradename) values ('" + txtgrade.Text + "')";
            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
                cnn.Close();
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('添加成功！');", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('添加失败！');", true);
            }
        }
        else if (txtgrade.Text == "")
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('名称不能为空！');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('该名称已存在！');", true);
        }

        freshgrade();
    }
    protected void freshgrade()
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adpt = new SqlDataAdapter("select * from journal_grade", cnn);
        adpt.Fill(dst);
        GridView6.DataSource = dst.Tables[0];
        GridView6.DataBind();
    }
    protected bool exist_grade(string name)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adptbt = new SqlDataAdapter("select gradename from journal_grade ", cnn);
        adptbt.Fill(dst);
        for (int i = 0; i < dst.Tables[0].Rows.Count; i++)
        {
            if (dst.Tables[0].Rows[i][0].ToString() == name)
            {
                return false;
            }
        }
        return true;
    }
    protected void btorgan_Click(object sender, EventArgs e)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);

        SqlCommand cmd = cnn.CreateCommand();
        if (txtorgan.Text != "" && exist_organ(txtorgan.Text))
        {
            cmd.CommandText = "insert into organization(organname) values ('" + txtorgan.Text + "')";
            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
                cnn.Close();
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('添加成功！');", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('添加失败！');", true);
            }
        }
        else if (txtorgan.Text == "")
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('名称不能为空！');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('该名称已存在！');", true);
        }

        freshorgan();
    }
    protected void freshorgan()
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adpt = new SqlDataAdapter("select * from organization", cnn);
        adpt.Fill(dst);
        GridView7.DataSource = dst.Tables[0];
        GridView7.DataBind();
    }
    protected bool exist_organ(string name)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adptbt = new SqlDataAdapter("select organname from organization ", cnn);
        adptbt.Fill(dst);
        for (int i = 0; i < dst.Tables[0].Rows.Count; i++)
        {
            if (dst.Tables[0].Rows[i][0].ToString() == name)
            {
                return false;
            }
        }
        return true;
    }
    protected void btlanguage_Click(object sender, EventArgs e)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);

        SqlCommand cmd = cnn.CreateCommand();
        if (txtlname.Text != "" && exist_language(txtlname.Text))
        {
            cmd.CommandText = "insert into language(lname) values ('" + txtlname.Text + "')";
            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
                cnn.Close();
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('添加成功！');", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('添加失败！');", true);
            }
        }
        else if (txtlname.Text == "")
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('名称不能为空！');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('该名称已存在！');", true);
        }

        freshlanguage();
    }
    protected void freshlanguage()
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adpt = new SqlDataAdapter("select * from language", cnn);
        adpt.Fill(dst);
        GridView8.DataSource = dst.Tables[0];
        GridView8.DataBind();
    }
    protected bool exist_language(string name)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlDataAdapter adptbt = new SqlDataAdapter("select lname from language ", cnn);
        adptbt.Fill(dst);
        for (int i = 0; i < dst.Tables[0].Rows.Count; i++)
        {
            if (dst.Tables[0].Rows[i][0].ToString() == name)
            {
                return false;
            }
        }
        return true;
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlCommand cmd = cnn.CreateCommand();
        int num = e.RowIndex;
        int id = Convert.ToInt32(GridView1.Rows[num].Cells[0].Text.ToString());
        SqlDataAdapter adptbt = new SqlDataAdapter("select * from book where book_type_id="+id, cnn);
        adptbt.Fill(dst);
        if (dst.Tables[0].Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('删除失败！请先删除本类别所有的图书信息。');", true);
        }
        else
        {
            

            cmd.CommandText = "delete from book_type where btid =" + id;
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
            freshbooktype();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('删除成功！');",true);
        }
        
    }
    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlCommand cmd = cnn.CreateCommand();
        int num = e.RowIndex;
        int id = Convert.ToInt32(GridView2.Rows[num].Cells[0].Text.ToString());
        SqlDataAdapter adptbt = new SqlDataAdapter("select * from data where data_type_id=" + id, cnn);
        adptbt.Fill(dst);
        if (dst.Tables[0].Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('删除失败！请先删除本类别所有的资料信息。');", true);
        }
        else
        {


            cmd.CommandText = "delete from data_type where dtid =" + id;
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
            freshdatatype();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('删除成功！');", true);
        }

    }
    protected void GridView3_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlCommand cmd = cnn.CreateCommand();
        int num = e.RowIndex;
        int id = Convert.ToInt32(GridView3.Rows[num].Cells[0].Text.ToString());
        SqlDataAdapter adptbt = new SqlDataAdapter("select * from journal where journal_type_id=" + id, cnn);
        adptbt.Fill(dst);
        if (dst.Tables[0].Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('删除失败！请先删除本类别所有的期刊信息。');", true);
        }
        else
        {


            cmd.CommandText = "delete from journal_type where jtid =" + id;
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
            freshjournaltype();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('删除成功！');", true);
        }
    }
    protected void GridView4_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlCommand cmd = cnn.CreateCommand();
        int num = e.RowIndex;
        int id = Convert.ToInt32(GridView4.Rows[num].Cells[0].Text.ToString());
        SqlDataAdapter adptbt = new SqlDataAdapter("select * from paper where paper_type_id=" + id, cnn);
        adptbt.Fill(dst);
        if (dst.Tables[0].Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('删除失败！请先删除本类别所有的论文信息。');", true);
        }
        else
        {


            cmd.CommandText = "delete from paper_type where ptid =" + id;
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
            freshpapertype();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('删除成功！');", true);
        }
    }
    protected void GridView5_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlCommand cmd = cnn.CreateCommand();
        int num = e.RowIndex;
        int id = Convert.ToInt32(GridView5.Rows[num].Cells[0].Text.ToString());
        SqlDataAdapter adptbt = new SqlDataAdapter("select * from book where binding_type_id=" + id, cnn);
        adptbt.Fill(dst);
        if (dst.Tables[0].Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('删除失败！请先删除本类别所有的图书信息。');", true);
        }
        else
        {
            cmd.CommandText = "delete from binding_type where bitid =" + id;
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
            freshbindingtype();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('删除成功！');", true);
        }
    }
    protected void GridView6_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlCommand cmd = cnn.CreateCommand();
        int num = e.RowIndex;
        int id = Convert.ToInt32(GridView6.Rows[num].Cells[0].Text.ToString());
        SqlDataAdapter adptbt = new SqlDataAdapter("select * from journal where gradeid=" + id, cnn);
        adptbt.Fill(dst);
        if (dst.Tables[0].Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('删除失败！请先删除本类别所有的期刊信息。');", true);
        }
        else
        {
            cmd.CommandText = "delete from journal_grade where gid =" + id;
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
            freshgrade();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('删除成功！');", true);
        }
    }
    protected void GridView7_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataSet dst = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlCommand cmd = cnn.CreateCommand();
        int num = e.RowIndex;
        int id = Convert.ToInt32(GridView7.Rows[num].Cells[0].Text.ToString());
        SqlDataAdapter adptbt = new SqlDataAdapter("select * from journal where organizationid=" + id, cnn);
        adptbt.Fill(dst);
        if (dst.Tables[0].Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('删除失败！请先删除本类别所有的期刊信息。');", true);
        }
        else
        {
            cmd.CommandText = "delete from organization where organid =" + id;
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
            freshorgan();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('删除成功！');", true);
        }
    }
    protected void GridView8_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataSet dst = new DataSet();
        DataSet dst1 = new DataSet();
        DataSet dst2 = new DataSet();
        DataSet dst3 = new DataSet();
        SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dtcnn"].ConnectionString);
        SqlCommand cmd = cnn.CreateCommand();
        int num = e.RowIndex;
        int id = Convert.ToInt32(GridView8.Rows[num].Cells[0].Text.ToString());
        SqlDataAdapter adptbt = new SqlDataAdapter("select * from book where language=" + id, cnn);
        SqlDataAdapter adptdt = new SqlDataAdapter("select * from data where language=" + id, cnn);
        SqlDataAdapter adptjt = new SqlDataAdapter("select * from journal where language=" + id, cnn);
        SqlDataAdapter adptpt = new SqlDataAdapter("select * from paper where language=" + id, cnn);
        adptbt.Fill(dst);
        adptdt.Fill(dst1);
        adptjt.Fill(dst2);
        adptpt.Fill(dst3);
        if (dst.Tables[0].Rows.Count > 0 || dst1.Tables[0].Rows.Count > 0 || dst2.Tables[0].Rows.Count > 0 || dst3.Tables[0].Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('删除失败！请先删除本类别所有的信息。');", true);
        }
        else
        {


            cmd.CommandText = "delete from language where lid =" + id;
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
            freshlanguage();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('删除成功！');", true);
        }
    }
    protected void home_Click(object sender, EventArgs e)
    {
        Response.Redirect("../login1.aspx");
    }
}