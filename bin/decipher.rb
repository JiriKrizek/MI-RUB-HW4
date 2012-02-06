

class Decipher
  MIN_CHAR_VAL=32
  MAX_CHAR_VAL=126

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

private
  def transform(char, shift)
    ch = char.ord+shift
    if(ch >= MIN_CHAR_VAL && ch <= MAX_CHAR_VAL)
      ch.chr
    else
      char
    end
  end
end

d = Decipher.new

File.open('input.txt', 'r') do |f|
  while(line = f.gets)
    p d.decipher(line.chomp)
  end
end