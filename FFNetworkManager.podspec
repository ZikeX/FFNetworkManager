

Pod::Spec.new do |s|
  s.name             = 'FFNetworkManager'
  s.version          = '0.1.0'
  s.summary          = 'A short description of FFNetworkManager.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/<GITHUB_USERNAME>/FFNetworkManager'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xjq' => 'xujq@cig.com.cn' }
  s.source           = { :git => 'https://github.com/<GITHUB_USERNAME>/FFNetworkManager.git', :tag => s.version.to_s }


  s.ios.deployment_target = '8.0'

  s.source_files = 'FFNetworkManager/Classes/**/*'

  s.framework    = "UIKit","Foundation"

  s.dependency 'FFBasePod'
  s.dependency 'FFSupportPod'
  s.dependency 'AFNetworking'
  s.dependency 'YYCache'
  s.dependency 'YYModel'

end
