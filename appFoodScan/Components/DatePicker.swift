//
//  DatePicker.swift
//  appFoodScan
//
//  Created by Carlos López on 05/04/25.
//

import SwiftUI

struct TimePicker: View {
    @State private var hour: Int = 0
    @State private var minutes: Int = 0
    @State private var seconds: Int = 0
    var body: some View {
        HStack(spacing: 0) {
            CustomView("hours", 0...24, $hour)
        }
    }

    @ViewBuilder
    private func CustomView(_ title: String, _ range: ClosedRange<Int>, _ selection: Binding<Int>) -> some View {
        PickerViewWithoutIndicator(selection: selection) {
            ForEach(range, id: \.self) { value in
                Text("\(value)")
                    .tag(value)
            }
        }
        .overlay {
            Text(title)
                .font(.callout)
                .frame(width: 50, alignment: .leading)
                .lineLimit(1)
                .offset(x: 50)
        }
    }
}



struct PickerViewWithoutIndicator<Content: View, Selection: Hashable>: View {
    @Binding var selection: Selection
    @ViewBuilder var content: Content
    @State private var isHidden: Bool = false
    var body: some View {
        Picker("", selection: $selection){
            if !isHidden{
                RemovePickerIndicator {
                    isHidden = true
                }
            }
            
            content
        }
        .pickerStyle(.wheel)
    }
}

fileprivate
struct RemovePickerIndicator: UIViewRepresentable {
    var result: () -> ()
    func makeUIView(context: Context) -> UIView{
        let view = UIView()
        view.backgroundColor = .clear
        DispatchQueue.main.async {
            if let pickerView = view.pickerView {
                if pickerView.subviews.count >= 2{
                    pickerView.subviews[1].backgroundColor = .clear
                }
                result()
            }
        }
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIView, context: Context){
        
    }
}

fileprivate
extension UIView {
    var pickerView: UIPickerView? {
        if let view = superview as? UIPickerView {
            return view
        }
        
        return superview?.pickerView
    }
}
