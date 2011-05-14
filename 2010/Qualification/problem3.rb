class Array
    def sum(s=0,e=self.length-1)
        self[s..e].inject(0) {|sm,i| sm+i}
    end
end

def ride(r,k,groups)
    rides = 0
    period = []

    lookup = {}
    queue = groups.dup
    i = 0
    while (lookup[queue].nil? || i > r)
        next_queue = []
        i += 1
        key = queue.dup
        cr = 0
        while ((queue.length > 0) && ((cr + queue[0]) <= k))
            cr += queue[0]
            next_queue << queue.shift
        end
        queue.concat next_queue
        lookup[key] = {:num=>cr,:next=>queue.dup,:pos=>i}
        period << cr
    end

    lead_in = i > r ? r : lookup[queue][:pos]-1

    if (r <= period.length)
        # no periods
        rides = period[0..(r-1)].sum
    else
        if (lead_in == 0)
            full_periods = r / period.length
            rems_periods = r % period.length

            rides =  full_periods * period.sum(0,period.length)
            rides += rems_periods * period.sum(0,rems_periods)
        else
            full_periods = r / (period.length - lead_in)
            rems_periods = r % (period.length - lead_in)

            rides =  full_periods * period.sum(lead_in+1)
            rides += rems_periods * period.sum(lead_in+1,lead_in+1+rems_periods)
            rides += period.sum(0,lead_in)
        end
    end
    rides
end

File.open('C-large.in','r') {|f|
    cn = f.gets.to_i

    1.upto(cn) {|i|
        r,k,n = f.gets.split(' ').map {|lmnt| lmnt.to_i}
        groups = f.gets.split(' ').map {|lmnt| lmnt.to_i}

        print "Case ##{i}: #{ride(r,k,groups)}\n"
    }
}