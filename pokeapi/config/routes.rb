Rails.application.routes.draw do

  scope module: 'api' do
    namespace :v1 do
      get 'pk', to: 'pokemons#show'
      get 'pk/pokedex/:id', to: 'pokemons#get'
      get 'pk/search', to: 'pokemons#search'
    end
  end

end
