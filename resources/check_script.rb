actions :create

default_action :create

attribute :script, kind_of: String, required: true
attribute :interval, kind_of: Integer, default: 5
attribute :weight, kind_of: Integer, default: -2
attribute :rise, kind_of: Integer, default: 2
attribute :fall, kind_of: Integer, default: 2
