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
    @State var second:Double! = 0.0
    @State var text_hour = String()
    @State var text_minute = String()
    @State var text_second = String()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack{
            Color.blue
            VStack{
                HStack{
                    Text("SwiftUI Clock").font(.largeTitle)
                }
            }.position(x: UIScreen.main.bounds.width / 2, y: 150)
            VStack{
                Image("face").resizable().frame(width: 300, height: 300, alignment: .center).onReceive(timer, perform: { timer in
                    if second > 9 && second < 60 {
                        if second == 59 {
                            second = 0
                            text_second = "0"+String(Int(second))
                        }
                        else{
                            text_second = String(Int(second))
                        }
                    }
                    else{
                            text_second = "0"+String(Int(second))
                    }
                    second = second! + 1
                })
            }.onAppear(perform: {
                date = Calendar.current.dateComponents(in: .current, from: Date())
                hour = (360/12) * Double(date.hour!)
                minute = (360/60) * Double(date.minute!)
                text_hour =  String(date.hour!)
                if date.minute == 0 {
                    text_minute = "0" + String(date.minute!)
                }
                else if date.minute! > 0 && date.minute! < 10 {
                    text_minute = "0" + String(date.minute!)
                  
                }
                else{
                    text_minute = String(date.minute!)
                  
                }
                if second > 9 && second < 60 {
                    text_second = String(Int(second))
                }
                else{
                    if second == 0 {
                        text_second = "0" + String(Int(second))
               
                    }
                    else if second > 0 && second < 9 {
                        text_second = "0"+String(Int(second))
               
                    }
                    else{
                        text_second = String(Int(second))
                    }
                }
            })
            VStack{
                Image("hand_hour").resizable().frame(width: 15, height: 90, alignment: .center).rotationEffect(Angle(degrees: hour!))
            }
            VStack{
                Image("hand_minute").resizable().frame(width: 15, height: 90, alignment: .center)
                    .rotationEffect(Angle(degrees: minute!))
            }
            VStack{
                Image("hand_second").resizable().frame(width: 15, height: 90, alignment: .center).rotationEffect(Angle(degrees: second!))
            }
            VStack{
                HStack{
                    Text(text_hour + " : " + text_minute + ":" + text_second)
                }
            }.position(x: UIScreen.main.bounds.width / 2, y: 650)
        }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
