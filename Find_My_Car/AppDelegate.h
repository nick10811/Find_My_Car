//
//  AppDelegate.h
//  Find_My_Car
//
//  Created by Nick on 13/2/3.
//  Copyright (c) 2013年 Nick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    // 增加Core Data的成員變數
    NSManagedObjectContext *m_managedObjectContext; //管理物件類別（Car），與上層應用程式溝通
    NSManagedObjectModel *m_managedObjectModel; //讀取資料模型(Data Model描述檔)
    NSPersistentStoreCoordinator *m_persistentStoreCoordinator; //管理讀寫sqlite資料庫
}
// 增加Core Data的成員變數property定義
@property (nonatomic, retain) NSManagedObjectContext *m_managedObjectContext;
@property (nonatomic, retain) NSManagedObjectModel *m_managedObjectModel;
@property (nonatomic, retain) NSPersistentStoreCoordinator *m_persistentStoreCoordinator;

@property (strong, nonatomic) UIWindow *window;

// 將物件同步進Core Data
- (void)saveContext;
// 傳回這個應用程式目錄底下的Documents子目錄
- (NSURL *)applicationDocumentsDirectory;
// 傳回這個應用程式中管理資料庫的Persistent Store Coordinator物件
- (NSPersistentStoreCoordinator *) persistentStoreCoordinator;
// 傳回這個應用程式中的物件模型管理員，負責讀取data model
- (NSManagedObjectModel*) managedObjectModel;
// 傳回這個應用程式的物件本文管理員，用來作物件的同步
- (NSManagedObjectContext*) managedObjectContext;

@end
