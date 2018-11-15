require 'pry'
class Fisherman < ActiveRecord::Base
  has_many :baskets
  has_many :fish, through: :baskets

  def view_basket(arg)
    system("clear")
    prompt = TTY::Prompt.new
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
    input = prompt.select("What would you like to do fisher?") do |menu|
       menu.choice name: "Play game"
       menu.choice name: "Go back to main menu"
     end
     if input == "Play game"
       game(arg)
     elsif input == "Go back to main menu"
       main_menu(arg)
     end
  end

  def self.login
    print "Please enter nickname: "
    nick_name = gets.chomp
    user = Fisherman.where(nickname: nick_name)[0]

    until user != nil
      system("clear")
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

    fisherman =  self.where("nickname = ?", nick_name).take
    # binding.pry
    if fisherman == nil
      fisherman = Fisherman.create(first_name: f_name, last_name: l_name, nickname: nick_name)
    else
      if self.where("first_name = ? AND last_name = ?", f_name, l_name).take
        system("clear")
        puts "You already have a profile!!!"
        self.login
      elsif self.where("nickname = ?", nick_name).take
        system("clear")
        puts "Nickname already taken!"
        self.create_user
      end
    end
  end

  
end
