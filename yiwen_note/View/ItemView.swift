//
//  ItemView.swift
//  yiwen_note
//
//  Created by yw.hao on 2023/10/26.
//

import SwiftUI

struct ItemView: View {
    @State private var isReminderOn: Bool = false

    var body: some View {
        VStack {
            Toggle("", isOn: $isReminderOn)
           .toggleStyle(CheckboxToggleStyle())
        }
        .padding()
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: configuration.isOn ? "largecircle.fill.circle" : "circle")
            .resizable()
            .frame(width: 24, height: 24)
            .foregroundColor(configuration.isOn ? .blue : .gray)
            .onTapGesture {
                configuration.isOn.toggle()
            }
    }
}

#Preview {
    ItemView()
}
