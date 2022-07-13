class Image < ApplicationRecord
    
    def new
        @image = Image.new
    end
    
    default_scope -> {order(created_at: :desc)}
    scope :asc, -> { order(title: :asc)}
    scope :desc, -> { order(title: :desc)}
    
   
end
