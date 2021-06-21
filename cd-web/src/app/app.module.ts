import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomeComponent } from './pages/home/home.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatButtonModule, MatDialogModule, MatFormFieldModule, MatIconModule, MatInputModule, MatProgressSpinnerModule, MatRippleModule, MatSelectModule, MatSidenavModule } from '@angular/material';
import { routing } from './app.router';
import { ListPersonComponent } from './pages/list-person/list-person.component';
import { PersonService } from './services/person-service';
import { CardComponent } from './pages/card/card.component';
import { PersonLocaleComponent } from './pages/person-locale/person-locale.component';
import { NgApexchartsModule } from 'ng-apexcharts';
import { SidenavService } from './services/side-nav-service';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NewPersonDialogComponent } from './pages/new-person-dialog/new-person-dialog.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    ListPersonComponent,
    CardComponent,
    PersonLocaleComponent,
    NewPersonDialogComponent,
  ],
  imports: [
    routing,
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    NgApexchartsModule,
    FormsModule,
    ReactiveFormsModule,
    MatSidenavModule,
    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
    MatSelectModule,
    MatRippleModule,
    MatIconModule,
    MatProgressSpinnerModule,
    MatDialogModule,
  ],
  providers: [
    PersonService,
    SidenavService,
  ],
  entryComponents: [
    NewPersonDialogComponent,
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
