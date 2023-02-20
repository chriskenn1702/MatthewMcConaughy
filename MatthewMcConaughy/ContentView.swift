//
//  ContentView.swift
//  MatthewMcConaughy
//
//  Created by Christopher Kennedy on 2/20/23.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State var numOfAlright = 1
    @State private var audioPlayer: AVAudioPlayer!
    var body: some View {
        VStack {
            Text("How is Matt?")
                .font(.largeTitle)
                .fontWeight(.black)
            Image("Matt")
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .shadow(radius: 30)
            Spacer()
            Stepper("How Alright is Matt?", value: $numOfAlright, in: 1...5)
                .font(.title2)
            Text("\(numOfAlright)")
                .font(.largeTitle)
            Spacer()
            Button("Tell Me!"){
                playSound(soundName: "alright")
            }
                .buttonStyle(.bordered)
                .tint(.gray)
                .foregroundColor(.blue)
            
            
        }
        .padding()
    }
    func playSound(soundName: String){
        guard let soundFile = NSDataAsset(name: soundName) else{
            print("😧 Could not read file named \(soundName)")
            return
        }
        do{
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.numberOfLoops = numOfAlright-1
            audioPlayer.play()
        } catch{
            print("🤬 ERROR: \(error.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
