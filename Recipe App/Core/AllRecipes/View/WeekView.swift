//
//  WeekView.swift
//  Recipe Management
//
//  Created by Haider Muhammed on 27/12/2023.
//

import SwiftUI

struct WeekView: View {
    var week: [WeekDay]
    @Binding var currentDate: Date
    @Namespace private var animation
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(week) { day in
                VStack(spacing: 8) {
                    Text(day.date.format("E"))
                        .font(.callout)
                        .fontWeight(.medium)
                        .textScale(.secondary)
                        .foregroundStyle(.gray)
                    
                    Text(day.date.format("dd"))
                        .font(.callout)
                        .textScale(.secondary)
                        .foregroundStyle(isSameDate(day.date, currentDate) ? .white : .gray)
                        .frame(width: 35, height: 35)
                        .background {
                            if isSameDate(day.date, currentDate) {
                                Circle()
                                    .fill(.blue)
                                    .matchedGeometryEffect(id: "TABINDICATOR", in: animation)
                            }
                            
                            if day.date.isTody {
                                Circle()
                                    .fill(.cyan)
                                    .frame(width: 5, height: 5)
                                    .vSpacing(.bottom)
                                    .offset(y: 12)
                            }
                        }
                        .background(.white.shadow(.drop(radius: 1)), in: .circle)
                    
                }
                .hSpacing(.center)
                .containerShape(.rect)
                .onTapGesture {
                    withAnimation(.snappy) {
                        self.currentDate = day.date
                    }
                }
            }
        }
    }
}


