SMDataDiller
============

This pod has been created specially for easy managing ``TableView`` controllers.

``` html
DataProvider - provider of your content for tableView (from dataBase, server, etc). 
DataSource   - handler of provided data. Prepares data for tableView.
```

##Implementing
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


If you don't want this (really simple, trust me) way, you can make cells mapping in your dataSource's method:
``` objective-c
- (void)fillCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
```
This method (as ``fillWithObject:``) is called every time, when cell will be displayed on the screen. So, be aware to make here any heavyweight operations (creating DataFormatters, etc). 




###P.S.
To clarify how yo use ``SMDataDiller``, you can find Example Project inside. Have a nice coding ;)
