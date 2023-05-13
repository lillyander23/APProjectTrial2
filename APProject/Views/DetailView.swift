//
//  DetailView.swift
//  APProject
//
//  Created by Lillian Anderson23 on 4/9/23.
//

import Foundation
import AVFoundation
import SwiftUI

struct DetailView: View {
    @ObservedObject var musicManager: MusicManager
    @State var index : Int //once again creating a connection between SongStored and DetailView
    
    @State var isPlaying = false
 
    var body: some View {
        
    
        VStack{
            ZStack{
                AsyncImage(
                    url: URL(string:musicManager.allSongs[index].artworkUrl100)!,
                    content: { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(height: UIScreen.main.bounds.height / 3)
                            .cornerRadius(30)
                    },
                    placeholder: {
                        ProgressView()
                        
                    }
                )
            }
                Spacer()
            Text(musicManager.allSongs[index].artistName)
                    .fontWeight(.bold)
                    .font(.custom("AmericanTypewriter",
                                  fixedSize: 35))
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.regular)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .multilineTextAlignment(.center)
                    .padding(10)
                
                Text("Song Details:")
                    .font(.custom("AmericanTypewriter",
                                  fixedSize: 25))
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.semibold)
                    .frame(maxWidth: 350, maxHeight: 30)
                    .multilineTextAlignment(.center)
            Text(musicManager.allSongs[index].songName)
                    .font(.system(size: 20))
                    .minimumScaleFactor(0.01)
                    .frame(maxWidth:.infinity, maxHeight:.infinity)
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    

                   
            
            Button(action: { //attaches an action to the play and pause button through the variable isPlaying
                isPlaying.toggle()
                if isPlaying {
                    musicManager.playSong(song: musicManager.allSongs[index])
                } else {
                    musicManager.stopSong()
                }
            }) {
                Image(systemName: isPlaying ? "pause" : "play.fill").resizable() //this displays the play and pause button and uses the variable isPlaying
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20.0, height: 20.0)
                
                
            }
            Button(action: {
                musicManager.updateLike(song: musicManager.allSongs[index])
            }
            ) {
                Image(systemName: musicManager.allSongs[index].liked ? "heart.fill" : "heart").resizable() //this displays the heart button and uses the variable song to pass in songStored
            }
  
            .frame(maxWidth: 20, maxHeight: 20)
            .padding()
            
       
            }
        }
    
}


