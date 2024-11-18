//
//  ContentView.swift
//  CalculatorApp
//
//  Created by Alem Nabiyev on 11/13/24.
//

import SwiftUI


let primaryColor = Color.init( #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1) )

struct ContentView: View {
    
    let rows = [
        ["7","8","9","/"],
        ["4","5","6","*"],
        ["1","2","3","-"],
        ["0",".","=","+"]
    ]
    
    @State private var finalValue: String = "Calculator"
    @State private var calExpression: [String] = []
    
    @State private var noBeingEntered: String = ""
    
    
    var body: some View {
        VStack {
            VStack {
                Text(finalValue)
                    .font(Font.custom("HelveticaNeue-Light", size: 78))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .foregroundColor(.white)
                
                Text(flattenTheExpression(exps: calExpression))
                    .font(Font.custom("HelveticaNeue-Light", size: 36))
                    .frame(alignment: .bottomTrailing)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(primaryColor)
            
            VStack {
                Spacer(minLength: 48)
                VStack {
                    ForEach(rows, id: \.self) { row in
                        HStack(alignment: .top, spacing: 0) {
                            Spacer(minLength: 13)
                            ForEach(row, id: \.self) { column in
                                Button(action: {
                                    handleButtonPress(column: column)
                                }, label: {
                                    Text(column)
                                        .font(.system(size: getFontSize(btnTxt: column)))
                                        .frame(maxWidth: .infinity, maxHeight: 100, alignment: .center)
                                      //  .frame ( width: 80, height: 80)
                               
                                .background(getBackground(str: column))
                                .foregroundColor(.white)
                               // .mask(RoundedRectangle(radius: 40, value: column))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                })

                            }
                        }
                    }
                }
            }
            .background(Color.black)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
    //        VStack {
    //            VStack{
    //                Text(finalValue)
    //                    .font(Font.custom("HelveticaNeue-Light", size:78))
    //                    .frame ( idealWidth: 100 , maxWidth: .infinity, idealHeight: 100, maxHeight: .infinity, alignment: .center )
    //                    .foregroundColor(Color.white)
    //
    //                Text(flattenTheExpression(exps: calExpression))
    //                    .font(Font.custom("HelveticaNeue-Light", size:36))
    //                    .frame(alignment: Alignment.bottomTrailing)
    //                    .foregroundColor(Color.white)
    //
    //
    //                Spacer()
    //
    //            }
    //            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    //            .background(primaryColor)
    //
    //            VStack{
    //                Spacer(minLength: 48)
    //                VStack{
    //                    ForEach(self.rows, id: \.self){ row in
    //                        /// this may be a problem
    //                        HStack( alignment: .top, spacing: 0) {
    //                            Spacer(minLength: 13)
    //                            ForEach(row, id: \.self) {
    //                                column in
    //                                Button(action: {
    //                                    handleButtonPress(column: column)
    //
    //                                    // moved to  sep func
    ////                                    if column == "=" {
    ////                                        self.calExpression = []
    ////                                        self.noBeingEntered = ""
    ////                                        return
    ////                                    } else if checkIfOperator(str: column) {
    ////                                        self.calExpression.append(column)
    ////                                        self.noBeingEntered = ""
    ////                                    } else {
    ////                                        self.noBeingEntered.append(column)
    ////                                        if self.calExpression.count == 0 {
    ////                                            self.calExpression.append(self.noBeingEntered)
    ////                                        } else {
    ////                                            if !checkIfOperator(str: self.calExpression[self.calExpression.count-1]) {
    ////                                                self.calExpression.remove(at: self.calExpression.count-1)
    ////
    ////                                            }
    ////                                            self.calExpression.append(self.noBeingEntered)
    ////                                        }
    ////                                    }
    ////                                    self.finalValue = processExpression ( exp: self.calExpression )
    ////                                    if self.calExpression.count > 3 {
    ////                                        self.calExpression = [self.final]
    ////
    //                                    }
    //
    //                                       }, label: {
    //                                    Text(column)
    //                                        .font(.system(size: getFontSize( btnTxt:column)))
    //                                        .frame(idealWidth:100, maxWidth: .infinity, idealHeight: 100, maxHeight: .infinity, alignment: .center)
    //                                } )
    //                                .foregroundColor(Color.white)
    //                                .background(getBackground(str:column))
    //                                .mask(CustomShape(radius: 40, value: column))
    //
    //
    //
    //                            }
    //                        }
    //                    }
    //
    //                }
    //            }
    //            .background(Color.black)
    //            .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    //        }
    //        .background(Color.black)
    //        .edgesIgnoringSafeArea(.all)
    //    }
    //
    //
//    func handleButtonPress(column: String) {
//        if column == "=" {
//            finalValue = processExpression(exp: calExpression)
//            calExpression = [] // Reset after calculation
//            noBeingEntered = ""
//        } else if checkIfOperator(str: column) {
//            calExpression.append(column)
//            noBeingEntered = ""
//        } else {
//            noBeingEntered.append(column)
//            if calExpression.isEmpty {
//                calExpression.append(noBeingEntered)
//            } else {
//                if !checkIfOperator(str: calExpression.last!) {
//                    calExpression.removeLast()
//                }
//                calExpression.append(noBeingEntered)
//            }
//        }
//    }
//    
//    
//    func getBackground(str:String) -> Color {
//        if checkIfOperator(str: str){
//            return primaryColor
//        }
//        return Color.black
//    }
//    
//    
//    
//    func getFontSize(btnTxt: String) -> CGFloat {
//        if checkIfOperator(str: btnTxt){
//            return 42
//        }
//        return 24
//    }
//    
//    func checkIfOperator(str: String) -> Bool {
//        if str == "+" || str == "-" || str == "*" || str == "/" || str == "=" {
//            return true
//        }
//        return false
//    }
//    
//    
//    struct RoundedRectangle: Shape {
//        let radius: CGFloat
//        let value: String
//        
//        func path(in rect: CGRect) -> Path {
//            var path = Path()
//            
//            let tl = CGPoint(x: rect.minX, y: rect.minY)
//            let tr = CGPoint(x: rect.maxX, y: rect.minY)
//            let br = CGPoint(x: rect.maxX, y: rect.maxY)
//            let bl = CGPoint(x: rect.minX, y: rect.maxY)
//            
//            let tls = CGPoint(x: rect.minX, y: rect.minY+radius)
//            let tlc = CGPoint(x: rect.minX + radius, y: rect.minY+radius)
//            
//            
//            path.move(to: tr)
//            path.addLine(to: br)
//            path.addLine(to: bl)
//            if value == "+" || value == "=" {
//                path.addLine ( to: tls )
//                path.addRelativeArc(center : tlc, radius: radius, startAngle: Angle.degrees(90), delta: Angle.degrees(180))
//            } else {
//                path.addLine ( to: tl )
//            }
//            
//            return path
//            
//        }
//        
//    }
//    
//    
//    func flattenTheExpression(exps: [String]) -> String {
//        
//        return exps.joined()
//    }
//    
//    
//    
//    func processExpression(exp:[String]) -> String {
//        if exp.count < 3 {
//            
//            return "0.0"
//        }
//        
//        guard var a = Double(exp[0]) else { return "0.0" }
//        var c: Double?
//        
//        for i in stride(from: 1, to: exp.count - 1, by: 2) {
//            c = Double(exp[i + 1])
//            guard let operand = c else { continue }
//            switch exp[i]{
//            case "+":
//                a += operand
//            case "-":
//                a -= operand
//            case "*":
//                a *= operand
//            case "/":
//                if operand != 0 {
//                    a /= operand
//                } else {
//                    return "Error"
//                }
//            default:
//                break
//            }
//        }
//        return String(format: "%.1f", a)
//    }
//}
//
//
//
    
    func handleButtonPress(column: String) {
            if column == "=" {
                finalValue = processExpression(exp: calExpression)
                calExpression = [] // Reset after calculation
                noBeingEntered = ""
            } else if checkIfOperator(str: column) {
                calExpression.append(column)
                noBeingEntered = ""
            } else {
                noBeingEntered.append(column)
                if calExpression.isEmpty {
                    calExpression.append(noBeingEntered)
                } else {
                    if !checkIfOperator(str: calExpression.last!) {
                        calExpression.removeLast()
                    }
                    calExpression.append(noBeingEntered)
                }
            }
        }
        
    func getBackground(str: String) -> Color {
           return checkIfOperator(str: str) ? primaryColor : Color.black
       }

       func getFontSize(btnTxt: String) -> CGFloat {
           return checkIfOperator(str: btnTxt) ? 42 : 24
       }

       func checkIfOperator(str: String) -> Bool {
           return ["+", "-", "*", "/", "="].contains(str)
       }

       func flattenTheExpression(exps: [String]) -> String {
           return exps.joined()
       }

       func processExpression(exp: [String]) -> String {
           if exp.count < 3 {
               return "0.0"
           }

           guard var a = Double(exp[0]) else { return "0.0" }
           var c: Double?

           for i in stride(from: 1, to: exp.count - 1, by: 2) {
               c = Double(exp[i + 1])
               guard let operand = c else { continue }

               switch exp[i] {
               case "+":
                   a += operand
               case "-":
                   a -= operand
               case "*":
                   a *= operand
               case "/":
                   if operand != 0 {
                       a /= operand
                   } else {
                       return "Error" // Handle division by zero
                   }
               default:
                   break
               }
           }
           return String(format: "%.1f", a)
       }
   }
#Preview {
    ContentView()
}
