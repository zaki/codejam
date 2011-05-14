

File.open('B-small-attempt4.in', 'r') {|f|
  numcases = f.gets.to_i

  for i in 0..numcases-1
    startA = Array.new
    enterA = Array.new
    startB = Array.new
    enterB = Array.new
    turnaround = f.gets.to_i * 60
    l = f.gets
    l =~ /([0-9]+) ([0-9]+)/
      na = $1.to_i
    nb = $2.to_i
    for a in 0..na-1
      l = f.gets
      l =~ /([0-9]+):([0-9]+) ([0-9]+):([0-9]+)/
      tah = $1.to_i
      tam = $2.to_i
      tbh = $3.to_i
      tbm = $4.to_i

      startA << Time.gm(2008, 01, 01, tah, tam);
      enterB << Time.gm(2008, 01, 01, tbh, tbm);
    end
    for b in 0..nb-1
      l = f.gets
      l =~ /([0-9]+):([0-9]+) ([0-9]+):([0-9]+)/
        tbh = $1.to_i
      tbm = $2.to_i
      tah = $3.to_i
      tam = $4.to_i

      startB << Time.gm(2008, 01, 01, tbh, tbm);
      enterA << Time.gm(2008, 01, 01, tah, tam);
    end

    poolA = 0
    poolB = 0

    startAtA = 0
    startAtB = 0

    at_a = Array.new
    at_b = Array.new

    startA.sort!
    enterA.sort!
    startB.sort!
    enterB.sort!

    events = Hash.new
    hasA = startA.length > 0
    hasB = startB.length > 0

    while ((startA.length > 0 && hasA) || (startB.length > 0 && hasB))

      sa = startA[0].nil? ? Time.gm(2009, 01, 01, 00, 00, 00) : startA[0]
      sb = startB[0].nil? ? Time.gm(2009, 01, 01, 00, 00, 00) : startB[0]
      ea = enterA[0].nil? ? Time.gm(2009, 01, 01, 00, 00, 00) : enterA[0]
      eb = enterB[0].nil? ? Time.gm(2009, 01, 01, 00, 00, 00) : enterB[0]

      if (ea <= [sa, sb, eb].min)
        at_a << ea
        poolA += 1
        enterA.shift
      elsif (eb <= [sa, sb, ea].min)
        at_b << eb
        poolB += 1
        enterB.shift
      elsif (sa <= [sb, ea, eb].min)

        if (poolA > 0 && at_a.length > 0 && at_a[0] + turnaround <= sa)
          poolA -= 1
          at_a.shift
        else
          startAtA = startAtA + 1
        end
        startA.shift
      elsif (sb <= [sa, ea, eb].min)
        if (poolB > 0 && at_b.length > 0 && at_b[0] + turnaround <= sb)
          poolB -= 1
          at_b.shift
        else
          startAtB += 1
        end
        startB.shift
      end

    end

    print "Case ##{i+1}: #{startAtA} #{startAtB}\n"
  end
}
