#
#  Be sure to run `pod spec lint PDCKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|  
            s.name         = "PDCKit"
            s.version      = "1.0.0"
            s.summary      = "MyKit and CocoaKit extend"
            s.homepage     = "https://github.com:doubleckeck"
            s.license      = { :type => "MIT", :file => 'LICENSE.md' }
            s.author       = { "PlutoY" => "kuaileainits@163.com" }
            s.platform     = :ios, "7.0"
            s.source       = { :git => "https://github.com:doubleckeck/PDCKit.git", :tag => s.version}
            s.frameworks   = 'UIKit'
            s.source_files = "PDCKit/PDCAdd/*.{h,m}"
            s.resource     = "PDCKit/PDCAdd/**"
            s.requires_arc = true
            end  
