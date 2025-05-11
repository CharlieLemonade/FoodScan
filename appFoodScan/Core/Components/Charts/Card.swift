//
//  Card.swift
//  appFoodScan
//
//  Created by Carlos López on 10/05/25.
//

import SwiftUI

struct Card: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.systemGray6)        .ignoresSafeArea()
                
                ScrollView{
                    VStack{
                        VStack(spacing: 1) {
                            Image("Kit-Kat-Logo")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                            
                            Text("Kit Kat")
                                .font(.title2)
                                .fontWeight(.semibold)
                        
                            HStack {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 1)
                            }.padding()
                            
                            MacroChartSection(macros: [
                                Macro(name: "Carbs", value: 22.5),
                                Macro(name: "Protein", value: 3.2),
                                Macro(name: "Fat", value: 11.0)
                            ], totalCalories: 217.0).padding(.horizontal)
                            
                            
                            HStack {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 1)
                            }.padding()
                            
                            VStack(spacing: 16){
                                HStack {
                                    Text("Cholesterol")
                                        .fontWeight(.light)
                                    
                                    Spacer()
                                    
                                    Text("5 mg (2%)")
                                        .fontWeight(.semibold)
                                }
                                .font(.callout).foregroundColor(AppColors.text)
                                .padding(.horizontal)
                                
                                HStack {
                                    Text("Sodium")
                                        .fontWeight(.light)
                                    
                                    Spacer()
                                    
                                    Text("5 mg (2%)")
                                        .fontWeight(.semibold)
                                }
                                .font(.callout).foregroundColor(AppColors.text)
                                .padding(.horizontal)
                            }
                            
                            HStack {
                                Text("Minerals")
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                                Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 1)
                            }.padding()
                            
                            VStack(spacing: 16){
                                HStack {
                                    Text("Calcium")
                                        .fontWeight(.light)
                                    
                                    Spacer()
                                    
                                    Text("5 mg (2%)")
                                        .fontWeight(.semibold)
                                }
                                .font(.callout).foregroundColor(AppColors.text)
                                .padding(.horizontal)
                                
                                HStack {
                                    Text("Iron")
                                        .fontWeight(.light)
                                    
                                    Spacer()
                                    
                                    Text("5 mg (2%)")
                                        .fontWeight(.semibold)
                                }
                                .font(.callout).foregroundColor(AppColors.text)
                                .padding(.horizontal)
                                
                                HStack {
                                    Text("Potasium")
                                        .fontWeight(.light)
                                    
                                    Spacer()
                                    
                                    Text("5 mg (2%)")
                                        .fontWeight(.semibold)
                                }
                                .font(.callout).foregroundColor(AppColors.text)
                                .padding(.horizontal)
                            }
                            
                        }
                        .background(Color(.systemBackground))
                        .cornerRadius(12)
                        .padding(.horizontal)
                    }.padding(.vertical)
                }
                .navigationTitle("Search")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            withAnimation(.snappy) { }
                        } label: {
                            Image(systemName: "xmark")
                                .imageScale(.large)
                                .foregroundStyle(AppColors.text)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            withAnimation(.snappy) { }
                        } label: {
                            Image(systemName: "heart")
                                .imageScale(.large)
                                .foregroundStyle(AppColors.text)
                        }
                    }
                }
                .overlay(alignment: .bottom){
                    VStack{
                        Divider()
                            .padding(.bottom)
                        HStack{
                            VStack{
                                Text("Weight")
                                    .font(.footnote)
                                    .foregroundStyle(.gray)
                                    
                                
                                HStack
                                {
                                    Text("42 g")
                                        .font(.title)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(AppColors.text)
                                    
                                    Button {
                                        withAnimation(.snappy) { }
                                    } label: {
                                        Image(systemName: "square.and.pencil")
                                            .imageScale(.large)
                                            .foregroundStyle(.gray)
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
                                        .foregroundStyle(AppColors.text)
                                }
                                
                                Text("1")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Button {
                                    withAnimation(.snappy) { }
                                } label: {
                                    Image(systemName: "plus.circle")
                                        .imageScale(.large)
                                        .foregroundStyle(AppColors.text)
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
                                    .foregroundStyle(AppColors.text)
                                    .background(AppColors.primary)
                                    .cornerRadius(40)
                            }
                        }
                    }
                    .background(.white)
                }
                
                
            }
        }
        
    }
}

#Preview {
    Card()
}
