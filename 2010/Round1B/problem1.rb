def solve(m, fs)
    tfs = fs.dup
    i = 0
    m.each {|mp|
        if (tfs.nil? || !tfs.keys.include?(mp.strip) && i < m.length)
            # have to create all the rest
            return (m.length - i)
        else
            tfs = tfs[mp.strip]
            i += 1
        end
    }
    return 0
end

def build_tree(path)
    return {path.first.strip=>nil} if (path.length == 1)
    return {path.first.strip=>build_tree(path[1..-1])}
end

File.open('A-small-attempt0.in','r') {|f|
    cn = f.gets.to_i
    1.upto(cn) {|cnn|

       n,m = f.gets.split(' ').map {|x| x.to_i}

       paths = []
       unless (n == 0)
           1.upto(n) {|i|
               paths << f.gets
           }
           paths.sort
       end
       fs = {}
       paths.each {|path|
           pp = path.split('/')
           pp.shift
           fs.merge!(build_tree(pp))
       }

       mkdirs = []
       1.upto(m) {|i|
            mkdirs << f.gets
       }
       mkdirs.sort

       ret = 0
       mkdirs.each {|m|
           mm = m.split('/')
           mm.shift
           ret += solve(mm, fs)
           fs.merge!(build_tree(mm))
       }

       print "Case ##{cnn}: #{ret}\n"
    }
}