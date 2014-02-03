SMDataDiller
============

This pod has been created specially for managing TableView controllers.

To improve DataDiller for your TableView. In your viewController (that keeps tableView) do the next:

- (void)setupDataDillers
{
    self.dataSource = [SUBCLASSofTableDataSource new];
    self.dataProvider = [SUBCLASSofDataProvider new];
    
    self.dataSource.dataProvider = self.dataProvider;
    self.dataSource.tableView = self.tableView;
    self.dataSource.delegate = self;
    
    [self.dataSource reload];
}
