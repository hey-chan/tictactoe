require "tty-cursor"
require 'dispel'
require "tty-prompt"
require "artii"
prompt = TTY::Prompt.new

art = Artii::Base.new :font => 'slant'
puts art.asciify('Tic Tac Toe!')

puts "Select the following"
welcome = prompt.select(" ", cycle: true) do |menu|
  menu.choice "Single player", 1
  menu.choice "Multiplayer", 2
  menu.choice "Scoreboard", 3
  menu.choice "Help", 4
  menu.choice "Quit", 5
end
# cursor = TTY::Cursor

# puts "Lorem ipsum"
# puts "Misc"

# draw app and redraw after each keystroke
class TicTacToe
  BOARD = <<BOARD
-------------------------
|       |       |       |
|   X   |   X   |   X   |
|       |       |       |
-------------------------
|       |       |       |
|   X   |   X   |   X   |
|       |       |       |
-------------------------
|       |       |       |
|   X   |   X   |   X   |
|       |       |       |
-------------------------
BOARD
  # def BOARD
  #   puts "".center(25, "-") 
  #   puts "|       |       |       |"
  #   puts "|   X   |   X   |   X   |"
  #   puts "|       |       |       |"
  #   puts "".center(25, "-")
  #   puts "|       |       |       |"
  #   puts "|   X   |   X   |   X   |"
  #   puts "|       |       |       |"
  #   puts "".center(25, "-")
  #   puts "|       |       |       |"
  #   puts "|   X   |   X   |   X   |"
  #   puts "|       |       |       |"
  #   puts "".center(25, "-")
  # end

  PLAYERS = ['X','O']

  attr_reader :position, :player

  def initialize
    @fields = Array.new(9).fill(' ')
    @position = 0
    @player = PLAYERS.first
  end

  def board
    index = -2
    BOARD.gsub(" X ") do
      index += 1
      field = @fields[index]
      @position == index ? "[#{field}]" : " #{field} "
    end
  end

  def move(x,y)
    x = (@position + x) % 3
    y = ((@position / 3) + y) % 3
    @position = x + (y * 3)
  end

  def set
    return if @fields[@position] != ' '
    @fields[@position] = @player
    @player = next_player
  end

  # def ai_move
  #   return unless position = ai_select_position
  #   @position = position
  #   set
  # end

  def draw?
    @fields.index(' ') == nil
  end

  def winner
    [
      [0,1,2],[3,4,5],[6,7,8],  # vertical
      [0,3,6],[1,4,7],[2,5,8],  # horizontal
      [0,4,8],[2,4,6]           # diagonal
    ].each do |pattern|
      players = pattern.map{|i| @fields[i] }.uniq
      next if players.size != 1
      winner = players.first
      next if winner == ' '
      return winner
    end
    nil
  end

  private

  # def ai_select_position
  #   return if winner or draw?
  #   free_positions = self.class.array_indexes(@fields, ' ')

  #   # how can i win ?
  #   free_positions.detect{|position| can_by_taking?(position, @player) } or
  #   # how can i prevent opponent from winning ?
  #   free_positions.detect{|position| can_by_taking?(position, next_player) } or
  #   # guess
  #   free_positions.sort_by{rand}.first
  # end

  def can_by_taking?(position, player)
    taking(position, player) do
      winner = self.winner
      winner == player
    end
  end

  def taking(position, player)
    old_player, @player = @player, player
    old_field = @fields[position]
    @fields[position] = @player
    yield
  ensure
    @fields[position] = old_field
    @player = old_player
  end

  def self.array_indexes(array, find)
    indexes = []
    array.each_with_index{|item,i| indexes << i if find == item }
    indexes
  end

  def next_player
    current_index = PLAYERS.index(@player)
    next_index = (current_index + 1) % PLAYERS.size
    PLAYERS[next_index]
  end
end


def draw(ttt)
  [ttt.board, status_line(ttt), "q = Quit, r = Reset"].join("\n")
end

def status_line(ttt)
  if winner = ttt.winner
    "Player #{winner} has won!!!!"
  elsif ttt.draw?
    "It is a draw..."
  else
    "It is #{ttt.player}`s turn..."
  end
end

Dispel::Screen.open do |screen|
  ttt = TicTacToe.new
  screen.draw draw(ttt)

  Dispel::Keyboard.output do |key|
    case key
    when :up then ttt.move(0,-1)
    when :down then ttt.move(0,1)
    when :right then ttt.move(1,0)
    when :left then ttt.move(-1,0)
    # when "a" then ttt.ai_move
    when :enter then ttt.set # enter
    when "q" then break
    when "r" then ttt = TicTacToe.new
    end
    screen.draw draw(ttt)
  end
end

