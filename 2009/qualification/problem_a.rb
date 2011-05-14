$dic = []

def solve(s)
  r = Regexp.compile("^"+s.gsub(/\(/, '[').gsub(/\)/, ']')+"$")
  _n = 0
  $dic.each {|w| _n += 1 if r.match(w)}
  return _n
end

File.open('A-small-attempt0.in') {|f|
  ns = f.gets.split(' ')
  l = ns[0].to_i; d = ns[1].to_i; n = ns[2].to_i

  1.upto(d) {
    $dic << f.gets
  }

  1.upto(n) {|i|
    cse = f.gets

    print "Case ##{i}: #{solve(cse)}\n"
  }
}
