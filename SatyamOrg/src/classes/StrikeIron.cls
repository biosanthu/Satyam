Public class StrikeIron{
 tempuriOrg.DNSSoap dns = new tempuriOrg.DNSSoap();
 wsStrikeironCom.LicenseInfo wl = new wsStrikeironCom.LicenseInfo();
 //dns.LicenseInfo = new DNSSoap.LicenseInfo();
 //dns.LicenseInfo.RegisteredUser = new tempuriOrg.RegisteredUser();
// dns.LicenseInfo.RegisteredUser.UserID = 'you@company.com';
// dns.LicenseInfo.RegisteredUser.Password = 'your-password';
// Make the Web service call
  tempuriOrg.DNSInfo info = dns.DNSLookup('www.myname.com');

}