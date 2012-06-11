# -*- coding: utf-8 -*-
module SortOut
  module Helpers
    def sortable(column, title = nil, options = {})
      default_options = { default: false, direction: true }
      options = default_options.merge(options) unless options.nil?
      title ||= column.titleize
      direction = nil
      if column.to_s == params[:sort] || (options[:default] and params[:sort].blank?)
        if params[:direction].blank?
          if options[:default].to_s == 'desc' and params[:sort].blank?
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
      link_to title, params.merge({ sort: column, direction: direction})
    end

    def sortable_fields
      html = "".html_safe
      html << hidden_field_tag(:sort, params[:sort]) if params[:sort].present?
      html << hidden_field_tag(:direction, params[:direction]) if params[:direction].present?
      html
    end

    def sortable_current(columns, default, options)
      options.reverse_merge! model_name: controller_name.singularize

      column = if params[:sort].present? and columns.include? params[:sort].to_sym
        params[:sort].to_sym
      else
        default.first
      end

      title = tl("#{options[:model_name]}.#{column.to_s}")

      if params[:direction].blank?
        if default[1].to_s == 'desc' and params[:sort].blank?
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

