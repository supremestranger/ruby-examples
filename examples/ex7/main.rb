class Dog
    def talk
        puts "Гав!"
    end

    def move(destination)
        puts "Иду к #{destination}"
    end
end

fido = Dog.new
rex = Dog.new

fido.talk
rex.move("будка")