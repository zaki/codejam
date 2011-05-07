def solve(candy)
  candy.inject(&:^) == 0 ? candy.sort[1..-1].inject(&:+) : 'NO'
end


File.open('C-large.in') do |f|
  t = f.gets.to_i
  1.upto(t) do |i|

    f.gets
    candy = f.gets.split(' ').map {|x| x.to_i}

    print "Case ##{i}: #{solve(candy)}\n"

  end

end
