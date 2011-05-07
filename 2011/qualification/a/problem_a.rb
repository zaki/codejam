def solve(moves, robots)
  cost = 0

  pos = {'O'=>1, 'B'=>1}
  i = 0
  while moves.length > 0
    move = moves.shift

    robot, switch = move[0], move[1]
    robots[robot].shift # The one we are doing right now

    # Current robot moves
    robot_move = (switch - pos[robot]).abs
    pos[robot] = switch

    # Other robot might move
    other_robot = robot == 'O' ? 'B' : 'O'

    if robots[other_robot].length > 0
      next_move = robots[other_robot].first
      if next_move >= pos[other_robot]
        if (next_move - pos[other_robot]) <= robot_move + 1 # with push included
          pos[other_robot] = next_move
        else
          pos[other_robot] += robot_move + 1
        end
      else
        if (pos[other_robot] - next_move) <= robot_move + 1
          pos[other_robot] = next_move
        else
          pos[other_robot] -= (robot_move + 1)
        end
      end
    end
    cost += robot_move + 1
  end
  cost
end


File.open('A-large.in') do |f|

  t = f.gets.to_i
  1.upto(t) do |i|

    lmnts = f.gets.split(' ')
    n = lmnts[0].to_i

    moves = []
    robots = {'B'=>[], 'O'=>[]}
    lmnts[1..-1].each_slice(2) do |robot, move|
      moves << [robot, move.to_i]
      robots[robot] << move.to_i
    end

    print "Case ##{i}: #{solve(moves, robots)}\n"
  end
end
