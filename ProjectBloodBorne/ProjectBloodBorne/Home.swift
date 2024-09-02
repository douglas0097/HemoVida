//
//  ContentView.swift
//  ProjectSwift
//
//  Created by Turma02-11 on 30/07/24.
//

import SwiftUI

struct Home: View {
    
  
    @StateObject var viewModel =  Soli()
    
    var pessoas = PessoaGlobal()
    
    
    @State var search: String = ""
    
    var body: some View {
        
        
        NavigationStack{
            ScrollView{
                VStack{
                    HStack{
                        AsyncImage(url: URL(string: pessoas.pessoas.foto)){image in
                            image.image?.resizable()
                                .scaledToFill()
                                .frame(width: 70, height: 70 )
                                .cornerRadius(100)
                        }
                        VStack{
                            Text("Bem vindo!")
                            Text(pessoas.pessoas.nome).bold()
                        }.font(.system(size: 12))
                            .foregroundColor(.white)
                            .padding(.leading)
                        Spacer()
                        Image(systemName: "rectangle.portrait.and.arrow.right.fill").foregroundColor(.white).padding(.bottom, 40)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(20)
                    .background(Color(.corSecundaria))
                    .roundedCornerWithBorder(radius: 10, corners:[.bottomLeft, .bottomRight])
                    
                    HStack {
                        TextField("Buscar", text: $search).multilineTextAlignment(.center)
                            .frame(width: 240)
                        
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.red))
                        
                        
                        
                        NavigationLink(destination: Mapa()){
                            Image(systemName: "map.fill").foregroundColor(.white).frame(width: 40, height: 24)
                                .background(Color(.corSecundaria))
                                .cornerRadius(20)
                                .padding(.leading, 7)
                            
                        }
                        
                        Image(systemName: "magnifyingglass").foregroundColor(.white).frame(width: 40, height: 24)
                            .background(Color(.corSecundaria))
                            .cornerRadius(20)
                            .padding(.leading, 7)
                        
                        
                    }.padding(.top, 10)
                    
                    
                    
                    HStack {
                        
                        
                        VStack{
                            
                            NavigationLink(destination: NovoAgendamento()){
                                HStack{
                                    
                                    Image(systemName: "deskclock").foregroundColor(Color.corSecundaria).frame(width: 28, height: 28).background(.white)
                                        .cornerRadius(100)
                                    Text("Agendar doação").font(Font.custom( "OpenSans", size: 14)).foregroundColor(.white)
                                        .padding(.trailing, 5)
                                    
                                    
                                    
                                }.frame(width: 170, height: 50)
                                    .background(Color.corPrincipal)
                                    .cornerRadius(40)
                            }
                            
                            NavigationLink(destination: NovaSolicitacao()){
                                HStack{
                                    Image(systemName: "plus.circle").frame(width: 28, height: 28).background(.white)
                                        .cornerRadius(100)
                                        .foregroundColor(Color.corSecundaria)
                                    
                                    
                                    
                                    Text("Nova Solicitação").font(.system(size: 14))
                                        .foregroundColor(.white)
                                }.frame(width: 170, height: 50)
                                    .background(Color.corPrincipal)
                                    .cornerRadius(40)
                            }
                        }
                        VStack{
                            
                            NavigationLink(destination: Agendamento()){
                                HStack{
                                    
                                    Image(systemName: "bookmark.fill").foregroundColor(Color.corSecundaria).frame(width: 28, height: 28).background(.white)
                                        .cornerRadius(100)
                                    Text("Agendamentos").font(Font.custom( "OpenSans", size: 14)).foregroundColor(.white)
                                    
                                    
                                    
                                }.frame(width: 170, height: 50)
                                    .background(Color.corPrincipal)
                                    .cornerRadius(40)
                            }
                            
                            
                            
                            NavigationLink(destination: Solicitacao()){
                                HStack{
                                    Image(systemName: "list.bullet.rectangle.fill").frame(width: 28, height: 28).background(.white)
                                        .cornerRadius(100)
                                        .foregroundColor(Color.corSecundaria)
                                    
                                    
                                  
                                    Text("Solicitações").font(.system(size: 14))
                                        .foregroundColor(.white)
                                        .padding(.trailing, 15)
                                }.frame(width: 170, height: 50)
                                    .background(Color.corPrincipal)
                                    .cornerRadius(40)
                            }
                           
                        }
                        
                        
                    }.frame(width: 362, height: 140)
                        .background(Color.corSecundaria)
                        .cornerRadius(20)
                        .padding(.top, 10)
                        .padding(.bottom,15)
                        .shadow(color: .gray.opacity(0.7), radius: 10, x: 5, y: 5)
                    
                    
                    VStack{
                        
                        ScrollView{
                            VStack{
                                ForEach(viewModel.solicitacoes, id: \.self) { pSolicitacao in
                                    ZStack{
                                        HStack{
                                            AsyncImage(url: URL(string: pSolicitacao.foto)){
                                                image in
                                                image.image?.resizable()
                                                    .scaledToFill()
                                                    .frame(width: 50, height: 50 )
                                                    .cornerRadius(100)
                                                
                                            }.frame(width: 45, height: 20)
                                                .padding(.bottom,30)
                                                .padding(.leading,5)
                                            VStack(alignment:.leading){
                                                Text("**Nome:** \(pSolicitacao.nome)")
                                                Divider()
                                                Text("**Descrição**: \(pSolicitacao.descr)")
                                            }
                                            .foregroundColor(.white)
                                            .font(.system(size:15))
                                            HStack{
                                                Text(pSolicitacao.sangue)
                                            }
                                            .foregroundColor(.white)
                                            .bold()
                                            .font(.system(size: 30))
                                            .frame(width: 70, height: 100)
                                            .background(Color.corSecundaria)
                                            .cornerRadius(20)
                                            
                                            
                                            
                                            
                                            
                                        }
                                        .frame(width: 340, height: 100)
                                        .background(Color.corPrincipal)
                                        .cornerRadius(20)
                                        .padding(.top, 15)
                                        .frame(width: 100)
                                        Spacer()
                                    }
                                    .frame(maxWidth: 350,maxHeight: .infinity)
                                }
                            }
                        }
                        
                        Spacer()
                        
                    }
                    .frame(width: 350,height: 360)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.red))
                    .padding(.bottom, 50)
                    
                }
            }
            .edgesIgnoringSafeArea(.all)
        }.onAppear(){
            viewModel.fetch()
        }
        .tint(.white)
    }
}

#Preview {
    Home()
}
