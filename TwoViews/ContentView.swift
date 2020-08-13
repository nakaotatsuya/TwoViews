//
//  ContentView.swift
//  TwoViews
//
//  Created by 中尾　達也 on 2020/08/13.
//  Copyright © 2020 Sample Inc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var lstitems: lstItems
    var body: some View {
        //  リスト表示するぜっ
        List{
            //  二次元配列のデータ全部ここに表示するまでグルグル回るよ
            ForEach(lstitems.item){ item in
                HStack{
                    Text(item.name)
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
