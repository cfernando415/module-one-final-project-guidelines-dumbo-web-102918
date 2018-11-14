class CreateBaskets < ActiveRecord::Migration[5.0]
  def change
    create_table :baskets do |t|
      t.integer :fisherman_id
      t.integer :fish_id
      t.float :length_cm
    end
  end
end
