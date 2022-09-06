class Vehicle
    attr_accessor :odometer
    attr_accessor :gas_used

    def accelerate
        puts "Вперёд!"
    end

    def sound_horn
        puts "Бип!"
    end

    def steer
        puts "Направляем."
    end

    def mileage
        total_gas = @gas_used == 0 ? 0.1 : @gas_used
        return @odometer / total_gas
    end
end

class Car < Vehicle
end

class Truck < Vehicle
end

class Motorcycle < Vehicle
end
