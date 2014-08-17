ActionController::Routing::Routes.draw do |map|
  # Install the default route as the lowest priority.
  # map.connect ':controller/:action/:id', :requirements => { :id => /.*/ }
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
