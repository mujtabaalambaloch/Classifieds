# Classifieds

**Note: This only runs on iOS 9+ Device**

To run simple open the **Classifieds.xcworkspace**

From Xcode: Connect Device, Product > Run

This contains the following librabies

1. [AFNetworking](https://github.com/AFNetworking/AFNetworking) - To call the Flickr API (As Images) and have a response in JSON
2. [JSONModel](https://github.com/JSONModel/JSONModel) - To map the JSON response into Model Classes
3. [SDWebImage](https://github.com/rs/SDWebImage) - To download images and cache them
4. [MBProgressHub](https://github.com/jdg/MBProgressHUD) - Loading Indicator used while calling Flickr API

> Flickr API Key must be added in the **Constants.h** file under **flickrAPIKey**
