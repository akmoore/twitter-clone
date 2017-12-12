class Relationship < ApplicationRecord
    #RELATIONSHIPS
        belongs_to :user #=> the current user
        belongs_to :friend, class_name: "User" #=> the one who's being followed by the current user.
end

# == Schema Information
#
# Table name: relationships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  friend_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
