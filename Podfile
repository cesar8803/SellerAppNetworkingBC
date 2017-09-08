source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '10.0'
use_frameworks!


project '/Users/adair/Documents/SellerAppNetworkingBC/SellerAppNetworkingBC.xcodeproj'

def shared_pods
    pod 'Alamofire', '~> 4.0'
    pod 'AlamofireObjectMapper', '~> 4.0'
end

target 'SellerAppNetworkingBC' do
  shared_pods
end

target 'SellerAppNetworkingBCTests' do
    shared_pods
end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.1'
    end
  end
end
