def solve(pic, row, col)
  0.upto(row-2) do |r|
    0.upto(col-2) do |c|
      # find red tile
      if (pic[r][c] == '#' &&
          pic[r+1][c] == '#' &&
          pic[r+1][c+1] == '#' &&
          pic[r][c+1] == '#')
        pic[r][c] = '/'
        pic[r][c+1] = '\\'
        pic[r+1][c] = '\\'
        pic[r+1][c+1] = '/'
      end
    end
  end

  0.upto(row-1) do |r|
    0.upto(col-1) do |c|
      if (pic[r][c] == '#')
        return "Impossible\n"
      end
    end
  end

  ret = ''
  pic.each {|row|
    ret << row.join('')
    ret << "\n"
  }
  ret
end

File.open('A-large.in') do |f|
  t = f.gets.to_i

  1.upto(t) do |i|

    r,c = f.gets.split(' ').map(&:to_i)

    pic = []

    0.upto(r-1) do |row|
      pic[row] = f.gets.strip.split('')
    end

    print "Case ##{i}:\n#{solve(pic, r, c)}"
  end
end
