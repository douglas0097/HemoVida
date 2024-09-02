import SwiftUI

struct Notifie: View {
    
    var body: some View {
        ScrollView{
            
            VStack{
                HStack{
                    Text("Notificações")
                        .foregroundStyle(.white)
                        .bold()
                    
                }
                .frame(maxWidth: .infinity)
                .padding(20)
                .background(Color(.corPrincipal))
                .roundedCornerWithBorder(radius: 10, corners:[.bottomLeft, .bottomRight])
                
                VStack(alignment:.leading){
                    Text("Hemocentro da Paraiba")
                        .font(.system(size: 22))
                        .bold()
                        .foregroundStyle(.corPrincipal)
                    
                    Divider()
                        .overlay(.white)
                    
                    Text("Requisicao para doacao de sangue aceita")
                        .foregroundStyle(.black)
                }
                .frame(width: 310, height: 110)
                .padding(.vertical,10)
                .padding(.horizontal,10)
                .cornerRadius(20)
                
                Divider()
                    .frame(width: 300)
                    .overlay(.red)
                
                VStack(alignment:.leading){
                    Text("Hemonucleo de Cajazeiras")
                        .font(.system(size: 22))
                        .bold()
                        .foregroundStyle(.corPrincipal)
                    
                    Divider()
                        .overlay(.white)
                    
                    Text("Sua solicitação foi aceita")
                        .foregroundStyle(.black)
                }
                .frame(width: 310, height: 110)
                .padding(.vertical,10)
                .padding(.horizontal,10)
                .cornerRadius(20)
                
                Divider()
                    .frame(width: 300)
                    .overlay(.red)
            }
           
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
    }

#Preview {
    Notifie()
}
