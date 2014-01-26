//
//  PullDownView.m
//  PullDown
//
//  Created by マック太郎 on 2014/01/18.
//  Copyright (c) 2014年 マック太郎. All rights reserved.
//

#import "PullDownView.h"

@implementation PullDownView
{
    UITableView *listView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //UITextFieldのデリゲートの設定
        self.delegate = self;
        self.borderStyle = UITextBorderStyleRoundedRect;
        
    }
    return self;
}

//IBにセットされている時に呼ばれる
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        //UITextFieldのデリゲートの設定
        self.delegate = self;
        self.borderStyle = UITextBorderStyleRoundedRect;
    }
    return self;
}


//テキストフィールドをタップした時に呼ばれる
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    //リストが表示されているか否か判定
    if (listView) {
        [self hideList];
    }else
    {
        [self showList];
    }
    
    return NO;
}

//リスト表示メソッド
-(void)showList
{
    //リストの作成
    listView = [[UITableView alloc]initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + self.frame.size.height, self.frame.size.width, self.frame.size.height*[_contens count]) style:UITableViewStylePlain];
    listView.delegate = self;
    listView.dataSource = self;
    
    //セルのあだ名設定
    [listView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"list"];
    
    listView.rowHeight = self.frame.size.height;
    
    //枠線の設定
    listView.layer.borderWidth = 0.5;
    listView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [listView.superview bringSubviewToFront:listView];
    [self.superview addSubview:listView];
    
    //ボタン連打対策
    self.enabled = NO;
    
    //アフィン変換のアニメーションの起点を変更
    listView.layer.anchorPoint = CGPointMake(0.5f, 0.0f);
    //アンカーポイントによる位置の修正
    listView.center = CGPointMake(listView.center.x, listView.center.y - listView.frame.size.height/2);
    
    listView.transform = CGAffineTransformMakeScale(1.0f, 0.0f);
    
    [UIView animateWithDuration:0.2f animations:^{
        
        //変形を元に戻る
        listView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        self.enabled = YES;
    }];
    
    
}

//リスト非表示メソッド
-(void)hideList
{
    self.enabled = NO;
    [UIView animateWithDuration:0.2f animations:^{
        listView.transform = CGAffineTransformMakeScale(1.0f, 0.0f);
    } completion:^(BOOL finished) {
        //リスト削除
        [listView removeFromSuperview];
        listView = nil;
        self.enabled = YES;
    }];
    

}


//セルの数指定
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_contens count];
}


//セルの設定
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"list";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    //セルの色々をテキストフィールドと同じ感じにする
    cell.textLabel.font = self.font;
    cell.textLabel.textColor = self.textColor;
    cell.textLabel.textAlignment = self.textAlignment;
    
    cell.textLabel.text = _contens[indexPath.row];
    
    
    return cell;
}

//セルダップ時の処理
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.text = _contens[indexPath.row];
    [self hideList];
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
