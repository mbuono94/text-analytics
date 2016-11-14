# == Schema Information
#
# Table name: rawtexts
#
#  id         :integer          not null, primary key
#  name       :string
#  attachment :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  data       :string
#

class Rawtext < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :name, presence: true # Make sure the owner's name is present.
  after_commit :delete_file, on: :destroy

  def create_objects
    # make the text objects and the message objects too
    data.each_line do |line|
      text_message = Message.create_from_line(line.split("\t"))
      # create a new user if we need to
      if User.find_by(number: text_message.number).nil?
        new_user = User.new(name: text_message.name, number: text_message.number)
        new_user.save
      end
    end
  end

  def delete_file
    attachment.remove!
  end
end
