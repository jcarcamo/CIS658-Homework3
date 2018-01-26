# CIS 658 - Homework3
#
# Juan Gonzalo Carcamo
# Nicolas Arias

#1. Print out the ubiquitous “Hello, World” message.
puts "Hello, World!"

#2. For the string “Hello, World,” find and print the index of the word “World”.
puts "Hello, World".index("World")

#3. Print the string "This is funny monkey #1!" where the number 1 changes from
#   1 to 10.  Implement this in 3 different ways using Ruby.

# 3.0
puts "\nObvious attempt"
for i in 1..10 do
    puts "This is funny monkey #{i}!"
end

# 3.1
puts "First attempt"
i = 1
10.times {
    puts "This is funny monkey #{i}!"
    i=i+1
}

# 3.2
puts "\nSecond attempt"
counter = [1,2,3,4,6,7,8,9,10]
counter.each { |val| puts "This is funny monkey #{val}!" }

# 4. Write a simple game that generates a random number 1 – 1000.  Let a player
#    guess the number.  If the guess is wrong print out whether the guess is
#    low or high and let the player guess again.  Repeat this until the user
#    guesses the number.  Award the lucky user who finally gets it right, a
#    surprise of their choice.   Hint: rand(1000) will generate a random number
#    random number 0 .. 999.  The function gets will read a string from the
#    keyboard that can be translated into an integer.

gameNumber = rand(1000) + 1
puts "Can you guess the number the computer generated? Hint: it is between 1 and 1000. -1 to not play"

userNumber = -1
found = false
while not found do
    userNumber = gets.chomp.to_i
    if userNumber == -1 then
        break
    elsif userNumber == gameNumber
        found = true
    end

    if gameNumber > userNumber then
        puts "Number is higher"
    elsif gameNumber < userNumber
        puts "Number is lower"
    end

    if not found then
        puts "Guess again or type -1 to end"
    end
end

if found then
    puts "You did it! Go to Dr. Engelsma to claim your prize"
    puts "1. Why's (poignant) guide to ruby"
    puts "2. One month AWS subscription"
    puts "3. +10 points of your final grade"
    gets.chomp
end
