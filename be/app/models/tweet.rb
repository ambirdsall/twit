# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  text       :string(140)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tweets_on_user_id  (user_id)
#

class Tweet < ActiveRecord::Base
  belongs_to :user

  validates :text, length: { in: 1..140 }
end
