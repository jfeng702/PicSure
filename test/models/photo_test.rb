# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  img_url     :string           not null
#  title       :string
#  description :text
#  owner_id    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  album_id    :integer
#

require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
