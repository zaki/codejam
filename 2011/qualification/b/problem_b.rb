def solve(syntax, oppositions, str)
  output = str[0].chr
  i = 1
  while i < str.length
    invoke = str[i].chr

    # Combinations
    if output.length > 0 && syntax[output[-1].chr+invoke]
      output[-1] = syntax[output[-1].chr+invoke]

    # Oppitions
    elsif output =~ oppositions[invoke]
      output = ''

    else
      output << invoke
    end

    i += 1
  end
  output.split('')
end

File.open('problem.b.test.txt') do |f|

  t = f.gets().to_i
  1.upto(t) do |i|

    lmnts = f.gets.split(' ')

    # Syntax
    c = lmnts[0].to_i
    combinations = lmnts[1..c]

    syntax = {}
    combinations.each do |com|
      syntax[com[0..1]] = com[2].chr
      syntax[com[0..1].reverse] = com[2].chr
    end

    # Oppositions
    d = lmnts[c+1].to_i
    oppositions = {}

    opps = lmnts[c+2..c+d+1]
    opps.each do |opp|
      if (oppositions[opp[0].chr].nil?)
        oppositions[opp[0].chr] ||= opp[1].chr
      else
        oppositions[opp[0].chr] += "|#{opp[1].chr}"
      end
      if (oppositions[opp[1].chr].nil?)
        oppositions[opp[1].chr] ||= opp[0].chr
      else
        oppositions[opp[1].chr] += "|#{opp[0].chr}"
      end
    end
    oppositions.each_key do |key|
      oppositions[key] = Regexp.new(oppositions[key])
    end

    # String
    n = lmnts[c+d+2].to_i
    str = lmnts[c+d+3]

    print "Case ##{i}: ["
    solution = solve(syntax, oppositions, str)
    print solution.join(', ')
    print "]\n"
  end
end

