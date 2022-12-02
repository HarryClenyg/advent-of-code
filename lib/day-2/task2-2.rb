def rps
  turns = []
  data = File.foreach("../resources/aoc-data-2-1.txt") do |line| 
    turns.push(line.to_str)
  end

  i = 0
  score = 0

  while i < turns.size

    elf_move = turns[i].split(" ")[0]
    required_outcome = turns[i].split(" ")[1]

    if elf_move == "B" && required_outcome == "X"; score += 1
    elsif elf_move == "C" && required_outcome == "Y"; score += 6
    elsif elf_move == "A" && required_outcome == "Z"; score += 8
    elsif elf_move == "A" && required_outcome == "X"; score += 3
    elsif elf_move == "B" && required_outcome == "Y"; score += 5
    elsif elf_move == "C" && required_outcome == "Z"; score += 7
    elsif elf_move == "C" && required_outcome == "X"; score += 2
    elsif elf_move == "A" && required_outcome == "Y"; score += 4
    elsif elf_move == "B" && required_outcome == "Z"; score += 9
    end
    i += 1
  end
  puts score
end

