#file: main.rb
require './commands'

def main
    atm_balance = { '5' => 0, '10' => 0, '50' => 0, '100' => 0 }
    commands = init_commands

    puts 'Введите количество купюр в банкомате (достоинством 5, 10, 50 и 100 рублей) (например "1 2 3 4"):'
    atm_items = gets.split
    atm_balance['5'] = atm_items[0].to_i
    atm_balance['10'] = atm_items[1].to_i
    atm_balance['50'] = atm_items[2].to_i
    atm_balance['100'] = atm_items[3].to_i

    puts 'Введите баланс пользователя:'
    account = gets.to_i

    loop do
        puts 'Введите команду:'
        cmd_id = gets.to_i
        success = 1
        for cmd in commands
            success *= cmd.process(cmd_id, account, atm_balance)
        end

        if success != 1
            puts "Вы ввели не ту команду."
        end
    end
end

def init_commands
    commands = []
    commands.push(BalanceCmd.new(1))
    commands.push(AddCmd.new(2))
    commands.push(WithdrawCmd.new(3))
    commands
end


main