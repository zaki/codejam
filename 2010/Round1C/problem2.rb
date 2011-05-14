File.open('B-large.in','r') {|f|
    cn = f.gets.to_i
    1.upto(cn) {|i|

        l,p,c = f.gets.split(' ').map {|x| x.to_f}

        measures = (Math.log((p-1)/l)/Math.log(c)).floor
        if (measures != 0)
            measures = (Math.log(measures)/Math.log(2)).floor + 1
        end
        print "Case ##{i}: #{measures}\n"
    }
}