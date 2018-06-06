require 'openssl'
require 'base64'
RSpec::Matchers.define :have_valid_digest_for_acas do |expected|
  match do |actual|
    # Assert - Stage 1 - Calculate the expected digest value which uses nokokiri to canonicalize it correctly
    doc = Nokogiri::XML(actual)
    node = doc.xpath('//env:Envelope/env:Header/wsse:Security/wsu:Timestamp', doc.collect_namespaces).first
    digest_value = Base64.encode64(OpenSSL::Digest::SHA1.digest(node.canonicalize(Nokogiri::XML::XML_C14N_EXCLUSIVE_1_0))).strip

    # Assert - Stage 2 - Test the digest value is correct
    xml = Hash.from_xml(actual)
    expect(xml.dig('Envelope', 'Header', 'Security', 'Signature', 'SignedInfo', 'Reference', 'DigestValue')).to eql digest_value
  end
end
