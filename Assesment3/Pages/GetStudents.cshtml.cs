using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Assesment3.Pages
{
    public class GetStudentsModel : PageModel
    {
        public static List<Student> students = new List<Student>()
        {

        };

        public Student Student { get; set; }

        public List<Student> list
        {
            get { return students; }
        }
        public void OnGet()
        {
        }
        public IActionResult OnPost()
        {
            students.Add(Student);
            return RedirectToPage("GetStudents");
        }
    }
   
}

