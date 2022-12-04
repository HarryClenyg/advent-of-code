def camp_cleanup
  elf_pairs = []
  data = File.foreach("./aoc-data-4.txt") do |line| 
    elf_pairs.push(line.to_s)
  end

  i = 0
  matches = 0

  while i < elf_pairs.size
    elf_1 = elf_pairs[i].split(",")[0]
    elf_2 = elf_pairs[i].split(",")[1]

    elf_1_range = Range.new(*elf_1.split("-").map(&:to_i))
    elf_2_range = Range.new(*elf_2.split("-").map(&:to_i))
    
    if (elf_1_range === elf_2_range.first || elf_1_range === elf_2_range.last) || (
      elf_2_range === elf_1_range.first || elf_2_range === elf_1_range.last)
      matches += 1
    end
    i += 1
  end
  matches
end

