////
////  AgoraHandler.swift
////  FitnessApp
////
////  Created by Jamal Rasool on 7/14/18.
////  Copyright © 2018 Jamal Rasool. All rights reserved.
////
//
//import Foundation
//import UIKit
//import AgoraRtcEngineKit
//
//class AgoraHandler: UIViewController {
//
//    @IBOutlet weak var mainView: UIView!
//    @IBOutlet weak var liveStatus: UILabel!
//    @IBOutlet weak var EndCallButton: UIButton!
//    @IBOutlet weak var HelpButton: UIButton!
//    @IBOutlet weak var userCamera: UIView!
//    @IBOutlet weak var trainerCamera: UIView!
//
//    var agoraKit: AgoraRtcEngineKit!
//    var sessionID: String!
//
//    @IBAction func cancelLiveStream(_ sender: Any) {
//        exitFromStream()
//    }
//    @IBAction func askQuestion(_ sender: Any) {
//        handleQuestion()
//    }
//
//    func initializeAgoraEngine() {
//        agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: AppID, delegate: self)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        handleUICreation()
//        initializeAgoraEngine()
//        setupVideo()
//        joinChannel()
//
//        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
//        view.addGestureRecognizer(tap)
//        view.isUserInteractionEnabled = true
////        self.view.addSubview(view)
//
//        hideKeyboard() // Might be a cause for concern
//
//    }
//
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//
//    // Users Camera
//    func setupLocalVideo() {
//        let videoCanvas = AgoraRtcVideoCanvas()
//        videoCanvas.uid = 0
//        videoCanvas.view = userCamera
//        videoCanvas.renderMode = .fit
//        agoraKit.setupLocalVideo(videoCanvas)
//    }
//
//    // Channel Name For Everyone to join
//    func joinChannel() {
//        agoraKit.joinChannel(byToken: nil, channelId: SessionID, info:nil, uid:0) {[weak self] (sid, uid, elapsed) -> Void in
//            if let weakSelf = self {
//                weakSelf.agoraKit.setEnableSpeakerphone(true)
//                UIApplication.shared.isIdleTimerDisabled = true
//            }
//        }
//    }
//
//    // Setting up the video classes
//    fileprivate func setupVideo() {
//        agoraKit.enableVideo()
//        agoraKit.setVideoProfile(.portrait720P_6, swapWidthAndHeight: false)
//    }
//
//
//    // exit from stream and go back to previous view ocntorller
//    fileprivate func exitFromStream() {
//        agoraKit.leaveChannel(nil)
//        UIApplication.shared.isIdleTimerDisabled = false
//        self.dismiss(animated: true, completion: nil)
//        agoraKit = nil
//    }
//
//    // When asking a user quesiton
//    fileprivate func handleQuestion() {
//
//    }
//
//    /**
//    Show button
//     */
//
//    fileprivate func showButtons() {
//
//        UIView.animate(withDuration: 0.35) {
//            self.EndCallButton.isHidden = false
//        }
//
//        hideButton()
//    }
//
//    fileprivate func hideButton() {
//        UIView.animate(withDuration: 7.00) {
//            self.EndCallButton.isHidden = true
//        }
//    }
//
//    @objc func handleTap(_ sender: UITapGestureRecognizer) {
//        showButtons()
//    }
//
//
//    fileprivate func handleUICreation() {
//        mainView.backgroundColor = setBlue()
//
//    }
//
//}
//
//extension AgoraHandler: AgoraRtcEngineDelegate {
//    func rtcEngine(_ engine: AgoraRtcEngineKit, firstRemoteVideoDecodedOfUid uid:UInt, size:CGSize, elapsed:Int) {
//        if (trainerCamera.isHidden) {
//            trainerCamera.isHidden = false
//        }
//
//        let videoCanvas = AgoraRtcVideoCanvas()
//        videoCanvas.uid = uid
//        videoCanvas.view = trainerCamera
//        videoCanvas.renderMode = .fit
//        agoraKit.setupRemoteVideo(videoCanvas)
//    }
//
//    // Tutorial Step 7
//    internal func rtcEngine(_ engine: AgoraRtcEngineKit, didOfflineOfUid uid:UInt, reason:AgoraUserOfflineReason) {
//        self.trainerCamera.isHidden = true
//    }
//
//    // Tutorial Step 10
//    func rtcEngine(_ engine: AgoraRtcEngineKit, didVideoMuted muted:Bool, byUid:UInt) {
//        trainerCamera.isHidden = muted
//        trainerCamera.isHidden = !muted
//    }
//}

//
//  VideoChatViewController.swift
//  Agora iOS Tutorial
//
//  Created by James Fang on 7/14/16.
//  Copyright © 2016 Agora.io. All rights reserved.
//

import UIKit
import AgoraRtcEngineKit

