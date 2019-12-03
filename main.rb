# The loop lives while this is true!
is_running = true

# Keeps track of how many total games were played
counter = 0

# Rolls the dice
def roll_dice
  rand(1..6)
end

# Do you want to watch the computer play itself or put it out of its misery?
def play_again(response)
  if response == "Y" || response == "y" || response == "Yes" || response == "yes" || response == "YES"
    true
  else
    false
  end
end

# Initial start values for the game
p1_win_count = 0
p2_win_count = 0
win_condition_total = ARGV[0].to_i | 1
draws = 0

# Time between rolls
game_delay = 0.4

# The loop runs as long is is_running is true
while is_running

  # In each loop, set the dice to their random values by calling roll_dice on
  # each variable then adding them together for the totals
  p1_roll_d1 = roll_dice
  p1_roll_d2 = roll_dice
  p1_roll_total = p1_roll_d1 + p1_roll_d2
  puts "Player two rolls #{p1_roll_d1} and #{p1_roll_d2} total: #{p1_roll_total}"
  sleep(game_delay)
  p2_roll_d1 = roll_dice
  p2_roll_d2 = roll_dice
  p2_roll_total = p2_roll_d1 + p2_roll_d2
  puts "Player two rolls #{p2_roll_d1} and #{p2_roll_d2} total: #{p2_roll_total}"

  # sleep(2)
  # If both players draw, increment the draw counter and continue
  if p1_roll_total == p2_roll_total
    puts " "
    puts "Its a draw, starting new game"
    puts " "
    draws += 1
  end

  # If player one wins this round, increment the p1_win_count by 1
  p1_win_count += 1 if p1_roll_total > p2_roll_total
  # If player two wins this round, increment the p2_win_count by 1
  p2_win_count += 1 if p1_roll_total < p2_roll_total

  puts "Starting next game......"
  puts " "

  # Increment the game counter by 1
  counter += 1

  # If one of the players reaches the win_condition total, run this section
  unless p1_win_count == win_condition_total || p2_win_count == win_condition_total
    next
  end
  puts "Scores\nP1: #{p1_win_count}\tP2: #{p2_win_count}\nDraws: #{draws}"
  puts "Player one wins!" if p1_win_count == win_condition_total
  puts "Player two wins!" if p2_win_count == win_condition_total
  puts " "
  puts "Would you like to play again? (Y or any key to exit)"
  play_again = STDIN.gets.chomp
  # Pass the player answer to the play_again method then execute the if section
  play_again(play_again)
  if play_again(play_again)
    # If the player answered with a truthy value reset the player win and draw
    # counts and continue the while loop
    p1_win_count = 0
    p2_win_count = 0
    draws = 0
    puts " "
    puts "Game starting"
    puts " "
  else
    # If the player entered a falsy value, change the is_running to false to terminate the loop
    puts "Thanks for playing, goodbye!"
    puts "You played #{counter} games"
    is_running = false
  end

end
