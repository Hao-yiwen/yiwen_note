//
//  Item.swift
//  yiwen_note
//
//  Created by yw.hao on 2023/10/26.
//

import Foundation

struct Tip: Identifiable {
    var id = UUID()
    var content:String
    var remark: String
    var isReminderOn: Bool
}
