import { Component, Inject, OnInit } from '@angular/core';
import {MAT_DIALOG_DATA, MatDialogRef} from "@angular/material/dialog";
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import { HttpClient } from '@angular/common/http';

interface DialogData {
  user: any,
}

const UPDATE_URL = 'http://localhost:8000/api/update'

@Component({
  selector: 'app-details',
  templateUrl: './details.component.html',
  styleUrls: ['./details.component.css']
})
export class DetailsComponent implements OnInit {
  isEditMode = false
  userForm: FormGroup;

  /**
   * Zmienna publiczna data zawiera listę użytkowników pobranych z API.
   * @param data
   */
  constructor(public dialogRef: MatDialogRef<DetailsComponent>, @Inject(MAT_DIALOG_DATA) public data: DialogData, private formBuilder: FormBuilder, private http: HttpClient)
  {

    this.userForm = this.formBuilder.group({
      name: [this.data.user.name, Validators.required],
      username: [this.data.user.username, Validators.required],
      email: [this.data.user.email, Validators.required],
    });

  }

  switchEditMode() {
    this.isEditMode = !this.isEditMode;
  }

  saveUserData() {

    let usersData = this.data || "";

    if(usersData) {
      usersData.user.name = this.userForm.value.name;
      usersData.user.username = this.userForm.value.username;
      usersData.user.email = this.userForm.value.email;
    }

    this.http.put<any>(UPDATE_URL, usersData.user)
      .subscribe({
        next: () => {
          console.log('Dane zostały zaktualizowane')
          this.dialogRef.close({refresh: true});
        },
        error: error => {
          console.error('Pojawił się błąd!', error);
          this.dialogRef.close();
        }
      });

  }

  ngOnInit(): void {
  }

}
