using_bundler = defined? Bundler
unless using_bundler
  puts "\nPlease re-run using:".red
  puts "  bundle exec pod install\n\n"
  exit(1)
end

# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

use_modular_headers!

# ignore all warnings from all pods
inhibit_all_warnings!

# Share pods

pod 'SwiftLint', '0.34.0'
pod 'Swinject', '2.6.2'

target 'TransactionViewer' do
  # Pods for TransactionViewer
end

target 'TransactionViewerTests' do
  # Pods for testing
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    # Remove deployment targets from pods, inherit from project
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end