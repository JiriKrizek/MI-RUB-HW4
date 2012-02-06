require '../lib/decipher.rb'
require 'test/unit'

class TestDecipher < Test::Unit::TestCase
	def test_decrypt
		input = "1JKJ'pz'{ol'{yhklthyr'vm'{ol'Jvu{yvs'Kh{h'Jvywvyh{pvu5
1PIT'pz'h'{yhklthyr'vm'{ol'Pu{lyuh{pvuhs'I|zpulzz'Thjopul'Jvywvyh{pvu5
1KLJ'pz'{ol'{yhklthyr'vm'{ol'Kpnp{hs'Lx|pwtlu{'Jvywvyh{pvu5"

		expected = "*CDC is the trademark of the Control Data Corporation.
*IBM is a trademark of the International Business Machine Corporation.
*DEC is the trademark of the Digital Equipment Corporation."

		d = Decipher.new()
		assert_equal(d.decipher(input), expected)
	end

	def test_encrypt
		input = "1JKJ'pz'{ol'{yhklthyr'vm'{ol'Jvu{yvs'Kh{h'Jvywvyh{pvu5
1PIT'pz'h'{yhklthyr'vm'{ol'Pu{lyuh{pvuhs'I|zpulzz'Thjopul'Jvywvyh{pvu5
1KLJ'pz'{ol'{yhklthyr'vm'{ol'Kpnp{hs'Lx|pwtlu{'Jvywvyh{pvu5"

		d = Decipher.new()
		assert_equal(d.cipher(d.decipher(input)), input)
	end

	def test_non_printable
		input = "\n"

		d = Decipher.new()
		assert_equal(d.decipher(input), input)
		assert_equal(d.cipher(input), input)
	end

	def test_printable
		input = "a"

		d = Decipher.new()
		assert_equal(d.decipher(input), "Z")
		assert_equal(d.cipher(input), "h")
	end

	def test_empty
		input = ""

		d = Decipher.new()
		assert_raises(ArgumentError) {
			d.decipher(d.decipher(), "")
		}

		assert_equal(d.decipher(""), "")
	end
end