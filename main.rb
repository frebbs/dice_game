is_running = true
counter = 0
def roll_dice
  rand(1..6)
end


p1_win_count = 0
p2_win_count = 0
draws = 0

while is_running

  p1_roll_d1 = roll_dice
  p1_roll_d2 = roll_dice
  p1_roll_total = p1_roll_d1 + p1_roll_d2
  puts "Player two rolls #{p1_roll_d1} and #{p1_roll_d2} total: #{p1_roll_total}"
  sleep(0.5)
  p2_roll_d1 = roll_dice
  p2_roll_d2 = roll_dice
  p2_roll_total = p2_roll_d1 + p2_roll_d2
  puts "Player two rolls #{p2_roll_d1} and #{p2_roll_d2} total: #{p2_roll_total}"

  #sleep(2)
  if p1_roll_total == p2_roll_total
    puts " "
    puts "Its a draw, starting new game"
    puts " "
    draws += 1
  end

  if p1_roll_total > p2_roll_total
    p1_win_count += 1
  end
  if p1_roll_total < p2_roll_total
    p2_win_count += 1
  end

  puts "Starting next game......"
  puts " "
  counter += 1

  if p1_win_count == 10 || p2_win_count == 10
    puts "Player wincount #{p1_win_count} #{p2_win_count} #{draws}"
    puts "Player one wins!" if p1_win_count == 10
    puts "Player two wins!" if p2_win_count == 10

    is_running = false

  end
end
