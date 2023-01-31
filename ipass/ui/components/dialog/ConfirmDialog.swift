//
//  ConfirmDialog.swift
//  ipass
//
//  Created by Oster Huang on 31/01/2023.
//

import SwiftUI

struct ConfirmDialog: View {
    @EnvironmentObject var presentation: AppDialogPresentation
    
    var body: some View {
        DialogView(isPresented: presentation.isShowConfirmDialog) {
            DialogBox(
                isPresented: presentation.isShowConfirmDialog,
                buttonArea: {
                    DialogTwoBtn(
                        leftBtnText: presentation.leftBtnText ?? "",
                        onLeftBtnClick: {
                            if presentation.onLeftBtnClick == nil {
                                presentation.closeConfirmDialog()
                            } else {
                                presentation.onLeftBtnClick?()
                            }
                        },
                        rightBtnText: presentation.rightBtnText ?? "",
                        onRightBtnClick: {
                            if presentation.onRightBtnClick == nil {
                                presentation.closeConfirmDialog()
                            } else {
                                presentation.onRightBtnClick?()
                            }
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

struct ConfirmDialog_Previews: PreviewProvider {
    @State static var appDialogPresentation = AppDialogPresentation()
    
    static var previews: some View {
        
        ZStack {
            Button {
                appDialogPresentation.showConfirmDialog(
                    title: "這是一個標題",
                    "請確認您是否已收到手機簡訊",
                    onLeftBtnClick: { appDialogPresentation.closeConfirmDialog() },
                    onRightBtnClick: { appDialogPresentation.closeConfirmDialog() }
                )
            } label: {
                Text("彈出來吧" + String(appDialogPresentation.isShowConfirmDialog))
            }
            
            ConfirmDialog().environmentObject(appDialogPresentation)
            
        }
        .previewDisplayName("有標題有內容")
        
        ZStack {
            Button {
                appDialogPresentation.showConfirmDialog(
                    "請確認您是否已收到手機簡訊 (只能按「是」來關閉視窗)",
                    leftBtnText: "否",
                    rightBtnText: "是"
                ) {
                    appDialogPresentation.closeConfirmDialog()
                }
            } label: {
                Text("彈出來吧" + String(appDialogPresentation.isShowConfirmDialog))
            }
            
            ConfirmDialog().environmentObject(appDialogPresentation)
            
        }
        .previewDisplayName("無標題")
        
        ZStack {
            Button {
                appDialogPresentation.showConfirmDialog(
                    title: "請確認您是否已收到手機簡訊"
                ) {
                    appDialogPresentation.closeConfirmDialog()
                }
            } label: {
                Text("彈出來吧" + String(appDialogPresentation.isShowConfirmDialog))
            }
            
            ConfirmDialog().environmentObject(appDialogPresentation)
            
        }
        .previewDisplayName("只有標題")
    }
}
