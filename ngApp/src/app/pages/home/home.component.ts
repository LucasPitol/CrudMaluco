import { Component, OnInit } from "@angular/core";
import { HomeService } from '../../services/homeService';
import { ClientService } from '../../services/clientService';
import {FormControl} from '@angular/forms';
import {Observable} from 'rxjs';
import {map, startWith} from 'rxjs/operators';
import { constants } from '../../utils/constants';
import { MatDialog, MatDialogRef } from "@angular/material";
import { AddClientComponent } from "../add-client-modal/add-client.component";
import { Client } from "src/app/models/client";
import { Values } from "src/app/utils/values";


@Component({
	selector: 'home-component',
	templateUrl: './home.component.html',
	styleUrls: ['./home.component.css'],
})

export class HomeComponent implements OnInit {

	addClientDialogRef: MatDialogRef<AddClientComponent>
	
	citiesStr = this.values.citiesStr

	myControl = new FormControl()
	options: string[] = this.citiesStr
	filteredOptions: Observable<string[]>
	
	cards: any = []
	
	cardsLoading = true

	private db = firebase.firestore();

	filterImageUrl = 'assets/filter.png';

	addNewCLientImage = 'assets/plus.png'

	filterForm = {
		local: {
			city: '',
			uf: ''
		},
		age: {
			minAge: '',
			maxAge: '',
		},
		categoria: '',
	}

	constructor(private homeService: HomeService,
				private clientService: ClientService,
				public addClientDialog: MatDialog,
				private values: Values
		) {}
	
	ngOnInit(): void {
		this.filteredOptions = this.myControl.valueChanges
			.pipe(
				startWith(''),
				map(value => this._filter(value))
			);
		if (this.cards.length <= 0)
		{
			this.getUsers()
		}
	}

	private _filter(value: string): string[] {
		const filterValue = value.toLowerCase();
	
		return this.options.filter(option => option.toLowerCase().includes(filterValue));
	}

	clearFilter()
	{
		this.filterForm.local.city = ""
		this.filterForm.local.uf = ""
	}
	
	applyFilter()
	{
		this.cardsLoading = true;

		this.cards = []
		
		let cardsx: any = []

		let cidade = this.filterForm.local.city

		if (cidade == undefined || cidade == ""){
			this.getUsers()
		} 
		else 
		{
			this.db.collection("client").where("cidade", "==", cidade)
				.get()
				.then((querySnapshot) => {
					querySnapshot.forEach((doc) => {
						cardsx = cardsx.concat(doc.data())
					});
					this.cards = cardsx
					this.cardsLoading = false
				})
				.catch(function(error) {
					console.log("Error getting documents: ", error)
				})
		}

	}

	getUsers()
	{
		let cardsx: any = []

		

		// this.clientService.getClients()
		// 					.subscribe( res => {
		// 						this.cards = res
		// 						this.cardsLoading = false
		// 					})

		this.clientService.getClients()
			.subscribe(
				res => {
					console.log(res)
					this.cards = res
					this.cardsLoading = false
				}
			)
	}

	openAddClientDialog()
	{
		let client: Client = new Client()

		this.addClientDialogRef = this.addClientDialog.open(AddClientComponent, {
			data: {client}
		});

		this.addClientDialogRef.afterClosed().subscribe(res => {
			if (res != undefined)
			{
				this.db.collection("client").add({
					bairro: client.bairro,
					cidade: client.cidade,
					cep: client.cep,
					complement: client.complement,
					cpf: client.cpf,
					email: client.email,
					largadouro: client.largadouro,
					name: client.name,
					phone1: client.phone1,
				})
				.then(function(docRef) {
					alert("Sucesso!")
				})
				.catch(function(error) {
					alert(error)//console.error("Error adding document: ", error);
				});
					
			}
		})
	}
}