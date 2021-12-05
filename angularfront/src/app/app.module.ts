import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';

import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MaterialModule } from './material/material.module';
import { DetailsComponent } from './details/details.component';
import { MainPageComponent } from './main-page/main-page.component';
import { UsersCarsComponent } from './users-cars/users-cars.component';


@NgModule({
  declarations: [
    AppComponent,
    DetailsComponent,
    MainPageComponent,
    UsersCarsComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    BrowserAnimationsModule,
    MaterialModule,
    ReactiveFormsModule,
  ],
  entryComponents: [
    DetailsComponent
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
