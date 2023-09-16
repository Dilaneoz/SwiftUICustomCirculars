//
//  Circular.swift
//  CustomCirculars
//
//  Created by Atil Samancioglu on 7.08.2022.
//

import Foundation
import SwiftUI

struct Circular : View {
    let lineWidth : CGFloat
    let backgroundColor : Color
    let foregroundColor : Color // ön plan rengi
    let percentage : Double // yüzde kaçı doluyo diye
    
    var body : some View {
        GeometryReader { geometry in // GeometryReader animasyonlarla çalışmayı etkin hale getirir ve x y düzlemini mümkün kılar, shapelerle çalışırken kullanılır
            ZStack { // üst üste gösterir
                CircularShape() // yuvarlağı oluşturur
                    .stroke(style: StrokeStyle(lineWidth: lineWidth)) // stroke diyerek şekil veririz. lineWidth çemberin çevresindeki çizginin kalınlığı
                    .fill(backgroundColor) //
                CircularShape(percent: percentage)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .fill(foregroundColor) // ön planda yüzde kaçının dolucağını belirliycez
            }
            .animation(.easeIn(duration: 1.0), value: percentage) // ilk kısım animasyonun ne olucağı, ikinci hangi değerle birlikte bu animasyonun olucağı. 1 saniye sürecek bi animasyon ekledik yani yavaş yavaş dolucak 1 sn içinde
            .padding(lineWidth/2) // çember ekrana tam sığacak şekilde küçüldü
        }
    }
}
