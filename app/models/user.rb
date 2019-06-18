class User < ActiveRecord::Base
  has_secure_password

  has_many :smbbj_progress_trackers

end