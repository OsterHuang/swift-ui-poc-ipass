//
//  MessageDialog.swift
//  ipass
//
//  Created by Oster Huang on 30/01/2023.
//

import SwiftUI

struct MessageDialog: View {
    @EnvironmentObject var presentation: AppDialogPresentation
    
    var body: some View {
        DialogView(isPresented: presentation.isShowMessageDialog) {
            DialogBox(
                isPresented: presentation.isShowMessageDialog,
                buttonArea: {
                    DialogOneBtn(
                        text: presentation.confirmText,
                        onConfirm: {
                            presentation.closeMessageDialog()
                            presentation.onConfirm?()
                        }
                    )
                }
            ) {
                if presentation.title != nil {
                    DialogTitle<Text>(presentation.title!)
                }
                
                if presentation.message != nil {
                    DialogContent<Text>(presentation.message!)
                }
            }
        }
    }
}

struct MessageDialog_Previews: PreviewProvider {
    @State static var appDialogPresentation = AppDialogPresentation()
    
    static var previews: some View {
        
        ZStack {
            Button {
                appDialogPresentation.showMessageDialog(
                    title: "這是一個標題",
                    "請確認您是否已收到手機簡訊"
                ) {
                    appDialogPresentation.closeMessageDialog()
                }
            } label: {
                Text("彈出來吧" + String(appDialogPresentation.isShowMessageDialog))
            }
            
            MessageDialog().environmentObject(appDialogPresentation)
            
        }
        .previewDisplayName("有標題有內容")
        
        ZStack {
            Button {
                appDialogPresentation.showMessageDialog(
                    "請確認您是否已收到手機簡訊"
                ) {
                    appDialogPresentation.closeMessageDialog()
                }
            } label: {
                Text("彈出來吧" + String(appDialogPresentation.isShowMessageDialog))
            }
            
            MessageDialog().environmentObject(appDialogPresentation)
            
        }
        .previewDisplayName("無標題")
        
        ZStack {
            Button {
                appDialogPresentation.showMessageDialog(
                    title: "請確認您是否已收到手機簡訊",
                    confirmText: "我知道了"
                ) {
                    appDialogPresentation.closeMessageDialog()
                }
            } label: {
                Text("彈出來吧" + String(appDialogPresentation.isShowMessageDialog))
            }
            
            MessageDialog().environmentObject(appDialogPresentation)
            
        }
        .previewDisplayName("只有標題")
    }
}
