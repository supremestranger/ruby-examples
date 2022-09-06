class Dog 
    attr_accessor :name, :age

    def report_age
        puts "Возраст: #{@age}."
    end

    def talk
        puts "Звук гавканья."
    end

    def move(dest)
        puts "#{name} идет к #{dest}"
    end
end

dog = Dog.new
dog.name = "Кто-то"
dog.age = 5
dog.report_age
dog.talk
dog.move("будка")