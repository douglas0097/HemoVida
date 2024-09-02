//
//  ContentView.swift
//  Perfil
//
//  Created by Turma02-5 on 30/07/24.
//

import SwiftUI



struct Profile: View {
    
    var pessoas: Personagem = Personagem(id:"3",nome: "Douglas", foto: "https://www.designi.com.br/images/preview/12161378.jpg", email: "douglas@gmail.com", sangue: "B+", idade: 23, peso: 74.0, altura: 1.80, sexo: "Masculino")
    
    
    var body: some View {
        ScrollView{ VStack {
            HStack{
                Text("Perfil")
                    .foregroundStyle(.white)
                    .bold()
            }
            .frame(maxWidth: .infinity)
            .padding(20)
            .background(Color(.corPrincipal))
            .roundedCornerWithBorder(radius: 10, corners:[.bottomLeft, .bottomRight])
            
            
            HStack{
                AsyncImage(url: URL(string: pessoas.foto)){image in
                    image.image?.resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70 )
                        .cornerRadius(100)
                }
                .padding(.bottom,30)
                
                HStack{
                    VStack(alignment:.leading){
                        Text("Douglas Almeida")
                            .font(.system(size: 20))
                            .bold()
                        Text("ID:012234")
                            .opacity(0.5)
                        Text("CPF:222.111.555-85")
                        
                        VStack(alignment:.trailing){
                            Text("NÍVEL: 2")
                                .bold()
                        }
                        .padding(.top,10)
                        .padding(.leading,170)
                    }
                    .foregroundStyle(.white)
                    .padding(.trailing,10)
                }
            }
            .padding(.init(top: 20, leading: 10, bottom: 20, trailing: 10))
            .background(Color(.corSecundaria))
            .cornerRadius(20)
            .shadow(color: .gray.opacity(0.7), radius: 10, x: 5, y: 5)
            .padding(.bottom,10)
            
            ZStack{
         
                Circle()
                    .fill(.white)
                    .frame(width: 110)
                    .overlay(Circle().stroke(Color.corPrincipal, lineWidth: 8))
                    .overlay(
                        VStack {
                            Text("2").font(.system(size: 30)).bold().foregroundStyle(.corPrincipal)
                            Text("Clínicas").font(.system(size: 15))
                                .foregroundStyle(.corPrincipal)
                        }
                    )
                    .padding(.leading,230)
                Circle()
                    .fill(.white)
                    .frame(width: 110)
                    .overlay(Circle().stroke(Color.corPrincipal, lineWidth: 8))
                    .overlay(
                        VStack {
                            Text("2").font(.system(size: 30)).bold().foregroundStyle(.corPrincipal)
                            Text("Doações").font(.system(size: 15))
                                .foregroundStyle(.corPrincipal)
                        }
                    )
                    .padding(.trailing,230)
                Circle()
                    .fill(.white)
                    .frame(width: 130)
                    .overlay(Circle().stroke(Color.corPrincipal, lineWidth: 8))
                    .overlay(
                        VStack {
                            Text("O+").font(.system(size: 50)).bold().foregroundStyle(.corPrincipal)
                            Text("Tipo")
                                .foregroundStyle(.corPrincipal)
                        }
                    )
                    .shadow(color: .gray.opacity(0.7), radius: 10, x: 5, y: 5)

            }
            .padding(.init(top: 20, leading: 6, bottom: 20, trailing: 6))
            
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.red).shadow(radius: 20))
            
            VStack(alignment:.leading){
                HStack{
                    Text("Email:")
                    Text("dougla@gmail.com")
                }
                
                Divider()
                    .overlay(.white)
                HStack{
                    
                    Text("Nome:")
                    Text("Douglas Almeida")
                }
                
                Divider()
                    .overlay(.white)
                HStack{
                    Text("Nascimento:")
                    Text("21/09/1996")
                }
                
                Divider()
                    .overlay(.white)
                HStack{
                    Text("Telefone:")
                    Text("(83) 99375-5349")
                }
                
                Divider()
                    .overlay(.white)
                HStack{
                    Text("Endereço:")
                    Text("Piauí")
                    
                }
                
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.corPrincipal)
            .cornerRadius(20)
            .padding(.init(top: 10, leading: 10, bottom: 20, trailing: 10))

            Spacer()

        }}
       
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

    }
}

#Preview {
    Profile()
}
