import { Injectable } from "@angular/core";
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';

@Injectable()
export class HomeService {

	private url = environment.crudApiUrl

	constructor(private http: HttpClient) {}

	public getUsers()
	{
		return this.http.get<any>(this.url + "api/user/list")
	}
 }