Pod::Spec.new do |s|
  s.name             = "IJSHttpUnit"
  s.version          = "1.0.0"
  s.summary          = "A Unit of AFNetworking manager."
  s.description      = "刘念大佬开发的封装AFNetworking,进行网络缓存,上传,下载,断点操作等功能的库"

  s.homepage         = "https://github.com/wangjinshan/MWHttpUnit"
  s.license          = 'MIT'
  s.author           = { "金山" => "1096452045@qq.com" }
  s.source           = { :git => "https://github.com/wangjinshan/MWHttpUnit.git", :tag => s.version.to_s }

  s.platform     = :ios, '9.0'
  s.ios.deployment_target = "9.0"
  s.requires_arc = true

  s.source_files = 'SDK/Classes/MWHTTPUnit.h'
  s.subspec 'CacheUnit' do |cu|
    cu.source_files = 'SDK/Classes/CacheUnit/*.{h,m}'
  end

  s.subspec 'HTTP' do |hp|
    hp.source_files = 'SDK/Classes/HTTP/*.{h,m}'
    hp.dependency 'AFNetworking'
  end

  s.subspec 'HTTPCacheUnit' do |hcu|
    hcu.source_files = 'SDK/Classes/HTTPCacheUnit/*.{h,m}'
    hcu.dependency 'MWHttpUnit/CacheUnit'
    hcu.dependency 'MWHttpUnit/HTTP'
    hcu.dependency 'MWHttpUnit/Extension'
  end

  s.subspec 'Extension' do |es|
    es.source_files = 'SDK/Classes/Extension/*.{h,m}'
  end

  s.public_header_files = 'SDK/Classes/MWHTTPUnit.h'
  s.frameworks = 'UIKit'
  s.dependency 'AFNetworking'
end
