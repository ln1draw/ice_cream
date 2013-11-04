def enter_flavors
  puts "Who are you adding to the list?"
  input = gets.chomp
  if input == 'done'
    return input
  end
  name = input
  puts 'Enter their favorite flavors, separated by a space: '
  flavor = gets.chomp.split
  return name, flavor
end

def make_flavor_hash
  flavor_hash = {}
  name = ''
  while name != 'done'
    name, flavor = enter_flavors
    flavor_hash[name] = flavor
  end
  flavor_hash.delete('done')
  return flavor_hash
end

def which_report
  puts 'Which report would you like: by (g)uest or by (f)lavor: '
  report = gets.chomp.downcase
  if report == 'g'
    guest_by_flavor
  elsif report == 'f'
    flavor_by_guest
  end
end

def guest_by_flavor
  @flavor_hash.each { |key, value| puts "#{key} prefers #{value.join(", ")}"}
end

def flavor_by_guest
  guest_hash = {}
  flavor_array = []

  @flavor_hash.each do |name, flavor|
    flavor.each do |each_flavor|
      if flavor_array.include?(each_flavor)
        guest_hash[each_flavor].push(name)
      else
        guest_hash[each_flavor] = [name]
        flavor_array.push(each_flavor)
      end 
    end
  end
  guest_hash.keys.sort.each { |key| puts "#{key} is preferred by #{guest_hash[key].join(", ")}"}
end


@flavor_hash = make_flavor_hash
which_report