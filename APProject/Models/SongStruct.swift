//
//  SongStruct.swift
//  APProject
//
//  Created by Lillian Anderson23 on 4/12/23.
//

import Foundation


struct SongStored {
    
    let id: UUID
    var artistName: String
    var songName: String
    var releaseDate: String
    var artworkUrl100: String
    var liked: Bool
    
    init(id: UUID = UUID(), artistName: String, songName: String, releaseDate: String, artworkUrl100: String, liked: Bool) { //initilized the values used in SongStored
        self.id = id
        self.artistName = artistName
        self.songName = songName
        self.releaseDate = releaseDate
        self.artworkUrl100 = artworkUrl100
        self.liked = liked
    }
    
}





