//
//  FirstViewController.h
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/25.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic)UICollectionView *collection;
@property (strong, nonatomic) NSArray *picArr;
@property (strong, nonatomic) NSArray *titleArr;

@end
