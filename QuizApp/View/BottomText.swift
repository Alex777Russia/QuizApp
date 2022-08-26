//
//  BottomText.swift
//  QuizApp
//
//  Created by Алексей Шевченко on 25.08.2022.
//

import SwiftUI

struct BottomText: View {
    let str: String
    let onClick: () -> Void
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: onClick,
                   label: {
                    Text(str)
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.all)
            })
            
            Spacer()
        } .background(Color.blue.opacity(0.4))
        
    }
}

struct BottomText_Previews: PreviewProvider {
    static var previews: some View {
        BottomText(str: "This is Test Text") {}
    }
}
