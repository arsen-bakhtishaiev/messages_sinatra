require "rspec"
require_relative "../encryption.rb"

describe "Encryption" do
	it "should encrypt and decrypt text" do
		text = "test text"
		encrypt = AES.new
		encrypted_text = encrypt.encrypt(text)
		decrypted_text = encrypt.decrypt(encrypted_text)

		expect(decrypted_text) == text
	end
end
