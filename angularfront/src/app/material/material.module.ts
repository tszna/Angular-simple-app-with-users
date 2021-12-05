import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatTableModule } from '@angular/material/table';
import { MatDialogModule } from "@angular/material/dialog";
import { MatButtonModule } from "@angular/material/button";
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatSnackBarModule } from '@angular/material/snack-bar';

const MaterialComponents = [
  MatTableModule,
  MatDialogModule,
  MatButtonModule,
  MatFormFieldModule,
  MatInputModule,
  MatSnackBarModule,
];

@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    MaterialComponents
  ],
  exports: [MaterialComponents]
})
export class MaterialModule { }
