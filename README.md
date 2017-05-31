# YPKit
### a framework come from my working programs!
> This frame used Block with Chain method foundation to call the objctive-c foundation,like that:
> 
	NSString *linkedinUrl = kLinkedinBaseUrl.concat(@"?")(
                                  @{
                                    @"response_type":@"code",
                                    @"client_id":kLinkedinClientID,
                                    @"redirect_uri":[kLinkedinRedirect_uri stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet alphanumericCharacterSet]],
                                    @"state":kLinkedinAuthStateUniqueString,
                                    @"scope":@"r_basicprofile%20r_emailaddress"
                                    }
                                  .toArray
                                  .map(^(NSArray *objArr) {return objArr.join(@"=");})
                                  .join(@"&")
    );

> linkedinUrl: <strong>https://www.linkedin.com/oauth/v2/authorization?client_id=81g9a1rsl69nn7&scope=r_basicprofile%20r_emailaddress&redirect_uri=http%3A%2F%2F119%2E139%2E198%2E147%3A61780%2Fripptonapi%2Fapi%2Fcustomer%2Flogin&state=DCEeFsrWf45A353sd23fKef424&response_type=code</strong>
