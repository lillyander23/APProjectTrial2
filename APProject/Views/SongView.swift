//
//  SongView.swift
//  FINAL PROJECT.1
//
//  Created by Lillian Anderson23 on 4/9/23.
//

import Foundation

import SwiftUI


struct SongView: View {
    @StateObject var musicManager = MusicManager()
    @State var isFavorites: Bool = false
            
    var body: some View {

                VStack{
                    List(0..<musicManager.songs.count, id: \.self) { index in
                        SelectedSongs(musicManager: musicManager, index: index)
                    }
                    
                }
                //                                    Binding( //created custom binding to connect SelectedSongs SongStored and SongView so they can store and pass data and display changes to that data on the SongView, followed this to create the custom binding https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-custom-bindings, this allowed the function filtered to function
                                      //                                        get: { songs[index] },
                                      //                                        set: {
                                      ////                                            print(songs[index].id)
                                      //                                            _ = songs.firstIndex{$0.id == songs[index].id}! //error occours when heart is liked
                                      //                                            musicManager.allSongs[index] = $0
                                      //                                        }
                                      //                                    )
                                      
//            .toolbar{
//                Button(isFavorites ? "All Songs" : "Liked Songs"){ //this button is the toggle between the filtered and unfiltered view
//                    isFavorites.toggle()
//                    musicManager.filter(liked: isFavorites)
//                }
//            }
            .onAppear{

                musicManager.filter(liked: isFavorites)}
    }

}
