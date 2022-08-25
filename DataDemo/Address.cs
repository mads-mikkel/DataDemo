using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataDemo
{
    public class Address
    {
        public Address()
        {
            People = new();
        }
        public List<Person> People { get; set; }
    }
}
