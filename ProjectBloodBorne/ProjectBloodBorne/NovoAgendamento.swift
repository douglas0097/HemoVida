//
//  barra02.swift
//  viewProjeto
//
//  Created by Turma02-20 on 30/07/24.
//
// CRIAR A DESGRACA DA ESTRUTA DE CONDICAO E DO ALERT

import SwiftUI

struct NovoAgendamento: View {
    
    @State var local2: String = ""
    @State var data2: String = ""
    @State var horario2: String = ""
    @State var peso2: String = ""
    @State private var showingSheet = false
    @State var opcoes = ["Sim", "Não"]
    @State private var selectedOpcao1: String = "Sim"
    @State private var selectedOpcao2: String = "Sim"
    @State private var selectedOpcao3: String = "Sim"
    @StateObject var viewModel = Agendament()
    
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
                        Text("Local:").bold()
                            .frame(width: 200)
                            .foregroundColor(.white)
                        
                        TextField(" Onde vai ser a doação ", text: $local2)
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
                        Text("Data:").bold()
                            .frame(width: 200)
                            .foregroundColor(.white)
                        
                        TextField(" Data do agendamento ", text: $data2)
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
                        Text("Hora:").bold()
                            .frame(width: 200)
                            .foregroundColor(.white)
                        
                        TextField(" Horario do agendamento", text: $horario2)
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
                        Text("Peso:").bold()
                            .frame(width: 200)
                            .foregroundColor(.white)
                        
                        TextField(" Digite seu peso", text: $peso2)
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
                        Text("Você possui entre 16 e 69 anos?").bold()
                            .frame(width: 260)
                            .foregroundColor(.white)
                        
                        Picker("opcoes", selection: $selectedOpcao1) {
                            ForEach(opcoes, id: \.self) { opcao in
                                Text(opcao)
                            }
                        }.tint(.white)
                    }
                }
                ZStack{
                    Rectangle()
                        .foregroundColor(.corPrincipal)
                        .frame(width: 300, height: 90)
                        .cornerRadius(20)
                        .shadow(color: .gray.opacity(0.7), radius: 10, x: 5, y: 5)
                    VStack{
                        Text("Fez tatuagem nos últimos 12 meses?").bold()
                            .frame(width: 300)
                            .foregroundColor(.white)
                        
                        Picker("opcoes", selection: $selectedOpcao1) {
                            ForEach(opcoes, id: \.self) { opcao in
                                Text(opcao)
                            }
                        }.tint(.white)
                    }
                }
                VStack{
                    Button {
                        
                        
                        viewModel.fetchCriar(data2 ,local2, horario2)
                        showingSheet.toggle()
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
                }.sheet(isPresented: $showingSheet) {
                    ZStack{
                        Color.corPrincipal

                        VStack(spacing:20){
                            Text("Agendamento concluido!")
                                .font(.system(size: 25))
                            Text("LEMBRE-SE")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .bold()
                            Text("1 - Apresentar documento de identificação com foto emitido por órgão oficial - Carteira de identidade, Carteira Nacional de Habilitação, Carteira de Trabalho, Passaporte, Registro nacional de estrangeiro -Certificado de Reservista e Carteira Profissional emitida por classe")
                            Text("2 - Estar alimentado. Evite alimentos gordurosos nas 3 horas que antecedem a doação. Caso seja após o almoço, aguardar 2 horas;")
                            Text("3 - Ter dormido pelo menos 6 horas nas últimas 24 horas; Lembrando que o prazo mínimo após a última doação para o Homem é de 3 meses e para a mulher é de 4 meses")
                            Text("Seja um doador de Sangue e Medula Óssea! Pouco para quem doa e muito para quem precis. Procure o Hemocentro e salve vidas!")
                            
                        }
                        .padding(.horizontal,10)
                    }
                    .foregroundColor(.white)
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
                Text("Novo Agendamento")
                    .foregroundStyle(.white)
            }
            
        }

            .toolbarBackground(Color.corSecundaria, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        .padding(.top,5)

    }
}
#Preview {
    NovoAgendamento()
}
