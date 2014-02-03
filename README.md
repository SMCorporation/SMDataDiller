SMDataDiller
============

This pod has been created specially for easy managing ``TableView`` controllers.

To improve DataDiller for tableView, in your viewController (that keeps tableView) do the next:

``` objective-c
- (void)setupDataDillers
{
    self.dataSource = [SUBCLASSofSMBaseTableViewDataSource new]; 
    self.dataProvider = [SUBCLASSofSMBaseDataProvider new];
    
    self.dataSource.dataProvider = self.dataProvider;
    self.dataSource.tableView = self.tableView;
    self.dataSource.delegate = self;
    
    [self.dataSource reload];
}
```

And in ``viewDidLoad`` call this method:
``` objective-c
[self setupDataDillers];
```


##Cells Mapping
To  simplify cell's mapping, you can just implement @protocol ```<SMCell>``` in your tableViewCell subclass.
``` objective-c
- (void)fillWithObject:(id)domainObject;
```
In this method (implemented by your tableViewCell subclass), you should write the way, domainObject will be mapped into cell.
``domainObject`` - object, that will be provided by your dataProvider for each cell. 
