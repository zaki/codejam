def runcase(engines, queries)
  return 0 if (engines.uniq.length > (queries.uniq.count {|x| engines.include?(x)}))

  changes = 0
  engine = ''
  l = Hash.new
  engines.select {|x| x != queries[0]}.each {|e| l[e] = queries.index(e); l[e] = 9999999 if l[e].nil?}
  engine = (l.sort{|a,b| b[1] <=> a[1]})[0][0]

  while queries.length > 0
    l = Hash.new
    s = queries.shift
    if (s == engine)
      changes += 1
      l = Hash.new
      (engines.select {|x| x != s}).each {|e| l[e] = queries.index(e); l[e] = 9999999 if l[e].nil?; l[s] = 0}
      engine = (l.sort{|a,b| b[1] <=> a[1]})[0][0]
    end

  end
  return(changes)
end

engines = Array.new
queries = Array.new

File.open('A-small-attempt5.in', 'r') {|f|
  numcases = f.gets.to_i-1
  for i in 0..numcases
    numengines = f.gets.to_i-1
    engines = Array.new
    for j in 0..numengines
      engines << f.gets
    end
    queries = Array.new
    numqueries = f.gets.to_i-1
    for j in 0..numqueries
      queries << f.gets
    end
    print "Case ##{i+1}: #{runcase(engines, queries)}\n"
  end
}
