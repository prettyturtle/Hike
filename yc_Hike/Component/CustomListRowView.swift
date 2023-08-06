//
//  CustomListRowView.swift
//  yc_Hike
//
//  Created by yc on 2023/08/06.
//

import SwiftUI

struct CustomListRowView: View {
    // MARK: - PROPERTIES
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent {
            // Content
            if let rowContent = rowContent {
                Text(rowContent)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            } else if let rowLinkLabel = rowLinkLabel,
                      let rowLinkDestination = rowLinkDestination,
                      let destinationURL = URL(string: rowLinkDestination) {
                Link(
                    rowLinkLabel,
                    destination: destinationURL
                )
                .foregroundColor(.pink)
                .fontWeight(.heavy)
            } else {
                EmptyView()
            }
            
        } label: {
            // Label
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    
                Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                
                Text(rowLabel)
            }
        }
    }
}

struct CustomListRowView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            CustomListRowView(
                rowLabel: "Designer",
                rowIcon: "paintpalette",
                rowContent: "John Doe",
                rowTintColor: .pink
            )
        }
    }
}
