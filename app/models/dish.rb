class Dish < ActiveRecord::Base
    belongs_to :restaurant
    has_many :dish_tags
    has_many :tags, through: :dish_tags

    def self.names
        Dish.all.map do |dish|
            dish.name
        end
    end

    def self.max_tags
        Dish.all.max_by do |dish|
            dish.tags.length 
        end
    end

    def self.untagged
        Dish.all.select do |dish|
            dish.tags.length == 0
        end
    end

    def self.average_tag_count
       tag_count = Dish.all.map do |dish|
            dish.tags.length
        end
        tag_count.sum / tag_count.length.to_f
    end

    def tag_count
        self.tags.length 
    end

    def tag_names
        self.tags.map  do |tag|
            tag.name 
        end
    end

    # def most_popular_tag

    # end
end