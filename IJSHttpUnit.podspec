Pod::Spec.new do |s|

  s.name         = "IJSHttpUnit"
  s.version      = "1.0.0"
  s.summary          = "A Unit of AFNetworking manager."
  s.description      = "刘念大佬开发的网络缓存库,封装AFNetworking,支持离线缓存,支持文件上传,下载,支持多文件,图片,zip,音频视频等文件的上传,支持断点续传,断点下载等功能"

  s.homepage     = "https://github.com/wangjinshan/MWHttpUnit"

  s.license      = "MIT (example)"

  s.author             = { "wangjinshan" => "1096452045@qq.com" }

  s.license          = 'MIT'
  s.source       = { :git => "https://github.com/wangjinshan/MWHttpUnit.git", :tag => "#{s.version}" ,:submodules => true}

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
    hcu.dependency 'IJSHttpUnit/CacheUnit'
    hcu.dependency 'IJSHttpUnit/HTTP'
    hcu.dependency 'IJSHttpUnit/Extension'
  end

  s.subspec 'Extension' do |es|
    es.source_files = 'SDK/Classes/Extension/*.{h,m}'
  end

  s.public_header_files = 'SDK/Classes/MWHTTPUnit.h'
  s.frameworks = 'UIKit'
  s.dependency 'AFNetworking'

  

end
