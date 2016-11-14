class MakeObjectsJob < ApplicationJob
  # queue_as :urgent

  def perform(rawtext)
    # make the text objects and the message objects too
    rawtext.data.each_line do |line|
      text_message = Message.create_from_line(line.split("\t"))
      # create a new user if we need to
      if User.find_by(number: text_message.number).nil?
        new_user = User.new(name: text_message.name, number: text_message.number)
        new_user.save
      end
    end
    # delete the file on disk now, we're done
    rawtext.attachment.remove!
  end
end
