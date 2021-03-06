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
import { MatExpansionModule, MatFormFieldModule, MatSidenavModule, MatButtonModule, MatInputModule, MatDividerModule, MatProgressSpinnerModule, MatAutocompleteModule, MatDialogModule, MatDatepickerModule, DateAdapter, MatNativeDateModule, MatTabsModule } from '@angular/material';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import { ClientService } from './services/clientService';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AddClientComponent } from './pages/add-client-modal/add-client.component';
import { Client } from './models/client';
import { Values } from './utils/values';
import { AngularFireModule } from '@angular/fire';
import { AngularFirestoreModule } from '@angular/fire/firestore';
import { AngularFireAuthModule } from '@angular/fire/auth';
import { environment } from '../environments/environment';
import { RegionalComponent } from './pages/regional/regional.component';
import { RegionalService } from './services/regional-service';
import { ChartsModule } from 'ng2-charts';


@NgModule({
	declarations: [
		AppComponent,
		HeaderComponent,
		HomeComponent,
		CardComponent,
		AddClientComponent,
		RegionalComponent,
	],
	imports: [
		AngularFireModule.initializeApp(environment.firebaseConfig),
		AngularFirestoreModule, // imports firebase/firestore, only needed for database features
		AngularFireAuthModule,
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
		MatDialogModule,
		MatDatepickerModule,
		MatNativeDateModule,
		MatTabsModule,
		ChartsModule,
  ],
  entryComponents: [AddClientComponent],
  providers: [
	  HomeService,
	  ClientService,
	  Client,
	  Values,
	  RegionalService,
	],
	bootstrap: [AppComponent]
})
export class AppModule {
 }
