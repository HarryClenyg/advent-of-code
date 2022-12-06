def tuning_trouble
  subroutine = []

  data = File.foreach("./aoc-data-day6.txt") do |line| 
    subroutine.push(line)
  end

  sub_arr = subroutine[0].chars

  i = 3
  while i < sub_arr.size
    unless sub_arr.slice(i - 3, 4).uniq!
      p sub_arr[i]
      break
    end
    i += 1
  end
  p i + 1
end
