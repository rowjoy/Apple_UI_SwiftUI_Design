//
//  National_Parks.swift
//  apple-framework
//
//  Created by Jamirul Islam on 8/9/25.
//

import SwiftUI

struct National_Parks: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0){
                ScrollView(.vertical, showsIndicators: false){
                    FeaturedView(image: "view1",title: "Grand Canyon",subTitle: "Arizona")
                        .padding(.top)
                    MostPopuler( images: "view2", caption: "Dhaka", title: "Most populer")
                        .padding()
                    Divider()
                    MostPopuler(images: "view3", caption: "Bangladesh", title: "Top Views")
                        .padding()

                    
                }
                
            }            .navigationTitle("Now trending")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            print("Profile tapped")
                        }) {
                            ProfileView()
                        }
                    }
                }
        }
    }
}



#Preview {
    National_Parks()
}

struct FeaturedView: View {
    var image : String
    var title : String
    var subTitle : String
    var body: some View {
        ZStack(alignment: .bottomLeading){
            Image(image)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: .infinity,height: 250)
            VStack(alignment: .leading){
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text(subTitle)
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .bottomLeading)
            .background(Color.black.opacity(0.5))
            
            HStack (spacing: 6) {
                ForEach(0..<3, id: \.self){ index in
                    Circle()
                        .fill(Color.white)
                        .frame(width: 8, height: 8)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .bottomTrailing)
        }
        
 
    }
}

struct ProfileView: View {
    var body: some View {
        Image(systemName: "person.crop.circle.fill")
            .resizable()
            .frame(width: 32, height: 32)
            .foregroundColor(.blue)
    }
}

struct MostPopuler: View {
    var images : String
    var caption : String
    var title : String
    var body: some View {
        VStack (alignment: .leading,) {
            Text(title)                        .font(.system(size: 25, weight: .medium, design: .default))
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 10){
                    ForEach(2..<10){ index in
                        VStack (alignment: .leading) {
                            Image("view\(index)")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .cornerRadius(10)
                            HStack{
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 10, height: 10)
                                Text(caption)
                                    .font(.system(size: 15, weight: .medium, design: .default))
                                    .foregroundColor(.blue)
                            }
                            
                        }
                        
                    }
                }
            }
            
         }
    }
}
