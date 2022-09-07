//
//  Orders.swift
//  eCommerceApp
//
//  Created by Shilpee Gupta on 06/09/22.
//

//Functionality to be implemented
//Out of Time as of Now!!
//Trying to display statements like
// Text("\(datas.user.name) bought \(datas.order.quantity)   \(datas.product.name) at $ \(datas.product.selling_price) on \(datas.order.order_date)")

import SwiftUI

struct Orders: View {
    @State private var ApiData=[APIs]()
    
    var body: some View {
        NavigationView{
            List(ApiData){ datas in
                Text(datas.user.name)
//                Text(datas.order.quantity)
//                Text(datas.product.name)
//                Text(datas.product.selling_price)
            }.task{
//                await apiCall.fetchUser()
//                await apiCall.fetchProduct()
//                await apiCall.fetchOrder()
            }
            .navigationBarTitle("Orders")
            .listStyle(.grouped)
        }
        
        
//        List(ApiData, id: \.id){ datas in
//            VStack(alignment: .leading){
//                Text(datas.user.name)
//                    .font(.headline)
//                    .foregroundColor(Color("BlueColor"))
////                        Text("\(datas.user.name) bought \(datas.order.quantity)   \(datas.product.name) at $ \(datas.product.selling_price) on \(datas.order.order_date)")
////                            .font(.body)
////                            .foregroundColor(.secondary)
//
//            }
//            .navigationTitle("Orders")
//            .task {
//                await fetchData()
//            }
//            .padding()
//        }
    }
    
    func fetchData(with Url: String) async {
        guard let url = URL(string: Url) else{
            print("THe URL doesn't Work.")
            return
        }
        //fetch data from the url created.
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            
            //decode the data
            if let decodedResponse = try? JSONDecoder().decode([APIs].self, from: data){
                ApiData=decodedResponse
            }
        }
        catch {
            print("The data is invalid.")
        }
    }
}

struct Orders_Previews: PreviewProvider {
    static var previews: some View {
        Orders()
    }
}
