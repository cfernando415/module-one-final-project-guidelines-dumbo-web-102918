require 'pry'
class Fisherman < ActiveRecord::Base
  has_many :baskets
  has_many :fish, through: :baskets

  def view_basket
    # This method should return a hash with the species as key and value as the total count caught for that species.
    basket = Hash.new(0)
    # binding.pry
    self.fish.map {|fish_type| fish_type.species}.each do |species|
      basket[species] += 1
    end
    # basket
    rows = []
    basket.each do |k, v|
      rows << [k, v]
    end
    table = Terminal::Table.new :title => "Your Basket", :headings => ['Fish', 'Count'], :rows => rows
    puts table
  end

  def self.login
    print "Please enter nickname: "
    nick_name = gets.chomp
    user = Fisherman.where(nickname: nick_name)[0]

    until user != nil
      puts "Nickname not found!!! Please try again."
      print "Please enter nickname: "
      nick_name = gets.chomp
      user = Fisherman.where(nickname: nick_name)[0]
    end

    puts "Welcome back #{user.nickname}!!!"
    user
  end

  def self.create_user
    print "Please enter first name: "
    f_name = gets.chomp
    print "Please enter last name: "
    l_name = gets.chomp
    print "Please enter a nickname: "
    nick_name = gets.chomp

    fisherman =  self.where("first_name = ? AND last_name = ? OR nickname = ?", f_name, l_name, nick_name).take
    if fisherman == nil
      fisherman = Fisherman.create(first_name: f_name, last_name: l_name, nickname: nick_name)
    else
      puts "You already have a profile!!!"
      self.login
    end
  end
end
