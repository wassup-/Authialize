#
# Be sure to run `pod lib lint Authialize.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  # info
  s.name                  = 'Authialize'
  s.version               = '0.1.11'
  s.summary               = 'Library for authenticating with multiple providers'
  s.homepage              = 'https://github.com/wassup-/Authialize'
  s.author                = {
    'Tom Knapen' => 'tom@knapen.io'
  }
  s.license               = {
    :type => 'MIT',
    :file => 'LICENSE'
  }

  # configuration
  s.platform              = :ios, '8.0'
  s.requires_arc          = true

  # files
  s.frameworks            = 'Foundation'
  s.source                = {
    :git => 'https://github.com/wassup-/Authialize.git',
    :tag => s.version.to_s
  }
  s.resource_bundles      = {
    'Authialize' => [
      'Authialize/Assets/*.png',
      'Authialize/Resources/*.lproj'
    ]
  }

  #s.default_subspecs = 'Core', 'Facebook', 'LinkedIn'

  ### Subspecs ###

  s.subspec 'Core' do |ss|
    ss.source_files         = 'Authialize/Classes/*.{h,m,swift}'
    ss.private_header_files = 'Authialize/Classes/*+Private.h'

    ss.dependency 'PromiseKit', '~> 3.0'
  end

  s.subspec 'Facebook' do |ss|
    ss.source_files             = 'Authialize/Classes/Providers/Facebook/*.{h,m,swift}'
    ss.private_header_files     = 'Authialize/Classes/Providers/Facebook/*+Private.h'

    ss.dependency 'Authialize/Core'

    ss.dependency 'FBSDKLoginKit'
  end

  s.subspec 'GooglePlus' do |ss|
    ss.source_files             = 'Authialize/Classes/Providers/GooglePlus/*.{h,m,swift}'
    ss.private_header_files     = 'Authialize/Classes/Providers/GooglePlus/*+Private.h'

    ss.dependency 'Authialize/Core'

    ss.dependency 'Google/SignIn'
  end

  s.subspec 'LinkedIn' do |ss|
    ss.source_files             = 'Authialize/Classes/Providers/LinkedIn/*.{h,m,swift}'
    ss.private_header_files     = 'Authialize/Classes/Providers/LinkedIn/*+Private.h'

    ss.dependency 'Authialize/Core'

    # LinkedIn iOS SDK
    ss.ios.preserve_paths       = 'Authialize/Frameworks/*.framework'
    ss.vendored_frameworks      = 'Authialize/Frameworks/linkedin-sdk.framework'
    ss.ios.resource             = 'Authialize/Frameworks/linkedin-sdk.framework'
    ss.ios.xcconfig             = {
      'LD_RUNPATH_SEARCH_PATHS' => '"$(PODS_ROOT)/Authialize/Authialize/Frameworks"'
    }
  end

end

