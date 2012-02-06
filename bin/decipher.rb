

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

	def transform(char, shift)
		ch = char.ord+shift
		if(ch >= MIN_CHAR_VAL && ch <= MAX_CHAR_VAL)
			ch.chr
		else
			ch
		end
	end
end

d = Decipher.new
text = "1JKJ'pz'{ol'{yhklthyr'vm'{ol'Jvu{yvs'Kh{h'Jvywvyh{pvu5
1PIT'pz'h'{yhklthyr'vm'{ol'Pu{lyuh{pvuhs'I|zpulzz'Thjopul'Jvywvyh{pvu5
1KLJ'pz'{ol'{yhklthyr'vm'{ol'Kpnp{hs'Lx|pwtlu{'Jvywvyh{pvu5"

print d.decipher(d.cipher(d.decipher(text)))