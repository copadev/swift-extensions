//
//  UIImage+Extensions.swift
//  swift-extensions
//
//  Created by Huy Duong on 3/15/19.
//  Copyright © 2019 Huy Duong. All rights reserved.
//

import Foundation
import UIKit


// MARK: - UIIMAGE RESIZE

extension UIImage {
    
    /**
     Streching image for bubble chat
     */
    func stretchOut() -> UIImage {
        let center = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        let capInsets = UIEdgeInsets(top: center.y, left: center.x, bottom: center.y, right: center.x)
        return self.resizableImage(withCapInsets: capInsets, resizingMode: .stretch)
    }
    
    
    /**
     
     */
    func resize(withSize newSize: CGSize) -> UIImage {
        
        UIGraphicsBeginImageContext(newSize)
        draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
        
        /*
         let hasAlpha = true
         let scale: CGFloat = 0.0 // Use scale factor of main screen
         UIGraphicsBeginImageContextWithOptions(newSize, !hasAlpha, scale)
         self.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
         let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
         return scaledImage!
         */
    }
    
    
    /**
     
     */
    func crop(withRatio ratio: CGFloat) -> UIImage? {
        
        let newImageWidth = size.height * ratio
        let cropRect = CGRect(x: ((size.width - newImageWidth) / 2.0) * scale,
                              y: 0.0,
                              width: newImageWidth * scale,
                              height: size.height * scale)
        
        guard let cgImage = cgImage else {
            return nil
        }
        guard let newCgImage = cgImage.cropping(to: cropRect) else {
            return nil
        }
        let newImage = UIImage(cgImage: newCgImage, scale: scale, orientation: imageOrientation)
        return newImage
    }
    
}



// MARK: - UIIMAGE COLOR

extension UIImage {
    
    /**
     
     */
    func mask(withColor color: UIColor) -> UIImage? {
        let maskImage = cgImage!
        
        let width = size.width
        let height = size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!
        
        context.clip(to: bounds, mask: maskImage)
        context.setFillColor(color.cgColor)
        context.fill(bounds)
        
        if let cgImage = context.makeImage() {
            let coloredImage = UIImage(cgImage: cgImage)
            return coloredImage
        } else {
            return nil
        }
    }
}



// MARK: - UIIMAGE ORIENTATION

extension UIImage {
    
    /**
     
     */
    func fixOrientation() -> UIImage {
        
        guard imageOrientation != .up else {
            return self
        }
        
        var transform = CGAffineTransform.identity
        
        switch imageOrientation {
            
        case .down, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: size.height)
            transform = transform.rotated(by: CGFloat.pi)
            break
            
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.rotated(by: CGFloat.pi / 2)
            break
            
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: size.height)
            transform = transform.rotated(by: -(CGFloat.pi / 2))
            break
            
        default:
            break
        }
        
        switch imageOrientation {
            
        case .upMirrored, .downMirrored:
            transform.translatedBy(x: size.width, y: 0)
            transform.scaledBy(x: -1, y: 1)
            break
            
        case .leftMirrored, .rightMirrored:
            transform.translatedBy(x: size.height, y: 0)
            transform.scaledBy(x: -1, y: 1)
            break
            
        default:
            break
        }
        
        let ctx: CGContext = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: self.cgImage!.bitsPerComponent, bytesPerRow: 0, space: self.cgImage!.colorSpace!, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
        
        ctx.concatenate(transform)
        
        switch imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            ctx.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: size.height, height: size.width))
            break
            
        default:
            ctx.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            break
        }
        
        let cgImage: CGImage = ctx.makeImage()!
        
        return UIImage(cgImage: cgImage)
    }
    
}
