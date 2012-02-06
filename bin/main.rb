# Write a complete program that will correctly decode a set of characters into a valid message. 
# Your program should read a given file of a simple coded set of characters and print the exact 
# message that the characters contain. The code key for this simple coding is a one for one 
# character substitution based upon a single arithmetic manipulation of the printable portion 
# of the ASCII character set.
#
# Your program should accept all sets of characters that use the same encoding scheme and should 
# print the actual message of each set of characters.
#
####################################################################################################
#
#     Usage: ruby decipher.rb file1.txt file2.txt ...
#            cat file1.txt | ruby decipher.rb
#
####################################################################################################

require '../lib/decipher.rb'

d = Decipher.new

# Read from files if some are defined and exists
if(ARGV.size > 0)
  ARGV.each do |f|
    d.readfile(f)
  end
else # Otherwise read from standard input
  $stdin.each_line do |a|
    puts d.decipher(a)
  end
end
