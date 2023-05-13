//
//  SelectedSongs.swift
//  APProject
//
//  Created by Lillian Anderson23 on 4/19/23.
//

import SwiftUI

struct SelectedSongs: View{
    @ObservedObject var musicManager : MusicManager
    
  @State var index: Int
    
    var body: some View{
        

        //used to store the details of songView
        ZStack{
        
            VStack{
               
                Text(musicManager.songs[index].artistName)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .foregroundColor(Color("AccentColor"))
                Spacer()
                Text(musicManager.songs[index].songName)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .foregroundColor(Color("AccentColor"))
                
                AsyncImage(
                    url: URL(string:musicManager.songs[index].artworkUrl100)!,
                    content: { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(height:150)
                            .cornerRadius(12)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                HStack {
                    Text("Release Date: \(musicManager.songs[index].releaseDate)")
                        .font(.subheadline)
                        .foregroundColor(Color("AccentColor"))
                    
                }
               
                }
                HStack{
                    NavigationLink {
                        DetailView(musicManager: musicManager, index: index)
                    } label: {
                        Text("")
                    }
                    
             
                        
                        
                    }
                    
                }
        .onAppear{
            print(index)
        }
                
            }
            
        }
        
    
    

