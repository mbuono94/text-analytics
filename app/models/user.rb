# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  number     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :messages

  def popular_kgrams(k=3, direction='out', start_of_sentence=true, num_grams=20)

    kgram_counts = Hash.new(0)

    messages = Message.with_user(self).where(direction: direction)

    messages.each do |message|
      if start_of_sentence
        sentences = message.text.strip.split('.')
        sentences.each do |sentence|
          words = sentence.split(" ")
          next if k > words.length
          slice = words[0...k]
          kgram = slice.join(" ")
          kgram_counts[kgram] += 1
        end
      else
        words = message.text.strip.split()

        words.each_with_index do |word, index|
          slice = words[index...index+k]
          next if index + k > words.length
          kgram = slice.join(" ")
          kgram_counts[kgram] += 1
        end
      end
    end
  
  kgram_counts.sort_by {|_key, value| value}.reverse[0...num_grams]
  end


  def popular_days(direction='out')

  end

end
