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

require 'rails_helper'

RSpec.describe Message, type: :model do
  context 'class methods' do
    describe 'test method' do
      it 'should do something' do
      end
    end
  end
end
