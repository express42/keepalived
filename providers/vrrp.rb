action :create do
  params = {}
  attributes = %w(notify_master notify_backup notify_fault interface virtual_router_id state nopreempt priority virtual_ipaddress virtual_routes advert_int auth_type auth_pass track_script track_interface)
  attributes.each do |attribute|
    if new_resource.respond_to?(attribute)
      params[attribute] = new_resource.send(attribute.to_sym) unless new_resource.send(attribute.to_sym).nil?
    end
  end

  r = template "vrrp_#{new_resource.name}" do
    path "#{node['keepalived']['confpath']}/vrrp_#{new_resource.name}.conf"
    source 'vrrp_generic.conf.erb'
    cookbook 'keepalived'
    owner 'root'
    group 'root'
    mode '0644'
    variables(
      'name' => new_resource.name,
      'params' => params
    )
    notifies :restart, 'service[keepalived]', :immediately
  end
  new_resource.updated_by_last_action(r.updated_by_last_action?)
end
