import { Component } from "@angular/core";
import { MatDialogRef } from "@angular/material";
import { Client } from "src/app/models/client";

@Component({
	selector: 'add-client-component',
	templateUrl: './add-client.component.html',
	styleUrls: ['./add-client.component.css'],
})

export class AddClientComponent {

    client: Client

    constructor(
        public addClientDialogRef: MatDialogRef<AddClientComponent>
    ) {
        this.client = new Client()
     }

    onNoClick()
    {
        this.addClientDialogRef.close()
    }
}