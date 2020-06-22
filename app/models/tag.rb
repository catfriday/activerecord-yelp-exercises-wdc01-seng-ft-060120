class Tag < ActiveRecord::Base
    has_many :dish_tags
    has_many :dishes, through: :dish_tags

    def self.most_common
        Tag.all.max_by  do |tag|
            tag.dishes.length
        end
    end

    def self.least_common
        Tag.all.min_by  do |tag|
            tag.dishes.length
        end   
    end

    def self.unused
        Tag.all.select do |tag|
            tag.dishes.length == 0
        end    
    end

    def self.uncommon
        Tag.all.select  do |tag|
            tag.dishes.length < 5
        end
    end

    def self.popular
       pop_tag = Tag.all.sort_by do |tag| 
            tag.dishes.length
        end
        pop_tag.reverse[0...5]
    end

    def restaurants
       all_dishes = Tag.all.map  do |tag|
            tag.dishes 
        end.flatten
        all_dishes.map  do |dish|
            dish.restaurant
        end.uniq 
    end

    def top_restaurant
        self.restaurants 
    end
end