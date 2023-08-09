//
//  ContentView.swift
//  SwiftUIClock
//
//  Created by Angelos Staboulis on 5/7/21.
//

import SwiftUI

struct ContentView: View {
    @State var date:DateComponents!
    @State var hour:Double! = 0.0
    @State var minute:Double! = 0.0
    @State var second:Int! = 0
    @State var second_value:Double!=0.0
    @State var text_hour = String()
    @State var text_minute = String()
    @State var text_second = String()
    @State var text_full_date = String()
    @State var text_full_time = String()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack{
            Color.blue
            VStack{
                HStack{
                    Text("SwiftUI Clock").font(.largeTitle)
                }
            }.frame(maxHeight:.infinity, alignment: .top)
                .padding(30.0)
            VStack{
                Image("face").resizable().frame(width: 300, height: 300, alignment: .center)
            }
            VStack{
                Image("hand_hour").resizable().frame(width: 15, height: 90, alignment: .center).rotationEffect(Angle(degrees: hour! + 15))
            }
            VStack{
                Image("hand_minute").resizable().frame(width: 15, height: 90, alignment: .center)
                    .rotationEffect(Angle(degrees: minute!))
            }
            VStack{
                Image("hand_second").resizable().frame(width: 15, height: 90, alignment: .center)
                    .rotationEffect(Angle(degrees: Double(second!)))
                
            }
            VStack{
                Text(text_full_time).onReceive(timer, perform: { timer in
                    date = Calendar.current.dateComponents(in: .current, from: Date())
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateStyle = .full
                    dateFormatter.string(from: date.date!)
                    text_full_date =  dateFormatter.string(from: date.date!)
                    second = second + 1
                    hour = (360/12) * Double(date.hour!) + 15
                    minute = (360/60) * Double(date.minute!)
                    second_value = (360/60) * Double(date.second!)
                    text_hour =  String(date.hour!)
                    text_minute = String(date.minute!>=0 && date.minute! < 10 ? "0" + String(describing:date.minute!) : String(describing:date.minute!))
                    text_second = String(date.second!>=0 && date.second! < 10 ? "0" + String(describing:date.second!) : String(describing:date.second!))
                    text_full_time = text_hour + ":" + text_minute + ":" + text_second
                   
                })
                Text(text_full_date)
            }.frame(maxHeight:.infinity,alignment: .bottom)
                .padding(30.0)
           
        }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
