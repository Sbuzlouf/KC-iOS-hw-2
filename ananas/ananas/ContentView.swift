//
//  ContentView.swift
//  ananas
//
//  Created by Sumaya Buzlouf on 16/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var quantity = [0, 0, 0, 0]
    @State var prices = [2.500, 2.250]
    @State var yourPrice = ""
    @State var totPrice = 0.0
    
    var body: some View {
       
        VStack {
            Image("green ananas")
                .resizable()
                .scaledToFit()
                .cornerRadius(50)
                .frame(width: 200, height: 80)
            
            
                HStack {
                    ExtractedView(myquantity: $quantity[0], myPrices: $prices[0], type: "Banana Biscuit")
                    ExtractedView(myquantity: $quantity[1], myPrices: $prices[1], type: "Mango C.C")
                    
                }
               
                HStack {
                    ExtractedView(myquantity: $quantity[2], myPrices: $prices[1], type: "Strawberry C.C")
                    ExtractedView(myquantity: $quantity[3], myPrices: $prices[1], type: "Berries C.C")
                    
                }
            
            HStack {
                Text("Insert the amount you have")
                
                TextField("Amount", text: $yourPrice)
                    .frame(width: 100, height: 40)
                    .foregroundColor(.white)
                    .background(.gray.opacity(0.6))
                    .cornerRadius(15)
                    .multilineTextAlignment(.center)
                    
                
            }
            
            Button {
                    
                } label: {
                    Text("Press here for receipt")
                        .padding(9)
                        .background(.yellow)
                        .cornerRadius(15)
                        .foregroundColor(.white)
                }

                Text("Total price is \(totPrice)")
                        
            }
                        
            }
        func priceCalc (p: Double, q: Int) -> Double {
            return p * Double(q)
        }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View {
    
    @Binding var myquantity : Int
    @Binding var myPrices : Double
    
    @State var type : String
    
    var body: some View {
        VStack {
            Image("\(type)")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .cornerRadius(25)
                .padding(9)
                .background(.yellow.opacity(0.7))
                .cornerRadius(30)
            
            Text("\(type)")
            
            Text("\(myPrices) KD")
            
            Stepper("", value: $myquantity, in: 0...10, step: 1)
                .labelsHidden()
            
            Text("\(myquantity)")
            
        }.padding()
    }
}
