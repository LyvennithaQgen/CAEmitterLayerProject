//
//  ContentView.swift
//  SnowFall
//
//  Created by Lyvennitha on 01/07/21.
//

import SwiftUI

struct ContentView: View {
    @State var isButtonHidden = false
    @State var imageName = "gifts"
    @State var catname = "SnowCat"
    @State var tagval = 0
    @State private var numberOfRects = 0
    
    @State public var ColorTop: Color = Color("")
    @State public var ColorBottom: Color = Color("")
    @State public var ImageStr: String = ""
    
    //NextView
    
    var body: some View {
        let backg = VStack{
            
            Image(catname)
                .resizable()
                .scaledToFit()
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
        }
        HStack{
            Button(action: {
                numberOfRects = 1
                catname = "SpringCat"
                imageName = "Thread"
                ColorTop = Color("ThunderTop")
                ColorBottom = Color("ThunderBottom")
                ImageStr = "ThunderCloud"
            }, label: {Text("Hoping!🌤")
                .foregroundColor(Color.black)
                .lineLimit(1)
                .minimumScaleFactor(0.4)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.yellow, lineWidth: 2))
               
            })
                .tag(1)
            //.background(SwiftUI.Color.yellow)
            
            Button(action: {numberOfRects = 2
                catname = "autumnCat"
                imageName = "AutumnGift"
                ColorTop = Color("WinterTop")
                ColorBottom = Color("WinterBottom")
                ImageStr = "WinterImage"
            }, label: {Text("Happy!💨")
                .foregroundColor(Color.black)
                .lineLimit(1)
                .minimumScaleFactor(0.4)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray, lineWidth: 2))
            })
                .tag(2)
            Button(action: {numberOfRects = 3
                catname = "HotCat"
                imageName = "Juice"
                ColorTop = Color("SunTop")
                ColorBottom = Color("SunBottom")
                ImageStr = "SunImage"
            }, label: {Text("Hot!🥵")
                .foregroundColor(Color.black)
                .lineLimit(1)
                .minimumScaleFactor(0.4)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.orange, lineWidth: 2))
            })
                .tag(3)
            Button(action: {numberOfRects = 4
                catname = "SnowCat"
                imageName = "gifts"
                ColorTop = Color("SnowTop")
                ColorBottom = Color("SnowBottom")
                ImageStr = "SnowImage"
            }, label: {Text("Cool!🥶")
                .foregroundColor(Color.black)
                .lineLimit(1)
                .minimumScaleFactor(0.4)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.blue, lineWidth: 2))
            })
                .tag(4)
        }
        .frame(height: 35)
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        Group{
            if numberOfRects == 1{
                
                NavigationLink(destination: WeatherView(topColor: $ColorTop, bottomColor: $ColorBottom, imageSe: $ImageStr)){
                SpringView()
                    .background(backg)
                }
            }else if numberOfRects == 2{
                NavigationLink(destination: WeatherView(topColor: $ColorTop, bottomColor: $ColorBottom, imageSe: $ImageStr)){
                AutumnView()
                    .background(backg)
                }
            }else if numberOfRects == 3{
                NavigationLink(destination: WeatherView(topColor: $ColorTop, bottomColor: $ColorBottom, imageSe: $ImageStr)){
                HotView()
                    .background(backg)
                }
            }else if numberOfRects == 4{
                NavigationLink(destination: WeatherView(topColor: $ColorTop, bottomColor: $ColorBottom, imageSe: $ImageStr)){
                EmitterView()
                    .background(backg)
                }
            }
            else{
            if isButtonHidden {
                AutumnView()
                    .background(backg)
            }else{
                EmitterView()
                    .background(backg)
            }
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 30, execute: {
                self.isButtonHidden = true
                self.imageName = "AutumnGift"
                self.catname = "autumnCat"
            })
        }
        .navigationBarTitle("Seasons", displayMode: .inline)
        
        
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 8 Plus")
    }
}

struct EmitterView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let size = CGSize(width: 824.0, height: 1112.0)
        let host = UIView(frame: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
        

        let particlesLayer = CAEmitterLayer()
        particlesLayer.frame = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)

        host.layer.addSublayer(particlesLayer)
        host.layer.masksToBounds = true

        particlesLayer.backgroundColor = UIColor.clear.cgColor //UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        particlesLayer.emitterShape = .circle
//        particlesLayer.emitterPosition = CGPoint(x: 509.4, y: 707.7)
        particlesLayer.emitterPosition = CGPoint(x: 0.0, y: 0.0)
        particlesLayer.emitterSize = CGSize(width: 1648.0, height: 1112.0)
        particlesLayer.emitterMode = .surface
        particlesLayer.renderMode = .oldestLast



        let image1 = UIImage(named: "logo")?.cgImage

        let cell1 = CAEmitterCell()
        cell1.contents = image1
        cell1.name = "Snow"
        cell1.birthRate = 92.0
        cell1.lifetime = 20.0
        cell1.velocity = 59.0
        cell1.velocityRange = -15.0
        cell1.xAcceleration = 5.0
        cell1.yAcceleration = 40.0
        cell1.emissionRange = 180.0 * (.pi / 180.0)
        cell1.spin = -28.6 * (.pi / 180.0)
        cell1.spinRange = 57.2 * (.pi / 180.0)
        cell1.scale = 0.06
        cell1.scaleRange = 0.3
        cell1.color = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor

        
        particlesLayer.emitterCells = [cell1]
        return host
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }

    typealias UIViewType = UIView
}

