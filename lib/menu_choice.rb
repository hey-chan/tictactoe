require "artii"
require "tty-prompt"
require "tty-reader"
require "tty-cursor"
# require_relative "./single_player"

def menu_input_select 
  art = Artii::Base.new :font => 'slant'
  puts art.asciify('Tic Tac Toe!')
  puts "1. Single player"
  puts "2. Multiplayer"
  puts "3. Scoreboard"
  puts "4. Help"
  puts "5. Quit"
  #take input from user
  menu_input = gets.chomp.to_i
  return menu_input
end

# def menu_input_select 
#   # puts "Select the following"
#   prompt.select(" ", cycle: true) do |menu|
#     menu.choice "Single player", 1
#     menu.choice "Multiplayer", 2
#     menu.choice "Scoreboard", 3
#     menu.choice "Help", 4
#     menu.choice "Quit", 5
#   end

# end

