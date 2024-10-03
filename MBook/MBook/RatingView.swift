//
//  RatingView.swift
//  MBook
//
//  Created by Mantosh Kumar on 03/10/24.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle( number > rating ? offColor : onColor)
                }
            }
        }.buttonStyle(.plain)
    }
    
    func image(for number: Int) -> Image {
        
        if number > rating {
            return offImage ?? onImage
        } else {
           return onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(3))
}

