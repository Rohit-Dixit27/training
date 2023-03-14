class Article < ApplicationRecord
    has_one_attached :image

    def image_modify
        image.variant(resize_to_limit: [200, 200]).processed
    end
end
