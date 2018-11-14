class Basket < ActiveRecord::Base
  belongs_to :fisherman
  belongs_to :fish

end
