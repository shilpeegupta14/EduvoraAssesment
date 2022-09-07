//
//  Model.swift
//  eCommerceApp
//
//  Created by Shilpee Gupta on 07/09/22.
//

import Foundation

struct Product: Codable, Hashable {
    let product_id: Int
    let name: String
    let stock: Int
    let selling_price: Int
}


//Will be used later in the codebase
//ScrollView {
//    ForEach(ApiData, id: \.id){
//        datas in
//        VStack {
//            HStack(spacing: 16){
//                Image(systemName: "person.fill")
//                    .font(.system(size: 32))
//                VStack(alignment: .leading){
//                    Text(datas.user.name)
//                        .font(.headline)
//                        .foregroundColor(Color("BlueColor"))
//                    Text("\(datas.user.name) bought \(datas.order.quantity)   \(datas.product.name) at $ \(datas.product.selling_price) on \(datas.order.order_date)")
//                }
//                Spacer()
//                Text("22d")
//                    .font(.system(size: 14, weight: .semibold))
//            }
//            Divider()
//        }.padding(.horizontal)
//    }
//}
//.navigationTitle("Orders")
//.task {
//    await fetchData()
//}


//            .navigationTitle("Products")
//            .toolbar{
//                ToolbarItemGroup(placement: .navigationBarTrailing) {
//                    Button(action: {
//                       print("Profile button tapped.")
//                    }, label: {
//                        Image(uiImage: avatarImage!)
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: 50, height: 50, alignment: .topLeading)
//                            .clipShape(Circle())
//                            .padding()
//                            .onTapGesture { isShowingPhotoPicker=true }
//                    }
//                    )}
//            }
