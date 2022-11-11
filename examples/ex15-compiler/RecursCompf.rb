#encoding: utf-8

class RecursComp
  Parentheses = ['(', '[', '{']
  HighPriorityOperators = ['*', '/', '%']

  def compile(str)
    @str,@index = preprocess(str),0
    compileF
  end
  
  private

  def preprocess(s)
    s = s.gsub(' ', '')
    res = ''

    in_comment = false
    i = 0
    while i <= s.length - 1
      if s[i] == '/' && s[i + 1] == '/' && !in_comment
        break
      end
      if s[i] == '/' && s[i + 1] == '*' && !in_comment
        in_comment = true
        i += 2
        next
      end
      if s[i] == '*' && s[i + 1] == '/' && in_comment
        in_comment = false
        i += 2
        next
      end
      if !in_comment
        res += s[i]
      end
      i += 1
    end

    return res
  end

  def compileF
    cur = @str[@index].chr
    compileT
    return if @index >= @str.length
    cur = @str[@index].chr
    if cur == '+' or cur == '-'
      @index += 1
      compileF
      print "#{cur} "
    end
  end
  def compileT
    compileM
    return if @index >= @str.length
    cur = @str[@index].chr
    if HighPriorityOperators.include?(@str[@index].chr)
      @index += 1
      compileT
      print "#{cur} "
    end
  end
  def compileM
    if Parentheses.include?(@str[@index].chr)
      @index += 1
      compileF
      @index += 1
    else
      compileV
    end
  end
  def compileV
    cur = @str[@index].chr
    print "#{cur} "
    @index += 1
  end
end

c = RecursComp.new
while true
  print "Введите формулу: "
  c.compile(readline.chomp)
  print "\n"
end

