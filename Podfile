install! 'cocoapods', :deterministic_uuids => false

# ignore all warnings from all pods
inhibit_all_warnings!

# Sources
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/AppLovin/Public-Cocoapods-Specs.git'
source 'https://github.com/KATracking/AppicAdSpecs'

minVersion = '12.4'

# Uncomment the next line to define a global platform for your project
platform :ios, minVersion

target 'AdManagerWrapper' do
  use_frameworks!
  pod 'AmazonPublisherServicesSDK', '4.3.1'
  pod 'AppLovinMediationGoogleAdapter', '9.9.0.0'

end

post_install do |pi|
   pi.pods_project.targets.each do |t|
       t.build_configurations.each do |bc|
           bc.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = minVersion
       end
   end
end
