//
//  ContentView.swift
//  BloodLink
//
//  Created by Turma02-1 on 30/07/24.
//

import SwiftUI
import Foundation
import MapKit


struct Location : Identifiable{
    let id = UUID()
    let nome: String
    let cordenadas: CLLocationCoordinate2D
    let endereco: String
    let telefone: String
    let horarioDeFuncionamento:String
    let imagem: String
    
}



struct Mapa: View {
    
    
    let hemocentro = CLLocationCoordinate2D(
        latitude: -7.23968082424875,
        longitude: -35.872661430932865)
    let hemocentroPB = CLLocationCoordinate2D(
        latitude: -7.127393220227291,
        longitude:  -34.8706310045366)
    let hemocentroCJ = CLLocationCoordinate2D(
        latitude: -6.883404759732599,
        longitude:  -38.554493477268174)
    
    var hemocentros = [
        Location(nome: "hemocentro Regional de Campina Grande",
                 cordenadas: CLLocationCoordinate2D(
                    latitude: -7.23968082424875,
                    longitude: -35.872661430932865),
                 endereco: "Endereço: R. Profa. Eutécia Vital Ribeiro",
                 telefone: "Telefone: (83) 3344-5482",
                 horarioDeFuncionamento: "Horario de funcionamento: \n Seg - Sex : 7:00 - 17:30 \n sab: 7:00 - 11:30",
                 imagem: "https://www.portaldacapital.com/wp-content/uploads/2023/02/hemocentro-de-cg-1.jpg "),
        Location(nome: "Hemocentro da Paraiba ",
                 cordenadas: CLLocationCoordinate2D(
                    latitude: -7.127393220227291,
                    longitude:  -34.8706310045366),
                 endereco: "Endereço: R. Profa. Eutécia Vital Ribeiro",
                 telefone: "Telefone: (83) 3344-5482",
                 horarioDeFuncionamento: "Horario de funcionamento: \n Seg - Sex : 7:00 - 17:30 \n sab: 7:00 - 11:30",
                 imagem: "https://dercio.com.br/wp-content/uploads/2023/02/Hemocentro-2.jpeg"),
        Location(nome: "Hemonucleo de Cajazeiras",
                 cordenadas: CLLocationCoordinate2D(
                    latitude: -6.883404759732599,
                    longitude:  -38.554493477268174),
                 endereco: "Endereço: R. José Rodovalho de Alençar - Bairro Cristo Rei, Cajazeiras - PB",
                 telefone: "Telefone: (83) 3531-6687",
                 horarioDeFuncionamento: "Horario de funcionamento: \n Seg - Sex : 7:00 - 12:00",
                 imagem:"https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEivv-nB0xwHhM2SjVTzOPXrh9vuX4JVHbQK2Eyvr-ZODcsQVWWR4F8T1HAs9D1xeXS_AbAAbazzsjdAX7o4BAnVFjvA-sBgkTSlm9mAgVeMw9I39MYQgywzqspH5Wdxh2USG8imfaUu3bg/s1600/100_1654.jpg"),
        
    ]
    
    @State var aux : Location = Location(nome: "hemocentro Regional de Campina Grande",
                                         cordenadas: CLLocationCoordinate2D(
                                            latitude: -7.23968082424875,
                                            longitude: -35.872661430932865),
                                         endereco: "Endereço: R. Profa. Eutécia Vital Ribeiro",
                                         telefone: "Telefone: (83) 3344-5482",
                                         horarioDeFuncionamento: "Horario de funcionamento: \n Seg - Sex : 7:00 - 17:30 \n sab: 7:00 - 11:30",
                                         imagem: "https://www.portaldacapital.com/wp-content/uploads/2023/02/hemocentro-de-cg-1.jpg ")
    
    
    @State var camera = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -7.23968082424875, longitude: -35.872661430932865),
            span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)))
    @State var showModel: Bool = false
    
    var body: some View {
        ZStack{
            Map(position: $camera){
                ForEach(hemocentros, id: \.id){ i in
                    Annotation(i.nome, coordinate: i.cordenadas){
                        ZStack{
                            Circle()
                                .fill(Color.corPrincipal)
                            Text("🩸")
                                .padding(5)
                                .onTapGesture {
                                    showModel = true
                                    aux = i
                                }
                            
                        }
                    }
                }
                
                
                
            } .sheet(isPresented: $showModel){
                ZStack{
                    Color(.corPrincipal)
                    VStack{
                        Text(aux.nome)
                            .foregroundStyle(.white)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                            .padding()
                        
                        VStack{
                            AsyncImage(url: URL(string: aux.imagem )){image in
                                image.image?
                                    .resizable()
                                    .scaledToFit()
                                
                            }
                            
                        }
                        .cornerRadius(5)
                        .padding()
                        VStack(alignment: .leading){
                            Text(aux.endereco)
                            
                            Divider()
                            Text(aux.telefone)
                            Divider()
                            Text(aux.horarioDeFuncionamento )
                            Divider()
                            
                        }
                        .foregroundStyle(.white)
                        .padding()
                        
                        Spacer()
                        
                    }
                }
                
            }
            
            
        }.toolbar{
            ToolbarItem(placement: .principal) {
                Text("Clinicas")
                    .foregroundStyle(.white)
            }
            
        }
        .toolbarBackground(Color.corPrincipal, for: .navigationBar)
        
    }
    
    
    
    
}


#Preview {
    Mapa()
}
