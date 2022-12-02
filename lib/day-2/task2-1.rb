def rps
  turns = []
  data = File.foreach("../resources/aoc-data-2-1.txt") do |line| 
    turns.push(line.to_str)
  end

  i = 0
  score = 0

  while i < turns.size

    elf_move = turns[i].split(" ")[0]
    your_move = turns[i].split(" ")[1]

    if elf_move == "B" && your_move == "X"; score += 1
    elsif elf_move == "C" && your_move == "Y"; score += 2
    elsif elf_move == "A" && your_move == "Z"; score += 3
    elsif elf_move == "A" && your_move == "X"; score += 4
    elsif elf_move == "B" && your_move == "Y"; score += 5
    elsif elf_move == "C" && your_move == "Z"; score += 6
    elsif elf_move == "C" && your_move == "X"; score += 7
    elsif elf_move == "A" && your_move == "Y"; score += 8
    elsif elf_move == "B" && your_move == "Z"; score += 9
    end
    i += 1
  end
  puts score
end

