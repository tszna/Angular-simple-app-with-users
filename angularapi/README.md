# AngularTrainingApi
<h4>Instalacja projektu</h4>
Po pobraniu projektu należy uruchomić terminal w głównym katalogu aplikacji, a następnie wpisać komendę:
<pre><code>composer install</code></pre>

<h4>Uruchomienie projektu</h4>
Aby uruchomić nasłuchiwanie przez Api, należy w terminalu, również w katalogu głównym aplikacji, wpisać:
<pre><code>php artisan serve</code></pre>
Api nasłuchuje pod adresem 'localhost:8000'.

<h4>Routing</h4>
Routing jest zdefiniowany w pliku routes/api.php

<h4>baza danych</h4>
Aby zasilić bazę danych 10 nowymi użytkownikami, należy w terminalu w głównym katalogu aplikacji wpisać:
<pre><code>php artisan migrate:fresh --seed</code></pre>
