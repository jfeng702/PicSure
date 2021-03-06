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

class Photo < ApplicationRecord
  validates :img_url, :owner_id, presence: true

  belongs_to :owner,
    primary_key: :id,
    foreign_key: :owner_id,
    class_name: :User

  has_many :album_photos,
    primary_key: :id,
    foreign_key: :photo_id,
    class_name: :AlbumPhoto

  has_many :albums,
    through: :album_photos,
    source: :album

  has_many :comments

  has_many :taggings,
    primary_key: :id,
    foreign_key: :photo_id,
    class_name: :Tagging

  has_many :tags,
    through: :taggings,
    source: :tag

  def user_photos
    current_user.photos
  end

  def self.tagged_with(body)
    Tag.find_by_body!(body).photos
  end


end
# column name	data type	details
# id	integer	not null, primary key
# img_url	string	not null
# title	string	optional
# description	text	optional
# owner_id	integer	not null, indexed, foreign key
# created_at	datetime	not null
# updated_at	datetime	not null
