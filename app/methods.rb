require 'pry'
require_all 'app'

def login_page
  system("clear")

  puts '
  $$$$$$$$\ $$\           $$\                                 $$$$$$$$\ $$\           $$\
  $$  _____|\__|          $$ |                                $$  _____|\__|          $$ |
  $$ |      $$\  $$$$$$$\ $$$$$$$\   $$$$$$\   $$$$$$\        $$ |      $$\  $$$$$$$\ $$$$$$$\
  $$$$$\    $$ |$$  _____|$$  __$$\ $$  __$$\ $$  __$$\       $$$$$\    $$ |$$  _____|$$  __$$\
  $$  __|   $$ |\$$$$$$\  $$ |  $$ |$$$$$$$$ |$$ |  \__|      $$  __|   $$ |\$$$$$$\  $$ |  $$ |
  $$ |      $$ | \____$$\ $$ |  $$ |$$   ____|$$ |            $$ |      $$ | \____$$\ $$ |  $$ |
  $$ |      $$ |$$$$$$$  |$$ |  $$ |\$$$$$$$\ $$ |            $$ |      $$ |$$$$$$$  |$$ |  $$ |
  \__|      \__|\_______/ \__|  \__| \_______|\__|            \__|      \__|\_______/ \__|  \__|

                                                                                               '
  prompt = TTY::Prompt.new
  input = prompt.select("Are you a new or returning fisherman?", %w(New Returning))
  if input == "New"
    main_menu(Fisherman.create_user)
  else
    main_menu(Fisherman.login)
  end
end



def main_menu(arg)
  system("clear")
  prompt = TTY::Prompt.new
  input = prompt.select("What do you wanna do, #{arg.first_name}?") do |menu|
    menu.choice name: 'Play Game'
    menu.choice name: 'View Basket'
    menu.choice name: 'Exit'
  end
  if input == "Play Game"
    game(arg)
  elsif input == 'View Basket'
    arg.view_basket(arg)
  elsif input == 'Exit'
    login_page
  end
end
