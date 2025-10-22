//
//  Midterm Project
//  Liam Christensen
//
//  10/21/25
//

import SwiftUI

struct ContentView: View {
    let subjects = Bundle.main.decode([Subject].self, from: "Data.json")

    var body: some View {
        NavigationStack {
            Text("From Philharmonia's list of instruments.")
            Spacer()
            ForEach(subjects) { subject in
                NavigationLink(destination: InstrumentView(instrument: subject)) {
                    Image(subject.imageName)
                        .resizable()
                        .frame(width: 85, height: 53)
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 20))
                    Text(subject.name)
                    Spacer()
                }
            }
            .navigationTitle("Liam's Orchestra")
        }
    }
}

struct InstrumentView: View {
    @State var instrument: Subject
    
    var body: some View {
        VStack {
            Image(instrument.imageName)
                .resizable()
                .frame(width: 320, height: 200)
            Divider()
                .padding(30)
            Text(instrument.name)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                .padding(10)
            Text(instrument.description)
                .frame(width:320)
        }
    }
}

#Preview {
    ContentView()
}
