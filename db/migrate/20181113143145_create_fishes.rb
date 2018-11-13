class CreateFishes < ActiveRecord::Migration[5.0]
  def change
    create_table :fishes do |t|
      t.string :species
      t.string :habitat
      t.string :description
      t.integer :rarity
    end
  end
end
