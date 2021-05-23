# require "artii"
# require "tty-prompt"
require "tty-reader"

# prompt = TTY::Prompt.new
reader = TTY::Reader.new
puts "Hello"
puts "Press Ctrl X or Esc to escape"
reader.on(:keyctrl_x, :keyescape) do
  puts "Exiting..."
  exit
end
loop do
  reader.read_line("=> ")
end

# reader.read_char 
  # Press any key to read, and will only read a single key stroke
# reader.read_line
  # Reads a single line
# reader.read_line(raw: false)
  # Reads arrow keys, and read by the terminal
# reader.read_line("> ", value: "")
  # Allows you to edit with pre determined value
# reader.read_multiline
  # Reads as many lines.
# reader.read_multiline(raw: false)
  # Similar to read_line(raw: false)
# choices = %w(Scorpion Kano Jax)
# prompt.select("Choose your destiny?", choices, symbols: { marker: "-->" }, help:"(Use arrow keys)", show_help: :always)

# # prompt.ok("Nice")
# prompt.warn("Much shock")
 
# letters = ("A".."Z").to_a
# prompt.select("Choose your letter?", letters, per_page: 4)


# puts "hello I will be testing this gem"

