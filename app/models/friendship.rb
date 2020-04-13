class Friendship < ApplicationRecord
  belongs_to :users
  belongs_to :friend, :class_name => "User"
end
