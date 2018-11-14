class CreateFish< ActiveRecord::Migration[5.0]
  def change
    create_table :fish do |t|
      t.string :species
      t.string :habitat
      t.string :description
      t.integer :rarity
    end
  end
end
