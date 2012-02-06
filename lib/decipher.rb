class Decipher
  # Minimal printable ascii value 
  MIN_CHAR_VAL=32
  # Maximal printable ascii value
  MAX_CHAR_VAL=126
  # Crypt key
  KEY = 7

  # Decrypt given variable
  def decipher(text)
    result = ""
    
    text.to_s.each_char  do |c|
      result << transform(c, -KEY)
    end
    result
  end

  # Encrypt given variable
  def cipher(text)
    result = ""

    text.to_s.each_char  do |c|
      result << transform(c, +KEY)
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