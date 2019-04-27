# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class NovelSerializer < ActiveModel::Serializer
  attributes :id, :title, :book_size, :isbn, :price,
             :image_url, :release_date, :author_id, :illustrator_id

  def image_url
    object.image.url
  end
end
