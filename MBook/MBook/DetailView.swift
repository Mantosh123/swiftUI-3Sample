//
//  DetailView.swift
//  MBook
//
//  Created by Mantosh Kumar on 06/10/24.
//

import SwiftData
import SwiftUI

struct DetailView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    var book: Book
    
    var body: some View {

//        NavigationStack {
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    Image(book.genre)
                        .resizable()
                        .scaledToFit()
                    
                    Text(book.genre.uppercased())
                        .fontWeight(.black)
                        .padding(10)
                        .foregroundColor(.white)
                        .offset(x: -10, y: -10)
                }
                
                Text(book.author)
                    .font(.title)
                Text(book.review)
                    .padding()
                RatingView(rating: .constant(book.rating))
                    .font(.largeTitle)
            }.navigationTitle(book.title)
                .navigationBarTitleDisplayMode(.inline)
                .scrollBounceBehavior(.basedOnSize)
                .alert("Delete book", isPresented: $showingDeleteAlert) {
                    Button("Delete", role: .destructive) { deleteBook() }
                    Button("Cancel", role: .cancel) {}
                } message: {
                    Text("Are you sure you want to delete this book?")
                }
                .toolbar {
                    Button("Delete this book", systemImage: "trash") {
                        showingDeleteAlert = true
                    }
                }
//        }
    }
    
    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
}

//#Preview {
//    do {
//        let config = ModelConfiguration(isStoredInMemoryOnly: true)
//        let conttainer = try ModelContainer(for: Book.self, configurations: config)
//        let example = Book(title: "Test Book", author: "Test autor", genre: "Test autor", review: "this book is good", rating: 4)
//        
//        return DetailView(book: example)
//            .modelContainer(conttainer)
//    } catch {
//        return Text("faild to create preview: \(error.localizedDescription)")
//    }
//}
