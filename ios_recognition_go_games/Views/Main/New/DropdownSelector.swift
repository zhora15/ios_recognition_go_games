//
//  DropdownSelector.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 04.03.2023.
//

import SwiftUI

struct DropdownSelector: View {
    @State private var shouldShowDropdown = false
    @State private var selectedOption: Int? = nil
    var placeholder: String
    var options: [Int]
    var onOptionSelected: ((_ option: Int) -> Void)?
    private let buttonHeight: CGFloat = 45
    
    var body: some View {
        Button(action: {
            self.shouldShowDropdown.toggle()
        }) {
            HStack {
                if selectedOption == nil {
                    Text(placeholder)
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray)
                } else {
                    Text("\(selectedOption!)")
                        .font(.system(size: 14))
                        .foregroundColor(Color.black)
                }
                
                
                Spacer()
                
                Image(systemName: self.shouldShowDropdown ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                    .resizable()
                    .frame(width: 9, height: 5)
                    .font(Font.system(size: 9, weight: .medium))
                    .foregroundColor(Color.black)
            }
        }
        .padding(.horizontal)
        .cornerRadius(5)
        .frame(maxWidth: .infinity, maxHeight: self.buttonHeight)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray, lineWidth: 1)
        )
        .overlay(
            VStack {
                if self.shouldShowDropdown {
                    Spacer(minLength: buttonHeight + 10)
                    Dropdown(options: self.options, onOptionSelected: { option in
                        shouldShowDropdown = false
                        selectedOption = option
                        self.onOptionSelected?(option)
                    })
                    
                }
            }.animation(.easeInOut(duration: 0.2), value: self.shouldShowDropdown), alignment: .topLeading
        )
        .background(
            RoundedRectangle(cornerRadius: 5).fill(Color.white)
        )
    }
}

struct Dropdown: View {
    var options: [Int]
    var onOptionSelected: ((_ option: Int) -> Void)?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(self.options, id: \.self) { option in
                    DropdownRow(option: option, onOptionSelected: self.onOptionSelected)
                }
            }
        }
        .frame(minHeight: CGFloat(options.count) * 30, maxHeight: 250)
        .padding(.vertical, 5)
        .background(Color.white)
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

struct DropdownRow: View {
    var option: Int
    var onOptionSelected: ((_ option: Int) -> Void)?
    
    var body: some View {
        Button(action: {
            if let onOptionSelected = self.onOptionSelected {
                onOptionSelected(self.option)
            }
        }) {
            HStack {
                Text("\(self.option)")
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 5)
    }
}

struct DropdownSelector_Previews: PreviewProvider {
    
    static let options: [Int] = [
        9,13,19
    ]
    
    static var previews: some View {
        Group {
            DropdownSelector(
                placeholder: "Screen size",
                options: options,
                onOptionSelected: { option in
                    print(option)
                })
            .padding(.horizontal)
        }
    }
}
