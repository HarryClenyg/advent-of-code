def rucksack_sort
  rucksacks = []
  data = File.foreach("./aoc-data-3.txt") do |line| 
    rucksacks.push(line.to_str)
  end
  
  priority_value = 0

  i = 0
  while i < rucksacks.size
    rucksack = rucksacks[i]
    divide = ((rucksack.length) / 2)
    compartments = rucksack.chars.each_slice(divide).map(&:join)
    matches = compartments[0].split('') & compartments[1].split('')

    j = 0
    while j < matches.size
      if matches[j] == matches[j].upcase
        priority_value += matches[j].ord.to_i - 38
      else
        priority_value += matches[j].ord.to_i - 96
      end
      j += 1
    end
  i += 1
  end
  p priority_value
end

