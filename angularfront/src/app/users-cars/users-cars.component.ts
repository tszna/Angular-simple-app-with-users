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
  // @ts-ignore
  countries: any[];
  // @ts-ignore
  cities: any[];

  showNoDataInfo = false;
  showAddForm: boolean = false;
  useCity: boolean = true;



  displayedColumns: string[] = ['Id', 'user_id', 'user', 'brand', 'model', 'year_of_premiere', 'city'];
  dataSource: MatTableDataSource<any> = new MatTableDataSource<any>([]);

  constructor(
    private formBuilder: FormBuilder,
    private http: HttpClient,
  ) {
    this.loadFromApi();
    this.loadUsers();
    this.loadCountries();
  }



  ngOnInit(): void {
    this.addCarFormGroup = this.formBuilder.group({
      brand: ['', Validators.required],
      model: ['', Validators.required],
      year: ['', Validators.required],
      user: ['', Validators.required],
      use_city: true,
      country: ['', Validators.required],
      city: ['', Validators.required],
    });

    this.addCarFormGroup.controls.use_city.valueChanges.subscribe((checked) => {
      this.useCity = checked;

      if (checked) {
        this.addCarFormGroup.controls.country.setValidators(Validators.required);
        this.addCarFormGroup.controls.city.setValidators(Validators.required);
      } else {
        this.addCarFormGroup.controls.country.clearValidators();
        this.addCarFormGroup.controls.city.clearValidators();
      }

      this.addCarFormGroup.controls.country.updateValueAndValidity({
        emitEvent: false
      });
      this.addCarFormGroup.controls.city.updateValueAndValidity();
    })
    this.addCarFormGroup.controls.country.valueChanges.subscribe((value) => this.loadCities(value))
  }

  loadUsers() {
    this.http.get(API_URL + '/user')
      .subscribe((response: any) => this.users = response.data);
  }

  loadCountries() {
    this.http.get(API_URL + '/country')
      .subscribe((response: any) => this.countries = response.data);
  }

  loadCities(countryId: any) {
    this.http.get(API_URL + `/country/${countryId}/cities`)
      .subscribe((response: any) => this.cities = response.data);
  }

  switchAddForm() {
    this.showAddForm = !this.showAddForm;
  }

  saveCar() {
    if (!this.addCarFormGroup.valid) {
      alert('Błędne dane');
      return;
    }

    let data = {
      user_id: this.addCarFormGroup.value.user,
      brand: this.addCarFormGroup.value.brand,
      model: this.addCarFormGroup.value.model,
      year_of_premiere: this.addCarFormGroup.value.year,
    };

    if (this.useCity) {
      // @ts-ignore
      data['city_id'] = this.addCarFormGroup.value.city
    }

    this.http.post(API_URL + '/car', data)
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
        console.log(usersData);
        this.dataSource = new MatTableDataSource(usersData.data);
        this.showNoDataInfo = true;
      });
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }
}
