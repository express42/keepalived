 action :run do
   conf_path = node['keepalived']['confpath']

   # get list of files from conf dir
   files_list = []
   Dir.glob(conf_path + '/*').each { |path| files_list.push(path.sub(conf_path + '/', '')) }

   resources_list = []

   # get file names from resource_collection
   run_context.resource_collection.each do |resource|
     if resource.class == Chef::Resource::KeepalivedVirtualServer
       resources_list.push('vs_' + resource.name)
     end
     if resource.class == Chef::Resource::KeepalivedVrrp
       resources_list.push('vrrp_' + resource.name)
     end
     if resource.class == Chef::Resource::KeepalivedCheckScript
       resources_list.push('script_' + resource.name)
     end
   end

   resource_files = []

   # get list of files created by provider
   resources_list.each do |r|
     files_list.each do |f|
       resource_files.push(f) if f.match(r)
     end
   end

   # delete unnecessary files
   (files_list - resource_files).each do |f|
     ::File.unlink(conf_path + '/' + f)
     Chef::Log.info('Removing file ' + f + ' in directory ' + conf_path + ' ...')
   end

   new_resource.updated_by_last_action(true)
 end
