require "tty-prompt"
require "pry"




def keypress
  prompt = TTY::Prompt.new
  if prompt.keypress(" .", timeout: 0.41, keys: [:space], ) == " "
    puts "yay you caught a fish!"
  else
    sleep(0.5)
    system("clear")
    return "try again"
  end
end

def exclamation
  system ("clear")
  print "\033[2J"
  puts '                               /$$
                              | $$
                              | $$
                              | $$
                              |__/

 /$$       /$$       /$$       /$$
|__/      |__/      |__/      |__/

                                     '
end


def game(arg)
  prompt = TTY::Prompt.new
  animation(PERIODS)
  exclamation
  value = keypress
  if value == "try again"
    system("clear")
    game(arg)
  else
    puts "yay! you caught a fish!"
    arg.fish << Fish.all.sample 
  input = prompt.select("Would you like to keep playing, or view your basket?", %w(Keep_Playing View_Basket))
      if input == "Keep_Playing"
        game(arg)
      elsif input == "View_Basket"
        arg.view_basket(arg)
      end
  end
end

period_zero = ''

period_one =
  '





 /$$
|__/
     '

period_two =
 '





 /$$       /$$
|__/      |__/
              '

period_three =
'





 /$$       /$$       /$$
|__/      |__/      |__/
                        '

PERIODS = [period_zero, period_one, period_two, period_three]


def animation(array)
  i = rand(1..3)
  while i < array.length
    print "\033[2J"
    array.each do |period|
      system("clear")
      puts period
      sleep(0.75)
    end
    i += 1
  end
end
