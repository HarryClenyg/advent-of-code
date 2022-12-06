def tuning_trouble
  subroutine = []

  data = File.foreach("./aoc-data-day6.txt") do |line| 
    subroutine.push(line)
  end

  sub_arr = subroutine[0].chars

  i = 13
  while i < sub_arr.size
    unless sub_arr.slice(i - 13, 14).uniq!
      p sub_arr[i]
      break
    end
    i += 1
  end
  p i + 1
end
