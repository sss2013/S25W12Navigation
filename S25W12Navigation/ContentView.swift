import SwiftUI

struct ContentView: View{
    @State private var viewModel = SongViewModel()
    
    var body: some View{
        NavigationStack{
            List(viewModel.songs) { song in
                NavigationLink(destination : SongDetailView(song:song)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(song.title)
                                .font(.headline)
                            Text(song.singer)
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
        }
    }
}

struct SingerView: View {
    var body: some View {
        NavigationStack {
            Text("가수 화면")

//            NavigationLink(destination: SingerView()) {
//                Text("노래 화면으로 이동")
//            }
        }
    }
}

struct SongDetailView: View {
    let song: Song

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    Text(song.singer)
                        .font(.title2)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(String(song.rating))
                        .font(.title)
                        .foregroundColor(.yellow)
                }
                .padding(.bottom, 10)

                Text(song.lyrics)
                    .font(.body)
                    .multilineTextAlignment(.leading)
            }
            .padding()
        }
        .navigationTitle(song.title)
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    ContentView()
}
