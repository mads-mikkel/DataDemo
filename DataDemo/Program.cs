using DataDemo;

class DemoProgram
{
    public static void Main()
    {
        Repository r = new();
        List<Person> people = r.GetAllPeople();
        
    }
}