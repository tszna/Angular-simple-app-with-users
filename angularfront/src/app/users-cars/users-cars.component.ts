import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {MatTableDataSource} from "@angular/material/table";
import { finalize } from 'rxjs/operators';
import { environment } from '../../environments/environment';

@Component({
  selector: 'app-users-cars',
  templateUrl: './users-cars.component.html',
  styleUrls: ['./users-cars.component.css']
})
export class UsersCarsComponent implements OnInit {

  // @ts-ignore
  addCarFormGroup: FormGroup;
  // @ts-ignore
  loginFormGroup: FormGroup;
  // @ts-ignore
  registerFormGroup: FormGroup;
  // @ts-ignore
  users: any[];
  // @ts-ignore
  countries: any[];
  // @ts-ignore
  cities: any[];

  showNoDataInfo = false;
  useCity: boolean = true;
  isVoting: boolean = false;
  isPaid: boolean = false;

  displayedColumns: string[] = ['Id', 'user_id', 'user', 'brand', 'model', 'year_of_premiere', 'city', 'vote'];
  dataSource: MatTableDataSource<any> = new MatTableDataSource<any>([]);

  constructor(
    private formBuilder: FormBuilder,
    private http: HttpClient,
  ) {
    this.loadFromApi();
    this.loadUsers();
    this.loadCountries();
    this.isPaid = true;
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

    //login form
    this.loginFormGroup = this.formBuilder.group({
      login: ['', Validators.required],
      password: ['', Validators.required],
    });

    //registr form
    this.registerFormGroup = this.formBuilder.group({
      name: ['', Validators.required],
      email: ['', Validators.required],
      password: ['', Validators.required],
      password_repeat: ['', Validators.required],
    });
  }

  loadUsers() {
    this.http.get(`${environment.api}user`)
      .subscribe((response: any) => this.users = response.data);
  }

  loadCountries() {
    this.http.get(`${environment.api}country`)
      .subscribe((response: any) => this.countries = response.data);
  }

  loadCities(countryId: any) {
    this.http.get(`${environment.api}country/${countryId}/cities`)
      .subscribe((response: any) => this.cities = response.data);
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

    this.http.post(`${environment.api}car`, data)
      .subscribe(
        () => {
          console.log('Dodano auto');
          window.location.reload();
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
    this.http.get(`${environment.api}car`,
    {headers: new HttpHeaders().set('Authorization', 'Bearer ' + JSON.parse(localStorage.getItem('token') ?? '{}'))}
    ).subscribe(
      (usersData: any) => {
        console.log(usersData);
        this.dataSource = new MatTableDataSource(usersData.data);
        this.isPaid = this.dataSource.data[0].userCanVote;
        this.showNoDataInfo = true;
      });
  }

  loginUser() {
    if (!this.loginFormGroup.valid) {
      alert('Błędne dane');
      return;
    }

    let data = {
      email: this.loginFormGroup.value.login,
      password: this.loginFormGroup.value.password,
    };

    this.http.post(
      // this.API_URL 
      `${environment.api}login`, data)
      .subscribe(
        (data: any) => {
          console.log('Zalogowano');
          localStorage.setItem('token', JSON.stringify(data?.token));
          window.location.reload();
        },
        (error: any) => {
          console.log('Nie udało się zalogować', error);
        }
      );
  }

  registerUser() {
    if (!this.registerFormGroup.valid) {
      alert('Błędne dane');
      return;
    }

    let data = {
      name: this.registerFormGroup.value.name,
      email: this.registerFormGroup.value.email,
      password: this.registerFormGroup.value.password,
      password_repeat: this.registerFormGroup.value.password_repeat,
    };

    this.http.post(`${environment.api}register`, data)
      .subscribe(
        (data: any) => {
          console.log('Dodano użytkownika');
          localStorage.setItem('token', JSON.stringify(data?.token));
          window.location.reload();
        },
        (error: any) => {
          console.log('Nie udało się dodać użytkownika', error);
        }
      );
  }

  logout() {
    this.http.post(`${environment.api}logout`, {}, 
    {headers: new HttpHeaders().set('Authorization', 'Bearer ' + JSON.parse(localStorage.getItem('token') ?? ''))})
    .subscribe(
      () => {
        localStorage.removeItem('token');
        console.log('Wylogowano');
        
        let x = document.getElementById("logout_info");
        // @ts-ignore
        x.className = "show";
        // @ts-ignore
        setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
        setTimeout(function(){ window.location.reload(); }, 3000);
        this.isPaid = true;
      }
    );
  }  

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

  voteFor(car: any, positive: number) {
    this.isVoting = true;

    this.http.get(`${environment.api}vote-for/${car.id}/${positive}`, {headers: new HttpHeaders()
      .set('Authorization', 'Bearer ' + JSON.parse(localStorage.getItem('token') ?? ''))})
      .pipe(finalize(() => this.isVoting = false))
      .subscribe(() => {
        
        if (!car.votes) {
          car.votes = [];
        }
        car.votes.push({is_positive: positive});
        car.userCanVote = false;
      })
  }

  positiveVotes(votes: any) {
    return (votes ?? []).filter((v: any) => v.is_positive == 1);
  }
  negativeVotes(votes: any) {
    return (votes ?? []).filter((v: any) => v.is_positive == 0);
  }

  addCarAnimation() {
    // @ts-ignore
   document.getElementById("addCarForm").classList.toggle("show-car-form");
 }

 showLoginForm() {
  // @ts-ignore
  document.getElementById("loginForm").classList.toggle("login-form");
 }

 hideLoginForm() {
  // @ts-ignore
  document.getElementById("loginForm").classList.toggle("login-form");
 }

 showRegisterForm() {
   // @ts-ignore
   document.getElementById("registerForm").classList.toggle("register-form");
  }

 hideRegisterForm() {
   // @ts-ignore
   document.getElementById("registerForm").classList.toggle("register-form");
  }

  hasToken() {
    return localStorage.getItem('token');
   }
}