struct AutumnView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let size = CGSize(width: 824.0, height: 1112.0)
        let host = UIView(frame: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
        

        let particlesLayer = CAEmitterLayer()
        particlesLayer.frame = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)

        host.layer.addSublayer(particlesLayer)
        host.layer.masksToBounds = true

        particlesLayer.backgroundColor = UIColor.clear.cgColor //UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        particlesLayer.emitterShape = .circle
//        particlesLayer.emitterPosition = CGPoint(x: 509.4, y: 707.7)
        particlesLayer.emitterPosition = CGPoint(x: 0.0, y: 0.0)
        particlesLayer.emitterSize = CGSize(width: 1648.0, height: 1112.0)
        particlesLayer.emitterMode = .surface
        particlesLayer.renderMode = .oldestLast



        let image1 = UIImage(named: "Autumn")?.cgImage

        let cell1 = CAEmitterCell()
        cell1.contents = image1
        cell1.name = "Snow"
        cell1.birthRate = 92.0
        cell1.lifetime = 20.0
        cell1.velocity = 59.0
        cell1.velocityRange = -15.0
        cell1.xAcceleration = 5.0
        cell1.yAcceleration = 40.0
        cell1.emissionRange = 180.0 * (.pi / 180.0)
        cell1.spin = -28.6 * (.pi / 180.0)
        cell1.spinRange = 57.2 * (.pi / 180.0)
        cell1.scale = 0.06
        cell1.scaleRange = 0.3
        cell1.color = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor

        particlesLayer.emitterCells = [cell1]
        return host
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }

    typealias UIViewType = UIView
}


struct HotView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let size = CGSize(width: 824.0, height: 1112.0)
        let host = UIView(frame: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
        

        let particlesLayer = CAEmitterLayer()
        particlesLayer.frame = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)

        host.layer.addSublayer(particlesLayer)
        host.layer.masksToBounds = true

        particlesLayer.backgroundColor = UIColor.clear.cgColor
        particlesLayer.emitterShape = .circle
//        particlesLayer.emitterPosition = CGPoint(x: 509.4, y: 707.7)
        particlesLayer.emitterPosition = CGPoint(x: 0.0, y: 0.0)
        particlesLayer.emitterSize = CGSize(width: 1648.0, height: 1112.0)
        particlesLayer.emitterMode = .surface
        particlesLayer.renderMode = .oldestLast



        let image1 = UIImage(named: "summer")?.cgImage

        let cell1 = CAEmitterCell()
        cell1.contents = image1
        cell1.name = "Snow"
        cell1.birthRate = 92.0
        cell1.lifetime = 20.0
        cell1.velocity = 59.0
        cell1.velocityRange = -15.0
        cell1.xAcceleration = 5.0
        cell1.yAcceleration = 40.0
        cell1.emissionRange = 180.0 * (.pi / 180.0)
        cell1.spin = -28.6 * (.pi / 180.0)
        cell1.spinRange = 57.2 * (.pi / 180.0)
        cell1.scale = 0.06
        cell1.scaleRange = 0.3
        cell1.color = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor

        
        particlesLayer.emitterCells = [cell1]
        return host
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }

    typealias UIViewType = UIView
}


struct SpringView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let size = CGSize(width: 824.0, height: 1112.0)
        let host = UIView(frame: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
        

        let particlesLayer = CAEmitterLayer()
        particlesLayer.frame = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)

        host.layer.addSublayer(particlesLayer)
        host.layer.masksToBounds = true

        particlesLayer.backgroundColor = UIColor.clear.cgColor //UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        particlesLayer.emitterShape = .circle
//        particlesLayer.emitterPosition = CGPoint(x: 509.4, y: 707.7)
        particlesLayer.emitterPosition = CGPoint(x: 0.0, y: 0.0)
        particlesLayer.emitterSize = CGSize(width: 1648.0, height: 1112.0)
        particlesLayer.emitterMode = .surface
        particlesLayer.renderMode = .oldestLast



        let image1 = UIImage(named: "Spring")?.cgImage

        let cell1 = CAEmitterCell()
        cell1.contents = image1
        cell1.name = "Snow"
        cell1.birthRate = 92.0
        cell1.lifetime = 20.0
        cell1.velocity = 59.0
        cell1.velocityRange = -15.0
        cell1.xAcceleration = 5.0
        cell1.yAcceleration = 40.0
        cell1.emissionRange = 180.0 * (.pi / 180.0)
        cell1.spin = -28.6 * (.pi / 180.0)
        cell1.spinRange = 57.2 * (.pi / 180.0)
        cell1.scale = 0.06
        cell1.scaleRange = 0.3
        cell1.color = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor

        
        particlesLayer.emitterCells = [cell1]
        return host
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }

    typealias UIViewType = UIView
}

struct NavigationConfiguration: UIViewControllerRepresentable {
    
init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.shadowColor = .clear
        navBarAppearance.backgroundColor = .clear
        UINavigationBar.appearance().standardAppearance = navBarAppearance
    }
    
func makeUIViewController(
        context: UIViewControllerRepresentableContext<NavigationConfiguration>
    ) -> UIViewController {
        UIViewController()
    }
    
func updateUIViewController(_ uiViewController: UIViewController,
                                context: UIViewControllerRepresentableContext<NavigationConfiguration>) {}
    
}
