//
//  Model.swift
//  ProjectBloodBorne
//
//  Created by Turma02-11 on 06/08/24.
//

import Foundation



class Soli : ObservableObject {
    @Published var solicitacoes : [Solicitacoes] = []
    @Published var solicita = Solicitacoes(id: 1, nome: "", foto: "", sangue: "", descr: "")
    
    func fetch(){
        guard let url = URL(string: "http://192.168.128.12:1880/pegarTodosComen" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Solicitacoes].self, from: data)
                
                DispatchQueue.main.async {
                    self?.solicitacoes = parsed
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    
    
    func fetchCriar(_ nome: String, _ tipo: String, _ desc: String){
        let pessoa = PessoaGlobal()
        solicita = Solicitacoes(id: 1, nome: nome, foto: pessoa.pessoas.foto, sangue: tipo, descr: desc)
        
        
        guard let url = URL(string: "http://192.168.128.12:1880/criarComent" ) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        do {
            let jsonData = try JSONEncoder().encode(solicita)
                       request.httpBody = jsonData
                       
                       URLSession.shared.dataTask(with: request) { data, response, error in
                           if let error = error {
                               
                               PessoaGlobal().showalert = true
                               DispatchQueue.main.async {
                                 print(error.localizedDescription)
                               }
                               return
                           }
                           
                           guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else {
                               DispatchQueue.main.async {
                                 print((response as? HTTPURLResponse)?.statusCode ?? -1)
                               }
                               return
                           }
                           
                           DispatchQueue.main.async {
                             print("Sucesso")
                           }
                       }.resume()
            
        }catch{
            DispatchQueue.main.async {
                          print("Falha no json")
                       }
            
        }
        
    }
    
    
    
}


class Agendament : ObservableObject{
    
    @Published var agendamentodos : [Agendamentos] = []
    @Published var agenda = Agendamentos(data: " ", hora: "", local: "")
    
    
    func fetch(){
        guard let url = URL(string: "http://192.168.128.12:1880/pegarAgenda" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Agendamentos].self, from: data)
                
                DispatchQueue.main.async {
                    self?.agendamentodos = parsed
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    
    func fetchCriar(_ data: String,_ local: String, _ hora: String){
        agenda = Agendamentos(data: data, hora: hora, local: local)
        
        
        guard let url = URL(string: "http://192.168.128.12:1880/agendamento" ) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        do {
            let jsonData = try JSONEncoder().encode(agenda)
                       request.httpBody = jsonData
                       
                       URLSession.shared.dataTask(with: request) { data, response, error in
                           if let error = error {
                               
                               PessoaGlobal().showalert = true
                               DispatchQueue.main.async {
                                 print(error.localizedDescription)
                               }
                               return
                           }
                           
                           guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else {
                               DispatchQueue.main.async {
                                 print((response as? HTTPURLResponse)?.statusCode ?? -1)
                               }
                               return
                           }
                           
                           DispatchQueue.main.async {
                             print("Sucesso")
                           }
                       }.resume()
            
        }catch{
            DispatchQueue.main.async {
                          print("Falha no json")
                       }
            
        }
        
    }
    
    
}
