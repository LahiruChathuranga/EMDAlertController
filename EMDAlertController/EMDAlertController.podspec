
Pod::Spec.new do |spec|
  spec.name         = "EMDAlertController"
  spec.version      = "0.1.8"
  spec.summary      = "This is a amazing alert library."
  spec.description  = "This is a nice library for IOS.it has several custom Alerts."
  spec.homepage     = "https://github.com/LahiruChathuranga/EMDAlertController"
  spec.license      = { :type => "MIT", :file => "LICENSE" }  
  spec.author             = { "Lahiru Chathuranga" => "hiru.wlc@gmail.com" }
  spec.platform     = :ios, "11.0"
  spec.swift_version = '4.0'
  spec.source       = { :git => "https://github.com/LahiruChathuranga/EMDAlertController.git", :tag => "0.1.8" }
  spec.source_files  = "EMDAlertController/EMDAlertController/CustomAlertClasses/*.{swift}"
  spec.frameworks = "UIKit", "PopupDialog"
  spec.resources = "EMDAlertController/EMDAlertController/CustomAlertXibs/*.*"
  spec.resource_bundles = {
    'EMDAlertController' => ['EMDAlertController/EMDAlertController/CustomAlertXibs/Images/*.*']
  }
  spec. static_framework = true
  spec.dependency 'PopupDialog', '~> 1.0.0'
end
