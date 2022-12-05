def supply_stacks
  stack_data = []
  move_data = []
  no_of_crates = []
  from_stack = []
  to_stack = []
  no_of_moves = 0
  final_output = []
  
  # manually update following value to reflect number of stacks
  no_of_stacks = 9

  data = File.foreach("./aoc-data-day5.txt") do |line| 
    if line.include? "move"
      move_data.push(line)      
    elsif line.include? "["
      stack_data.push(line.chop)
    end
  end

  stacks = get_stacks(stack_data, no_of_stacks)
  moves = get_moves(move_data)

  moves.each do |move|
    no_of_crates << move[0].to_i
    from_stack << move[1].to_i
    to_stack << move[2].to_i
    no_of_moves += 1
  end

  k = 0
  while k < no_of_moves
    crates_to_move = stacks[from_stack[k] - 1].slice!(0, no_of_crates[k])
    crates_to_move.reverse!.each do |crate|
      stacks[to_stack[k]- 1].insert(0, crate)
    end
    k += 1
  end

  stacks.each do |stack|
    final_output << stack[0]
  end

  final_output.join
end

def get_stacks(stack_data, no_of_stacks)
  rows = []
  i = 0
  while i < stack_data.size
    j = 0
    while j < stack_data[i].chars.size
      crate = stack_data[i].chars.slice(j, 3)
      rows.push(crate.join)
      j += 4
    end
    i += 1
  end
  columns = rows.each_slice(no_of_stacks).to_a.transpose
  columns.each { |column| column.delete("   ") }
end

def get_moves(move_data)
  moves = []
  i = 0
  while i < move_data.size
    arr = move_data[i].split(' ')
    arr.each do |word|
    if word.match(/\d{1,2}/)
      moves.push(word)
    end
  end
    i += 1
  end
  moves.each_slice(3).to_a
end
