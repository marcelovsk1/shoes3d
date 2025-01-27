//
//  Home.swift
//  shoes_app
//
//  Created by Marcelo Amaral Alves on 2024-04-25.
//

import SwiftUI
import SceneKit

struct Home: View {
    @State var scene: SCNScene? = .init(named: "nike_dunk.scn")
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
            
            ShoePropertiesViews()
        }
        .padding()
    }
    
    // MARK: Custom Seeker
    @ViewBuilder
    func CustomSeeker() -> some View {
        GeometryReader {_ in
            Rectangle()
                .trim(from: 0, to: 0.474)
                .stroke(.linearGradient(colors: [
                    .clear,
                    .clear,
                    .black.opacity(0.2),
                    .black.opacity(0.6),
                    .white,
                    .black.opacity(0.6),
                    .black.opacity(0.2),
                    .clear,
                    .clear
                ],
                        startPoint: .leading, endPoint: .trailing), style:
                        StrokeStyle(lineWidth: 2, lineCap: .round,
                        lineJoin: .round, miterLimit: 1, dash: [2], dashPhase: 1))
                .overlay {
                    // MARK: Seeker View
                    HStack(spacing: 3) {
                        Image(systemName: "arrowtriangle.left.fill")
                            .font(.caption)
                        Image(systemName: "arrowtriangle.right.fill")
                            .font(.caption)
                    }
                    .foregroundColor(.black)
                    .padding(.horizontal, 7)
                    .padding(.vertical, 10)
                    .background {
                        RoundedRectangle(cornerRadius: 10,
                                         style: .continuous)
                        .fill(.orange)
                    }
                    .offset(y: -6)
                }
        }
        
    }
    
    // MARK: Shoe Properties
    @ViewBuilder
    func ShoePropertiesViews() -> some View {
        VStack {
            VStack(alignment: .leading, spacing: 12) {
                Text("Nike React-X 4 ")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Text("Men's Running Shoes")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                Label {
                    Text("4.5")
                        .fontWeight(.semibold)
                } icon: {
                    Image(systemName: "star.fill")
                }
            }
            .padding(.top, 30)
            .frame(maxWidth: .infinity, alignment: .leading)
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
                Image(systemName: "arrowtriangle.left.and.line.vertical.and.arrowtriangle.right.fill")
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
