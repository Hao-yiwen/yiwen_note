//
//  ContentView.swift
//  yiwen_note
//
//  Created by yw.hao on 2023/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text(NSLocalizedString("Page Title", comment: ""))
                    .foregroundStyle(.purple)
                    .fontWeight(.bold)
                    .padding([.leading, .top], 20)
                    .font(.largeTitle)
                Spacer()
            }
            VStack {
                
            }
            Spacer()
        }
        .background(Color(UIColor.systemGroupedBackground))  // 设置背景色
    }
}

#Preview {
    ContentView()
}
