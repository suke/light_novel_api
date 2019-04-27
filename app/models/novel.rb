# frozen_string_literal: true

class Novel < ApplicationRecord
  validates :title, presence: true,
                    uniqueness: true,
                    length: { maximum: 255 }
  validates :isbn, presence: true,
                   uniqueness: true,
                   length: { maximum: 255 }
end
