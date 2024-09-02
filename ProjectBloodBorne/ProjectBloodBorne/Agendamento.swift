//
//  Agendamento.swift
//  ProjectBloodBorne
//
//  Created by Turma02-5 on 02/08/24.
//

import SwiftUI

struct Agendamento: View {
    
    @StateObject var viewModel = Agendament()
    
    
    var body: some View {
        ScrollView{
            
            VStack{
                ForEach(viewModel.agendamentodos , id: \.self){
                    pAgendamento in
                    VStack(alignment:.leading){
                        Text("Data: \(pAgendamento.data)")
                        Divider()
                            .overlay(.white)
                        Text("Hora: \(pAgendamento.hora)")
                        Divider()
                            .overlay(.white)
                        Text("Local: \(pAgendamento.local)")
                    }
                    .frame(width: 310, height: 110)
                    .padding(.vertical,10)
                    .padding(.horizontal,10)
                    .background(Color.corPrincipal)
                    .cornerRadius(20)
                    .foregroundColor(.white)
                    Divider()
                        .frame(width: 300)
                        .overlay(.red)
                    
                }
                Spacer()
            }
            .padding(.top,10)
            .frame(maxWidth: 350,maxHeight: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.red))
            
        } 
        .padding(.top,60)
        .onAppear(){
            viewModel.fetch()
        } .toolbar{
            ToolbarItem(placement: .principal) {
                Text("Agendamentos")
                    .foregroundStyle(.white)
            }
            
        }

            .toolbarBackground(Color.corSecundaria, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    
    
}

#Preview {
    Agendamento()
}
