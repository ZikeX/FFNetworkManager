

Pod::Spec.new do |s|
  s.name             = 'FFNetworkManager'
  s.version          = '0.1.0'
  s.summary          = '网络请求和缓存'

  s.description      = <<-DESC
                        pod个人库网络请求和缓存
                       DESC

  s.homepage         = 'https://github.com/xujunquan/FFNetworkManager'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xujunquan' => 'ian553087358@163.com' }
  s.source           = { :git => 'https://github.com/xujunquan/FFNetworkManager.git', :tag => s.version.to_s }


  s.ios.deployment_target = '8.0'

  s.source_files = 'FFNetworkManager/Classes/**/*'

  s.framework    = "UIKit","Foundation"

  s.dependency 'FFBasePod'
  s.dependency 'FFSupportPod'
  s.dependency 'AFNetworking'
  s.dependency 'YYCache'
  s.dependency 'YYModel'

end
