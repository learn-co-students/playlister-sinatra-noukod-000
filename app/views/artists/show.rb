<h2> <%= @artist.name %> </h2>

<h2>Songs: </h2>
<% @artist.songs.each do |song| %>
<h3><a href="/songs/<%= song.slug %>"><%= song.name %></a> </h3>
<% end %>

<h2>Genres: </h2>
<% @artist.genres.each do |genre| %>
<h3><a href="/genres/<%= genre.slug %>"> <%= genre.name %> </a> </h3>
<% end %>
