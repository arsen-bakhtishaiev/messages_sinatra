require "openssl"
require "digest/sha1"
require "base64"

IV = "1234567890ABCDFEFGHIJ"
ALGO = "aes-128-cbc"
KEY = "dfgertbg;fhjfdvbfg"

class AES
	
	def encrypt(text)
		aes = OpenSSL::Cipher::Cipher.new(ALGO)
		aes.encrypt
		aes.key = KEY
		aes.iv = IV
		data = aes.update(text)
		data << aes.final
		return Base64.encode64(data)
	end
	
	def decrypt(text)
		aes = OpenSSL::Cipher::Cipher.new(ALGO)
		aes.decrypt
		aes.key = KEY
		aes.padding = 0
		aes.iv = IV
		decode = Base64.decode64(text)
		data = aes.update(decode)
		data << aes.final
		return data
	end

end

