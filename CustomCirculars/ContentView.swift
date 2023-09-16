//
//  ContentView.swift
//  CustomCirculars
//
//  Created by Atil Samancioglu on 7.08.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var firstCirclePercentage : Double = 0 // buraya 50 versek yarısı koyu mavi yarısı transparan mavi olurdu
    @State var secondCirclePercentage : Double = 0
    @State var thirdCirclePercentage : Double = 0

    
    var body: some View {
        ZStack{
            Circular(lineWidth: 40,
                     backgroundColor: Color.blue.opacity(0.2), // opacity i 1 yapsak transparan olmazdı
                     foregroundColor: Color.blue,
                     percentage: firstCirclePercentage
            )
            .frame(width: 350, height: 350)
            .onTapGesture { // tıklandığında ne olucağını yazıcaz
                if self.firstCirclePercentage == 0 { // hiç dolu değilken tıklandığında
                    self.firstCirclePercentage = 50 // yarısı dolucak
                } else {
                    self.firstCirclePercentage = 0 // yarısı doluyken tıklandığında 0 a geri düşücek
                }
            }
            
            Circular(lineWidth: 40,
                     backgroundColor: Color.red.opacity(0.2),
                     foregroundColor: Color.red,
                     percentage: secondCirclePercentage
            )
            .frame(width: 250, height: 250)
            .onTapGesture {
                if self.secondCirclePercentage == 0 {
                    self.secondCirclePercentage = 75
                } else {
                    self.secondCirclePercentage = 0
                }
            }
            
            Circular(lineWidth: 40,
                     backgroundColor: Color.green.opacity(0.2),
                     foregroundColor: Color.green,
                     percentage: thirdCirclePercentage
            )
            .frame(width: 150, height: 150)
            .onTapGesture {
                if self.thirdCirclePercentage == 0 {
                    self.thirdCirclePercentage = 100
                } else {
                    self.thirdCirclePercentage = 0
                }
            }
            
     
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
