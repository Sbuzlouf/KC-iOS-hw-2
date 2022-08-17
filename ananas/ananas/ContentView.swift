//
//  ContentView.swift
//  ananas
//
//  Created by Sumaya Buzlouf on 16/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var quantity = [0, 0, 0, 0]
    @State var prices = 3
    @State var state = ""
    @State var yourPrice = ""
    @State var totPrice = 0
    
    var body: some View {
       
        VStack {
            Image("green ananas")
                .resizable()
                .scaledToFit()
                .cornerRadius(50)
                .frame(width: 200, height: 80)
            
            
                HStack {
                    ExtractedView(myquantity: $quantity[0], myPrices: $prices, type: "Banana Biscuit")
                    ExtractedView(myquantity: $quantity[1], myPrices: $prices, type: "Mango C.C")
                    
                }
               
                HStack {
                    ExtractedView(myquantity: $quantity[2], myPrices: $prices, type: "Strawberry C.C")
                    ExtractedView(myquantity: $quantity[3], myPrices: $prices, type: "Berries C.C")
                    
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
            
            
                Text("Press here for receipt")
                    .padding(9)
                    .background(.yellow)
                    .cornerRadius(15)
                    .foregroundColor(.white)
                    .onTapGesture {
                        totPrice = prices * (quantity[0] + quantity[1] + quantity[2] + quantity[3])
                        
                        if (yourPrice.isEmpty) {
                            state = "Oops, you need to fill amount"
                        }
                       else if totPrice <= (Int(yourPrice) ?? 0) {
                            state = "Your order is being proceeded"
                        }
                        else {
                            state = "Sorry, the money is not enough"
                        }
                    }
                    
                
                Text("Total price is: \(totPrice) KD")
            
                Text(state)
                .foregroundColor(.red)
                        
            }
                        
        }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View {
    
    @Binding var myquantity : Int
    @Binding var myPrices : Int
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
