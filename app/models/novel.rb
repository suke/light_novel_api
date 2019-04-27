# frozen_string_literal: true

# == Schema Information
#
# Table name: novels
#
#  id             :bigint           not null, primary key
#  title          :string(255)      not null
#  price          :integer
#  book_size      :string(255)
#  isbn           :string(255)      not null
#  release_date   :datetime
#  author_id      :integer
#  illustrator_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#


class Novel < ApplicationRecord
  validates :title, presence: true,
                    uniqueness: true,
                    length: { maximum: 255 }
  validates :isbn, presence: true,
                   uniqueness: true,
                   length: { maximum: 255 }
end
