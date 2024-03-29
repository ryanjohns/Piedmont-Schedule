ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.
  
  # Sample of regular route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
  # map.connect '', :controller => "welcome"

  map.connect '', :controller => 'schedule', :action => 'list'

  map.list_schedules 'list-schedules', :controller => 'schedule', :action => 'list'
  map.view_schedule 'view-schedule/:id/:edit_id', :controller => 'schedule', :action => 'view', :id => nil, :edit_id => 0
  map.create_schedule 'create-schedule', :controller => 'schedule', :action => 'create_schedule'
  map.delete_schedule 'delete-schedule/:id', :controller => 'schedule', :action => 'delete_schedule', :id => nil
  map.toggle_auto_reload 'toggle-auto-reload', :controller => 'schedule', :action => 'toggle_auto_reload'

  map.edit_case 'edit-case', :controller => 'case', :action => 'edit_case'
  map.delete_case 'delete-case/:id', :controller => 'case', :action => 'delete_case', :id => nil

  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  map.connect ':controller/service.wsdl', :action => 'wsdl'

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end
