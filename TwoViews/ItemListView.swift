//
//  ItemListView.swift
//  TwoViews
//
//  Created by 中尾　達也 on 2020/08/13.
//  Copyright © 2020 Sample Inc. All rights reserved.
//

import SwiftUI

struct ItemListView: View {
    //  グローバル変数を参照するよって意味ぐらいに覚えて下さい
    @EnvironmentObject var lstitems: lstItems
    
    var body: some View {
        //  縦に並べまっせ〜!
        VStack{
            //  追加ボタン
            Button(action:{
                //  ここでグローバル変数に値を追加しています
                self.lstitems.add(obj: ItemInfo(id:UUID(),name: "これはテストです(\(self.lstitems.item.count + 1)個目)") )
            }){
                //  ボタンのキャプション
                Text("追加")
            }
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView()
    }
}

//  プログラムで管理したいデータ構造体
struct ItemInfo: Codable, Equatable, Identifiable {
   //  管理する為にID
   //  Identifiableで必要。
   //  説明すると長いのでとりあえずつけとばいいかぐらいのノリでいいと思います
   var id: UUID
   //  ----- ここから下が実際にプログラムで使用するメンバー変数です -----
   var name: String    //  名前。実質これだけしか管理してません(笑)まあ分かりやすくする為にシンプルにしています
}

//  管理したいリストデータを集約して管理するクラス。
//  そうクラスなんです!構造体じゃないよ
//  管理用に関数持ちたいのでクラスにした程度でいいと思います。説明すると長いし、理論は後からで結構!
class lstItems: ObservableObject {
   //  @PubLishedは管理したいメンバーを宣言する時に使用。
   //  これ管理するぜ!ぐらいでいいと思います。
   //  小難しい理論は脇においといて作ることがモチベーションとして大事!
   @Published var item = [ItemInfo]()
   //  二次元配列にデータ構造体を追加する関数です
   //  ItemListView.swiftからボタン押した時に呼んでます
   func add(obj: ItemInfo) {
       //  その名前通り、ペコッと追加!
       item.append(obj)
   }
}
