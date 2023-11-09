class CreateSignature
  include Interactor

  EXPIRATION_TIME = 60

  def call
    hash = {
      method:     context.method,
      url:        context.url,
      expires_at: (Time.now + EXPIRATION_TIME).to_i,
      params:     context.params.to_json,
    }
    context.signature = sign(hash)
  end

  private

  def sign(hash)
    private_key = OpenSSL::PKey::RSA.new(File.open(ENV['PRIVATE_KEY_PATH']))
    data = "#{hash[:expires_at]}|#{hash[:method].to_s.upcase}|#{hash[:url]}|#{hash[:params]}"

    Base64.encode64(private_key.sign(OpenSSL::Digest.new('SHA256'), data)).delete("\n")
  end
end
