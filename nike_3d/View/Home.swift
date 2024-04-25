//
//  Home.swift
//  shoes_app
//
//  Created by Marcelo Amaral Alves on 2024-04-25.
//

import SwiftUI
import SceneKit

struct Home: View {
    @State var scene: SCNScene? = .init(named: "nike_react.scn")
    // Mark: View Properties
    @State var isVerticalLook: Bool = false
    var body: some View {
        VStack {
            HeaderView()
            
            // MARK: 3D View
            CustomSceneView(scene: $scene)
                .frame(height: 350)
                .padding(.top, -50)
                .padding(.bottom, -15)
            
            CustomSeeker()
        }
        .padding()
    }
    
    // MARK: Custom Seeker
    @ViewBuilder
    func CustomSeeker() -> some View {
        GeometryReader {_ in
            Rectangle()
                .trim(from: 0, to: 0474)
                .stroke(.linearGradient(colors: [],
                        startPoint: .leading, endPoint: .trailing), style:
                        StrokeStyle(lineWidth: 2, lineCap: .round,
                        lineJoin: .round, miterLimit: 1, dash: [3], dashPhase: 1))
        }
        
    }
    
    // MARK: Header View
    @ViewBuilder
    func HeaderView() -> some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "arrow.left")
                    .font(.system(size: 16, weight: .heavy))
                    .foregroundColor(.black)
                    .frame(width: 42, height: 42)
                    .background {
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(.black.opacity(0.2))
                    }
            }
            
            Spacer()
            
            Button {
                withAnimation(.easeInOut){isVerticalLook.toggle()}
            } label: {
                Image(systemName: "arrow.left")
                    .font(.system(size: 16, weight: .heavy))
                    .foregroundColor(.black)
                    .frame(width: 42, height: 42)
                    .background {
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(.black.opacity(0.2))
                    }
            }
        }
    }
}

#Preview { ContentView() }
