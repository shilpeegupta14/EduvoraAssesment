//
//  Main.swift
//  eCommerceApp
//
//  Created by Shilpee Gupta on 07/09/22.
//

import Foundation

struct APIs: Codable, Identifiable{
    var id=UUID()
    let user: User
    let product: Product
    let order: Order
    var baseString="https://assessment.api.vweb.app/"
    
    
}

let orderScreen=Orders()

struct apiCall {
    let baseString="https://assessment.api.vweb.app/"
    
    func fetchUser() async{
        let userURL=baseString+"users"
        await orderScreen.fetchData(with: userURL)
    }
    
    func fetchProduct() async{
        let productURL=baseString+"products"
        await orderScreen.fetchData(with: productURL)
    }
    func fetchOrder() async{
        let orderURL=baseString+"orders"
        await orderScreen.fetchData(with: orderURL)
    }
    
//
//    func fetchData(with Url: String) async {
//        guard let url = URL(string: Url) else{
//            print("THe URL doesn't Work.")
//            return
//        }
//        //fetch data from the url created.
//        do{
//            let (data, _) = try await URLSession.shared.data(from: url)
//
//            //decode the data
//            if let decodedResponse = try? JSONDecoder().decode([APIs].self, from: data){
//                api=decodedResponse
//            }
//        }
//        catch {
//            print("The data is invalid.")
//        }
//    }

}
