// /api/v1/pokedex/1/
const fetchPoke = function (e) {
  e.preventDefault();

  const pokemonNum = $('#query').val();

  $.getJSON(`https://pokeapi.co/api/v2/pokemon/${ pokemonNum }/`).done(function (info) {
      const pokeName = info.name;

      $('#name').append(pokeName);
    }).done(function (info) {
      const pokeType = info.types[0].type.name;
      $('#type').append(pokeType);
    }).done(function (info) {
      const ability= info.abilities[0].ability.name;
      $("#ability").append(ability);
    }).fail(function () {
      alert('Invalid number');
    });
  };

$(document).ready(function () {
  $('#pokemon-search').on('submit', fetchPoke);
});
