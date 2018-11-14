require 'pry'
class Fisherman < ActiveRecord::Base
  has_many :baskets
  has_many :fish, through: :baskets

  def view_basket
    # This method should return a hash with the species as key and value as the total count caught for that species.
    basket = Hash.new(0)
    binding.pry
    self.fish.map {|fish_type| fish_type.species}.each do |species|
      basket[species] += 1
    end
    basket
  end
end
