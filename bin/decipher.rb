# Write a complete program that will correctly decode a set of characters into a valid message. 
# Your program should read a given file of a simple coded set of characters and print the exact 
# message that the characters contain. The code key for this simple coding is a one for one 
# character substitution based upon a single arithmetic manipulation of the printable portion 
# of the ASCII character set.
####################################################################################################
#
#     Usage: ruby decipher.rb file1.txt file2.txt ...
#            cat file1.txt | ruby decipher.rb
#
####################################################################################################


class Decipher
  # Minimal printable ascii value 
  MIN_CHAR_VAL=32
  # Maximal printable ascii value
  MAX_CHAR_VAL=126

  # Decrypt given variable
  def decipher(text)
    unless text.respond_to?(:to_s)
      fail TypeError.new("'text' needs 'to_s' capability")
    end
    result = ""
    text.to_s.each_char  do |c|
      result << transform(c, -7)
    end
    result
  end

  # Encrypt given variable
  def cipher(text)
    unless text.respond_to?(:to_s)
      fail TypeError.new("'text' needs 'to_s' capability")
    end

    result = ""

    text.to_s.each_char  do |c|
      result << transform(c, +7)
    end
    result
  end

  # Decipher given filename or print an error
  def readfile(file)
    if(File.readable?(file) && !File.directory?(file))
      File.open(file, 'r') do |f|
        while(line = f.gets) do
          puts decipher(line.chomp)
        end
      end
    else
      $stderr.print("ERROR: File #{file.to_s} does not exist or is not readable.")
    end
  end

private
  # Shift given printable character (add or subtract value in ascii table)
  # Does not modify unprintable chars
  def transform(char, shift)
    unless char.respond_to?(:ord)
      fail TypeError.new("'char' needs 'ord' capability")
    end
    unless char.respond_to?(:chr)
      fail TypeError.new("'char' needs 'chr' capability")
    end
    unless shift.is_a?(Integer)
      fail TypeError.new("'shift' must be a integer")
    end

    ch = char.ord+shift
    if(ch >= MIN_CHAR_VAL && ch <= MAX_CHAR_VAL)
      ch.chr
    else
      char
    end
  end
end

d = Decipher.new

# Read from files if some are defined and exists
if(ARGV.size>0)
  ARGV.each do |f|
    d.readfile(f)
  end
else # Otherwise read from standard input
  $stdin.each_line do |a|
    puts d.decipher(a)
  end
end
