
Pod::Spec.new do |s|

# 1 Settings

    s.platform = :ios
    s.ios.deployment_target = '10.0'
    s.name = "SellerAppNetworkingBC"
    s.summary = "Pod con la colección de servicios de Bridgecore."
    s.requires_arc = true


# 2 Version

    s.version = "1.0.1"


# 3 License

    s.license = { :type => "MIT", :file => "LICENSE" }


# 4 Author

    s.author = { "Alejandro Hernandez" => "alejhernandez@deloittemx.com" }


# 5 HomePage

    s.homepage = "https://www.liverpool.com.mx"


# 6 URL Git

    s.source = { :git => "https://github.com/cesar8803/SellerAppNetworkingBC.git", :tag => "#{s.version}" }


# 7 Dependencies

    s.framework = "Foundation"
    s.dependency 'Alamofire', '~> 4.0'
    s.dependency 'AlamofireObjectMapper', '~> 4.0'
    s.dependency 'PromiseKit', '~> 4.4'


# 8 Sources Files

    s.source_files = "SellerAppNetworkingBC/BridgeCoreClasses/**/*.{swift}"

# 9 Resources

    # s.resources = "SellerAppNetworkingBC/**/*.{png,jpeg,jpg,storyboard,xib}"

end
