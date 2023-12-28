//
//  DateFormatView.swift
//  Recipe Management
//
//  Created by Haider Muhammed on 27/12/2023.
//

import SwiftUI

struct DateFormatView: View {
    @Binding var currentDate: Date
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 5) {
                Text(currentDate.format("MMMM"))
                    .foregroundStyle(Color(.systemBlue))
                
                Text(currentDate.format("YYYY"))
                    .foregroundStyle(.gray)
            }
            .font(.title3.bold())
            
            Text(currentDate.formatted(date: .complete, time: .omitted))
                .font(.callout)
                .fontWeight(.semibold)
                .textScale(.secondary)
                .foregroundStyle(.gray)
        }
        .hSpacing(.leading)
        .padding(15)
    }
}
