##SKMultiLineAttributedTextLabel

SpriteKit SKLabelNode with multiline and attributedText.

## Requirements

- iOS 8+ / tvOS 9+
- Xcode 8+

## Usage
```swift
let myspritelabel = SKMultiLineAttributedTextLabel(text:"Peter Piper picked a peck of pickled pepper", width: 500, height: 700, color: UIColor.clear)

self.addChild(myspritelabel)

self.myspritelabel.attributedText(index: 0).fontColor = UIColor.red
```
## License
`SKMultiLineAttributedTextLabel` is available under the MIT license. See the LICENSE file for more info.
