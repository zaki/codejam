def solve(teams)
  wins = []
  loss = []
  wp = []
  owp = []
  oowp = []

  teams.each do |team|
    wins << team.delete('.0').length.to_f
    loss << team.delete('.1').length.to_f
  end

  owps = []
  0.upto(teams.length - 1) do |i|
    wp[i] = wins[i] / (wins[i] + loss[i])
    # calculate owp for each team
    owps[i], owp_cnt = 0.0, 0
    0.upto(teams.length-1) do |j|
      next if i == j
      owps[i] += case teams[i][j]
                   when '0'
                     (wins[j] - 1.0) / (wins[j] + loss[j] - 1.0)
                   when '1'
                     (wins[j]) / (wins[j] + loss[j] - 1.0)
                   else
                     0.0
                     #(wins[j]) / (wins[j] + loss[j])
                   end
      owp_cnt += 1 unless teams[i][j] == '.'
    end
    owp[i] = owps[i] / owp_cnt
  end

  0.upto(teams.length - 1) do |i|
    _oowp = []
    0.upto(teams.length - 1) do |j|
      unless teams[i][j] == '.' || i == j
        _oowp << owp[j]
      end
    end
    oowp[i] = _oowp.inject(&:+) / _oowp.length.to_f
  end

  0.upto(teams.length - 1) do |i|
    #print "0.25 * #{wp[i]} + 0.5 * #{owp[i]} + 0.25 * #{oowp[i]}\n"
    print 0.25 * wp[i] + 0.5 * owp[i] + 0.25 * oowp[i]
    print "\n"
  end
end


File.open('A-large.in') do |f|
  t  = f.gets.to_i
  1.upto(t) do |i|

    n = f.gets.to_i

    teams = []
    1.upto(n) do |j|
      teams << f.gets.strip
    end

    print "Case ##{i}:\n"
    solve(teams)
  end
end
