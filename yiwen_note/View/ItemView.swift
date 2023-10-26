//
//  ItemView.swift
//  yiwen_note
//
//  Created by yw.hao on 2023/10/26.
//

import SwiftUI


struct ItemView: View {
    @Binding var isReminderOn: Bool
    @Binding var content: String
    @Binding var remark: String
    
    @State private var isRemarkVisible: Bool = false
    
    init(isReminderOn: Binding<Bool>, content: Binding<String>, remark: Binding<String>) {
        self._isReminderOn = isReminderOn
        self._content = content
        self._remark = remark
        self._isRemarkVisible = State(initialValue: !remark.wrappedValue.isEmpty)
    }

    var body: some View {
        VStack {
            HStack {
                Toggle("", isOn: $isReminderOn)
                    .toggleStyle(CheckboxToggleStyle())
                    .padding(.trailing, 7)
                VStack {
                    TextField("添加", text: $content)
                        .font(.title3)
                        .padding([.top, .bottom, .trailing])
                    
                    if isRemarkVisible || !remark.isEmpty {
                        TextField("备注", text: $remark)
                            .onAppear { isRemarkVisible = true }
                            .onDisappear { isRemarkVisible = remark.isEmpty ? false : true }
                    }
                }
            }
            Divider()
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
