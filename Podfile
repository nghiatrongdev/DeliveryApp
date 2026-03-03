platform :ios, '13.0'

target 'DeliveryApp' do
  use_frameworks! :linkage => :static

  pod 'SwiftGen', '~> 6.0'
  pod 'FirebaseAuth'
  pod 'FirebaseFirestore'
  pod 'GoogleSignIn'
  pod 'FBSDKLoginKit'
end

post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      end
    end
  end
end
