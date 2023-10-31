import SwiftUI
import UIKit

struct EventList: View {
    @EnvironmentObject var eventData: EventData
    
    var body: some View {
        List {
            
        }
        .navigationBarTitle("提醒事项")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                
            }
        }
        .dismissKeyboardOnTap()
    }
    
    
}

struct DismissKeyboardOnTap: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
    }
}

extension View {
    func dismissKeyboardOnTap() -> some View {
        self.modifier(DismissKeyboardOnTap())
    }
}

struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        EventList()
    }
}
