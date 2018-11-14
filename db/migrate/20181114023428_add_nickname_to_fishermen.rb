class AddNicknameToFishermen < ActiveRecord::Migration[5.0]
  def change
    add_column :fishermen, :nickname, :string
  end
end
