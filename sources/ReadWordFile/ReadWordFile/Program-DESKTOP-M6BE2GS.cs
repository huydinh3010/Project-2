using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Office.Interop.Word;

namespace ReadWordFile
{
    interface Animal
    {
        void showInfo(); // phương thức thuần ảo, chỉ khai báo mà ko triển khai, phải để trong class abstract
        void keu();
        int abc
        {
            get;
            set;
        }

    }

    class Dog : Animal
    {

        public void keu()
        {

        }

        public void showInfo()
        {
            Console.WriteLine("hahasdkhfjkashfasf");
        }

        public Dog()
        {

        }
        public int abc
        {
            get { return 0; }
            set { }
        }

        public Dog(int height, int weight, int legs)
        {

        }
    }



    class Program
    {
        static void Main(string[] args)
        {
            //Application word = new Application();
            //Document doc = word.Documents.Open("C:\\Users\\Nguyen Huy Dinh\\Desktop\\word_file.docx");
            //String read = string.Empty;
            //List<string> data = new List<string>();
            //for (int i = 1; i <= doc.Paragraphs.Count; i++)
            //{
            //    string temp = doc.Paragraphs[i].Range.Text;
            //    if (temp != string.Empty)
            //        data.Add(temp);
            //    Console.WriteLine(temp);
            //}
            //doc.Paragraphs[0].Range.Text = "a";

            //doc.Paragraphs[0].Format.SpaceAfter = 24;
            //doc.Content.Text = "Heading 1";
            //doc.Content.Font.Bold = 1;
            //doc.Content.Font.Size = 24;
            //((_Document)doc).Close();
            //((_Application)word).Quit();

            // truyeenf tham so boi gia tri: truyen nhu binh thuong
            // truyen tham so boi tham chieu: them ref truoc tham so vd swap(ref a, ref b)
            // truyen boi output: them out vd swap(out a)
            // nullable: kieu du lieu co ca gia tri null, int?
            // toan tu ??: vd: a??b ,neu a == null thi tra ve b, ko thi tra ve a

            // params, truyen nhieu tham so
            // int[] arr = new int[] { 0, 1, 1 };
            // string str = new string("abc");
            // str = "hello";
            // static class, chỉ chứa các biến tĩnh và phương thức tĩnh
            // static function: chỉ có thể truy cập vào các thành viên tĩnh 
            // constructor tĩnh: gọi 1 lần duy nhất khởi tạo cho toàn bộ class, ko có access specifier

            Animal a = new Dog();
            a.showInfo();



            Console.ReadKey();
        }
    }
}
