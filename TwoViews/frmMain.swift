//
//  frmMain.swift
//  TwoViews
//
//  Created by 中尾　達也 on 2020/08/13.
//  Copyright © 2020 Sample Inc. All rights reserved.
//

import SwiftUI

struct frmMain: View {
    var body: some View {
        //  タブ宣言!
        TabView{
            //  画面のその1
            //  ディフォルトでこの画面を表示するよってことです。
            //  ContentView.swiftの内容ね
            ContentView()
                //  タブのアイテムとして以下を追加
                .tabItem{
                    //  前回と同じ
                //Image(systemName: "list.dash")
                Text("リスト表示")
            }
            //  画面その2
            //  管理したいデータをこの画面で追加します
            ItemListView()
                //  タブアイテムとして以下を追加
                .tabItem{
                    //  このあたりも前回と同じ
                    //Image(systemName: "square.and.pencil")
                    Text("アイテム追加")
            }
        }
    }
}

struct frmMain_Previews: PreviewProvider {
    //  グローバル変数の実体を管理
    //  この画面で、データ構造体を管理します
    static let lstitems = lstItems()
    
    static var previews: some View {
        frmMain()
        //  データ構造体を渡します。
        //  SceneDelegateで追加したあれ。
        .environmentObject(lstitems)
    }
}
