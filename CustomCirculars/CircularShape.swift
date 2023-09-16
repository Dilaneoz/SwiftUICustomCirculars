//
//  CircularShape.swift
//  CustomCirculars
//
//  Created by Atil Samancioglu on 7.08.2022.
//

import Foundation
import SwiftUI

struct CircularShape : Shape { // burada default olarak view yazılıydı onu sildik shape yaptık çünkü view değil shape oluşturucaz
    var percent : Double
    var startAngle : Double
    
    // percent e göre bi animasyon yapılacağını swiftui da aşağıdaki kodlarla yazıyoruz
    typealias AnimatableData = Double // AnimatableData animasyon yapılacak veri swiftte tanımlı
    var animatableData: Double { // burada animatableData nın değerini atıyoruz. değeri percent
        get {
            return percent
        }
        set { // eğer percent değişirse yeni değer ne gelirse onu ver
            percent = newValue
        }
    }
    
    
    // bu initiliazer da aldığımız değerleri kendi structımız içindeki propertylerde "var percent : Double" bu şekilde saklayabiliriz. böylece artık bi shape oluştururken bize bi başlangıç açısı bi de yüzde kaçının dolucağı sorulacak. bu değerleri aşağıdaki fonksiyona vericez
    init(percent: Double=100, startAngle: Double = -90){ // percent yüzde kaçının dolucağı, -90 dersek sol köşeden başlıycak
        self.percent = percent
        self.startAngle = startAngle
    }
    
    static func percentToAngle(percent: Double, startAngle:Double) -> Double {
        return (percent / 100 * 360 + startAngle) // yüzde kaçı dolu olucaksa ona göre dönücek
    }
    
    func path(in rect: CGRect) -> Path { // patika çiziceğimiz 2 boyutlu şeklin yolunu yani nasıl çizileceğini belirtir
        let width = rect.width // rect.width dediğimizde genişliği alabiliyoruz
        let height = rect.height
        let radius = min(width,height) / 2 // yarıçapı ne kadar olucak. width ve height ın minimumunu al ve ikiye böl
        let center = CGPoint(x: width/2, y: height/2) // şeklin merkezi nerede olucak
        let endAngle = Self.percentToAngle(percent: percent, startAngle: startAngle) // startAngle başlangıç açısı, endAngle bitiş açısının ne olucağı
        
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: Angle(degrees: startAngle), endAngle: Angle(degrees: endAngle), clockwise: false) // clockwise saat yönünde mi gideceği
            
        }
    }
    
}
