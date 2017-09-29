# ACCodeReader

[![CI Status](http://img.shields.io/travis/antoine.cointepas@orange.fr/ACCodeReader.svg?style=flat)](https://travis-ci.org/antoine.cointepas@orange.fr/ACCodeReader)
[![Version](https://img.shields.io/cocoapods/v/ACCodeReader.svg?style=flat)](http://cocoapods.org/pods/ACCodeReader)
[![License](https://img.shields.io/cocoapods/l/ACCodeReader.svg?style=flat)](http://cocoapods.org/pods/ACCodeReader)
[![Platform](https://img.shields.io/cocoapods/p/ACCodeReader.svg?style=flat)](http://cocoapods.org/pods/ACCodeReader)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ACCodeReader is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ACCodeReader"
```

Add a list of supported codes to your readerView:
```ruby
readerView.supportCodeType = [AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeQRCode, AVMetadataObjectTypeDataMatrixCode, AVMetadataObjectTypeUPCECode, AVMetadataObjectTypeAztecCode, AVMetadataObjectTypeITF14Code, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeCode128Code, AVMetadataObjectTypeCode39Mod43Code, AVMetadataObjectTypeInterleaved2of5Code]
```
## Author

antoinecointepas@gmail.com

## License

ACCodeReader is available under the MIT license. See the LICENSE file for more info.
