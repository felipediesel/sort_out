# -*- coding: utf-8 -*-

require 'active_record'

require 'sort_out/action_controller'
require 'sort_out/helpers'
require 'sort_out/active_record'

ActiveRecord::Base.send :extend, SortOut::ActiveRecord
ActionController::Base.send :include, SortOut::ActionController
ActionView::Base.send :include, SortOut::Helpers

module SortOut
  mattr_accessor :action_controller_options
  @@action_controller_options = {}

  mattr_accessor :sort
  @@sort = nil

  mattr_accessor :direction
  @@direction = nil
end