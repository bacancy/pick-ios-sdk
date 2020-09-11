
Pod::Spec.new do |s|

  s.name         = "PickSDK"
  s.version      = "0.0.1"
  s.summary      = "Official Pick SDK for iOS to access Pick API."

  s.description  = <<-DESC
                   The Pick SDK for iOS framework provides:
                   * Access to the Pick API
                   * Working with Access Tokens and User Profiles
                   DESC

  s.homepage     = "https://bitbucket.org/pickride/pick-ios-sdk"
  s.license      = "Copyright © 2018 Pick Ride Network, Inc."
  s.author       = "Pick Ride Network, Inc."

  s.platform     = :ios, "10.0"

  s.source       = { :git => "git@bitbucket.org:pickride/pick-ios-sdk.git", :tag => "#{s.version}" }
  s.source_files  = "PickSDK/**/*.{swift,h}"
  s.requires_arc = true
  s.swift_version = "4.2"

  s.dependency 'Alamofire', '4.8.1'
  s.dependency 'ObjectMapper', '3.4.2'
  s.dependency 'AlamofireObjectMapper', '5.2.0'

end
