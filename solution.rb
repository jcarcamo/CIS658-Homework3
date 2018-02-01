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

# 5. Given the following array definition in Ruby, generate a method named
#    convert_to_type_strings that takes the array as input and returns a second
#    array where each element in the array corresponds to a string
#    representation of the type (e.g. class) of each element in the array.

data = ['hello', 0, :sym, 3.4, "world", true, [0..3]]

def convert_to_type_strings(data)
    type = Array.new
    data.each { |val| type.push(val.class.to_s) }
    return type
end

print convert_to_type_strings(data), "\n"

# 6. Augment the existing Array class in Ruby so that it has a method named
#    convert_to_type_strings that does exactly what the method in question #5
#    above does but using the array’s internal data (e.g. you cannot pass the
#    array as a parameter).   Hint: investigate the map method defined by
#    Array.  When you are finished, test with the following code:
class Array
    def convert_to_type_strings()
        type = self.map { |val| val.class.to_s }
    end
end

data = ['hello', 0, :sym, 3.4, "world", true, [0..3]]
print data.convert_to_type_strings, "\n"

# 7. Given an array of symbol values representing an ensemble, write a method
#    called tabulate_sections that produces a hash that maps a string
#    representation of the section (e.g. type) the instrument belongs to, to
#    the number of instruments in that section of the ensemble.   For example,
#    the input array:
$sections = {
  piano: 'percussion',
  clarinet: 'woodwind',
  oboe: 'woodwind',
  trumpet: 'brass',
  frenchhorn: 'brass',
  violin: 'strings',
  cello: 'strings'
}

def tabulate_sections(ensemble)
  tabbed = Hash.new(0)
  ensemble.each do |instrument|
    puts $sections[instrument]
    tabbed[$sections[instrument]] += 1
  end
  return tabbed
end

ensemble = [:piano, :clarinet, :oboe, :trumpet, :frenchhorn, :violin, :piano, :oboe, :cello]
print tabulate_sections(ensemble),"\n"
