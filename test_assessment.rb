require "artii"
require "tty-prompt"
require "tty-reader"
require "tty-cursor"


class WelcomeMenu
  def initialize
    @prompt = TTY::Prompt.new
    @reader = TTY::Reader.new
    @display = Display.new
    @art = Artii::Base.new :font => 'slant'
  end

  def main_menu_display
    puts @art.asciify('Tic Tac Toe!')

    puts "Select the following"
    welcome = @prompt.select(" ", cycle: true) do |menu|
      menu.choice "Single player", 1
      menu.choice "Multiplayer", 2
      menu.choice "Scoreboard", 3
      menu.choice "Help", 4
      menu.choice "Quit", 5
    end
    process_menu(input)
  end

  def exit_app
    @display.artii('Good bye ')
    puts '      © Matthew Liu'
    puts ''
    puts ''
    exit
  end
end
end

# cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]

# case welcome
#   when 1
#     puts "What is your name?"
#     name = gets.chomp.capitalize
#     puts "Hello #{name}. Let's play a game of tic tac toe"
    
#     puts "".center(25, "-")
#     puts "|       |       |       |"
#     puts "|       |       |       |"
#     puts "|       |       |       |"
#     puts "".center(25, "-")
#     puts "|       |       |       |"
#     puts "|       |       |       |"
#     puts "|       |       |       |"
#     puts "".center(25, "-")
#     puts "|       |       |       |"
#     puts "|       |       |       |"
#     puts "|       |       |       |"
#     puts "".center(25, "-")

#   when 2
#     puts "What is your name player 1?"
#     player_one = gets.chomp.capitalize
#     puts "Hello #{player_one}. What is your name player 2?"
#     player_two = gets.chomp.capitalize
#     puts "Nice to meet you. #{player_one} and #{player_two}, let's play a game of tic tac toe."
#     puts "".center(25, "-") 
#     puts "|       |       |       |"
#     puts "|   #{cells[0]}   |   #{cells[1]}   |   #{cells[2]}   |"
#     puts "|       |       |       |"
#     puts "".center(25, "-")
#     puts "|       |       |       |"
#     puts "|   #{cells[3]}   |   #{cells[4]}   |   #{cells[5]}   |"
#     puts "|       |       |       |"
#     puts "".center(25, "-")
#     puts "|       |       |       |"
#     puts "|   #{cells[6]}   |   #{cells[7]}   |   #{cells[8]}   |"
#     puts "|       |       |       |"
#     puts "".center(25, "-")

#   when 3
#     puts "Scoreboard"
#   when 4
#     puts "hello"
#   when 5
#     puts "Press ESC or Ctrl + X to quit"
#     reader.on(:keyctrl_x, :keyescape) do
#       puts a.asciify('Thanks for playing')
#       puts "© Matthew Liu"
#       exit
#     end
    
#     loop do
#       reader.read_line("=> ")
#     end
    
#   else
#     puts "Invalid response"
# end
# class WelcomeMenu
#   def initialize
#     @prompt = TTY::Prompt.new
#     @display = Display.new
#   end

#   def menu_display
#     @prompt.artii "Tic Tac Toe"
#   #   input = @prompt.select("Select the following", cycle: true) do |menu|
#   #     menu.choice "Single player", 1
#   #     menu.choice "Multiplayer", 2
#   #     menu.choice "Scoreboard", 3
#   #     menu.choice "Help", 4
#   #     menu.choice "Quit", 4
#   #   end
#   #   process_menu
#   end
# end






# class TicTacToe
#   # initialize
#   def initialize
#       # set up the board
#       @board = Board.new

#       # set up the players
#       @player_x = Player.new("Madame X", :x, @board)
#       @player_y = Player.new("Mister Y", :y, @board)

#       # assign the starting player
#       @current_player = @player_x
#   end

#   # play
#   def play

#       # loop infinitely
#       loop do
#           # call the board rendering method
#           @board.render

#           # ask for coordinates from the current player
#           @current_player.get_coordinates

#           # check if game is over
#           break if check_game_over

#           # switch players
#           switch_players
#       end
#   end

#   # check_game_over?
#   def check_game_over
#       # check for victory
#       # check for draw
#       check_victory || check_draw
#   end

#   # check_victory?
#   def check_victory
#       # IF Board says current player's piece has
#       # a winning_combination?
#       if @board.winning_combination?(@current_player.piece)
#           # then output a victory message
#           puts "Congratulations #{@current_player.name}, you win!"
#           true
#       else
#           false
#       end
#   end

#   # check_draw?
#   def check_draw
#       # If Board says we've filled up 
#       if @board.full?
#           # display draw message
#           puts "Bummer, you've drawn..."
#           true
#       else
#           false
#       end
#   end

#   # switch_players
#   def switch_players
#       if @current_player == @player_x
#           @current_player = @player_y
#       else
#           @current_player = @player_x
#       end
#   end

