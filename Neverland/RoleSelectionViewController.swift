//
//  RoleSelectionViewController.swift
//  Neverland
//
//  Created by Apple on 1/27/18.
//  Copyright © 2018 League of Sophistication. All rights reserved.
//

import UIKit
import AVFoundation

class RoleSelectionViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, JSQDemoViewControllerDelegate {
    func didDismissJSQDemoViewController(_ vc: DemoMessagesViewController!) {
//        NotificationCenter.default.removeObserver(vc)
        vc.demoData.delegate = nil
        vc.demoData = nil
        self.dismiss(animated: true, completion: nil)
    }
    
    var imagePickerController: UIImagePickerController?
    var capturedImages: [UIImage] = []
    var groupChatName: String = "Popular"
    var groupChatIndex: Int = 0
    var name: String?
    var selectedImage: UIImage?
    var selectedImageName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Role_1.imageView?.contentMode = UIViewContentMode.scaleAspectFill;
        Role_2.imageView?.contentMode = UIViewContentMode.scaleAspectFill;
        Role_3.imageView?.contentMode = UIViewContentMode.scaleAspectFill;
        customButton.imageView?.contentMode = UIViewContentMode.scaleAspectFill;

        Role_1.layer.cornerRadius = 4
        Role_2.layer.cornerRadius = 4
        Role_3.layer.cornerRadius = 4
        customButton.layer.cornerRadius = 4
        
