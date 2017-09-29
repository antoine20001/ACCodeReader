#
# Be sure to run `pod lib lint ACCodeReader.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ACCodeReader'
  s.version          = '1.1.0'
  s.summary          = 'An UIView subclass to scan code'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
An UIView subclass to scan barcode.
Currently, you can scan :
- AVMetadataObjectTypeQRCode
- AVMetadataObjectTypeEAN8Code
- AVMetadataObjectTypeUPCECode
- AVMetadataObjectTypeAztecCode
- AVMetadataObjectTypeEAN13Code
- AVMetadataObjectTypeITF14Code
- AVMetadataObjectTypeCode39Code
- AVMetadataObjectTypeCode93Code
- AVMetadataObjectTypeEAN8Code
- AVMetadataObjectTypePDF417Code
- AVMetadataObjectTypeCode128Code
- AVMetadataObjectTypeDataMatrixCode
- AVMetadataObjectTypeCode39Mod43Code
- AVMetadataObjectTypeInterleaved2of5Code
                       DESC

  s.homepage         = 'https://github.com/antoine20001/ACCodeReader'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'antoine20001' => 'antoine.cointepas@orange.fr' }
  s.source           = { :git => 'https://github.com/antoine20001/ACCodeReader.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/antoine20001'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ACCodeReader/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ACCodeReader' => ['ACCodeReader/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'AVFoundation', 'AudioToolbox'
  # s.dependency 'AFNetworking', '~> 2.3'
end
