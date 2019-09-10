using CrudMalucoWeb.Models.Dto;
using System.Collections.Generic;

namespace CrudMalucoWeb.Services
{
	public class UserService
	{
		public List<CardUserDto> GetUserCards()
		{
			List<CardUserDto> cards = new List<CardUserDto>();





			//CardUserDto card1 = new CardUserDto
			//{
			//	Name = "Judas Martins",
			//	BirthDate = DateTime.Now,
			//	City = "Rio de Janeiro",
			//	Neighborhood = "Recreio",
			//	FavoriteProduct = "Brown King Size",
			//	Cpf = "425.698.985-86",
			//	Email = "judasm@gmail.com",
			//	Phone = "(21) 9 9652-3666",
			//	Uf = "RJ",
			//	Cep = "22790-865",
			//	Largadouro = "Rua Lalau, 13",
			//	Complement = "Condominio Arvore"
			//};

			//cards.Add(card1);

			//CardUserDto card2 = new CardUserDto
			//{
			//	Name = "Judas Martins",
			//	BirthDate = DateTime.Now,
			//	City = "Rio de Janeiro",
			//	Neighborhood = "Recreio",
			//	FavoriteProduct = "Brown King Size",
			//	Cpf = "425.698.985-86",
			//	Email = "judasm@gmail.com",
			//	Phone = "(21) 9 9652-3666",
			//	Uf = "RJ",
			//	Cep = "22790-865",
			//	Largadouro = "Rua Lalau, 13",
			//	Complement = "Condominio Arvore"
			//};

			//cards.Add(card2);

			return cards;
		}
	}
}
