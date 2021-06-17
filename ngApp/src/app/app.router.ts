import { Routes, RouterModule } from "@angular/router";
import { HeaderComponent } from "./pages/header/header.component";
import { DashboardComponent } from "./pages/test/dashboard/dashboard.component";

const appRoutes: Routes = [
    { path: 'home', component: HeaderComponent },
    { path: '**', redirectTo: 'home' }
]

export const routing = RouterModule.forRoot(appRoutes);
