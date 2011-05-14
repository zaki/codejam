File.open('A-large.in','r') {|f|
    cn = f.gets.to_i
    1.upto(cn) {|cnn|

        n = f.gets.to_i
        pairs = []
        1.upto(n) {||
            a1,b1 = f.gets.split(' ').map {|x| x.to_i}
            pairs << {:a=>a1,:b=>b1}
        }

        conn = 0
        pairs.each {|p1|
            pairs.each {|p2|
                conn += 1 if (p1[:a] < p2[:a] && p1[:b] > p2[:b]) ||  (p1[:a] > p2[:a] && p1[:b] < p2[:b])
            }
        }

        conn /= 2
        print "Case ##{cnn}: #{conn}\n"
    }
}