using Microsoft.Data.SqlClient;

namespace DataDemo
{
    public class Repository
    {
        private const string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=UniDb;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        public List<Person> GetAllPeople()
        {
            // Lav koden der fylder listen med objekter:

            // Vi bruger den samme forbindelse til begge SELECT transaktions, så derfor har vi kun én sql streng:
            string sql = "SELECT * FROM ContactInformations;SELECT * FROM Persons";

            // Lav en forbindelse til databasen, og åbn den:
            SqlConnection connection = new(connectionString);
            connection.Open();

            // Lav et command object, der skal udføre transaktionen
            SqlCommand command = new SqlCommand(sql, connection);

            // Udfør transaktionen, og gem resultatet i en SqlDataReader:
            SqlDataReader reader = command.ExecuteReader();

            // Udtag c.i. data og lav om til C# objekter:
            List<ContactInformation> contactInformations = MakeContactInformationsList(reader);

            reader.NextResult();

            List<Person> persons = MakePersonsList(reader, contactInformations);


            // returner listen der nu er fyldt med objekter:
            return persons;
        }

        private List<ContactInformation> MakeContactInformationsList(SqlDataReader reader)
        {
            List<ContactInformation> contactInformations = new();

            while (reader.Read())
            {
                int id = (int)reader["ContactInformationId"];
                string phone = (string)reader["PhoneNumber"];
                string mail = (string)reader["Mail"];
                ContactInformation contactInformation = new()
                {
                    Id = id,
                    Phone = phone,
                    Email = mail
                };
                contactInformations.Add(contactInformation);
            }

            return contactInformations;
        }

        private List<Person> MakePersonsList(SqlDataReader reader, List<ContactInformation> contactInformations)
        {
            List<Person> people = new();

            while (reader.Read())
            {
                int id = (int)reader["PersonId"];
                string firstname = (string)reader["Firstname"];
                string lastname = (string)reader["Lastname"];
                int contactInfomation_FK = (int)reader["FK_ContactInformationId"];

                ContactInformation contactInformation = GetContactInformationForPerson(contactInfomation_FK, contactInformations);

                Person p = new()
                {
                    Id = id,
                    Firstname = firstname,
                    Lastname = lastname,
                    ContactInformation = contactInformation
                };
                people.Add(p);
            }

            return people;
        }

        private ContactInformation GetContactInformationForPerson(int contactInfomation_FK, List<ContactInformation> contactInformations)
        {
            foreach (ContactInformation contactInformation in contactInformations)
            {
                if(contactInformation.Id == contactInfomation_FK)
                {
                    return contactInformation;
                }
            }
            return new();
        }
    }
}
