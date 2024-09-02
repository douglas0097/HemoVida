import SwiftUI

struct  Solicitacao: View {
    
    var arrayMinhasSolicitacoes = [Solicitacoes(id: 1, nome: "Miqueias Regis", foto: "https://i.pinimg.com/236x/de/46/8f/de468f5ad8f306a00ce2342743c1ac7b.jpg", sangue: "O+", descr: "Ta morrendo porque nào aguentou as horas de tabalho excessiva"),
                             
                             
    ]
    
    
    
    
    @StateObject var viewModel = Soli()
    
    var body: some View {
        ScrollView{
            
            VStack{
                ForEach(viewModel.solicitacoes.filter{$0.id == 1}, id: \.self){
                    pSolicitacao in
                    ZStack{
                        HStack{
                            AsyncImage(url: URL(string: pSolicitacao.foto)){image in
                                image.image?.resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50 )
                                    .cornerRadius(100)
                                
                            }
                            .frame(width: 45, height: 20)
                            .padding(.bottom,30)
                            .padding(.leading,5)
                            
                            VStack(alignment:.leading){
                                Text("**Nome:** \(pSolicitacao.nome)")
                                Divider()
                                Text("**Descrição**: \(pSolicitacao.descr)")
                            }
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
                    }
                    .frame(width: 340, height: 100)
                    .background(Color.corPrincipal)
                    .cornerRadius(20)
                    .padding(.top, 15)
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
            
        }.onAppear(){
            viewModel.fetch()
        }
        .padding(.top,70)
        .toolbar{
            ToolbarItem(placement: .principal) {
                Text("Minhas Solicitações")
                    .foregroundStyle(.white)
            }
            
        }
        .foregroundColor(.white)

            .toolbarBackground(Color.corSecundaria, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    
    
}

#Preview {
    Solicitacao()
}
