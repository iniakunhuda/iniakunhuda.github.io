module Jekyll
  module CategoryCountFilter
    def category_count(categories)
      category_counts = Hash.new(0)

      categories.each do |category|
        category_counts[category] += 1
      end

      category_counts
    end
  end
end

Liquid::Template.register_filter(Jekyll::CategoryCountFilter)
