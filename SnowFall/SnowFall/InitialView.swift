//
//  InitialView.swift
//  SnowFall
//
//  Created by Lyvennitha on 01/07/21.
//

import SwiftUI

struct InitialView: View{
   
    var body: some View{
        let exampleColor : Color = Color(red: 7/255, green: 235/255, blue: 237/255)
        NavigationView {
            //Color.clear
            VStack{
//                Text("Cat")
//                    .font(.title2)
//                    .fontWeight(.semibold)
//                    .foregroundColor(Color.blue)
                //lineSpacing(100)
                NavigationLink(destination: ContentView()){
                    Spacer()
                    Image("CircleImage")
                        .resizable()
                        .frame(height: 250)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                                    .shadow(radius: 7)
                }
                Spacer()
                Text("Cat World")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                Spacer()
                
                    //.lineSpacing(80)
                Image("Season")
                    .resizable()
                    .frame(height: 250)
                
            }
            .edgesIgnoringSafeArea([.bottom])
            
            //.background(exampleColor)
            .navigationBarTitle("Welcome", displayMode: .automatic)
            .background(
                LinearGradient(gradient: Gradient(colors: [.white, exampleColor, .black]), startPoint: .top, endPoint: .bottom)
            )// Working
            .background(NavigationConfiguration())
            
        }
    }
   
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}
