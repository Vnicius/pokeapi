class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.integer :pkdex_number
      t.string :name
      t.text :icon
      t.string :type_1
      t.string :type_2
      t.timestamps
    end
  end
end
