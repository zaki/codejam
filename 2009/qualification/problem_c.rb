$arr = ['w','e','l','c','o','m','e',' ','t','o',' ','c','o','d','e',' ','j','a','m']
$no = 0

def solve(s)
  while ($parsol.length > 0)
    ps = $parsol.pop
    stage = ps[0]
    start = ps[1]

    # find next letter for stage+1
    if (stage == $arr.length-1)
      # found a word
      $no += 1
    else
      nxtidx = s.index($arr[stage+1], start+1)
      unless (nxtidx.nil?)
        $parsol << [stage+1,nxtidx]
      end
    end

    # find next letter for stage
    nxtidx = s.index($arr[stage], start+1)
    unless (nxtidx.nil?)
      $parsol << [stage,nxtidx]
    end
  end

end

File.open('C-small-attempt0.in') {|f|
  n = f.gets.to_i

  1.upto(n) {|i|
    cse = f.gets
    $no = 0

    $parsol = []

    if (cse.index('w').nil?)

    else
      $parsol << [0,cse.index('w')]
    end

    solve(cse)

    print "Case ##{i}: #{format('%04d', $no).to_s[-4..-1]}\n"
  }
}
