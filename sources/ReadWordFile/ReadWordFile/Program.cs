using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Word = Microsoft.Office.Interop.Word;
using System.Reflection;
using System.Data.SqlClient;
using System.Data.Common;

namespace ReadWordFile
{
    class DBSQLServerUtils
    {
        public static SqlConnection GetDBConnection(string datasource, string database, string username, string password) 
        {
            // connection string
            string connString = @"Data Source=" + datasource + ";Initial Catalog=" + database + ";Persist Security Info=True;User ID=" + username + ";Password=" + password;
            return new SqlConnection(connString);
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            SqlConnection connection = DBSQLServerUtils.GetDBConnection("DESKTOP-BR7TD27\\SQLEXPRESS", "Phong_xet_nghiem", "sa", "30101998");

            try
            {
                Console.Write("ID = ");
                int id = Convert.ToInt32(Console.ReadLine());
                connection.Open(); // khởi tạo kết nối đến SQL Server
                SqlCommand cmd = connection.CreateCommand();
                cmd.CommandText = "Select * from XetNghiem where ID = " + id;
                DbDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    object oMissing = System.Reflection.Missing.Value;
                    object oEndOfDoc = "\\endofdoc"; 
                    Word._Application oWord;
                    Word._Document oDoc;
                    oWord = new Word.Application();
                    oDoc = oWord.Documents.Add(ref oMissing, ref oMissing, ref oMissing, ref oMissing);
                    DateTime ngay_co_kq = new DateTime();
                    while (reader.Read())
                    {
                        // KẾT QUẢ XÉT NGHIỆM
                        oWord.Selection.Font.Bold = 1; // chữ đậm
                        oWord.Selection.Font.Size = 24; // cỡ 24
                        oWord.Selection.Font.Name = "Times New Roman"; // kiểu font chữ
                        oWord.Selection.TypeText("KẾT QUẢ XÉT NGHIỆM"); // text
                        oWord.Selection.Paragraphs.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter; // căn lề
                        oWord.Selection.ParagraphFormat.SpaceAfter = 24; // khoảng cách đến dòng kế tiếp
                        oWord.Selection.TypeText(Environment.NewLine); // dòng mới

                        // Tên bệnh nhân: Nguyễn Văn A
                        oWord.Selection.Font.Bold = 0; // bỏ chữ đậm
                        oWord.Selection.Font.Size = 14; // cỡ 14
                        oWord.Selection.Font.Underline = Word.WdUnderline.wdUnderlineSingle; // gạch dưới
                        oWord.Selection.Font.Italic = 1; // in nghiêng
                        oWord.Selection.Paragraphs.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft; // căn lề trái
                        oWord.Selection.TypeText("Tên bệnh nhân:"); // tên bệnh nhân
                        oWord.Selection.Font.Underline = Word.WdUnderline.wdUnderlineNone; // bỏ gạch dưới
                        oWord.Selection.Font.Italic = 0; // bỏ in nghiêng
                        oWord.Selection.TypeText(" " + reader.GetString(reader.GetOrdinal("TenBenhNhan"))); // tên lấy từ csdl
                        oWord.Selection.ParagraphFormat.SpaceAfter = 8;
                        oWord.Selection.TypeText(Environment.NewLine); 

                        // Giới tính: Nam
                        oWord.Selection.Font.Underline = Word.WdUnderline.wdUnderlineSingle;
                        oWord.Selection.Font.Italic = 1;
                        oWord.Selection.TypeText("Giới tính:");
                        oWord.Selection.Font.Underline = Word.WdUnderline.wdUnderlineNone;
                        oWord.Selection.Font.Italic = 0;
                        oWord.Selection.TypeText(" " + reader.GetString(reader.GetOrdinal("GioiTinh")));
                        oWord.Selection.TypeText(Environment.NewLine);

                        // Năm sinh: 1998
                        oWord.Selection.Font.Underline = Word.WdUnderline.wdUnderlineSingle;
                        oWord.Selection.Font.Italic = 1;
                        oWord.Selection.TypeText("Năm sinh:");
                        oWord.Selection.Font.Underline = Word.WdUnderline.wdUnderlineNone;
                        oWord.Selection.Font.Italic = 0;
                        oWord.Selection.TypeText(" " + reader.GetInt32(reader.GetOrdinal("NamSinh")));
                        oWord.Selection.ParagraphFormat.SpaceAfter = 24;
                        oWord.Selection.TypeText(Environment.NewLine);

                        ngay_co_kq = reader.GetDateTime(reader.GetOrdinal("NgayCoKetQua"));

                    }
                    reader.Close();
                    // Bảng kết quả
                    Word.Table oTable;
                    Word.Range wrdRng = oDoc.Bookmarks.get_Item(ref oEndOfDoc).Range; // đặt vị trí tạo bảng
                    oTable = oDoc.Tables.Add(wrdRng, 13, 2, ref oMissing, ref oMissing); // tạo bảng
                    oTable.Borders.InsideLineStyle = Word.WdLineStyle.wdLineStyleSingle; // kiểu đường viền bên trong bảng
                    oTable.Borders.OutsideLineStyle = Word.WdLineStyle.wdLineStyleSingle; // kiểu đường viền bên ngoài
                    oTable.Range.ParagraphFormat.SpaceAfter = 6;
                    oTable.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter;
                    oTable.Cell(1, 1).Range.Text = "Loại mẫu";
                    oTable.Cell(1, 2).Range.Text = "Kết quả";
                    cmd.CommandText = "Select * from KetQuaXetNghiem where ID = " + id;
                    DbDataReader reader1 = cmd.ExecuteReader();
                    reader1.Read();
                    // ghi vào các cell trong bảng
                    oTable.Cell(2, 1).Range.Text = "Urea";
                    oTable.Cell(2, 2).Range.Text = reader1[reader1.GetOrdinal("Urea")].ToString();
                    oTable.Cell(3, 1).Range.Text = "Creatinine";
                    oTable.Cell(3, 2).Range.Text = reader1[reader1.GetOrdinal("Creatinine")].ToString();
                    oTable.Cell(4, 1).Range.Text = "CPK";
                    oTable.Cell(4, 2).Range.Text = reader1[reader1.GetOrdinal("CPK")].ToString();
                    oTable.Cell(5, 1).Range.Text = "Calcium";
                    oTable.Cell(5, 2).Range.Text = reader1[reader1.GetOrdinal("Calcium")].ToString();
                    oTable.Cell(6, 1).Range.Text = "Phosphorous";
                    oTable.Cell(6, 2).Range.Text = reader1[reader1.GetOrdinal("Phosphorous")].ToString();
                    oTable.Cell(7, 1).Range.Text = "Amylase";
                    oTable.Cell(7, 2).Range.Text = reader1[reader1.GetOrdinal("Amylase")].ToString();
                    oTable.Cell(8, 1).Range.Text = "Lipase";
                    oTable.Cell(8, 2).Range.Text = reader1[reader1.GetOrdinal("Lipase")].ToString();
                    oTable.Cell(9, 1).Range.Text = "Bilirubin Toàn Phần";
                    oTable.Cell(9, 2).Range.Text = reader1[reader1.GetOrdinal("BilirubinToanPhan")].ToString();
                    oTable.Cell(10, 1).Range.Text = "AST";
                    oTable.Cell(10, 2).Range.Text = reader1[reader1.GetOrdinal("AST")].ToString();
                    oTable.Cell(11, 1).Range.Text = "ALT";
                    oTable.Cell(11, 2).Range.Text = reader1[reader1.GetOrdinal("ALT")].ToString();
                    oTable.Cell(12, 1).Range.Text = "AlkalinePhosphatase";
                    oTable.Cell(12, 2).Range.Text = reader1[reader1.GetOrdinal("AlkalinePhosphatase")].ToString();
                    oTable.Cell(13, 1).Range.Text = "Glucose";
                    oTable.Cell(13, 2).Range.Text = reader1[reader1.GetOrdinal("Glucose")].ToString();

                    oWord.Selection.Move(Word.WdUnits.wdLine, 200); // dịch con trỏ đến cuối văn bản (bỏ qua table)
                    oWord.Selection.Font.Italic = 1;
                    oWord.Selection.Paragraphs.LeftIndent = 250; // dịch lề bên trái của đoạn văn này
                    oWord.Selection.Paragraphs.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter;
                    oWord.Selection.ParagraphFormat.SpaceAfter = 8;
                    oWord.Selection.TypeText("Hà Nội, ngày " + ngay_co_kq.Day.ToString() + ", tháng " + ngay_co_kq.Month.ToString() + ", năm " + ngay_co_kq.Year.ToString() + ".\r\nChữ ký bác sĩ\r\n");
                    oWord.Visible = true;
                }
                else
                {
                    Console.WriteLine("Khong tim thay");
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Error: " + e.Message);
            }
            Console.ReadKey();
        }
    }
}
