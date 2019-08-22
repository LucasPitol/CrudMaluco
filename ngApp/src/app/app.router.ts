import { Routes, RouterModule } from "@angular/router";
import { HeaderComponent } from "./pages/header/header.component";

const appRoutes: Routes = [
    { path: 'home', component: HeaderComponent },
]

export const routing = RouterModule.forRoot(appRoutes);
