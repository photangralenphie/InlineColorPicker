import SwiftUI

@available(iOS 15.0, *)
public struct InlineColorPicker: View {
    
    @Binding public var colorIndex: Int
    
    @State public var pickerStyle: ColorPickerStyle
    @State public var systemImage: String
    @State public var description: String
    
    public init(colorIndex: Binding<Int>, pickerStyle: ColorPickerStyle, systemImage: String = "paintbrush", description: String = "Accent Color:") {
        _colorIndex = colorIndex
        self.pickerStyle = pickerStyle
        self.systemImage = systemImage
        self.description = description
    }
    
    public var body: some View {
        VStack {
            if pickerStyle == .expanded {
                HStack {
                    Label(description, systemImage: systemImage)
                    Spacer()
                    Text(GetColorByID(colorIndex).description.capitalized)
                        .foregroundColor(GetColorByID(colorIndex))
                }
            }

            HStack {
                ForEach(availibleColors, id: \.self) { color in
                    Circle()
                        .strokeBorder(GetColorByID(colorIndex) == color ? Color.gray : color , lineWidth: 3)
                        .background {
                            if (color == Color.primary) {
                                Image(systemName: "circle.righthalf.fill")
                                    .imageScale(.large)
                            } else {
                                Circle().foregroundColor(color)
                            }
                        }
                        .padding(.horizontal, -13)
                        .onTapGesture {
                            colorIndex = availibleColors.firstIndex(of: color)!
                        }
                }
            }
        }
        .padding(.vertical, 7)
    }
}

public enum ColorPickerStyle {
    case slim, expanded
}

fileprivate let availibleColors = [Color.blue, Color.cyan, Color.mint, Color.green, Color.yellow, Color.orange, Color.red, Color.purple, Color.indigo, Color.primary]

public func GetColorByID(_ ID: Int) -> Color {
    return availibleColors[ID]
}
