import { Component, Inject, OnInit } from "@angular/core";
import { FormControl, Validators } from "@angular/forms";
import { MatDialogRef, MAT_DIALOG_DATA } from "@angular/material";
import { Constants } from "src/app/utils/constants";

export interface NewPersonDialogData {
    name: string
    country: string
}

@Component({
    selector: 'new-person-dialog-component',
    templateUrl: './new-person-dialog.component.html',
    styleUrls: ['./new-person-dialog.component.scss'],
})
export class NewPersonDialogComponent implements OnInit {

    nameFormControl: FormControl
    countryList: string[]
    countrySelected: string

    constructor(
        public dialogRef: MatDialogRef<NewPersonDialogComponent>,
        @Inject(MAT_DIALOG_DATA) public data: NewPersonDialogData) { }

    ngOnInit(): void {
        this.countrySelected = this.data.country
        this.buildFormValidators()
        this.getCountryList()
    }

    buildFormValidators() {
        this.nameFormControl = new FormControl('', [
            Validators.required,
            Validators.maxLength(20),
        ]);
    }

    getCountryList() {
        this.countryList = Constants.countryList
    }

    onNoClick(): void {
        this.dialogRef.close()
    }

    validateForm() {
        return (this.nameFormControl.valid && this.countrySelected.length > 0)
    }

    save() {
        var valid = this.validateForm()

        if (valid) {
            this.data.name = this.nameFormControl.value
            this.data.country = this.countrySelected

            this.dialogRef.close(this.data)
        }
    }
}