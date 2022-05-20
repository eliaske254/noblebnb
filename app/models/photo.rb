# == Schema Information
#
# Table name: photos
#
#  id         :bigint           not null, primary key
#  listing_id :bigint           not null
#  file       :string
#  caption    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Photo < ApplicationRecord
  belongs_to :listing
  has_one_attached :file do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  def image_as_thumbnail
    image.variant(resize_to_limit: [300, 300]).processed
  end
end
