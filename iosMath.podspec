Pod::Spec.new do |s|
  s.name                      = 'iosMath'
  s.version                   = '2.2.0'
  s.summary                   = 'Math equation rendering for iOS and macOS'
  s.description               = 'iosMath is a library for typesetting math formulas in iOS and macOS using CoreText. It implements the TeX typesetting algorithm on top of OpenType math fonts.'
  s.homepage                  = 'https://github.com/kostub/iosMath'
  s.license                   = { :type => 'MIT', :file => 'LICENSE' }
  s.author                    = { 'MathChat' => '' }
  s.source                    = { :git => 'https://github.com/kostub/iosMath.git', :tag => s.version.to_s }
  s.swift_versions            = ['5.0']

  s.ios.deployment_target     = '15.0'
  s.osx.deployment_target     = '11.0'

  # All source files — includes lib, render, render/internal
  s.source_files              = 'iosMath/lib/*.{h,m}', 'iosMath/render/*.{h,m}', 'iosMath/render/internal/*.{h,m}'

  # Public headers (matches module.modulemap)
  s.public_header_files       = [
    'iosMath/render/MTMathUILabel.h',
    'iosMath/render/MTFont.h',
    'iosMath/render/MTFontManager.h',
    'iosMath/render/MTMathListDisplay.h',
    'iosMath/lib/MTMathList.h',
    'iosMath/lib/MTMathAtomFactory.h',
    'iosMath/lib/MTMathListBuilder.h',
    'iosMath/lib/MTMathListIndex.h',
  ]

  # Exclude platform-specific files
  s.ios.exclude_files         = 'iosMath/render/NS*.{h,m}', 'iosMath/render/MTLabel.{h,m}'
  s.osx.exclude_files         = 'iosMath/render/UIColor+HexString.{h,m}'

  # Fonts as a resource bundle (CocoaPods best practice)
  s.resource_bundles          = { 'MTFonts' => ['iosMath/fonts/*.otf', 'iosMath/fonts/*.plist'] }

  # Required system frameworks
  s.frameworks                = 'CoreGraphics', 'CoreText', 'QuartzCore', 'Foundation'
  s.ios.framework             = 'UIKit'
  s.osx.framework             = 'AppKit'
end