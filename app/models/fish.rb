class Fish < ActiveRecord::Base
has_many :baskets
has_many :fishermen, through: :baksets


end
