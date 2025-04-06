//
//  ScannedFoodDetails.swift
//  appFoodScan
//
//  Created by Carlos López on 05/04/25.
//
import SwiftUI
import Charts

struct MacroData {
    let name: String
    let value: Double
}

struct ScannedFoodDetails: View {
    
    @State private var macros: [MacroData] = [
        .init(name: "Carbs", value: 14.7),
        .init(name: "Protein", value: 10.5),
        .init(name: "Fat", value: 16.8)
    ]
    
    var body: some View {
        ScrollView {
            HStack {
                Button {
                    withAnimation(.snappy) { }
                } label: {
                    Image(systemName: "xmark")
                        .imageScale(.large)
                        .foregroundStyle(.blue)
                }
                
                Spacer()
                
                Button {
                    withAnimation(.snappy) { }
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                        .foregroundStyle(.blue)
                }
            }
            .padding()
            
            VStack {
                VStack {
                    Image("Kit-Kat-Logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                    
                    Text("Kit Kat")
                        .font(.title2)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                
                Divider()
                    .background(Color.white.opacity(0.5))
                    .padding(.vertical, 8)
                
                // Gráfica y valores al lado
                HStack {
                    // Gráfica
                    Chart {
                        ForEach(macros, id: \.name) { macro in
                            SectorMark(
                                angle: .value("Value", macro.value),
                                innerRadius: .ratio(0.8),
                                outerRadius: .ratio(1.0)
                            )
                            .foregroundStyle(by: .value("Macro", macro.name))
                        }
                    }
                    .frame(width: 150, height: 150)
                    
                    // Lista de valores a la derecha
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(macros, id: \.name) { macro in
                            HStack {
                                Circle()
                                    .fill(colorForMacro(macro.name))
                                    .frame(width: 10, height: 10)
                                
                                Text(macro.name)
                                    .foregroundColor(.white)
                                    .fontWeight(.light)
                                
                                Spacer()
                                
                                Text("\(macro.value, specifier: "%.1f") g")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }
                            Divider()
                        }
                    }
                    
                    .frame(maxWidth: .infinity)
                    .padding(.leading, 10)
                }.padding(.vertical, 6)
                
                Divider()
                    .background(Color.white.opacity(0.5))
                        
                
                
                VStack {
                    HStack {
                        Text("Cholesterol")
                            .foregroundColor(.white)
                            .fontWeight(.light)
                        
                        Spacer()
                        
                        Text("5mg (2%)")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    } .padding(.top, 8)
                    
                    Divider()
                    
                    HStack {
                        Text("Sodium")
                            .foregroundColor(.white)
                            .fontWeight(.light)
                        
                        Spacer()
                        
                        Text("21mg (1%)")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }
                
            
                
                VStack {
                    HStack {
                        Text("Calcium")
                            .foregroundColor(.white)
                            .fontWeight(.light)
                        
                        Spacer()
                        
                        Text("5mg (2%)")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    } .padding(.top, 8)
                    
                    Divider()
                    
                    HStack {
                        Text("Potasium")
                            .foregroundColor(.white)
                            .fontWeight(.light)
                        
                        Spacer()
                        
                        Text("21mg (1%)")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Sodium")
                            .foregroundColor(.white)
                            .fontWeight(.light)
                        
                        Spacer()
                        
                        Text("21mg (1%)")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Sodium")
                            .foregroundColor(.white)
                            .fontWeight(.light)
                        
                        Spacer()
                        
                        Text("21mg (1%)")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Sodium")
                            .foregroundColor(.white)
                            .fontWeight(.light)
                        
                        Spacer()
                        
                        Text("21mg (1%)")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }
                
                Divider()
                
                HStack {
                    Text("Sodium")
                        .foregroundColor(.white)
                        .fontWeight(.light)
                    
                    Spacer()
                    
                    Text("21mg (1%)")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                
            }
            .padding()
            .background(Color(red: 32/255, green: 34/255, blue: 42/255))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            
            
        }.overlay(alignment: .bottom){
            VStack{
                Divider()
                    .padding(.bottom)
                HStack{
                    VStack{
                        Text("Weight")
                            .font(.footnote)
                            .foregroundStyle(.white)
                            
                        
                        HStack
                        {
                            Text("42 g")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                            
                            Button {
                                withAnimation(.snappy) { }
                            } label: {
                                Image(systemName: "square.and.pencil")
                                    .imageScale(.large)
                                    .foregroundStyle(.white)
                            }
                            
                        }
                        
                        
                        
                    }
                    Spacer()
                   
                    HStack{
                        Button {
                            withAnimation(.snappy) { }
                        } label: {
                            Image(systemName: "minus.circle")
                                .imageScale(.large)
                                .foregroundStyle(.white)
                        }
                        
                        Text("1")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Button {
                            withAnimation(.snappy) { }
                        } label: {
                            Image(systemName: "plus.circle")
                                .imageScale(.large)
                                .foregroundStyle(.white)
                        }
                            
                    }
                    
                    
                    
                }.padding(.horizontal)
                HStack{
                    Button{
                        
                    } label:{
                        Text(" + Add")
                            .frame(width: 360, height: 60)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .background(.green)
                            .cornerRadius(40)
                    }
                }
            }
            .background(.blue)
        }
        
        
        
        
    }
    
    
    
    // Función para asignar colores a los macros
    private func colorForMacro(_ name: String) -> Color {
        switch name {
        case "Carbs": return .orange
        case "Protein": return .blue
        case "Fat": return .green
        default: return .gray
        }
    }
}

#Preview {
    ScannedFoodDetails()
}
