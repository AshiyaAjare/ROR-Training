def check_ip(ip)
  octet1, octet2, octet3, octet4 = ip.split('.')

  octet1 = octet1.to_i
  octet2 = octet2.to_i
  octet3 = octet3.to_i
  octet4 = octet4.to_i
  
  if [octet1, octet2, octet3, octet4].any? {|octet| octet<0 || octet>255}
    return "invalid IP"
  end

  case octet1
  when 1..127
    return "class A"
  when 128..191
    return "class B"
  when 192..233
    return "class C"
  when 224..239
    return "class D"
  when 240..255
    return "class E"
  else
    return "invalid IP"
  end
end


puts "Enter IP address: "
ip=gets.chomp

puts "Class of the IP address: #{check_ip(ip)}"
