using CrudMalucoWeb.Services;
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

			HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK);
			return response;
		}
	}
}