import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MainPageComponent } from './main-page/main-page.component';
import { UsersCarsComponent } from './users-cars/users-cars.component';

const routesConfig:Routes = [
  {path:'', component: MainPageComponent},
  {path:'cars', component: UsersCarsComponent},
]

@NgModule({
  imports: [RouterModule.forRoot(routesConfig)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
