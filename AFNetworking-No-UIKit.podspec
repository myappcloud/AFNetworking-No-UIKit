#
# Be sure to run `pod lib lint AFNetworking-No-UIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AFNetworking-No-UIKit'
  s.version          = '1.0.0'
  s.summary          = 'AFNetworking官方库移除UIKit扩展类：移除对UIWebview的支持'
  s.module_name = "AFNetworking"


# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/myappcloud/AFNetworking-No-UIKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'myappcloud' => 'appcloud@mingyuanyun.com' }
  s.source           = { :git => 'https://github.com/myappcloud/AFNetworking-No-UIKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'AFNetworking-No-UIKit/Classes/AFNetworking.h'
    s.public_header_files = "Classes/AFNetworking.h"

     pch_AF = <<-EOS
#ifndef TARGET_OS_IOS
  #define TARGET_OS_IOS TARGET_OS_IPHONE
#endif

#ifndef TARGET_OS_WATCH
  #define TARGET_OS_WATCH 0
#endif

#ifndef TARGET_OS_TV
  #define TARGET_OS_TV 0
#endif
EOS
  s.prefix_header_contents = pch_AF



  s.subspec 'Serialization' do |ss|
    ss.source_files = 'AFNetworking-No-UIKit/Classes/AFURL{Request,Response}Serialization.{h,m}'
    ss.public_header_files = 'AFNetworking-No-UIKit/Classes/AFURL{Request,Response}Serialization.h'
    ss.watchos.frameworks = 'MobileCoreServices', 'CoreGraphics'
    ss.ios.frameworks = 'MobileCoreServices', 'CoreGraphics'
    ss.osx.frameworks = 'CoreServices'
  end

  s.subspec 'Security' do |ss|
    ss.source_files = 'AFNetworking-No-UIKit/Classes/AFSecurityPolicy.{h,m}'
    ss.public_header_files = 'AFNetworking-No-UIKit/Classes/AFSecurityPolicy.h'
    ss.frameworks = 'Security'
  end

  s.subspec 'Reachability' do |ss|
    ss.ios.deployment_target = '7.0'
    ss.osx.deployment_target = '10.9'
    ss.tvos.deployment_target = '9.0'

    ss.source_files = 'AFNetworking-No-UIKit/Classes/AFNetworkReachabilityManager.{h,m}'
    ss.public_header_files = 'AFNetworking-No-UIKit/Classes/AFNetworkReachabilityManager.h'

    ss.frameworks = 'SystemConfiguration'
  end

   s.subspec 'NSURLSession' do |ss|
    ss.dependency 'AFNetworking-No-UIKit/Serialization'
    ss.ios.dependency 'AFNetworking-No-UIKit/Reachability'
    ss.osx.dependency 'AFNetworking-No-UIKit/Reachability'
    ss.tvos.dependency 'AFNetworking-No-UIKit/Reachability'
    ss.dependency 'AFNetworking-No-UIKit/Security'

    ss.source_files = 'AFNetworking-No-UIKit/Classes/AF{URL,HTTP}SessionManager.{h,m}', 'AFNetworking/AFCompatibilityMacros.h'
    ss.public_header_files = 'AFNetworking-No-UIKit/Classes/AF{URL,HTTP}SessionManager.h', 'AFNetworking/AFCompatibilityMacros.h'
  end

  # s.resource_bundles = {
  #   'AFNetworking-No-UIKit' => ['AFNetworking-No-UIKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
