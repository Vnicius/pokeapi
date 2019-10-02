# Pokeapi
API to Pokémons informations in Ruby on Rails

## Before everything

```sh
    $ cd pokeapi
```
## Install

```sh
    $ bundle install
```

## Start the database

- Check the database credentials in `pokeapi/config/database.yml`
- Run:

```sh
    $ rails db:migrate
```

## Scraper

- Do the scrap in the [Bulbapedia page](https://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_National_Pok%C3%A9dex_number)

```sh
    rails scraper:pokemons
```

## Start the server

```
    $ rails s
```

## Routes

- Base url: `http://localhost:3000/v1`

|type|route| description|return|
|--|--|--|--|
|GET|`/pk`| Get the list of all Pokémon|List of Pokémon object in the `data` field|
|GET|`/pk/pokedex/:id`| Get a Pokémon by the index in the pokedex |A Pokémon object in the `data` field|
|GET|`/pk/search?q=[QUERY]`|Search the Pokémon by the name|List of Pokémon object in the `data` field|

## Pokémon Object

```json
    {
        "id": Integer,
        "name": String,
        "icon": String,
        "type_1": String,
        "type_2": String,
        "created_at": Date,
        "updated_at": Date
    }
```

## Todo

- [ ] `Types` as a new table
- [ ] Pokémon `description`
- [ ] Pokémon image
- [X] User authentication in the `user-auth` branch
