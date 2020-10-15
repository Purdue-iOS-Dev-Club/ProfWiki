//
//  ProfessorDetailView.swift
//  ProfWiki
//
//  Created by Harjas Monga on 10/13/20.
//

import SwiftUI

struct ProfessorDetailView: View {
    private let professor: Professor
    private let image: UIImage
    @State private var detail: ProfessorDetail?
    
    init(professor: Professor, image: UIImage) {
        self.professor = professor
        self.image = image
    }
    
    var body: some View {
        VStack {
            Image(uiImage: self.image)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 333)
            if let detail = detail {
                VStack(alignment: .leading) {
                    ProfessorPropertyView(label: "Name", value: "\(detail.firstname + " " + detail.lastname)")
                    ProfessorPropertyView(label: "Email", value: detail.email)
                    ProfessorPropertyView(label: "Office", value: detail.office)
                    if let number = detail.phone {
                        ProfessorPropertyView(label: "Phone", value: number)
                    }
                    if let score = detail.ratemyprofessorscore {
                        ProfessorPropertyView(label: "Score", value: "\(score)")
                    }
                    if let difficulty = detail.difficulty {
                        ProfessorPropertyView(label: "Difficulty", value: "\(difficulty)")
                    }
                    if let education = detail.education {
                        HStack {
                            Text("Education:")
                                .bold()
                            Spacer()
                        }
                        Text(education)
                            .padding(.vertical, 1)
                    }
                }.padding(.horizontal, 16)
            }
        }.onAppear(perform: {
            ProfessorService.getDetail(for: professor) { (detail) in
                self.detail = detail
            }
        })
    }
}

struct ProfessorPropertyView: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text("\(label):")
                .bold()
            Text(value)
            Spacer()
        }.padding(.vertical, 1)
    }
}

struct ProfessorDetailView_Previews: PreviewProvider {
    
    static let dusnmore = Professor(id: 18, firstname: "Buster", lastname: "Dusmore", imageurl: "https://www.cs.purdue.edu/people/images/small/faculty/bxd.jpg")

    static var previews: some View {
        ProfessorDetailView(professor: Self.dusnmore, image: UIImage(systemName: "person") ?? UIImage())
    }
}
