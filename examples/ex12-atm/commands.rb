#file: commands.rb


class Cmd
    def initialize(cmd_id)
        @cmd_id = cmd_id
    end
    
    def get_cmd_id
        return @cmd_id
    end
end

class BalanceCmd < Cmd
    def process(id, account, atm_balance)
        if id == @cmd_id
            puts "У вас #{account} рублей"
            return true
        end

        return false
    end
end

class AddCmd < Cmd
    def process(id, account, atm_balance)
        if id == @cmd_id
            puts 'Введите номинал купюры, которую хотите внести'
            add = gets.chomp
            atm_balance[add] += 1
            account += add.to_i
            return true
        end

        return false
    end
end

class WithdrawCmd < Cmd
    def process(id, account, atm_balance)
        if id == @cmd_id
            puts 'Введите сумму денег, которую хотите снять'
            elapsed = gets.to_i
            add = 0

            if elapsed > account
                puts 'Недостаточно денег на счету!'
                return true
            end

            hundreds = [elapsed / 100, atm_balance['100']].min
            atm_balance['100'] -= hundreds
            add += hundreds * 100
            elapsed -= hundreds * 100

            fs = [elapsed / 50, atm_balance['50']].min
            atm_balance['50'] -= fs
            add += fs * 50
            elapsed -= fs * 50

            ts = [elapsed / 10, atm_balance['10']].min
            atm_balance['10'] -= ts
            add += ts * 10
            elapsed -= ts * 10

            fvs = [elapsed / 50, atm_balance['5']].min
            atm_balance['5'] -= fvs
            add += fvs * 5
            elapsed -= fvs * 5

            if elapsed != 0
                puts 'Не удается снять такую сумму.'
                return true
            end

            account -= add
            puts "Успешно снято #{add} рублей!"
            puts atm_balance

            return true
        end

        return false
    end
end