        if let person = name {
            Role_1.setImage(UIImage.init(named: "\(person) 1"), for: .normal)
            Role_2.setImage(UIImage.init(named: "\(person) 2"), for: .normal)
            Role_3.setImage(UIImage.init(named: "\(person) 3"), for: .normal)

            if person.contains(" ") {
                let array = person.split(separator: " ")
                if let last = array.last {
                    Name_1.text = Name_1.text! + " " + "\(last)"
                    Name_2.text = Name_2.text! + " " + "\(last)"
                    Name_3.text = Name_3.text! + " " + "\(last)"

                }
            } else {
                Name_1.text = Name_1.text! + " " + person
                Name_2.text = Name_2.text! + " " + person
                Name_3.text = Name_3.text! + " " + person
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didSelectSerious(_ sender: UIButton) {
        sender.layer.opacity = 0.7
        Role_2.layer.opacity = 1.0
        Role_3.layer.opacity = 1.0
        customButton.layer.opacity = 1.0
        self.selectedImage = sender.imageView?.image
        if let person = name {
            self.selectedImageName = "\(person) 1"
        }
    }
    
    @IBAction func didSelectCreepy(_ sender: UIButton) {
        sender.layer.opacity = 0.7
        Role_1.layer.opacity = 1.0
        Role_3.layer.opacity = 1.0
        customButton.layer.opacity = 1.0
        self.selectedImage = sender.imageView?.image
        if let person = name {
            self.selectedImageName = "\(person) 2"
        }

    }
    
    @IBAction func didSelectSmiley(_ sender: UIButton) {
        sender.layer.opacity = 0.7
        Role_1.layer.opacity = 1.0
        Role_2.layer.opacity = 1.0
        customButton.layer.opacity = 1.0
        self.selectedImage = sender.imageView?.image
        if let person = name {
            self.selectedImageName = "\(person) 2"
        }

    }
    
    @IBAction func didTriggerCustomGallaryPresentation(_ sender: Any) {
        let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        if authStatus == .denied {
            // Denies access to camera, alert the user.
            // The user has previously denied access. Remind the user that we need camera access to be useful.
            let alertController =
                UIAlertController(title: "Unable to access the Camera",
                                  message: "To enable access, go to Settings > Privacy > Camera and turn on Camera access for this app.",
                                  preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(ok)
            
            self.present(alertController, animated: true, completion: nil)
        } else if authStatus == .notDetermined {
            // The user has not yet been presented with the option to grant access to the camera hardware.
            // Ask for it.
            AVCaptureDevice.requestAccess(for: AVMediaType.video) {granted in
                // If access was denied, we do not set the setup error message since access was just denied.
                if granted {
                    // Allowed access to camera, go ahead and present the UIImagePickerController.
                    self.showImagePickerForSourceType(.photoLibrary)
                }
            }
        } else {
            // Allowed access to camera, go ahead and present the UIImagePickerController.
            self.showImagePickerForSourceType(.photoLibrary)
        }
    }
    
    fileprivate func showImagePickerForSourceType(_ sourceType: UIImagePickerControllerSourceType) {
//        if self.imageView.isAnimating {
//            self.imageView.stopAnimating()
//        }
        
        if self.capturedImages.count > 0 {
            self.capturedImages.removeAll()
        }
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.modalPresentationStyle = .currentContext
        imagePickerController.sourceType = sourceType
        imagePickerController.delegate = self
        imagePickerController.modalPresentationStyle =
            (sourceType == .camera) ? .fullScreen : .popover
        
        let presentationController = imagePickerController.popoverPresentationController
//        presentationController?.barButtonItem = button  // display popover from the UIBarButtonItem as an anchor
        presentationController?.permittedArrowDirections = .any
        
        if sourceType == .camera {
            // The user wants to use the camera interface. Set up our custom overlay view for the camera.
            imagePickerController.showsCameraControls = false
            
            /*
             Load the overlay view from the OverlayView nib file. Self is the File's Owner for the nib file, so the overlayView outlet is set to the main view in the nib. Pass that view to the image picker controller to use as its overlay view, and set self's reference to the view to nil.
             */
//            Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)
//            self.overlayView.frame = imagePickerController.cameraOverlayView!.frame
//            imagePickerController.cameraOverlayView = self.overlayView;
//            self.overlayView = nil;
        }
        
        self.imagePickerController = imagePickerController; // we need this for later
        
        self.present(imagePickerController, animated: true, completion: {
            //.. done presenting
        })
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage]! as? UIImage {
            self.customButton.setImage(image, for: .normal)
            self.selectedImage = image
            
            if let person = name {
                self.selectedImageName = "\(person) Custom" // scary needs special handling
            }

            customButton.layer.opacity = 0.7
            Role_1.layer.opacity = 1.0
            Role_2.layer.opacity = 1.0
            Role_3.layer.opacity = 1.0
        }
        self.dismiss(animated: true, completion: nil)

//        self.capturedImages.append(image)
//
//        if self.cameraTimer?.isValid ?? false {
//            return
//        }
//
//        self.finishAndUpdate()
    }

    
    @IBAction func Start_Chat(_ sender: Any) {
        let vc: DemoMessagesViewController = DemoMessagesViewController.init(nibName: "JSQMessagesViewController", bundle: nil)
        vc.groupChatName = self.groupChatName
        vc.groupChatIndex = Int32(self.groupChatIndex)
        vc.characterName = name
        vc.characterImageName = self.selectedImageName
        vc.characterImage = self.selectedImage
        
        vc.setSenderId(name)
        
//        let deviceName = UIDevice.current.name
//        if deviceName.contains("Stich") {
//            print("CARE: sophia's phone detected");
//            vc.setSenderId("513-222-2222")
//        }
        vc.delegateModal = self
        let nc: UINavigationController = UINavigationController.init(rootViewController: vc)
        nc.navigationBar.prefersLargeTitles = true
        self.present(nc, animated: true, completion: nil)
    }
    
    
    @IBAction func changeRole(_ sender: Any) {
        self.present(CategorySelectionViewController(), animated: true, completion: nil)
    }
    
    
    
    
    
    @IBOutlet weak var Role_1: UIButton!
    
    @IBOutlet weak var Name_1: UILabel!
    
    
    @IBOutlet weak var Role_2: UIButton!
    
    @IBOutlet weak var Name_2: UILabel!
    
    
    
    @IBOutlet weak var Role_3: UIButton!
    
    @IBOutlet weak var Name_3: UILabel!

    @IBOutlet weak var customButton: UIButton!
    
}
