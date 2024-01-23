//
//  ContentView.swift
//  LockAnimationApp
//
//  Created by Pouya Sadri on 12/01/2024.
//

import SwiftUI

//MARK: - Content View
struct ContentView: View {
    var body: some View {
		ZStack{
			LinearGradient(gradient: Gradient(colors: [Color(red: 83/255, green: 105/255, blue: 118/255),Color(red: 41/255, green: 43/255, blue: 73/255)]), startPoint: .topLeading, endPoint: .bottomTrailing)
				.ignoresSafeArea()
			LockView()
		}
    }
}

#Preview {
    ContentView()
}

//MARK: - Lock View

struct LockView: View {
	@State var isLock : Bool = false
	var body: some View {
		ZStack{
			LockCircle(isLock: $isLock)
			LockRectangle(isLock: $isLock)
			LockTextAndToggleView(isLock: $isLock)
		}
	}
}
//MARK: - LockCircle View
struct LockCircle : View {
	@Binding var isLock : Bool
	var body: some View {
		ZStack{
			Circle()
				.trim(from: 0.0 , to: 0.5)
				.stroke(isLock ? Color.green : Color.gray, style: StrokeStyle(lineWidth: 20,lineCap: .round))
				.frame(width: 160,height: 160,alignment: .center)
				.rotationEffect(.degrees(isLock ? 270 : 180))
				.animation(Animation.easeInOut(duration: 0.5).repeatCount(1),value: isLock)
				.onAppear(){
					self.isLock.toggle()
				}
				.offset(x:0,y:-133)
		}
	}
}
//MARK: - LockRectangle
struct LockRectangle:View {
	@Binding var isLock : Bool
	var body: some View {
		RoundedRectangle(cornerRadius: 25)
			.foregroundStyle(.black)
			.foregroundStyle(isLock ? .green : .gray)
			.frame(width: 250, height: 250,alignment: .center)
	}
}
//MARK: - LockTextAndToggle View
struct LockTextAndToggleView : View {
	@Binding var isLock : Bool
	var body: some View {
		VStack{
			Text(isLock ? "Unlock" : "Lock")
				.font(.largeTitle)
				.fontWeight(.regular)
				.foregroundStyle(isLock ? .green : .gray)
			Toggle("",isOn: $isLock)
				.labelsHidden()
		}
		.padding()
		.overlay{
			RoundedRectangle(cornerRadius: 25)
				.stroke(lineWidth: 5)
				.foregroundStyle(isLock ? .green : .gray)
				.frame(width: 250,height: 250, alignment: .center)
		}
	}
}
