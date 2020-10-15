//
//  ContentView.swift
//  ProfWiki
//
//  Created by Harjas Monga on 10/13/20.
//

import SwiftUI

struct ContentView: View {
    @State var profs: [Professor]
    
    var body: some View {
        NavigationView {
            List(profs, id: \.id) { prof in
                ProfessorCellView(professor: prof)

            }
            .navigationBarTitle("Prof Wiki")
        }
        .onAppear(perform: {
            ProfessorService.getAll { (professors) in
                self.profs = professors
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let dunsmore = Professor(id: 18, firstname: "Buster", lastname: "Dusmore", imageurl: "https://www.cs.purdue.edu/people/images/small/faculty/bxd.jpg")
        
        let adams = Professor(id: 4, firstname: "George", lastname: "Adams", imageurl: "https://www.cs.purdue.edu/people/images/small/faculty/gba.jpg")
        
        ContentView(profs: [dunsmore, adams])
    }
}
