using System;
using System.Runtime.Serialization;

namespace CrudMalucoWeb.Models.Dto
{
	[DataContract]
	public class CardUserDto
	{
		[DataMember(Name = "id")]
		public string Id { get; set; }

		[DataMember(Name = "name")]
		public string Name { get; set; }

		[DataMember(Name = "cpf")]
		public string Cpf { get; set; }

		[DataMember(Name = "birthDate")]
		public DateTime BirthDate { get; set; }

		[DataMember(Name = "phone1")]
		public string Phone { get; set; }

		[DataMember(Name = "phone2")]
		public string Phone2 { get; set; }

		[DataMember(Name = "email")]
		public string Email { get; set; }

		[DataMember(Name = "largadouro")]
		public string Largadouro { get; set; }

		[DataMember(Name = "cep")]
		public string Cep { get; set; }

		[DataMember(Name = "bairro")]
		public string Neighborhood { get; set; }

		[DataMember(Name = "complement")]
		public string Complement { get; set; }

		[DataMember(Name = "cidade")]
		public string City { get; set; }

		[DataMember(Name = "uf")]
		public string Uf { get; set; }

		[DataMember(Name = "favorite")]
		public string FavoriteProduct { get; set; }
	}
}
