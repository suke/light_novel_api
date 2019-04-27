# frozen_string_literal: true

class CreateNovel < ActiveRecord::Migration[5.2]
  def change
    create_table :novels do |t|
      t.string :title, null: false
      t.integer :price
      t.string :book_size
      t.string :isbn, null: false
      t.string :image
      t.datetime :release_date
      t.integer :author_id
      t.integer :illustrator_id
      t.timestamps
    end
  end
end
