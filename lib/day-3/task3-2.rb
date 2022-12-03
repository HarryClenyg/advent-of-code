def team_badges
  rucksacks = []
  data = File.foreach("./aoc-data-3.txt") do |line| 
    rucksacks.push(line.to_str.chop)
  end
  
  badge_value = 0

  i = 0
  while i < rucksacks.size
    matches = rucksacks[i].split('') & rucksacks[i + 1].split('') & rucksacks[i + 2].split('')

    j = 0
    while j < matches.size
      if matches[j] == matches[j].upcase
        badge_value += matches[j].ord.to_i - 38
      else
        badge_value += matches[j].ord.to_i - 96
      end
      j += 1
    end
  i += 3
  end
  p badge_value
end

