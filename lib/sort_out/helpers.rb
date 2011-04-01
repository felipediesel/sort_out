# -*- coding: utf-8 -*-
module SortOut
  module Helpers
    def sortable(column, title = nil, options = {})
      default_options = { :default => false }
      options = default_options.merge(options) unless options.nil?
      title ||= column.titleize
      direction = nil
      if column.to_s == params[:sort] || (options[:default] and params[:sort].blank?)
        if params[:direction].blank?
          direction = "desc"
          title << '▼'
        else
          title << '▲'
        end
      end
      #▴ ▾ ▼ ▲
      link_to title, params.merge({:sort => column, :direction => direction})
    end

    def sortable_fields
      html = "".html_safe
      html << hidden_field_tag(:sort, params[:sort]) if params[:sort].present?
      html << hidden_field_tag(:direction, params[:direction]) if params[:direction].present?
      html
    end
  end
end
