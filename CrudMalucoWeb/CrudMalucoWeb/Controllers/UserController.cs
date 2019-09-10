using CrudMalucoWeb.Models.Dto;
using CrudMalucoWeb.Services;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Runtime.InteropServices.ComTypes;
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
			string URL = "http://localhost:8000/api/books";

			HttpClient client = new HttpClient();

			client.BaseAddress = new Uri(URL);

			client.DefaultRequestHeaders.Accept.Add(
			new MediaTypeWithQualityHeaderValue("application/json"));

			HttpResponseMessage res = client.GetAsync(URL).Result;

			var dataObjects = res.Content.ReadAsAsync<IEnumerable<IDataObject>>().Result;

			List<CardUserDto> cards = this.UserService.GetUserCards();

			HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, cards);
			return response;
		}
	}
}