module AuthHelper
  def encode password
    Digest::SHA2.hexdigest password
  end

  def generate_password
    SecureRandom.hex(8)
  end
end
