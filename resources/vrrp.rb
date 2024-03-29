actions :create

default_action :create

attribute :interface, kind_of: String, required: true
attribute :virtual_router_id, kind_of: Integer, default: 10
attribute :state, kind_of: String, equal_to: %w(MASTER BACKUP), default: 'BACKUP'
attribute :noprempt, kind_of: [TrueClass, FalseClass], default: false
attribute :priority, kind_of: Integer, default: 100
attribute :virtual_ipaddress, kind_of: Array, required: true

# Optional attributes
attribute :virtual_routes, kind_of: Array, required: false
attribute :advert_int, kind_of: Integer, required: false
attribute :auth_type, kind_of: String, equal_to: %w(pass ah), required: false
attribute :auth_pass, kind_of: String, required: false
attribute :track_interface, kind_of: Array, required: false
attribute :track_script, kind_of: String, required: false
attribute :notify_master, kind_of: String, required: false
attribute :notify_backup, kind_of: String, required: false
attribute :notify_fault, kind_of: String, required: false
