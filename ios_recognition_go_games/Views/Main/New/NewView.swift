//
//  NewView.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 04.03.2023.
//

import SwiftUI
import UIKit

struct NewView: View {
    @StateObject private var viewModel = NewViewModel()
    @State private var selectedSource = 0
    @State private var presentImporter = false
    
    @State private var target: Binding<String>?    // dynamic target for importer
    
    @State private var parsedGame: Game? = nil
    
    
    var body: some View {
        VStack {
            Text("Recognize new Game").font(.title).padding(.bottom, 40)
            VStack(alignment: .leading) {
                TextField(Date().convertDateToString(), text: $viewModel.gameTitle)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .padding(.bottom, 20)
                    .cornerRadius(5)
                Text("Board size")
                DropdownSelector(placeholder: "Select board size", options: viewModel.boardSizeOptions).padding(.bottom, 40).zIndex(2)
                Text("Source")
            }
            HStack(spacing: 0) {
                Button(action: {
                    selectedSource = 0
                }) {
                    Text("Real-time")
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                        .background(selectedSource == 0 ? Color(r: 176, g: 176, b: 176) : Color(r: 237, g: 237, b: 237))
                        .edgesIgnoringSafeArea(.bottom)
                }
                Divider()
                    .frame(width: 1)
                    .background(Color.black)
                Button(action: {
                    selectedSource = 1
                }) {
                    Text("File")
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                        .background(selectedSource == 1 ? Color(r: 176, g: 176, b: 176) : Color(r: 237, g: 237, b: 237))
                        .edgesIgnoringSafeArea(.bottom)
                }
            }.frame(width: 200, height: 40).padding(.bottom, 10).zIndex(-1)
            switch selectedSource {
            case 0:
                HStack{}.padding(.bottom, 10)
            case 1:
                VStack(alignment: .leading) {
                    Button {
                        presentImporter = true
                    } label: {
                        HStack(spacing: 0) {
                            Image(systemName: "tray.and.arrow.up.fill").padding(.leading, 10)
                            Text("Upload").frame(maxWidth: .infinity)
                        }.frame(width: 150, height: 50).background(Color(r: 237, g: 237, b: 237)).foregroundColor(Color.black)
                    }.padding(.bottom, 20).fileImporter(isPresented: $presentImporter, allowedContentTypes: []) { result in
                        do{
                            let fileUrl = try result.get()
                            guard fileUrl.startAccessingSecurityScopedResource() else { return }
                            if let data = try? Data(contentsOf: fileUrl),
                               let text = String(data: data, encoding: .utf8) {
                                self.target?.wrappedValue = text
                                let gameParser = GameParser(sgf: text)
                                parsedGame = gameParser.parseSGF()
                            }
                            fileUrl.stopAccessingSecurityScopedResource()
                            
                        } catch{
                            print ("error reading")
                            print (error.localizedDescription)
                        }
                    }
                    HStack(spacing: 30) {
                        TextField("Start 00:00:00", text: $viewModel.fileStartTime)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .padding(.bottom, 20)
                            .cornerRadius(5)
                        TextField("End 12:34:56", text: $viewModel.fileEndTime)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .padding(.bottom, 20)
                            .cornerRadius(5)
                    }
                }.padding(.bottom, 10)
            default:
                HStack{}
            }
            switch selectedSource {
            case 0:
                NavigationLink(destination: CameraContentView()) {
                    HStack(spacing: 0) {
                        Text("Start").frame(maxWidth: .infinity)
                    }.frame(width: 160, height: 40).background(Color(r: 217, g: 217, b: 217)).foregroundColor(Color.black)
                }
            case 1:
                if checkFile() {
                    NavigationLink(destination: GameFileView(viewModel: GameFileViewModel(currentGame: parsedGame))) {
                        HStack(spacing: 0) {
                            Text("Start").frame(maxWidth: .infinity)
                        }.frame(width: 160, height: 40).background(Color(r: 217, g: 217, b: 217)).foregroundColor(Color.black)
                    }
                } else {
                    HStack(spacing: 0) {
                        Text("Start").frame(maxWidth: .infinity)
                    }.frame(width: 160, height: 40).background(Color(r: 217, g: 217, b: 217)).foregroundColor(Color.black)
                }
                
            default:
                Text("")
            }
            Spacer()
        }.padding(30).onAppear {
            //                viewModel.checkPermission()
            //                while true {
            //                    if !viewModel.permissionGranted {
            //                        viewModel.checkPermission()
            //                    } else {
            //                        break
            //                    }
            //                }
        }
    }
    
    private func checkFile() -> Bool {
        if parsedGame == nil {
            return false
        } else {
            return true
        }
    }
}

struct NewView_Previews: PreviewProvider {
    static var previews: some View {
        NewView()
    }
}



