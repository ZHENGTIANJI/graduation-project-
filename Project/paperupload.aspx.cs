using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class 首页 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["class"] == null||(int)Session["class"] !=1)
        {
            Response.Redirect("/login1.aspx");
        }
        user.Text = "当前用户:" + Session["name"].ToString();
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
        SqlDataAdapter adptnum = new SqlDataAdapter("select count(name) as number from paper where name='" + txtname.Text + "' and author='" + txtauthor.Text + "'", cnn);
        SqlCommand cmd = cnn.CreateCommand();
        adptpt.Fill(dst1);
        adptmajor.Fill(dst2);
        //adptbindingtype.Fill(dst3);
        adptlanguage.Fill(dst4);
        adptnum.Fill(dst5);
        int ptid = (int)dst1.Tables[0].Rows[0]["ptid"];
        String majorid = dst2.Tables[0].Rows[0]["mid"].ToString();
        //int bitid = (int)dst3.Tables[0].Rows[0]["bitid"];
        int lid = (int)dst4.Tables[0].Rows[0]["lid"];
        int num;
        if ((int)dst5.Tables[0].Rows[0]["number"] == 1)
        {
            /*num = (int)dst5.Tables[0].Rows[0]["number"] + 1;
            cmd.CommandText = "update paper set number='" + num + "' where name='" + txtname.Text + "'";
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();*/
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('您之前已经提交，请不要重复提交！');", true);

        }
        else
        {
            num = 1;

            String stockdt = DateTime.Now.ToString("yyyy-MM-dd");
            if (txtname.Text == ""||txtadviser.Text==""||txtauthor.Text==""||txtdirection.Text==""||txtformat.Text==""||txtnumberofpage.Text=="")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('信息不得为空！');", true);
            }
            else if (FileUpload1.FileName == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('请上传论文！');", true);
            }
            else
            {
                String writedt = write_year.Text + "-" + write_month.Text + "-" + write_day.Text;
                String dbdt = db_year.Text + "-" + db_month.Text + "-" + db_day.Text;
                String QR = "";
                cmd.CommandText = "INSERT INTO paper(name, adviser,paper_type_id, major_id, QR_code, direction, write_dt, author, stock_dt, shenhe, dabian_dt, xuezhi, status, number, format, number_of_page,language,note,zhicheng) VALUES ('" + txtname.Text + "','" + txtadviser.Text + "'," + ptid + "," + majorid + ",'" + QR + "','" + txtdirection.Text + "','" + writedt + "','" + txtauthor.Text + "','" + stockdt + "','" + "待审核" + "','" + dbdt + "','" + xuezhi.SelectedItem.Value + "'," + "'库存'," + num + ",'" + txtformat.Text + "','" + txtnumberofpage.Text + "'," + lid + ",'" + "" + "','" + zhicheng.SelectedItem.Value + "')";
                cnn.Open();
                cmd.ExecuteNonQuery();
                cnn.Close();
                if (UpLoadFile())
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('保存成功！');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "", "alert('保存失败！');", true);
                }

            }
        }

    }
    public bool UpLoadFile()
    {
        int uploaderid = 1;
        int paperid = 1;
        string dt = DateTime.Now.ToString("yyyy-MM-dd");
        SqlConnection cnn = new SqlConnection("Data Source=(local);Initial Catalog=档案室信息管理系统1.0;Integrated Security=True");
        SqlCommand cmd = cnn.CreateCommand();
        var path = Server.MapPath("/论文/" + FileUpload1.FileName.ToString());
        FileUpload1.SaveAs(path);
        cmd.CommandText = "INSERT INTO file_att(file_name,extension_name,file_size,uploader_id,uploaded_dt,paper_id) VALUES ('" + FileUpload1.FileName.ToString() + "','pdf','" + FileUpload1.FileBytes.Length + "','" + uploaderid + "','" + dt + "','" + paperid + "')";
        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();
        return true;
        /*try
        { 
            cnn.Open();
            cmd.ExecuteNonQuery();
            return true;
        }
        catch
        {
            return false;
        }
        finally
        {
            cnn.Close();
        }*/
    }
}