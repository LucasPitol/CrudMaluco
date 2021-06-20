import { Routes, RouterModule } from "@angular/router";
import { HomeComponent } from './pages/home/home.component';


const appRoutes: Routes = [
    { path: 'home', component: HomeComponent },
    // { path: '', redirectTo: 'home', pathMatch: 'full' },
    { path: '**', redirectTo: 'home' }
]

export const routing = RouterModule.forRoot(appRoutes);
