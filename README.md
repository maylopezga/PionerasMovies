# PionerasMovies
En el Gemfile agregaremos la siguiente línea.
```
  gem 'devise'
```
En la terminal corremos
```
$  bundle install

```

Insatlemos 'Devise'

```
  $ rails generate devise:install
```
Crear la root en routes

```
root to: 'movies#index'
```
Añadimos los mensajes en el body de 'application.html.erb'

ruta -> “app/views/layouts/application.html.erb”

```
<p class="notice"><%= notice %></p>
<p class="alert"><%= alert %></p>
```

Generamos el modelo
```
$ rails g devise User

$ rake db:migrate
```

En el navegador podemos ver que el modelo de user ya se creó

```
http://localhost:3000/users/sign_in
```

Para generar la vista de devise corremos el siguiente comando en la consola

```
$ rails generate devise:views
```


En el _navigation_ agregamos las siguientes líneas de código para generar los enlaces de iniciar sesión y registrarse.

ruta -> "/app/views/partials/_navigation.html.erb"_

```
<% if user_signed_in?%>
<li class="col-md"><%= link_to new_movie_path do %>
<span class="glyphicon glyphicon-pushpin "></span> Crear artículo<%end%>
</li>
<li class="col-md"><%= link_to edit_user_registration_path do %>
<span class="glyphicon glyphicon-user"></span> Usuario <%end%>
</li>
<li class="col-md"><%= link_to destroy_user_session_path, method: :delete do %>
<span class="glyphicon glyphicon-log-in "></span> Cerrar sesión<%end%>
</li>

<%else%>
<li class="col-md"><%= link_to new_user_registration_path do %>
<span class="glyphicon glyphicon-user"></span> Registrarse<%end%>
</li>
<li class="col-md"><%= link_to new_user_session_path do %>
<span class="glyphicon glyphicon-log-in"></span> Iniciar sesión<%end%>
</li>

<%end%>

```

Agregamos la siguiente línea en el controlador de movies

ruta -> "app/controllers/movise_controller.rb"

```
before_action :authenticate_user!, except: [:show,:index]
```
Esto nos indica que las personas que no tienen cuenta solo pueden acceder a la vista de show y de index
