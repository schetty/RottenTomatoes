//
//  TableViewController.m
//  RottenTomatoes
//
//  Created by naomi schettini on 2016-09-26.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "TableViewController.h"
#import "Movie.h"
#import "MovieTableViewCell.h"
#import "MovieDetailsViewController.h"


@interface TableViewController ()

@property NSMutableArray * objects;
@property NSMutableArray * moviesInTheatresArray;
@property NSMutableArray * moviesNotInTheatresArray;
@property NSString * title;
@property Movie* aMovie;
@property MovieTableViewCell *cell;


@end

@implementation TableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * stringURL = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=xe4xau69pxaah5tmuryvrw75";
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *retrieveMovies = [session dataTaskWithURL:[NSURL URLWithString:stringURL] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSError *jsonError = nil;
            
            //converts the movie data api JSON stuff that's defaultly in binary code (memory adresses) into NSDictionary or NSArray
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            NSMutableArray *movieObjects = [NSMutableArray new];
            NSMutableArray * moviesInTheatresArray = [NSMutableArray array];
            NSMutableArray * moviesNotInTheatresArray = [NSMutableArray array];
            
            if (json) {
                if ( [json isKindOfClass:[NSDictionary class]] ) {
                    //isolate the title portion of the nsdictionary
                    NSArray *movies = [json objectForKey:@"movies"];
                    
                    
                    for (NSDictionary *movie in movies) {
                        
                        Movie * aMovie = [[Movie alloc] initWithInfo:movie];
                        
                        [movieObjects addObject:aMovie];
//                        if ([aMovie isInTheatres]) {
//                            [self.moviesInTheatresArray addObject:aMovie];
//                        }
//                        else {
//                            [self.moviesNotInTheatresArray addObject:aMovie];
//                        }
                    }
                    
                }
            }
            
            
            NSLog(@"%@", movieObjects);
            
            
            //This function is the fundamental mechanism for submitting blocks to a dispatch queue.
            dispatch_async(dispatch_get_main_queue(), ^ {
                self.objects = movieObjects;
                [self.tableView reloadData];
                

            });

        }
        
    }];
    
    
    //call the task again to continue the retrieval of data
    
    [retrieveMovies resume];

    
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 30.0f)];
//    [view setBackgroundColor:[UIColor colorWithRed:70.0 green:80.0 blue:93.0 alpha:1.0]];
//
//    
//        if([self.aMovie isInTheatres])
//    {    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, self.view.bounds.size.width, 20)];
//        [lbl setFont:[UIFont systemFontOfSize:18]];
//        [lbl setTextColor:[UIColor blackColor]];
//        [view addSubview:lbl];
//            [lbl setText:[NSString stringWithFormat:@"In Theatres"]];
//        }
//        else {
//            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, self.view.bounds.size.width, 20)];
//            [lbl setFont:[UIFont systemFontOfSize:18]];
//            [lbl setTextColor:[UIColor blackColor]];
//            [view addSubview:lbl];
//            [lbl setText:[NSString stringWithFormat:@"No Longer In Theatres"]];
//        }
//
//    return view;
//}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   self.cell = [tableView dequeueReusableCellWithIdentifier:@"movieCell" forIndexPath:indexPath];
    
    
    Movie * aMovie = self.objects[indexPath.row];
    
    self.cell.movie = aMovie;

    return self.cell;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//[self performSegueWithIdentifier:@"showDetails" sender:self.aMovie.imageStr];
//}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString: @"showDetails"]) {
//        MovieDetailsViewController *dest = (MovieDetailsViewController *)[segue destinationViewController];
        //the sender is what you pass into the previous method
        //telling segue this is the next details view controller
        NSIndexPath * selectedItem = self.tableView.indexPathForSelectedRow;
        MovieTableViewCell * selectedCell = [self.tableView cellForRowAtIndexPath:selectedItem];

        

        MovieDetailsViewController * movieDetails = segue.destinationViewController;
// made the details view controller the designated view controller
        // then set the movie details movie to the movie that is in the selected cell by the above code
        
        movieDetails.movie = selectedCell.movie;

        
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
////         Delete the row from the data source
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
////         Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }
//}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation


//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}


@end
