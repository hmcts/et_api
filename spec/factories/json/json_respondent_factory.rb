require 'faker'
require 'securerandom'

FactoryBot.define do
  factory :json_respondent_data, class: ::EtApi::Test::Json::Node do
    trait :minimal do
      name 'dodgy_co'
      association :address_attributes, :the_shard, factory: :json_address_data
      association :work_address_attributes, :the_shard, factory: :json_address_data
      organisation_more_than_one_site false
    end

    trait :full do
      minimal
      contact 'John Smith'
      dx_number ""
      address_telephone_number ''
      work_address_telephone_number ''
      alt_phone_number ''
      contact_preference 'email'
      email_address 'john@dodgyco.com'
      fax_number ''
      organisation_employ_gb 10
      employment_at_site_number 5
      disability true
      disability_information 'Lorem ipsum disability'
    end

    trait :mr_na_o_leary do
      full
      name "n/a O'Leary"
    end
  end
end
