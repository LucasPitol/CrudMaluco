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


@NgModule({
  declarations: [
	AppComponent,
	HeaderComponent,
	HomeComponent,
	CardComponent
  ],
  imports: [
    BrowserModule,
    routing,
	AppRoutingModule,
	HttpModule,
    HttpClientModule,
  ],
  providers: [
	  HomeService,
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
