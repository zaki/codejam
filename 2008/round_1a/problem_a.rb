def vp(v1, v2)
  res = 0
  for i in 0..(v1.length-1)
    res += v1[i].to_i * v2[i].to_i
  end
  return(res)
end

File.open('A-small-attempt1.in', 'r') {|f|
  numcases = f.gets.to_i-1
  for i in 0..numcases
    v1 = []
    v2 = []
    line1 = ''
    line2 = ''
    n = f.gets.to_i-1
    line1 = f.gets
    line2 = f.gets
    v1 = line1.split(' ')
    v2 = line2.split(' ')
    min = 99999999

    mv10 = v1.sort {|x,y| (x.to_i) <=> (y.to_i)}
    mv20 = v2.sort {|x,y| (x.to_i*-1) <=> (y.to_i*-1)}

    min = vp(mv10, mv20)
    print "Case ##{i+1}: #{min}\n"
  end
}
