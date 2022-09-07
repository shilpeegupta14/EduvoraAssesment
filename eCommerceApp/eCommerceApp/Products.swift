//
//  ContentView.swift
//  MoodUI
//
//  Created by Kathan Lunagariya on 28/05/22.
//

import SwiftUI

struct Products: View {
    @State private var isShowingPhotoPicker=false
    @State private var avatarImage = UIImage(systemName: "person.fill")
    
    let prodData = [
        Product(product_id: 1, name: "Cookie - Oatmeal", stock: 92, selling_price: 141),
        Product(product_id: 2, name: "Beer - Organic Lager", stock: 88, selling_price: 27),
        Product(product_id: 3, name: "Sobe - Orange Carrot",stock: 85, selling_price: 176),
        Product(product_id: 4, name: "Pepper - Chillies, Crushed", stock: 99, selling_price: 70),
        Product(product_id: 5, name: "Wine - Duboeuf Beaujolais", stock: 21, selling_price: 157),
        Product(product_id: 6, name: "Tomatoes Tear Drop", stock: 3, selling_price: 58),
        Product(product_id: 7, name: "Oneshot Automatic Soap System", stock: 98, selling_price: 7),
        Product(product_id: 8, name: "Wine - Magnotta, Merlot Sr Vqa", stock: 91, selling_price: 181)
    ]
    
    let columns = [
        GridItem(.fixed(UIScreen.main.bounds.width/2 - 15), spacing: 15),
        GridItem(.fixed(UIScreen.main.bounds.width/2 - 15), spacing: 15)
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            HStack{
                Text("Products")
                    .bold()
                    .font(Font.system(size: 40))
                Spacer()
                Image(uiImage: avatarImage!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50, alignment: .topLeading)
                    .clipShape(Circle())
                    .padding()
                    .onTapGesture { isShowingPhotoPicker=true }
                    .sheet(isPresented: $isShowingPhotoPicker, content: {
                        PhotoPicker(avatarImage: $avatarImage)
                    })
            }
            .padding()
            .foregroundColor(.red)
            
            LazyVGrid(columns: columns) {
                ForEach(prodData, id: \.self) {detail in
                    ProductDetailView(detail: detail)
                }
            }
        }
    }
}


struct ProductDetailView:View{
    let detail: Product
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.black)
                .frame(width: UIScreen.main.bounds.width/2 - 15, height: UIScreen.main.bounds.width/1.5)
            
            VStack{
                HStack{
                    Text(detail.name)
                        .bold()
                        .font(Font.system(size: 18))
                        .foregroundColor(.white)
                    Spacer()
                }.padding(.horizontal, 0)
                
                Spacer()
                
                VStack(alignment: .center){
                    ProductStockIndicator(detail: detail)
                    
                    Spacer()
                    
                    Text("$\(detail.selling_price)")
                        .bold()
                        .font(Font.system(size: 25))
                        .foregroundColor(.white)
                }.padding(.top)
                
            }.padding()
        }
        .padding(.horizontal)
    }
}


struct ProductStockIndicator:View{
    let detail:Product
    
    var body: some View{
        ZStack{
            Circle()
                .trim(from: 0, to: 1)
                .stroke(.yellow.opacity(0.35), lineWidth: 10)
                .frame(width: UIScreen.main.bounds.width / 2 - 15 - 50, height: UIScreen.main.bounds.width / 2 - 15 - 50)
            
            Circle()
                .trim(from: 0, to: Double(detail.stock)/100.00)
                .stroke(.yellow, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .frame(width: UIScreen.main.bounds.width / 2 - 15 - 50, height: UIScreen.main.bounds.width / 2 - 15 - 50)
                .rotationEffect(Angle(degrees: -90))
            
            Text("\(detail.stock)")
                .bold()
                .font(Font.system(size: 30))
                .foregroundColor(.white)
        }
    }
    
//    func getEmotionMoodPercentage() -> String{
//        if detail.categoryCount == 0{
//            return "0"
//        }
//
//        let frac = Double(detail.categoryCount) / 9.0
//        let per = frac * 100
//        return String(format: "%.1f", per)
//    }
}


struct Product_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
