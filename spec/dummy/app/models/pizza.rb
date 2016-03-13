class Pizza < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
end
