import { Component, OnInit } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { MatDialog } from '@angular/material/dialog';
import { DetailsComponent } from '../details/details.component';
import { MatTableDataSource } from '@angular/material/table';
import { MatSnackBar } from '@angular/material/snack-bar';

const API_URL = 'http://localhost:5100/api/user'

@Component({
  selector: 'app-main-page',
  templateUrl: './main-page.component.html',
  styleUrls: ['./main-page.component.css']
})
export class MainPageComponent implements OnInit {
  title: string = 'angularfront';
  displayedColumns: string[] = ['select', 'Id', 'name', 'username', 'akcje'];
  dataSource: MatTableDataSource<any> = new MatTableDataSource<any>([]);
  rowToDelete: any[] = [];
  errorMessage: string = '';
  checkedUsers: any[] = [];
  manyToDelete: any[] = [];

  loadFrom = 0;
  numberOfRowsInTable = 2;
  isLoading = false;
  pageLimitReached = true;
  pages = 0;
  showNoDataInfo = false;
  isInSearchMode = false;

  constructor(private http: HttpClient, public dialog: MatDialog, private snackBar: MatSnackBar) {
    this.loadFromApi();
  }

  /**
   * Funkcja odpowiedzialna za pobranie danych z API i zapisanie ich do zmiennej dataSource.
   */
  loadFromApi() {
    this.isLoading = true;
    this.http.get(API_URL + `/load/${this.loadFrom}/${this.numberOfRowsInTable}`).subscribe(
      (usersData: any) => {
        this.pages = usersData.data.pages;
        this.dataSource = new MatTableDataSource(usersData.data.users);
        this.isLoading = false;
        this.pageLimitReached = (this.pages - this.loadFrom - 1) <= 0;
        this.showNoDataInfo = true;
      });
  }

  /**
   * Funkcja odpowiedzialna za uruchomienie okna modalnego z listą danych użytkownika
   * @param user
   */
  openDialog(user: any) {
    const dialogRef = this.dialog.open(DetailsComponent, {
      width: '50vw',
      data: {
        user: user
      }
    });

    dialogRef.afterClosed().subscribe((result) => result?.refresh && this.loadFromApi());
  }

  /**
   * Funkcja odpowiedzialna za usunięcie pojedynczego użytkownika z listy oraz bazy danych
   * przy pomocy przycisku "usuń".
   * Część styli z potwierdzenia usunięcia znajduje się w pliku style.css w katalogu src.
   * @param rowId
   */
  deleteRow(rowId: any) {
    this.rowToDelete = this.dataSource.data.filter(value => {
      return value.id === rowId.id;
    });

    this.http.delete(API_URL + '/' + this.rowToDelete[0].id)
      .subscribe({
        next: () => {
          this.dataSource.data = this.dataSource.data.filter(value => {
            return value.id !== rowId.id;
          });
          this.snackBar.open('Wiersz został usunięty', '', {duration: 2000,})
        },
        error: error => {
          this.errorMessage = error.message;
          console.error('Nastąpił błąd!', error);
        }
      });
  }

  /**
   * Funkcja uruchamia się po wpisaniu przez użytkownika jakiejś frazy w pole wyszukiwania filtrując w ten
   * sposób wyniki wyświetalne na widoku.
   * @param event
   */
  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();

    this.isInSearchMode = filterValue.length > 0;
  }

  deleteMany() {
    this.manyToDelete = this.dataSource.data.filter(user => this.checkedUsers.includes(user.id));
    this.manyToDelete = this.manyToDelete.map(user => user.id);
    this.http.delete(API_URL + 's', { body: this.manyToDelete })
      .subscribe({
        next: () => {
          console.log('wszystko ok');
          location.reload();
        },
        error: error => {
          this.errorMessage = error.message;
          console.error('Wystąpił błąd', error);
        }
      });
    this.checkedUsers = [];
  }

  checkAll() {
    if(this.checkedUsers.length === this.dataSource.data.length) {
      this.checkedUsers = [];
    } else {
      this.checkedUsers = this.dataSource.data.map(user => user.id);
    }
  }

  check(user: any) {
    if(this.isChecked(user)) {
      this.checkedUsers = this.checkedUsers.filter(id => id !== user.id);
    } else {
      this.checkedUsers.push(user.id);
    }
  }

  isChecked(user: any) {
    return this.checkedUsers.includes(user.id);
  }

  ngOnInit(): void {
  }

  loadMore(): void {
    this.isLoading = true;
    this.loadFrom++;
    this.http.get(API_URL + `/load/${this.loadFrom}/${this.numberOfRowsInTable}`).subscribe(
      (usersData: any) => {
        this.isLoading = false;
        const current = this.dataSource.data;

        if (usersData.data.users.length === 0 || usersData.data.users.length < this.numberOfRowsInTable) {
          this.pageLimitReached = true;
        }
        
        usersData.data.users.forEach((row: any) => {
          current.push(row);
        });

        this.dataSource.data = current;

      });
  }

}
