def calorie_counter
  total_calories = []
  calories = []
  data = File.foreach("../resources/aoc-data-1-1.txt") do |line| 
    calories.push(line.to_i)
  end

  i = 0
  calories_carried = 0

  while i < (calories.size)
    if calories[i] == 0
      total_calories.push(calories_carried)
      calories_carried = 0
    else
      calories_carried += calories[i]
    end
    i += 1
  end
  total_calories.push(calories_carried)

  # part1
  puts total_calories.max
  # part2
  puts total_calories.max(3).sum
end

