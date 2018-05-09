# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target 'Skor Gift' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Skor Gift
pod 'EAIntroView', '~> 2.10.0'
pod 'PagingMenuController'
pod 'SnapKit', '~> 4.0.0'
pod 'Firebase/Core'
pod 'Firebase/Messaging'

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if ['PagingMenuController'].include? target.name
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '3.2'
                config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
            end
            else
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.0'
                config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
            end
        end
    end
end

end
