module SortOut
  module ActiveRecord
    def sortable(options = {})
      default_options = { :default_column => [:name, :asc], :after => [], :by => [] }
      @sortable_options = default_options.merge(options) unless options.nil?
      @sortable_options[:default_column] = [@sortable_options[:default_column], :asc] unless @sortable_options[:default_column].is_a? Array
      @sortable_options[:by] << @sortable_options[:default_column][0]
    end

    def sort_out(column, direction = nil)
      if column.is_a? Hash
        direction = column[:direction]
        column = column[:sort]
      end
      
      sort_column = sortable_column(column).to_s.downcase
      sort_column << sortable_direction(column, direction)

      model = self.order(sort_column)
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
      @sortable_options[:default_column][0]
    end

    def sortable_direction(column, direction)
      if direction.present?
        " desc"
      elsif column.blank?
        " #{@sortable_options[:default_column][1].to_s}"
      else
        ""
      end
    end
  end
end

