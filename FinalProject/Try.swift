//
//  Try.swift
//  FinalProject
//
//  Created by User11 on 2021/1/14.
//

import SwiftUI
import WaterfallGrid
struct Try: View {
    var body: some View {
        WaterfallGrid((1..<4), id: \.self) { index in
          Image("\(index)")
            .resizable()
            .aspectRatio(contentMode: .fit)
        }
    }
}

struct Try_Previews: PreviewProvider {
    static var previews: some View {
        Try()
    }
}
