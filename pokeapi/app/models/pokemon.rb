class Pokemon < ApplicationRecord
    scope :search, lambda { |q| where("LOWER(pokemons.name) LIKE ?", "%#{q.downcase}%") }
end
