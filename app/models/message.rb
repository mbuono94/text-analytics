# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  date       :string
#  time       :string
#  direction  :string
#  number     :string
#  name       :string
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ApplicationRecord

  # belongs_to :messageable, polymorphic: true

  PARSED_INDICIES = {
      date: 0,
      time: 1,
      direction: 2,
      number: 3,
      name: 4,
      text: 5
    }

  scope :sent, -> { where(direction: 'out') }
  scope :received, -> { where(direction: 'in') }
  scope :with_user, -> (user) { where(number: user.number) }

  def self.create_from_line(array) 

    new_message = Message.find_or_create_by(
      date: array[PARSED_INDICIES[:date]],
      time: array[PARSED_INDICIES[:time]], 
      direction: array[PARSED_INDICIES[:direction]], 
      number: array[PARSED_INDICIES[:number]].split(//).last(10).join, 
      name: array[PARSED_INDICIES[:name]], 
      text: array[PARSED_INDICIES[:text]].strip  
      )
    new_message.save
    new_message
  end
end
