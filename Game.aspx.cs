using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.WebSockets;

namespace ROCK_PAPER_SCISSOR
{
    public partial class Game : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["PlayerName"] != null)
                {
                    lblPlayerName.Text ="Welcome "+ Session["PlayerName"].ToString();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                    Session.Abandon();
                }
                BindGrid();
            }
            
        }
        public void InsertData()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    try
                    {

                        cmd.Connection = con;
                        cmd.CommandText = "usp_I_Score";
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Total_Win", Convert.ToInt64(txt_Won.Value));
                        cmd.Parameters.AddWithValue("@Player_Name", Session["PlayerName"].ToString());
                        cmd.Parameters.AddWithValue("@Total_Loss", Convert.ToInt64(txt_Loss.Value));
                        cmd.Parameters.AddWithValue("@Total_Tied", Convert.ToInt64(txt_Tie.Value));
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                    catch (Exception ex)
                    {

                        throw;
                    }

                }
            }
        }
        protected void btnExit_Click(object sender, EventArgs e)
        {
            InsertData();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void btnScoreboard_Click(object sender, EventArgs e)
        {
            if (txt_Won.Value!="0"||txt_Loss.Value != "0" || txt_Tie.Value != "0")
            {
                InsertData();
            }
            if (gamePnl.Visible == true)
            {
                gamePnl.Visible =false;
                scorePnl.Visible = true;
                BindGrid();
            }
        }

        protected void btnGamePanel_Click(object sender, EventArgs e)
        {
            if (scorePnl.Visible == true)
            {
                gamePnl.Visible = true;
                scorePnl.Visible = false;
            }
        }
        public void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    try
                    {

                        cmd.Connection = con;
                        cmd.CommandText = "usp_S_ScoreBoard";
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Player_Name", Session["PlayerName"].ToString());
                        con.Open();
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            grd_Score.DataSource = dt;
                            grd_Score.DataBind();
                        }
                        else
                        {
                            grd_Score.DataSource = "";
                            grd_Score.DataBind();
                        }
                        con.Close();
                    }
                    catch (Exception ex)
                    {

                        throw;
                    }

                }
            }
        }
    }
}