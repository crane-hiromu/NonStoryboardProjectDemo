# Uncomment the next line to define a global platform for your project
platform :ios, '8.0'

def shared_library
    #pod 'FontAwesomeKit'
end

target 'NonStoryboardProjectDemo’ do
  use_frameworks!

  shared_library
end

target 'NonStoryboardProjectDemoTests' do
  inherit! :search_paths
  
  shared_library
end

target 'NonStoryboardProjectDemoUITests' do
  inherit! :search_paths

  shared_library
end
