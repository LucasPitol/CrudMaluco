import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule }    from '@angular/common/http';
import { HttpModule } from '@angular/http';
import { AppComponent } from './app.component';
import { HeaderComponent } from './pages/header/header.component';
import { routing } from './app.router';
import { AppRoutingModule } from './app-routing.module';
import { HomeComponent } from './pages/home/home.component';
import { CardComponent } from './pages/card/card.component';
import { HomeService } from './services/homeService';
import { MatExpansionModule, MatFormFieldModule, MatSidenavModule, MatButtonModule, MatInputModule, MatDividerModule, MatProgressSpinnerModule, MatAutocompleteModule, MatDialogModule } from '@angular/material';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import { ClientService } from './services/clientService';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AddClientComponent } from './pages/add-client-modal/add-client.component';


@NgModule({
	declarations: [
		AppComponent,
		HeaderComponent,
		HomeComponent,
		CardComponent,
		AddClientComponent,
		
	],
	imports: [
		BrowserModule,
		routing,
		ReactiveFormsModule,
		AppRoutingModule,
		HttpModule,
		HttpClientModule,
		BrowserAnimationsModule,
		MatExpansionModule,
		MatFormFieldModule,
		MatSidenavModule,
		MatButtonModule,
		MatInputModule,
		MatDividerModule,
		FormsModule,
		MatProgressSpinnerModule,
		MatAutocompleteModule,
		MatDialogModule
		
  ],
  entryComponents: [AddClientComponent],
  providers: [
	  HomeService,
	  ClientService
	],
	bootstrap: [AppComponent]
})
export class AppModule {
 }
