module SortOut
  module ActiveRecord
    def sortable(options = {})
      default_options = { :default_column => 'name', :after => [], :by => [] }
      @sortable_options = default_options.merge(options) unless options.nil?
      @sortable_options[:by] << [options[:default_column]]
    end

    def sort_out(column, direction)
      sort_column = sortable_column(column)
      sort_direction = direction.present? ? "desc" : "asc"
      model = self.order "#{sort_column} #{sort_direction}"
      @sortable_options[:after].each do |order|
        model = model.order(order.join(' ')) if order[0].to_s != sort_column
      end
      model
    end

    def sortable_column(column)
      @sortable_options[:by].each do |field|
        if field.is_a? Array and field[0].to_s == column
          return field[1]
        elsif field.to_s == column
          return column
        end
      end
      @sortable_options[:default_column]
    end
  end
end
