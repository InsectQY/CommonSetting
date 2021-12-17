#
# Be sure to run `pod lib lint CommonSetting.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CommonSetting'
  s.version          = '1.0.0'
  s.summary          = '通用的设置页面封装'

  s.description      = <<-DESC
  支持配置文件和代码两种方式配置，拥有多种常见设置功能
                       DESC

  s.homepage         = 'https://github.com/InsectQY/CommonSetting'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'insect' => '704861917@qq.com' }
  s.source           = { :git => 'https://github.com/InsectQY/CommonSetting', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'CommonSetting/Classes/QYCommonSetting.h'
  
  s.subspec 'Core' do |ss|
      ss.source_files = 'CommonSetting/Classes/Core/*.{h,m}'
    end
  
  s.subspec 'Resources' do |ss|
      ss.resource_bundles = {'CommonSettingResources' => ['CommonSetting/Resources/*.*']}
    end
  
  s.subspec 'About' do |ss|
      ss.source_files = 'CommonSetting/Classes/About/*.{h,m}'
      ss.dependency 'CommonSetting/Resources'
      ss.dependency 'CommonSetting/Core'
    end
  
  s.subspec 'Introduce' do |ss|
      ss.source_files = 'CommonSetting/Classes/Introduce/*.{h,m}'
      ss.dependency 'CommonSetting/Resources'
      ss.dependency 'CommonSetting/Core'
    end
  
  s.subspec 'Main' do |ss|
      ss.source_files = 'CommonSetting/Classes/Main/*.{h,m}'
      ss.dependency 'CommonSetting/Resources'
      ss.dependency 'CommonSetting/Core'
      ss.dependency 'CommonSetting/About'
      ss.dependency 'CommonSetting/Introduce'
    end
  
end
