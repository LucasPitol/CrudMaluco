using CrudMalucoWeb.Models.Dto;
using CrudMalucoWeb.Services;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CrudMalucoWeb.Controllers
{
	[RoutePrefix("api/user")]
	public class UserController : ApiController
	{
		private UserService UserService { get; set; }

		public UserController()
		{
			this.UserService = new UserService();
		}

		[HttpGet]
		[Route("list")]
		public HttpResponseMessage GetCardsForHome()
		{
			List<CardUserDto> cards = this.UserService.GetUserCards();

			HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, cards);
			return response;
		}
	}
}