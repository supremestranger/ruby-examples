class Bird
    def talk
        puts "Звуки чириканья."
    end

    def move(dest)
        puts "Лечу к #{dest}."
    end
end

class Dog
    def talk
        puts "Звуки гавканья."
    end
    
    def move(dest)
        puts "Иду к #{dest}."
    end
end

class Cat
    def talk
        puts "Звуки мяуканья."
    end

    def move(dest)
        puts "Иду к #{dest}."
    end
end

bird = Bird.new
dog = Dog.new
cat = Cat.new

bird.move("дерево")
dog.talk
bird.talk
cat.move("дом")