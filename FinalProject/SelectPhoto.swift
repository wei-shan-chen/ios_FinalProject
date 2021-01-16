//
//  SelectPhoto.swift
//  FinalProject
//
//  Created by User11 on 2021/1/13.
//

import SwiftUI

struct SelectPhoto: View {
    @State private var showSelectPhoto = false
    @State private var selectImage = Image(systemName:"photo")
    @State private var scale : CGFloat = 1
    @State private var brightness : Double = 0
    @State private var blurness : CGFloat = 0
    @State private var rotation : Double = 0
    @State private var contract : Double = 1
    @State private var grayscale : Double = 1
    @State private var saturation : Double = 1
    
    var body: some View {
        GeometryReader{geometry in
            VStack{
                Button(action: {
                    self.showSelectPhoto = true
                }) { selectImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    .clipped()
                    .scaleEffect(scale)
                    .brightness(brightness)
                    .blur(radius: blurness)
                    .rotationEffect(.degrees(rotation))
                    .contrast(contract)
                    .grayscale(grayscale)
                    .saturation(saturation)
                }
                .sheet(isPresented: $showSelectPhoto){
                    ImagePickerController(showSelectPhoto: self.$showSelectPhoto, selectImage: self.$selectImage)
                }
                
                
                Form{
                    VStack{
                        Group{
                            HStack{
                                Text("大小")
                                Slider(value: $scale,in: 0...1,minimumValueLabel:Image(systemName: "magnifyingglass").imageScale(.small),maximumValueLabel:Image(systemName: "magnifyingglass").imageScale(.large)
                                ){
                                    Text("")
                                }
                                .accentColor(.red)
                            }
                        }
                        Group{
                            HStack{
                                Text("亮度")
                                Slider(value: $brightness,in: 0...1,minimumValueLabel:Image(systemName: "sun.max.fill").imageScale(.small),maximumValueLabel:Image(systemName: "sun.max.fill").imageScale(.large)){
                                    Text("")
                                }
                                .accentColor(.orange)
                            }
                        }
                        Group{
                            HStack{
                                Text("模糊")
                                Slider(value:$blurness,in : 0...10,minimumValueLabel:Image(systemName: "drop").imageScale(.small),maximumValueLabel:Image(systemName: "drop").imageScale(.large)){
                                    Text("")
                                }
                                .accentColor(.yellow)
                            }
                        }
                        Group{
                            HStack{
                                Text("旋轉")
                                Slider(value: $rotation, in: 0...360,minimumValueLabel:Image(systemName: "person.fill").imageScale(.small),maximumValueLabel:Image(systemName: "person.fill.turn.down").imageScale(.large)) {
                                    Text("")
                                }
                                .accentColor(.green)
                            }
                        }
                        Group{
                            HStack{
                                Text("對比")
                                Slider(value: $contract, in: 1...3,minimumValueLabel:Image(systemName: "arrow.right").imageScale(.small),maximumValueLabel:Image(systemName: "arrow.left").imageScale(.large)) {
                                    Text("")
                                }
                            }
                        }
                        Group{
                            HStack{
                                Text("灰階")
                                Slider(value: $contract, in: 0...2,minimumValueLabel:Image(systemName: "circle").imageScale(.small),maximumValueLabel:Image(systemName: "circle.fill").imageScale(.large)) {
                                    Text("")
                                }
                                .accentColor(.purple)
                            }
                        }
                        Group{
                            HStack{
                                Text("飽和度")
                                Slider(value: $contract, in: 0...10,minimumValueLabel:Image(systemName: "wifi.slash").imageScale(.small),maximumValueLabel:Image(systemName: "wifi").imageScale(.large)) {
                                    Text("")
                                }
                                .accentColor(.black)
                            }
                        }
                    }
                }
            }
        }
        
    }
}

struct SelectPhoto_Previews: PreviewProvider {
    static var previews: some View {
        SelectPhoto()
    }
}
