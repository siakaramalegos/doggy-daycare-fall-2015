class Owner < ActiveRecord::Base
  has_many :dogs

  # Normalizes the attribute itself before validation
  phony_normalize :phone, default_country_code: 'US'

  # TODO: Add phone number validation
  validates :first_name, :last_name, presence: true
  validates_plausible_phone :phone, normalized_country_code: 'US', presence: true

end

# == Schema Information
#
# Table name: owners
#
#  id          :integer          not null, primary key
#  first_name  :string
#  last_name   :string
#  phone       :string
#  evac_waiver :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
