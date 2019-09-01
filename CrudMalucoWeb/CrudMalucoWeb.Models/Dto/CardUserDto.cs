using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace CrudMalucoWeb.Models.Dto
{
    public class CardUserDto
    {
        public string Name { get; set; }

        public string Cpf { get; set; }

        public DateTime BirthDate { get; set; }

        public string Phone { get; set; }

        public string Phone2 { get; set; }

        public string Email { get; set; }

        public string Largadouro { get; set; }

        public string Cep { get; set; }

        public string Neighborhood { get; set; }

        public string Complement { get; set; }

        public string City { get; set; }

        public string Uf { get; set; }

        public string FavoriteProduct { get; set; }
    }
}
