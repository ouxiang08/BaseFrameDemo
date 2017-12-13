// MKMapView+ZoomLevel.h
#import <MapKit/MapKit.h>

@interface MKMapView (ZoomLevel)

- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate
    zoomLevel:(CGFloat)zoomLevel
    animated:(BOOL)animated;

- (MKCoordinateRegion)coordinateRegionWithMapView:(MKMapView *)mapView
                                centerCoordinate:(CLLocationCoordinate2D)centerCoordinate
								andZoomLevel:(CGFloat)zoomLevel;
- (CGFloat) zoomLevel;

- (CLLocationCoordinate2D*) visibleCoordinates;

- (CLLocationCoordinate2D*) screenCoordinatesWithFlow:(CGFloat) ratio; // Value of ratio above 0

- (void) removeAllAnnotations;

@end
