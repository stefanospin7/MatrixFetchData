//
//  main.swift
//  testMatrixDict
//
//  Created by Stefano  on 21/06/22.
//

import Foundation





struct SAPB1_StockItem: Codable {
let WhsCode: String

let ItemCode: String

let OnHand: Decimal

let IsCommited: Decimal

let OnOrder: Decimal

}


struct StockByWarehouseResponse: Codable {
    
    var StockByWarehouse: [SAPB1_StockItem] = Array()

}



let JSONString = """
  {"StockByWarehouse":
  [
  {"WhsCode":"A","ItemCode":"Test","OnHand":3,"IsCommited":5,"OnOrder":5},
  {"WhsCode":"B","ItemCode":"Test2","OnHand":3,"IsCommited":2,"OnOrder":1}
  ]
  }
  """

//print(JSONString)
let jsonData = JSONString.data(using: .utf8)!
do {
  let decoder = JSONDecoder()
    //let tableDataContent = try decoder.decode([SAPB1_StockItem].self, from: jsonData)
    
  let tableData = try decoder.decode(StockByWarehouseResponse.self, from: jsonData)
  print(tableData)
    print("*******")
    print("Wscode:")
    print(tableData.StockByWarehouse[0].WhsCode)
    print("Itemcode:")
    print(tableData.StockByWarehouse[1].ItemCode)
 // print("Rows in array: \(tableData.StockByWarehouse.count)")
    print("*******")
   // print(tableDataContent)
}
catch {
  print (error)
}
