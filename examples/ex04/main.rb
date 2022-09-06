puts "Добро пожаловать в 'Угадай мое число'!"
puts "Как вас зовут?"
input = gets.chomp
puts "Добро пожаловать, #{input}!"
puts "Я загадал случайное число. Попробуйте его угадать, #{input}!"
target = rand(26)
num_guesses = 0
finished = false

while num_guesses < 10 && finished == false
    puts "У вас еще #{10 - num_guesses} попыток."
    print "Попробуйте: "
    guess = gets.to_i

    num_guesses += 1
    
    if guess < target
        puts "Мое загаданное число больше!"
    elsif guess > target 
        puts "Мое загаданное число меньше"
    els if guess == target
        puts "Вы угадали мое число!"
        finished = true
    end
end
puts "Игра окончена!"