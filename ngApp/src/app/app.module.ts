import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { HeaderComponent } from './pages/header/header.component';
import { routing } from './app.router';
import { AppRoutingModule } from './app-routing.module';


@NgModule({
  declarations: [
	AppComponent,
	HeaderComponent
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
