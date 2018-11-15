class Fish < ActiveRecord::Base
has_many :baskets
has_many :fishermen, through: :baksets

  def self.view_encyclopedia(arg)
    system("clear")
    # binding.pry
    species = self.all.map {|x| x.species}
    species_description = self.all.map {|x| x.description}
    prompt = TTY::Prompt.new
    user_choice = prompt.select("encyclopedia", species)

    case user_choice
      when species[0]
        puts "#{species[0]}: #{species_description[0]}"
        prompt_a(arg)
      when species[1]
        puts "#{species[1]}: #{species_description[1]}"
        prompt_a(arg)
      when species[2]
        puts "#{species[2]}: #{species_description[2]}"
        prompt_a(arg)
      when species[3]
        puts "#{species[3]}: #{species_description[3]}"
        prompt_a(arg)
      when species[4]
        puts "#{species[4]}: #{species_description[4]}"
        prompt_a(arg)
      when species[5]
        puts "#{species[5]}: #{species_description[5]}"
        prompt_a(arg)
      when species[6]
        puts "#{species[6]}: #{species_description[6]}"
        prompt_a(arg)
      when species[7]
        puts "#{species[7]}: #{species_description[7]}"
        prompt_a(arg)
      when species[8]
        puts "#{species[8]}: #{species_description[8]}"
        prompt_a(arg)
      else
        puts "#{species[9]}: #{species_description[9]}"
        prompt_a(arg)
    end

  end
end
