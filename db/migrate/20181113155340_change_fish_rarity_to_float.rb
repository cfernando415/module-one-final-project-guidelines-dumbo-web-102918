class ChangeFishRarityToFloat < ActiveRecord::Migration[5.0]
  # def change
  # end

  def up
    change_column :fish, :rarity, :float
  end

  def down

  end
end
