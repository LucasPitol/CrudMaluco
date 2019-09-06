import { Component, Inject } from "@angular/core";
import { MatDialogRef, MAT_DIALOG_DATA } from "@angular/material";
import { Client } from "src/app/models/client";

@Component({
	selector: 'add-client-component',
	templateUrl: './add-client.component.html',
	styleUrls: ['./add-client.component.css'],
})

export class AddClientComponent {


    constructor(
        public addClientDialogRef: MatDialogRef<AddClientComponent>,
        @Inject (MAT_DIALOG_DATA) public client: Client
    ) {
        
     }

    onNoClick()
    {
        this.addClientDialogRef.close()
    }
}