# end


# # Manages all player-related functionality
# class Player
#   attr_accessor :name, :piece

#   # initialize
#   def initialize(name = "Mystery_Player", piece, board)
#       # Set marker type (e.g. X or O)
#       raise "Piece must be a Symbol!" unless piece.is_a?(Symbol)
#       @name = name
#       @piece = piece
#       @board = board
#   end

#   # get_coordinates
#   def get_coordinates
#       # loop infinitely
#       loop do
#           # ask_for_coordinates
#           coords = ask_for_coordinates

#           # IF validate_coordinates_format is true
#           if validate_coordinates_format(coords)
#               # IF piece can be placed on Board
#               if @board.add_piece(coords, @piece)
#                   # break the loop
#                   break
#               end
#           end
#       end
#   end


#   # ask_for_coordinates
#   def ask_for_coordinates
#       # Display message asking for coordinates
#       puts "#{@name}(#{@piece}), enter your coordinates in the form x,y:"
#       # pull coordinates from command line
#       gets.strip.split(",").map(&:to_i)
#   end

  # validate_coordinates_format
#   def validate_coordinates_format(coords)
#       # UNLESS coordinates are in the proper format
#       if coords.is_a?(Array) && coords.size == 2
#           true
#       else
#           # display error message
#           # Note that returning `nil` acts falsy!
#           puts "Your coordinates are in the improper format!"
#       end
#   end

# end


# Maintains game board state
# class Board
#   # initialize board
#   def initialize
#       # set up blank data structure
#       @board = Array.new(3){Array.new(3)}
#   end

#   # render
#   def render
#       puts
#       # loop through data structure
#       @board.each do |row|
#           row.each do |cell|
#               # display an existing marker if any, else blank
#               cell.nil? ? print("-") : print(cell.to_s)
#           end
#           puts
#       end
#       puts

#   end

#   # add_piece
#   def add_piece(coords, piece)
#       # IF piece_location_valid?
#       if piece_location_valid?(coords)
#           # place piece
#           @board[coords[0]][coords[1]] = piece
#           true
#       else
#           false
#       end
#   end

#   # piece_location_valid?
#   def piece_location_valid?(coords)
#       # Is the placement within_valid_coordinates?
#       if within_valid_coordinates?(coords)
#           # Are the piece coordinates_available?
#           coordinates_available?(coords)
#       end
#   end

#   # within_valid_coordinates?
#   def within_valid_coordinates?(coords)
#       # UNLESS piece coords are in the acceptible range
#       if (0..2).include?(coords[0]) && (0..2).include?(coords[1])
#           true
#       else
#           # display an error message
#           puts "Piece coordinates are out of bounds"
#       end
#   end

#   # coordinates_available?
#   def coordinates_available?(coords)
#       # UNLESS piece coords are not occupied
#       if @board[coords[0]][coords[1]].nil?
#           true
#       else
#           # display error message
#           puts "There is already a piece there!"
#       end
#   end

#   # winning_combination?
#   def winning_combination?(piece)
#       # is there a winning_diagonal?
#       # or winning_vertical? 
#       # or winning_horizontal? for that piece?
#       winning_diagonal?(piece)   || 
#       winning_horizontal?(piece) || 
#       winning_vertical?(piece)
#   end

#   # winning_diagonal?
#   def winning_diagonal?(piece)
#       # check if specified piece has a triplet across diagonals
#       diagonals.any? do |diag|
#           diag.all?{|cell| cell == piece }
#       end
#   end

#   # winning_vertical?
#   def winning_vertical?(piece)
#       # check if specified piece has a triplet across verticals
#       verticals.any? do |vert|
#           vert.all?{|cell| cell == piece }
#       end
#   end

#   # winning_horizontal?
#   def winning_horizontal?(piece)
#       # check if specified piece has a triplet across horizontals
#       horizontals.any? do |horz|
#           horz.all?{|cell| cell == piece }
#       end
#   end

#   # diagonals
#   def diagonals
#       # return the diagonal pieces
#       [[ @board[0][0],@board[1][1],@board[2][2] ],[ @board[2][0],@board[1][1],@board[0][2] ]]
#   end

#   # verticals
#   def verticals
#       # return the vertical pieces
#       @board
#   end

#   # horizontals
#   def horizontals
#       # return the horizontal pieces
#       horizontals = []
#       3.times do |i|
#           horizontals << [@board[0][i],@board[1][i],@board[2][i]]
#       end
#       horizontals
#   end

#   # full?
#   def full?
#       # does every square contain a piece?
#       @board.all? do |row|
#           row.none?(&:nil?)
#       end
#   end

# end

# t = TicTacToe.new
# t.play
# # > load 'tictactoe.rb'
# # ---
# # ---
# # ---
# # Enter your coordinates in the form x,y:
