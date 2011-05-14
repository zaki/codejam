File.open('C-test.in','r') {|f|
    cn = f.gets.to_i
    1.upto(cn) {|i|

        a1,a2,b1,b2 = f.gets.split(' ').map {|x| x.to_i}

        am = [a1,a2].min
        bm = [b1,b2].min
        aM = [a1,a2].max
        bM = [b1,b2].max

        a2m, a2M, b2m, b2M = [am, aM, bm, bM].map {|x| x*2+1}

        res = 0
        if (a2M < bm || a2m > bM)
            # no match
        else
            res += ([a2m,bm].max) - ([a2m,bM].min)
        end

        if (b2M < am || b2m > aM)
            # no match
        else
            print ([b2m,aM].min)
            print "-"
            print ([b2m,am].max)
            print "\n"
            res += ([b2m,aM].min) - ([b2m,am].max)
        end

        print "Case ##{i}: #{res}\n"
    }
}