class VideoChatViewController: UIViewController {
    @IBOutlet weak var localVideo: UIView!              // Tutorial Step 3
    @IBOutlet weak var remoteVideo: UIView!             // Tutorial Step 5
    @IBOutlet weak var controlButtons: UIView!
    @IBOutlet weak var remoteVideoMutedIndicator: UIImageView!
    @IBOutlet weak var localVideoMutedBg: UIImageView!
    @IBOutlet weak var localVideoMutedIndicator: UIImageView!
    
    var agoraKit: AgoraRtcEngineKit!                    // Tutorial Step 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupButtons()              // Tutorial Step 8
//        hideVideoMuted()            // Tutorial Step 10
        initializeAgoraEngine()     // Tutorial Step 1
        setupVideo()                // Tutorial Step 2
        setupLocalVideo()           // Tutorial Step 3
        joinChannel()               // Tutorial Step 4
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Tutorial Step 1
    func initializeAgoraEngine() {
        agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: AppID, delegate: self)
    }
    
    // Tutorial Step 2
    func setupVideo() {
        agoraKit.enableVideo()  // Default mode is disableVideo
        agoraKit.setVideoProfile(.landscape720P_6, swapWidthAndHeight: false) // Default video profile is 360P
    }
    
    // Tutorial Step 3
    func setupLocalVideo() {
        let videoCanvas = AgoraRtcVideoCanvas()
        videoCanvas.uid = 0
        videoCanvas.view = localVideo
        videoCanvas.renderMode = .fit
        agoraKit.setupLocalVideo(videoCanvas)
    }
    
    // Tutorial Step 4
    func joinChannel() {
        agoraKit.joinChannel(byToken: nil, channelId: "abby", info:nil, uid:0) {[weak self] (sid, uid, elapsed) -> Void in
            // Join channel "demoChannel1"
            if let weakSelf = self {
                weakSelf.agoraKit.setEnableSpeakerphone(true)
                UIApplication.shared.isIdleTimerDisabled = true
            }
        }
    }
    
    // Tutorial Step 6
    @IBAction func didClickHangUpButton(_ sender: UIButton) {
        leaveChannel()
    }
    
    func leaveChannel() {
                agoraKit.leaveChannel(nil)
                UIApplication.shared.isIdleTimerDisabled = false
                self.dismiss(animated: true, completion: nil)
                agoraKit = nil
    }
    
    // Tutorial Step 8
    func setupButtons() {
        perform(#selector(hideControlButtons), with:nil, afterDelay:8)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(VideoChatViewController.ViewTapped))
        view.addGestureRecognizer(tapGestureRecognizer)
        view.isUserInteractionEnabled = true
    }
    
    @objc func hideControlButtons() {
        controlButtons.isHidden = true
    }
    
    @objc func ViewTapped() {
        if (controlButtons.isHidden) {
            controlButtons.isHidden = false;
            perform(#selector(hideControlButtons), with:nil, afterDelay:8)
        }
    }
    
    func resetHideButtonsTimer() {
        VideoChatViewController.cancelPreviousPerformRequests(withTarget: self)
        perform(#selector(hideControlButtons), with:nil, afterDelay:8)
    }
    
    // Tutorial Step 9
    @IBAction func didClickMuteButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        agoraKit.muteLocalAudioStream(sender.isSelected)
        resetHideButtonsTimer()
    }
    
    // Tutorial Step 10
    @IBAction func didClickVideoMuteButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        agoraKit.muteLocalVideoStream(sender.isSelected)
        localVideo.isHidden = sender.isSelected
        localVideoMutedBg.isHidden = !sender.isSelected
        localVideoMutedIndicator.isHidden = !sender.isSelected
        resetHideButtonsTimer()
    }
    
    func hideVideoMuted() {
        remoteVideoMutedIndicator.isHidden = true
        localVideoMutedBg.isHidden = true
        localVideoMutedIndicator.isHidden = true
    }
    
    // Tutorial Step 11
    @IBAction func didClickSwitchCameraButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        agoraKit.switchCamera()
        resetHideButtonsTimer()
    }
}

extension VideoChatViewController: AgoraRtcEngineDelegate {
    // Tutorial Step 5
    func rtcEngine(_ engine: AgoraRtcEngineKit, firstRemoteVideoDecodedOfUid uid:UInt, size:CGSize, elapsed:Int) {
        if (remoteVideo.isHidden) {
            remoteVideo.isHidden = false
        }
        let videoCanvas = AgoraRtcVideoCanvas()
        videoCanvas.uid = uid
        videoCanvas.view = remoteVideo
        videoCanvas.renderMode = .fit
        agoraKit.setupRemoteVideo(videoCanvas)
    }
    
    // Tutorial Step 7
    internal func rtcEngine(_ engine: AgoraRtcEngineKit, didOfflineOfUid uid:UInt, reason:AgoraUserOfflineReason) {
        self.remoteVideo.isHidden = true
    }
    
    // Tutorial Step 10
    func rtcEngine(_ engine: AgoraRtcEngineKit, didVideoMuted muted:Bool, byUid:UInt) {
        remoteVideo.isHidden = muted
        remoteVideoMutedIndicator.isHidden = !muted
    }
}

