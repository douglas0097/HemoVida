//
//  barra02.swift
//  viewProjeto
//
//  Created by Turma02-20 on 30/07/24.
//
// CRIAR A DESGRACA DA ESTRUTA DE CONDICAO E DO ALERT

import SwiftUI

struct NovaSolicitacao: View {
    
    @State var nome2: String = ""
    @State var sangue2: String = ""
    @State var descr2: String = ""
    @StateObject var viewModel = Soli()

    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                ZStack{
                    Rectangle()
                        .foregroundColor(.corPrincipal)
                        .frame(width: 300, height: 90)
                        .cornerRadius(20)
                        .shadow(color: .gray.opacity(0.7), radius: 10, x: 5, y: 5)
                    VStack{
                        Text("Nome:").bold()
                            .frame(width: 200)
                            .foregroundColor(.white)
                        
                        TextField(" Pessoa para que vai ser doado ", text: $nome2)
                            .frame(width: 250)
                            .background(.white)
                            .cornerRadius(20)
                    }
                }
                ZStack{
                    Rectangle()
                        .foregroundColor(.corPrincipal)
                        .frame(width: 300, height: 90)
                        .cornerRadius(20)
                        .shadow(color: .gray.opacity(0.7), radius: 10, x: 5, y: 5)
                    VStack{
                        Text("Tipo sanguíneo:").bold()
                            .frame(width: 200)
                            .foregroundColor(.white)
                        
                        TextField(" Tipo sanguíneo da pessoa ", text: $sangue2)
                            .frame(width: 250)
                            .background(.white)
                            .cornerRadius(20)
                    }
                    
                }
                ZStack{
                    Rectangle()
                        .foregroundColor(.corPrincipal)
                        .frame(width: 300, height: 90)
                        .cornerRadius(20)
                        .shadow(color: .gray.opacity(0.7), radius: 10, x: 5, y: 5)
                    VStack{
                        Text("Descrição:").bold()
                            .frame(width: 200)
                            .foregroundColor(.white)
                        
                        TextField(" Descreva o caso", text: $descr2)
                            .frame(width: 250)
                            .background(.white)
                            .cornerRadius(20)
                    }
                    
                }

                VStack{
                    Button {
                        
                        viewModel.fetchCriar(nome2, sangue2, descr2)
                        
                    } label: {
                        HStack{
                            Text("Enviar")
                                .fontWeight(.semibold)
                                .font(.system(size: 15))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 40)
                        .background(.corPrincipal)
                        .cornerRadius(20)
                    }
                }
            }
            .padding(20)
            .frame(maxWidth: 350,maxHeight: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.red))
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }.toolbar{
            ToolbarItem(placement: .principal) {
                Text("Agendamentos")
                    .foregroundStyle(.white)
            }
            
        }

            .toolbarBackground(Color.corSecundaria, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        .padding(.top,30)

    }
}
#Preview {
    NovaSolicitacao()
}
