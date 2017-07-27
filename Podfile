# Uncomment the next line to define a global platform for your project
platform :ios, '8.0'

def shared_library
    # Macをserrieにupdateしたらcartfileで管理する（現状エラーになる）
    pod 'ObjectMapper'
    pod 'AlamofireObjectMapper'
end

target 'NonStoryboardProjectDemo’ do
  use_frameworks!

  shared_library
end

target 'NonStoryboardProjectDemoTests' do
  inherit! :search_paths

  use_frameworks!  
  shared_library
end

target 'NonStoryboardProjectDemoUITests' do
  inherit! :search_paths

  use_frameworks!
  shared_library
end
