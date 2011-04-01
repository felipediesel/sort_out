# -*- coding: utf-8 -*-

require 'active_record'

require 'sort_out/helpers'
require 'sort_out/active_record'

ActiveRecord::Base.send :extend, SortOut::ActiveRecord
ActionView::Base.send :include, SortOut::Helpers