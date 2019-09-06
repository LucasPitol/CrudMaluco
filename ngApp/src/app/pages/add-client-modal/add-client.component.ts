import { Component, Inject, OnInit } from "@angular/core";
import { MatDialogRef, MAT_DIALOG_DATA } from "@angular/material";
import { Client } from "src/app/models/client";
import { Values } from "src/app/utils/values";
import { FormControl } from "@angular/forms";
import { Observable } from "rxjs";
import { startWith, map } from "rxjs/operators";

@Component({
	selector: 'add-client-component',
	templateUrl: './add-client.component.html',
	styleUrls: ['./add-client.component.css'],
})

export class AddClientComponent implements OnInit {
    
    citiesStr = this.values.citiesStr
    
    myControl = new FormControl()
	options: string[] = this.citiesStr
	filteredOptions: Observable<string[]>
    
    constructor(
        public addClientDialogRef: MatDialogRef<AddClientComponent>,
        @Inject (MAT_DIALOG_DATA) public client: Client,
        private values: Values
        ) {
            
        }
        
    ngOnInit(): void {
        this.filteredOptions = this.myControl.valueChanges
			.pipe(
				startWith(''),
				map(value => this._filter(value))
			);
    }

    private _filter(value: string): string[] {
		const filterValue = value.toLowerCase();
	
		return this.options.filter(option => option.toLowerCase().includes(filterValue));
	}

    onNoClick()
    {
        this.addClientDialogRef.close()
    }
}