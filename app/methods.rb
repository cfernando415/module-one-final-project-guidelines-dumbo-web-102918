require 'pry'
# def create_user
#   print "Please enter first name: "
#   f_name = gets.chomp
#   print "Please enter last name: "
#   l_name = gets.chomp
#   print "Please enter a nickname: "
#   nick_name = gets.chomp
#   fisherman = Fisherman.create(first_name: f_name, last_name: l_name, nickname: nick_name)
# end

def login_page
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
    Fisherman.create_user.view_basket
  else
    Fisherman.login.view_basket
  end
end
