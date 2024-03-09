# InlineColorPicker

 - Uses the official SwiftUI colors
 - Supports Darkmode
 - Included Colors: Blue, Cyan, Mint, Green, Yellow, Orange, Red, Purple, Indigo, Primary (Black in Lightmode, White in Darkmode)

## Styles
### ```.slim```
![Screenshot 2024-02-18 at 11 14 28](https://github.com/photangralenphie/InlineColorPicker/assets/64361476/ed0f2fcb-26e1-40da-9874-70be9a7348e6)![Screenshot 2024-02-18 at 11 17 54](https://github.com/photangralenphie/InlineColorPicker/assets/64361476/d91d3b78-7e87-41ef-8dec-4dbf1914a23b)

### ```.expanded```
![Screenshot 2024-02-18 at 11 10 40](https://github.com/photangralenphie/InlineColorPicker/assets/64361476/2405069f-1658-4e1e-8d8b-033620c66615)![Screenshot 2024-02-18 at 11 19 58](https://github.com/photangralenphie/InlineColorPicker/assets/64361476/44b1a234-f6de-4445-8c2e-127c05e05be2)


## Usage
Import Package
```swift
import InlineColorPicker
```

The InlineColorPicker binds to an ID.  
If you want to persist your selected color can use AppStorage.
```swift
@AppStorage("accentColorID") private var accentColorID: Int = 0

var body: some View {
    Form {
        InlineColorPicker(colorIndex: $accentColorID, pickerStyle: .expanded)
    }
}
```

Use your selected Color
```swift
ContentView()
    .tint(GetColorById(accentColorID))
```
### Optional Parameters for ```.expanded``` style
 - ```systemImage: String```  
  -> Name of a SFSymbol which is displayed in the top leading corner (default: "paintbrush")  
 - ```description: String```  
  -> String which is displayed next to the Icon (default: "Accent Color:")

## Requirements
 - iOS 15+
 - iOS 17+ for SensoryFeedback

## Licence
 - MIT License
