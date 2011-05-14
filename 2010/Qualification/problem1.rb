# Problem 1

def solve(n,k)
    return 'OFF' if k % 2 == 0 || k < 2**(n-1)
    snappers = []
    0.upto(n-1) {|i| snappers[i] = false}
    0.upto(n-1) {|i| snappers[i] = (((k/(2**i)%2)) == 1) }
    0.upto(n-1) {|i| return 'OFF' unless snappers[i] }
    return 'ON'
end

File.open('A-large.in','r') {|f|
    cn = f.gets.to_i

    1.upto(cn) {|i|
        line = f.gets
        n,k = line.split(' ')
        print "Case ##{i}: #{solve(n.to_i,k.to_i)}\n"
    }
}