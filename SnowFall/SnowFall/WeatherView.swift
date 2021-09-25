//
//  WeatherView.swift
//  SnowFall
//
//  Created by Lyvennitha on 13/07/21.
//

import Foundation
import SwiftUI

struct WeatherView: View{
    @Binding var topColor: Color
    @Binding var bottomColor: Color
    @Binding var imageSe: String
    
    var body: some View{
        ZStack{
           LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .top, endPoint: .bottom)
            VStack(spacing: 10.0){
                Text("Wednesday, 14th july")
                    .fontWeight(.bold)
                    .font(.system(size: 17))
                    .foregroundColor(Color.white)
            Image(imageSe)
                .resizable()
                .frame(width: 150, height: 150)
                .scaledToFit()
            Text("7°")
                .fontWeight(.thin)
                    .font(.system(size: 80))
                    .foregroundColor(Color.white)
            }
           
        }
        .edgesIgnoringSafeArea([.top, .bottom])
        //.background(Image("Rain"))
    }
}

//struct WeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        //WeatherView(topColor: Color("ThunderBottm"), bottomColor: Color("ThunderBottm"), imageSe: "Thunder")
//    }
//}
