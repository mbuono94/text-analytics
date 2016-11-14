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

require 'rails_helper'

RSpec.describe Rawtext, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
