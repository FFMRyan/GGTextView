//
//  ViewController.m
//  GGTextView
//
//  Created by iOSGeekOfChina on 2016/11/28.
//  Copyright © 2016年 geek. All rights reserved.
//

#import "ViewController.h"
#import "GGTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,GGTableViewCellDelegate>

@property (nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic,strong) UITableView * dataTabelview;
@end

@implementation ViewController


-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:@{@"name":@"姓名",@"tip":@"请输入用户名",@"content":@""},@{@"name":@"居住地",@"tip":@"请输入居住地",@"content":@""},@{@"name":@"你喜欢谁",@"tip":@"请输入对象名字",@"content":@""}, nil];
    }
    return _dataArray;
}
-(UITableView *)dataTabelview{
    if (!_dataTabelview) {
        _dataTabelview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
        _dataTabelview.delegate = self;
        _dataTabelview.dataSource = self;
        
    }
    return _dataTabelview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.dataTabelview];
    [self.dataTabelview reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 96.0f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    GGTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GGTableViewCell"];
    if (!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"GGTableViewCell" bundle:nil] forCellReuseIdentifier:@"GGTableViewCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"GGTableViewCell"];
        cell.delegate = self;
    }
    
    NSDictionary * tempDict = self.dataArray[indexPath.row];
    cell.nickNameLabel.text = [tempDict objectForKey:@"name"];
    if ([[tempDict objectForKey:@"content"] length]>0) {
        cell.ggTextView.text = [tempDict objectForKey:@"content"];
    }else{
       cell.ggTextView.placeholder = [tempDict objectForKey:@"tip"];
    }
    
    return cell;
}
-(void)updataContent:(NSString *)content cellWith:(GGTableViewCell *)cell{
    
    if (!content) {
        return;
    }
    
    NSIndexPath * path = [self.dataTabelview indexPathForCell:cell];
    
    NSDictionary * dict = self.dataArray[path.row];
    [dict setValue:content forKey:@"content"];
    [self.dataArray removeObjectAtIndex:path.row];
    [self.dataArray insertObject:dict atIndex:path.row];
    
    [self.dataTabelview reloadData];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
