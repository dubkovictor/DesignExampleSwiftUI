//
//  Home.swift
//  DesignExample
//
//  Created by Victor on 22.01.2023.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showProfile: Bool
    @Binding var showContetn: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    AvatarView(showProfile: $showProfile)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.horizontal, 14)
                .padding(.top, 30)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    RingsView()
                        .padding(.horizontal, 30)
                        .padding(.bottom, 30)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        ForEach(sectionData) { item in
                            GeometryReader { geometry in
                                SectionView(section: item)
                                    .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20),
                                                      axis: (x: 0, y: 10, z: 0))
                            }
                            .frame(width: 275, height: 275)
                        }
                    }
                    .padding(30)
                    .padding(.bottom, 30)
                    .onTapGesture {
                        self.showContetn = true
                    }
                }
                .offset(y: -30)
                
                HStack {
                    Text("Сourses")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .padding(.leading, 30)
                .offset(y: -60)
                SectionView(width: screen.width - 60, height: 275, section: sectionData[1])
                    .offset(y: -60)
                
                Spacer()
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false), showContetn: .constant(false))
    }
}

struct SectionView: View {
    
    var width: CGFloat = 275
    var height: CGFloat = 275
    
    var section: Section
    
    var body: some View {
        VStack {
            HStack (alignment: .top) {
                Text(section.title)
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(Color(.white))
                Spacer()
                Image(section.logo)
            }
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: width, height: height)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData = [
    Section(title: "Desing SwiftUI", text: "50 Lessons", logo: "Logo SwiftUI", image: Image("1"), color: Color.purple),
    Section(title: "Fundamentals SwiftUI", text: "30 Lessons", logo: "Logo SwiftUI", image: Image("2"), color: Color.red),
    Section(title: "Еask solution", text: "10 Lessons", logo: "Logo SwiftUI", image: Image("4"), color: Color.blue)
]

struct RingsView: View {
    var body: some View {
        HStack(spacing: 30) {
            HStack(spacing: 12) {
                RingView(color1: .purple, color2: .blue, width: 44, height: 44, percent: 68, show: .constant(true))
                VStack (alignment: .leading, spacing: 4) {
                    Text("5 min ago")
                        .font(.subheadline)
                        .bold()
                    Text("Watched 15 minutes today")
                        .font(.caption)
                }
            }
            .padding(8)
            .background(.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 12)
            .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
            
            HStack(spacing: 12) {
                RingView(color1: .red, color2: .orange, width: 32, height: 32, percent: 58, show: .constant(true))
            }
            .padding(8)
            .background(.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 12)
            .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
            
            HStack(spacing: 12) {
                RingView(color1: .green, color2: .purple, width: 32, height: 32, percent: 18, show: .constant(true))
            }
            .padding(8)
            .background(.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 12)
            .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
        }
    }
}

