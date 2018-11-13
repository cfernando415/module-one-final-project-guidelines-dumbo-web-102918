class CreateFishermenFishes < ActiveRecord::Migration[5.0]
  def change
    create_table :fishermen_fishes do |t|
      t.integer :fisherman_id
      t.integer :fishes_id
      t.float :length_cm
    end
  end
end
