# frozen_string_literal: true

module V1
  class Novels < Grape::API
    resources :novels do
      desc 'get novels',
           success: NovelSerializer,
           produces: %w[application/json]
      get serializer: NovelSerializer do
        novels = Novel.all
        novels
      end

      desc 'create novel',
           success: NovelSerializer,
           produces: %w[application/json]
      params do
        requires :title, type: String
        requires :isbn, type: String
        optional :price, type: Integer
        optional :book_size, type: String
        optional :release_date, type: DateTime
        optional :image, type: File
        optional :author_id, type: Integer
        optional :illustrator_id, type: Integer
      end
      post serializer: NovelSerializer do
        declared_params = declared(params, include_missing: false)
        novel = Novel.create!(declared_params)
        novel
      end

      resource ':id' do
        desc 'get novel',
             success: NovelSerializer,
             produces: %w[application/json]
        get serializer: NovelSerializer do
          novel = Novel.find(params[:id])
          novel
        end

        desc 'update novel',
             success: NovelSerializer,
             produces: %w[application/json]
        params do
          optional :title, type: String
          optional :isbn, type: String
          optional :price, type: Integer
          optional :book_size, type: String
          optional :release_date, type: DateTime
          optional :image, type: File
          optional :author_id, type: Integer
          optional :illustrator_id, type: Integer
        end
        put serializer: NovelSerializer do
          declared_params = declared(params, include_missing: false)
          novel = Novel.find(params[:id])
          novel.update!(declared_params)
          novel
        end

        desc 'delete novel'
        delete do
          novel = Novel.find(params[:id])
          novel.destroy!
          novel
        end
      end
    end
  end
end
