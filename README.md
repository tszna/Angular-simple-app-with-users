# Angular simple app with users
Jest to prosta aplikacja, która wyświetla listę użytkowników z bazy danych MySQL. W aplikacji można usuwać pojedynczego użytkownika, usuwać wielu użytkowników, pokazywać więcej danych o użytkowniku w oknie modalnym, a także edytować dane użytkownika. Po kliknięciu w obrazek, przechodzimy do innej podstrony gdzie możemy przypisać samochód każdemu użytkownikowi z bazy. Do każdej tabeli została dodana wyszukiwarka, która pozwala filtrować dane w tabeli zgodnie z frazą wpisaną w pole wyszukiwania. Większość warstwy frontowej bazuje na angular material. Backend został napisany w frameworku laravel.
Widok ogólny aplikacji: 

<img src="https://i.imgur.com/8H4Mb5e.gif" alt="operation in app">

Widok trybu edycji:

<img src="https://i.imgur.com/cwrXMRK.gif" alt="operation in app">

Widok przypisywania samochodu do użytkownika:

<img src="https://i.imgur.com/PLfcYYO.gif" alt="operation in app">


<h4>Uruchomienie projektu</h4>
W celu uruchomienie projektu należy uruchomić terminal w katalogu angularapi, a następnie wpisać komendę:
<pre><code>composer install</code></pre>
Aby uruchomić nasłuchiwanie przez Api, należy w terminalu, również w katalogu angularapi wpisać komendę:
<pre><code>php artisan serve</code></pre>
Następnie należy przejść w terminalu do katalogu angularfront i wpisać:
<pre><code>npm install</code></pre>
a po zainstalowaniu paczek wpisać:
<pre><code>npm start</code></pre>
Następnie w bazie mysql utworzyć bazę danych o nazwie: angular, i użytkownika z uprawnieniami do tej bazy danych o loginie: angular i haśle: angular.
W kolejnym kroku należy zaimportować do stworzonej bazy danych plik sql, który znajduje się w głównym katalogu aplikacji.
Po zakończeniu procesu inicjalizacji aplikacja będzie gotowa do wyświetlenia pod adresem `http://localhost:4200/`.

<h4>Uruchomienia projektu poprzez docker</h4>
Po pobraniu projektu należy skopiować zawartość katalogu Docker i wkleić do głównego katalogu aplikacji, w taki sposób aby nadpisać istniejące pliki. Następnie należy uruchomić terminal w głównym katalogu aplikacji i wpisać komendę:
<pre><code>docker-compose up</code></pre>
W kolejnym kroku należy uruchmić phpmyadmin i zaimportować do istniejącej bazy danych plik sql, który znajduje się w głównym katalogu aplikacji.
Kontener phpmyadmin nasłuchuje domyślnie na porcie 5080, apache na porcie 5100, a aplikacja wyświetla się na porcie 3200. Domyślne porty można zmienić w pliku docker-compose.yml
