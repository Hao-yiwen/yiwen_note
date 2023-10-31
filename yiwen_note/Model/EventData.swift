//
//  EventData.swift
//  yiwen_note
//
//  Created by yw.hao on 2023/10/31.
//

import SwiftUI

class EventData: ObservableObject {
    @Published var events: [Event] = [
        Event(content: "跑步", remark: "每日五公里")
    ]
    
    func delete(_ event: Event) {
        events.removeAll{
            $0.id == event.id
        }
    }
    
    func add(_ event: Event){
        events.append(event)
    }
}
