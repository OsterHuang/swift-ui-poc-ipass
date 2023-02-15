//
//  AppDialogViewModel.swift
//  ipass
//
//  Created by Oster Huang on 30/01/2023.
//

import Foundation
import SwiftUI

class AppDialogPresentation: ObservableObject {
    
    /**
     * 限定一定只彈一個dialog
     * 若是需求是可以彈多個的話，可使用陣列資料的方式來呈現
     *  -- 在第一層的view(global app)中彈出 --
     */
    var isShowing: Bool = false
    
    // One Button Dialog
    @Published var isShowMessageDialog: Bool = false
    // Two Buttons Dialog
    @Published var isShowConfirmDialog: Bool = false
    // Three Buttons Dialog
//    @Published var isShowThreeButtonDilaog: Bool = false
    
    @Published var title: String?
    @Published var message: String?
    
    // One Button Dialog
    @Published var confirmText: String = "確認"
    var onConfirm: (() -> Void)?
    
    // Two Button Dialog
    @Published var leftBtnText: String? = "取消"
    var onLeftBtnClick: (() -> Void)?
    @Published var rightBtnText: String?
    var onRightBtnClick: (() -> Void)?
    
    func showMessageDialog(
        title: String? = nil,
        _ message: String? = nil,
        confirmText: String = "確認",
        onConfirm: (() -> Void)? = {}
    ) {
        print("showMessageDialog - \(isShowing)  \(isShowMessageDialog)")
        if isShowing { return }
        
        self.isShowing = true
        self.isShowMessageDialog = true
        
        self.title = title
        self.message = message
        self.confirmText = confirmText
        self.onConfirm = onConfirm
    }
    
    func closeMessageDialog() {
        self.isShowing = false
        self.isShowMessageDialog = false
        
        self.title = nil
        self.message = nil
        self.confirmText = "確認"
        self.onConfirm = {}
    }
    
    func showConfirmDialog(
        title: String? = nil,
        _ message: String? = nil,
        leftBtnText: String? = "取消",
        onLeftBtnClick: (() -> Void)? = {},
        rightBtnText: String? = "確認",
        onRightBtnClick: (() -> Void)? = {}
    ) {
        if isShowing { return }
        
        self.isShowing = true
        self.isShowConfirmDialog = true
        
        self.title = title
        self.message = message
        self.leftBtnText = leftBtnText
        self.onLeftBtnClick = onLeftBtnClick
        self.rightBtnText = rightBtnText
        self.onRightBtnClick = onRightBtnClick
    }
    
    func closeConfirmDialog() {
        self.isShowing = false
        self.isShowConfirmDialog = false
        
        self.title = nil
        self.message = nil
        self.leftBtnText = "取消"
        self.onLeftBtnClick = nil
        self.rightBtnText = "確認"
        self.onRightBtnClick = nil
    }
}
