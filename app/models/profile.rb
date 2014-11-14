class Profile < ActiveRecord::Base
  belongs_to :user

  acts_as_mappable :default_units => :kms, :distance_field_name => :distance

  mount_uploader :avatar, AvatarUploader
end
