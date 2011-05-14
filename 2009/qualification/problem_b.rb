# x ->
# y v
$nxb = 'a'

def solve(x, y)
  # N W E S
  # p x,y
  return($basin[x][y]) if $basin[x][y] != '-'

  #p $basin

  height = $map[x][y].to_i

  n = w = s = e = 99999
  # p $we,$he,x+1,y
  n = $map[x-1][y].to_i if (x > 0)
  w = $map[x][y-1].to_i if (y > 0)
  e = $map[x][y+1].to_i if (y < $we-1)
  s = $map[x+1][y].to_i if (x < $he-1)

  m = [n, w, e, s].min

  if m == 99999 || m >= height
    # no flow from here, trap and backpropagate
    $basin[x][y] = $nxb
    $nxb = $nxb.next
  elsif (m == n)
    $basin[x][y] = solve(x-1,y)
  elsif (m == w)
    $basin[x][y] = solve(x,y-1)
  elsif (m == e)
    $basin[x][y] = solve(x,y+1)
  elsif (m == s)
    $basin[x][y] = solve(x+1,y)
  end

  return($basin[x][y])
end

def pretty()
  $basin.each {|r| print "#{r.join(' ')}\n"}
end

File.open('B-small-attempt0.in') {|f|
  maps = f.gets.to_i
  1.upto(maps) {|mm|
    h,w = f.gets.split(' ')
    $he = h.to_i
    $we = w.to_i
    $map = []
    $basin = []
    $nxb = 'a'
    0.upto($he-1) {|i|
      $map[i] = f.gets.split(' ')
      $basin[i] = ['-']*$we
    }
    0.upto($he-1) {|x|
      0.upto($we-1) {|y|
        solve(x, y)
      }
    }
    print "Case ##{mm}:\n"
    pretty
  }
}
