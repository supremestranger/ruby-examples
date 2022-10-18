def get_matrix(n)
    puts "Введите элементы #{n} матрицы (элементы строк отделять через запятую, строки отделять через знак |"
    puts "Например: 1,2,3|4,5,6|7,8,9"
    matrix = []
    
    input = gets.split("|")
    input.each do |element|
        row = element.split(",").map { |n| n.to_i}
        matrix.push(row)
    end
    return matrix
end

def main()
    matrix_a = get_matrix("первой")
    matrix_b = get_matrix("второй")
    result = []

    if matrix_a[0].length != matrix_b.length 
        puts "Такие матрицы перемножать нельзя!"
        return
    end

    for i in 0..matrix_a.length-1
        add = []
        for j in 0..matrix_b[0].length-1
            n = 0
            for k in 0..matrix_a[0].length-1
                n += matrix_a[i][k] * matrix_b[k][j]
            end
            add.append(n)
        end

        result.append(add)
    end

    print result
end

main