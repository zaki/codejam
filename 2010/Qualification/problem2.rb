require 'mathn'

def solve(nums)
    diffs = []
    0.upto(nums.length-1) {|i1| (i1+1).upto(nums.length-1) {|i2| diffs << (nums[i2]-nums[i1])}}
    t = diffs.uniq.inject(0) {|g,i| g.gcd i}
    rems = nums.map {|i| t - (i % t)}.uniq
    if t == 1
        d = 0
    elsif rems.length == 1
        d = rems[0] == t ? 0 : rems[0]
    else
        raise "Error"
    end
    #nums.each {|n| p "INCORRECT #{n}+#{d} = #{n+d} % #{d} = #{(n+d)%t}" if (n+d)%t!=0}
    d
end

File.open('B-large.in','r') {|f|
    cn = f.gets.to_i
    1.upto(cn) {|i|
        nums = f.gets.split
        nums.shift
        nums.map! {|lmnt| lmnt.to_i}

        print "Case ##{i}: #{solve(nums.uniq.sort)}\n"
    }
}