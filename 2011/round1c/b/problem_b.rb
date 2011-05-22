def solve(l,t,n,cs)
  time = 0
  ls_rem = l

  if (ls_rem == 0)
    return cs.inject(&:+)*2
  end

  while (time < t && cs.length > 0)
    d = cs.shift
    if ((time + d*2) > t)
      # decide if we should use it in flight
      dd = (d - (t - time) / 2.0) # boostable distance
      ud = (d - dd) # unboostable distance
      cost = dd + ud*2
      if (ls_rem > 0 &&
            (
              ls_rem >= cs.length || # there are enough Ls left for everything
              cs.sort.reverse[ls_rem-1] < dd # the one after ls_rem is smaller than what we gain
            )
          )
        ls_rem -= 1
        time += (t - time) # the remaining time till L is built
        time += dd  # the boosted time
      else
        # use it later
        time += d*2
      end
    else
      # cannot built yet
      time += d*2
    end
  end

  # the rest can now use Ls
  if (cs.length > 0) # no more left anyway
    if (ls_rem > 0) # some boosters left
      if (ls_rem >= cs.length) # can use in all of them
        time += (cs.inject(&:+))
      else
        boost = ls_rem
        rem = cs.sort.reverse

        time += rem[0..boost-1].inject(&:+)
        time += rem[boost..-1].inject(&:+)*2
      end
    else # no boosters
      time += ((cs.inject(&:+))*2)
    end
  end
  time.to_i
end

File.open('B-large.in') do |f|
  t = f.gets.to_i

  1.upto(t) do |i|

    line = f.gets.strip.split(' ').map(&:to_i)
    l,_t,n,c = line[0..3]

    cs = line[4..-1]
    cs = cs*(n.to_f / cs.length.to_f+1)

    cs = cs[0..n-1]

    print "Case ##{i}: #{solve(l,_t,n,cs)}\n"
  end
end
