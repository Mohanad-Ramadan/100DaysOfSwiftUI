//
//  ContentView.swift
//  Instafilter
//
//  Created by Mohanad Ramdan on 26/08/2023.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var image: Image?
    //@State private var slider: Slider<>?
    @State private var processedImage: UIImage? {
        didSet {
            disableSave = false
        }
    }
    @State private var filterIntensity = 0.5
    @State private var radius = 200.0
    @State private var showingImagePicker = false
    @State private var disableSave = true
    @State private var inputImage: UIImage?
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @State private var showingFilterSheet = false
    let context = CIContext()
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.secondary)

                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)

                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                    showingImagePicker = true
                }

                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                        .onChange(of: filterIntensity) { _ in
                            applyProcessing()
                        }
                }
                HStack {
                    Text("Raduis")
                    Slider(value: $radius)
                        .onChange(of: radius) { _ in
                            applyProcessing()
                        }
                }
                .padding(.vertical)

                HStack {
                    Button("Change Filter") {
                        showingFilterSheet = true
                    }

                    Spacer()

                    Button("Save", action: save)
                        .disabled(disableSave == true)
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .sheet(isPresented: $showingImagePicker){
                ImagePicker(image: $inputImage)
            }
            .confirmationDialog("Select a filter", isPresented: $showingFilterSheet) {
                    Button("Crystallize") { setFilter(CIFilter.crystallize()) }
                    Button("Edges") { setFilter(CIFilter.edges()) }
                    Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                    Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                    Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                    Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                    Button("Vignette") { setFilter(CIFilter.vignette()) }
                    Button("Cancel", role: .cancel) { }
            }
            .onChange(of: inputImage) { _ in loadImage() }
        }
    }

    func save(){
        guard let processedImage = processedImage else { return }

        let imageSaver = ImageSaver()
        imageSaver.writeToPhotoAlbum(image: processedImage)
    }
    
    func loadImage(){
        guard let inputImage = inputImage else { return }
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
        
    }
    
    func applyProcessing(){
        let inputKeys = currentFilter.inputKeys

        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(radius, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey) }
        
        guard let outputImage = currentFilter.outputImage else { return }
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent){
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }else{ disableSave = true }
        
    }
    
    func setFilter(_ filter: CIFilter){
        currentFilter = filter
        loadImage()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
