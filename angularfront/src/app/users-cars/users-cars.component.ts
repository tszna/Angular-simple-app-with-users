import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import {HttpClient} from "@angular/common/http";
import {MatTableDataSource} from "@angular/material/table";


const API_URL = 'http://localhost:8000/api'

@Component({
  selector: 'app-users-cars',
  templateUrl: './users-cars.component.html',
  styleUrls: ['./users-cars.component.css']
})
export class UsersCarsComponent implements OnInit {

  // @ts-ignore
  addCarFormGroup: FormGroup;
  // @ts-ignore
  users: any[];

  showAddForm: boolean = false;



  displayedColumns: string[] = ['Id', 'user_id', 'user', 'brand', 'model', 'year_of_premiere'];
  dataSource: MatTableDataSource<any> = new MatTableDataSource<any>([]);

  constructor(
    private formBuilder: FormBuilder,
    private http: HttpClient,
  ) {
    this.loadFromApi();
    this.loadUsers();
  }



  ngOnInit(): void {
    this.addCarFormGroup = this.formBuilder.group({
      brand: ['', Validators.required],
      model: ['', Validators.required],
      year: ['', Validators.required],
      user: ['', Validators.required],
    });
  }

  loadUsers() {
    this.http.get(API_URL + '/user')
      .subscribe((response: any) => this.users = response);
  }

  switchAddForm() {
    this.showAddForm = !this.showAddForm;
  }

  saveCar() {
    if (!this.addCarFormGroup.valid) {
      alert('Błędne dane');
      return;
    }

    this.http.post(API_URL + '/car', {
      user_id: this.addCarFormGroup.value.user,
      brand: this.addCarFormGroup.value.brand,
      model: this.addCarFormGroup.value.model,
      year_of_premiere: this.addCarFormGroup.value.year,
    })
      .subscribe(
        () => {
          console.log('Dodano auto');
          this.loadFromApi();
          this.switchAddForm();
        },
        (error: any) => {
          console.log('Nie udało się dodać auta', error);
        }
      );
  }

  /**
   * Funkcja odpowiedzialna za pobranie danych z API i zapisanie ich do zmiennej dataSource.
   */
  loadFromApi() {
    this.http.get(API_URL + '/car').subscribe(
      (usersData: any) => {
        this.dataSource = new MatTableDataSource(usersData);
      });
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }
}
