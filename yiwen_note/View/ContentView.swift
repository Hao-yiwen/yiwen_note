//
//  ContentView.swift
//  yiwen_note
//
//  Created by yw.hao on 2023/10/26.
//

import SwiftUI

struct ContentView: View {
    @State private var addTips = false
    @State private var tips: [Tip] = []
    
    var body: some View {
        VStack(alignment: .leading){
            ScrollView {
                HStack {
                    Text(NSLocalizedString("Page title", comment: ""))
                        .foregroundStyle(.purple)
                        .fontWeight(.bold)
                        .padding([.leading, .top], 20)
                        .font(.largeTitle)
                    Spacer()
                }
                VStack {
                    ForEach($tips.indices, id: \.self) { index in
                        ItemView(isReminderOn: $tips[index].isReminderOn, content: $tips[index].content, remark: $tips[index].remark)
                    }
                }
                .padding()
            }
            HStack {
                Button(action: {
                    let newTip = Tip(content: "", remark: "", isReminderOn: false)
                    tips.append(newTip)
                }){
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.purple)
                            .padding(.leading, 30)
                        Text("新提醒事项")
                            .foregroundStyle(.purple)
                            .font(.title2)
                    }
                }
                Spacer()
            }
        }
        .background(Color(UIColor.systemGroupedBackground))  // 设置背景色
        .onTapGesture {
            hideKeyboard()
        }
        
    }
    
    // 隐藏键盘的方法
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    ContentView()
}
