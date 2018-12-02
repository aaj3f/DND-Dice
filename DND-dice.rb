require "pry"

def d4(x=1)
  x = 1 if x == nil
  y = 0
  x.times {y += rand(1..4)}
  y
end

def d6(x=1)
  x = 1 if x == nil
  y = 0
  x.times {y += rand(1..6)}
  y
end

def d8(x=1)
  x = 1 if x == nil
  y = 0
  x.times {y += rand(1..8)}
  y
end

def d10(x=1)
  x = 1 if x == nil
  y = 0
  x.times {y += rand(1..10)}
  y
end

def d12(x=1)
  x = 1 if x == nil
  y = 0
  x.times {y += rand(1..12)}
  y
end

def d20(x=1)
  x = 1 if x == nil
  y = 0
  x.times {y += rand(1..20)}
  y
end

def d100(x=1)
  x = 1 if x == nil
  y = 0
  x.times {y += rand(1..100)}
  y
end

loop do
puts "\nWhat dice do you need to roll?"
puts "Type in the form [d20 + 2d8 + 4]"
print "... "
input = gets.chomp
puts "\n\n  ____"
puts " /\\' .\\    _____"
puts "/: \\___\\  / .  /\\"
puts "\\' / . / /____/..\\"
puts " \\/___/  \\'  '\\  /"
puts "          \\'__'\\/"
puts "\n\n"

break if input == "exit"
if !(input.scan(/[a-zA-Z]{2}/).empty?)
  puts "Woops, I don\'t quite recognize those dice."
  puts "Mind trying again? ..."
  next
end
input.slice!(/^\[/) && input.slice!(/\]$/)
in1 = input.slice!(/^\d*d\d+\b/)
in2 = input.slice!(/\d*d\d+/)
fix = input.slice!(/\d*$/)

count1 = in1[/^\d\d?/].to_i if in1[/^\d\d?/]
dice1 = in1[/d\d+\b/]


(count2 = in2[/^\d\d?/].to_i if in2[/^\d\d?/]) if in2
dice2 = in2[/d\d+\b/] if in2

fix.to_i > 0 ? fix = fix.to_i : fix = 0

def roll(dice, count=1)
  case dice
  when "d4"
    sum = d4(count)
    puts "\t[#{count}#{dice}] You rolled: #{sum}!\n\n"
    sum
  when "d6"
    sum = d6(count)
    puts "\t[#{count}#{dice}] You rolled: #{sum}!\n\n"
    sum
  when "d8"
    sum = d8(count)
    puts "\t[#{count}#{dice}] You rolled: #{sum}!\n\n"
    sum
  when "d10"
    sum = d10(count)
    puts "\t[#{count}#{dice}] You rolled: #{sum}!\n\n"
    sum
  when "d12"
    sum = d12(count)
    puts "\t[#{count}#{dice}] You rolled: #{sum}!\n\n"
    sum
  when "d20"
    sum = d20(count)
    puts "\t[#{count}#{dice}] You rolled: #{sum}!"
    puts "\tCRITICAL FAIL!! NoOoOoOo~~~" if sum == 1
    puts "\tNAT 20, YOU BAD BITCH!!" if sum == 20
    puts "\n"
    sum
  when "d100"
    sum = d100(count)
    puts "\t[#{count}#{dice}] You rolled: #{sum}!\n\n"
    sum
  end
end

r1 = roll(dice1, count1)
dice2 ? r2 = roll(dice2, count2) : r2 = 0


puts "Your total roll: #{r1 + r2 + fix} [#{dice1}#{" + #{dice2}" if dice2}#{" + #{fix}" if fix > 0}]!\n\n"

end
