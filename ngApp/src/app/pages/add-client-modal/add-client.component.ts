import { Component } from "@angular/core";
import { MatDialogRef } from "@angular/material";

@Component({
	selector: 'add-client-component',
	templateUrl: './add-client.component.html',
	styleUrls: ['./add-client.component.css'],
})

export class AddClientComponent {

    constructor(
        public addClientDialogRef: MatDialogRef<AddClientComponent>
    ) { }

    onNoClick()
    {
        this.addClientDialogRef.close()
    }
}