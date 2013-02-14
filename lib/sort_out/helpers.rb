# -*- coding: utf-8 -*-
module SortOut
  module Helpers
    def sortable(column, title = nil, options = {})
      options.reverse_merge! default: false, direction: true, params: {}
      title ||= column.titleize
      direction = nil
      if column.to_s == SortOut.sort || (options[:default] and SortOut.sort.blank?)
        if SortOut.direction.blank?
          if options[:default].to_s == 'desc' and SortOut.sort.blank?
            title << '▲' if options[:direction]
          else
            direction = "desc"
            title << '▼' if options[:direction]
          end
        else
          title << '▲' if options[:direction]
        end
      end
      #▴ ▾ ▼ ▲
      link_to title, params.merge({ sort: column, direction: direction }.merge(options[:params]))
    end

    def sortable_fields
      html = "".html_safe
      html << hidden_field_tag(:sort, SortOut.sort) if SortOut.sort.present?
      html << hidden_field_tag(:direction, SortOut.direction) if SortOut.direction.present?
      html
    end

    def sortable_current(columns, default, options)
      options.reverse_merge! model_name: controller_name.singularize

      column = if SortOut.sort.present? and columns.include? SortOut.sort.to_sym
        SortOut.sort.to_sym
      else
        default.first
      end

      title = tl("#{options[:model_name]}.#{column.to_s}")

      if SortOut.direction.blank?
        if default[1].to_s == 'desc' and SortOut.sort.blank?
          title << '▲'
        else
          title << '▼'
        end
      else
        title << '▲'
      end
    end
  end
end

