class Restaurant < ActiveRecord::Base
    has_many :dishes


    def self.mcdonalds
        Restaurant.all.find_by({name: "McDonalds"})
    end

    def self.sweetdeli
        Restaurant.all.find_by({name: "Sweet Deli"})
    end

    def self.tenth
        Restaurant.all[9]
    end

    def self.with_long_names
        Restaurant.all.select {|restaurant| restaurant.name.length > 12}
    end

    def self.max_dishes
        Restaurant.all.max_by {|restaurant| restaurant.dishes.count}
    end

    def self.focused
        Restaurant.all.select {|restaurant| restaurant.dishes.length < 5}
    end

    def self.large_menu
        Restaurant.all.select {|restaurant| restaurant.dishes.length > 20}
    end

    def get_tag_names
        all_tags = self.dishes.map do |dish|
            dish.tags
        end.flatten

        tag_names = all_tags.map {|tag| tag.name}.uniq

        return tag_names
    end

    def self.vegitarian
        binding.pry
        Restaurant.all.select {|restaurant| restaurant.get_tag_names.include?("Vegitarian")}
    end

    def self.name_like(name)
        Restaurant.all.select { |restaurant| restaurant.name.downcase.include?(name.downcase)}
    end

    def self.name_not_like(name)
        Restaurant.all.select { |restaurant| !restaurant.name.downcase.include?(name.downcase)}
    end
end