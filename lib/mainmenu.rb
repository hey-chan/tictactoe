require "artii"
require "tty-prompt"
require "tty-reader"
require "tty-cursor"
require_relative "./menu_choice"
# require_relative "./single_player"

prompt = TTY::Prompt.new
reader = TTY::Reader.new



# puts "Select the following"
# welcome = prompt.select(" ", cycle: true) do |menu|
#   menu.choice "Single player", 1
#   menu.choice "Multiplayer", 2
#   menu.choice "Scoreboard", 3
#   menu.choice "Help", 4
#   menu.choice "Quit", 5
# end
# class WelcomeMenu
#   def initialize
#     @single_player = SinglePlayer.new
#   end
# end

while true 
  case menu_input_select
  when 1
    # @single_player
    puts "What is your name?"
    name = gets.chomp.capitalize
    puts "Hello #{name}. Let's play a game of tic tac toe"
    single_player_tictactoe = true
    while single_player_tictactoe
      puts "".center(25, "-")
      puts "|       |       |       |"
      puts "|       |       |       |"
      puts "|       |       |       |"
      puts "".center(25, "-")
      puts "|       |       |       |"
      puts "|       |       |       |"
      puts "|       |       |       |"
      puts "".center(25, "-")
      puts "|       |       |       |"
      puts "|       |       |       |"
      puts "|       |       |       |"
      puts "".center(25, "-")
      puts " "
      puts "Press 1 to go back"
      puts "Press 2 to quit"
      choice = gets.to_i
      if choice == 1
        single_player_tictactoe = false
      else choice == 2
        puts "Thanks for playing"
        exit
      end
    end

  when 5
    puts "Thanks for playing"
    exit
  end
end

