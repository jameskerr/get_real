class Account < ActiveRecord::Base

  enum service: [:twitter, :instagram, :facebook]

  scope :twitter, -> { where(service: 'twitter') }
  scope :instagram, -> { where(service: 'instagram') }
  scope :facebook, -> { where(service: 'facebook') }

end
