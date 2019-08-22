import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { HeaderComponent } from './pages/header/header.component';
import { routing } from './app.router';
import { AppRoutingModule } from './app-routing.module';
import { HomeComponent } from './pages/home/home.component';


@NgModule({
  declarations: [
	AppComponent,
	HeaderComponent,
	HomeComponent
  ],
  imports: [
    BrowserModule,
    routing,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
