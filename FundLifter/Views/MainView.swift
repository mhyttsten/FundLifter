//
//  MainView.swift
//  FundLifter
//
//  Created by Magnus Hyttsten on 11/11/19.
//  Copyright © 2019 Magnus Hyttsten. All rights reserved.
//

import SwiftUI

struct MainView: View {
  @EnvironmentObject var settings: AppDataObservable
  
  @State private var show_modal: Bool = false
  
  var body: some View {
    NavigationView {
      VStack {
        List {
          ForEach(settings.portfolios) { dp4W in
            NavigationLink(destination: PortfolioView(portfolioName: dp4W._name).environmentObject(self.settings)) {
              DP4WRowView(title: dp4W._name, dp4ModelKey: dp4W.id).environmentObject(self.settings)
//                entry: dp4W).environmentObject(self.settings)
            }
          }
        }

        Text("\(settings.message)").bold()  // .padding(.bottom, 50)
        Text("\(settings.fundDBCreationTime)")
        Button(action: {
          self.show_modal = true
        }) {
          Text("Refresh DB")
        }.sheet(isPresented: self.$show_modal) {
          UpdateDBModalView().environmentObject(self.settings)
        }
      }
      .navigationBarTitle(Text("Main: \(dateLastFridayAsYYMMDD(inclusive: false))"))
      // Cannot do this because of bug when pushing 'Back'
//              .navigationBarItems(trailing:
//                NavigationLink(destination: LogView()) {
//                  Text("Help")
//                })
      }.onAppear {
        self.settings.initialize()
    }
  }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
