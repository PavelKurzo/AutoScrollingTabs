//
//  HomeView.swift
//  AutoScrollingTabs
//
//  Created by Павел Курзо on 09/03/2023.
//

import SwiftUI

struct HomeView: View {
    @State private var activeTab: ModelType = .horses
    @Namespace private var animation
    @State private var productsBasedOnType: [[ModelData]] = []
    @State private var animationProgress: CGFloat = 0
    @State private var scrollableTabOffset: CGFloat = 0
    @State private var initialOffset: CGFloat = 0
    
    var body: some View {
        
        ScrollViewReader { proxy in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    ForEach(productsBasedOnType, id: \.self) { products in
                        ProductSectionView(products)
                    }
                }
                .offset("CONTENTVIEW") { rect in
                    scrollableTabOffset = rect.minY - initialOffset
                }
            }
            .offset("CONTENTVIEW", completion: { rect in
                initialOffset = rect.minY
            })
            .safeAreaInset(edge: .top) {
                ScrollableTabs(proxy)
                    .offset(y: scrollableTabOffset > 0 ? scrollableTabOffset : 0)
            }
        }
        .coordinateSpace(name: "CONTENTVIEW")
        .navigationTitle("Info list")
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color("Purple"), for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .background {
            Rectangle()
                .fill(Color("BG"))
                .ignoresSafeArea()
        }
        .onAppear {
            guard productsBasedOnType.isEmpty else { return }
            
            for type in ModelType.allCases {
                let products = products.filter { $0.type == type }
                productsBasedOnType.append(products)
            }
        }
    }
    
    @ViewBuilder
    func ProductSectionView(_ products: [ModelData]) -> some View {
        VStack(alignment: .leading, spacing: 15) {
            if let firstProduct = products.first {
                Text(firstProduct.type.rawValue)
                    .font(.title)
                    .fontWeight(.semibold)
            }
            
            ForEach(products) { product in
                ProductRowView(product)
            }
        }
        .padding(15)
        .id(products.type)
        .offset("CONTENTVIEW") { rect in
            let minY = rect.minY

            if (minY < 30 && -minY < (rect.midY / 2) && activeTab != products.type) && animationProgress == 0 {
                withAnimation(.easeInOut(duration: 0.3)) {

                    activeTab = (minY < 30 && -minY < (rect.midY / 2) && activeTab != products.type) ? products.type : activeTab
                }
            }
        }
    }
    
    @ViewBuilder
    func ProductRowView(_ product: ModelData) -> some View {
        HStack(spacing: 15) {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding(10)
                .background {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(.white)
                }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(product.title)
                    .font(.title3)
                
                Text(product.subtitle)
                    .font(.callout)
                    .foregroundColor(.gray)
                
                Text(product.price)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Purple"))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    func ScrollableTabs(_ proxy: ScrollViewProxy) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(ModelType.allCases, id: \.rawValue) { type in
                    Text(type.rawValue)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .background(alignment: .bottom, content: {
                            if activeTab == type {
                                Capsule()
                                    .fill(.white)
                                    .frame(height: 5)
                                    .padding(.horizontal, -5)
                                    .offset(y: 15)
                                    .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                            }
                        })
                        .padding(.horizontal, 15)
                        .contentShape(Rectangle())
                        .id(type.tabID)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                activeTab = type
                                animationProgress = 1.0
                                proxy.scrollTo(type, anchor: .topLeading)
                            }
                        }
                }
            }
            .padding(.vertical, 15)
            .onChange(of: activeTab) { newValue in
                withAnimation(.easeInOut(duration: 0.3)) {
                    proxy.scrollTo(newValue.tabID, anchor: .center)
                }
            }
            .checkAnimationEnd(for: animationProgress) {
                animationProgress = 0.0
            }
        }
        .background {
            Rectangle()
                .fill(Color("Purple"))
                .shadow(color: .black.opacity(0.2), radius: 5, x: 5, y: 5)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
