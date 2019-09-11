using CrudMalucoWeb.Models.Dto;
using System.Collections.Generic;

namespace CrudMalucoWeb.Services
{
	public class UserService
	{
		public List<CardUserDto> GetUserCards(IEnumerable<CardUserDto> dataMap)
		{
			List<CardUserDto> cards = new List<CardUserDto>();

			foreach (CardUserDto card in dataMap)
			{
				cards.Add(card);
			}

			return cards;
		}
	}
}
