def enter_flavors
  puts "What's your name: "
  name = gets.chomp
  puts 'Enter your favorite flavor: '
  flavor = gets.chomp
  return name, flavor
end

def make_flavor_hash
  flavor_hash = {}
  name = ''
  while name != 'done'
    name, flavor = enter_flavors
    flavor_hash[name] = flavor
  end
  return flavor_hash
end

def which_report
  puts 'Which report would you like: by (g)uest or by (f)lavor: '
  report = gets.chomp
  if report == 'g'
    guest_by_flavor
  elsif report == 'f'
    flavor_by_guest
  end
end

def guest_by_flavor
  @flavor_hash.each { |key, value| puts "#{key} prefers #{value}"}
end

def flavor_by_guest
  guest_hash = {}
  flavor_array = []

  @flavor_hash.each do |name, flavor|

    if flavor_array.include?(flavor)
      guest_hash[flavor].push(name)
    else
      guest_hash[flavor] = [name]
      flavor_array.push(flavor)
    end
  end
  
  guest_hash.each { |key, value| puts "#{key} is preferred by #{value.join(", ")}"}
end


@flavor_hash = make_flavor_hash
which_report