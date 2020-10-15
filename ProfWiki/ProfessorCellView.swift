//
//  ProfessorCellView.swift
//  ProfWiki
//
//  Created by Harjas Monga on 10/13/20.
//

import SwiftUI

struct ProfessorCellView: View {
    let professor: Professor
    @StateObject private var loader: ImageLoader
    
    init(professor: Professor) {
        self.professor = professor
        _loader = StateObject(wrappedValue: ImageLoader(path: professor.imageurl))
    }
    
    var body: some View {
        ZStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Professor")
                        .font(.footnote)
                    Text(professor.firstname)
                        .font(.title)
                    Text(professor.lastname)
                        .font(.largeTitle)
                        .bold()
                }
                Spacer()
                Image(uiImage: loader.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 200)
            }
            NavigationLink( destination: ProfessorDetailView(professor: professor, image: loader.image)) {
                EmptyView()
            }.buttonStyle(PlainButtonStyle())
        }
        .onAppear(perform: {
            loader.load()
        })
    }
}

struct ProfessorCellView_Previews: PreviewProvider {
    static var previews: some View {
        let dusnmore = Professor(id: 18, firstname: "Buster", lastname: "Dusmore", imageurl: "https://www.cs.purdue.edu/people/images/small/faculty/bxd.jpg")
        ProfessorCellView(professor: dusnmore)
    }
}
