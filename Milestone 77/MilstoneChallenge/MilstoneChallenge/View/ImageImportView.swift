//
//  ImageImportView.swift
//  MilstoneChallenge
//
//  Created by Mohanad Ramdan on 03/09/2023.
//

import SwiftUI

struct ImageImportView: View {
    @Environment(\.dismiss) var dismiss
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var ciImage: CIImage?
    @State private var processedImage: UIImage?
    @State private var textInput = ""
    @State private var showingImagePicker = false
    let context = CIContext()
    
    var body: some View {
        NavigationView{
            Form{
                ZStack {
                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .background(Color.secondary)
                        .cornerRadius(10)
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                    showingImagePicker = true
                }
                .listRowBackground(EmptyView())
                Section("Name"){
                    TextField("Image", text: $textInput)
                }
            }
            
        }
        .toolbar {
            Button("Save", action: save)
        }
        .navigationTitle("Add Image")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingImagePicker){
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) { _ in loadImage() }
    }
    
    
    func save(){
        guard let processedImage = processedImage else { return }

        let imageSaver = ImageSaver()
        imageSaver.writeToPhotoAlbum(image: processedImage)
        dismiss()
    }
    
    func loadImage(){
        guard let inputImage = inputImage else { return }
        let ciImage = CIImage(image: inputImage)
        
        guard let ciImage = ciImage else { return }
        if let cgimg = context.createCGImage(ciImage, from: ciImage.extent){
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
    
}

struct ImageImportView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ImageImportView()
        }
    }
}
