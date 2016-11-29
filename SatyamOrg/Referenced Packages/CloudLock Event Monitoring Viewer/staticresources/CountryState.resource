<!--
// If you have PHP you can set the post values like this
//var postState = '<?= $_POST["state"] ?>';
//var postCountry = '<?= $_POST["country"] ?>';
var postState = '';
var postCountry = '';
// State table
//
// To edit the list, just delete a line or add a line. Order is important.
// The order displayed here is the order it appears on the drop down.
//
var state = '\
United States:Alabama:Alabama|\
United States:Alaska:Alaska|\
United States:Arizona:Arizona|\
United States:Arkansas:Arkansas|\
United States:California:California|\
United States:Colorado:Colorado|\
United States:Connecticut:Connecticut|\
United States:Delaware:Delaware|\
United States:District of Columbia:District of Columbia|\
United States:Florida:Florida|\
United States:Georgia:Georgia|\
United States:Hawaii:Hawaii|\
United States:Idaho:Idaho|\
United States:Illinois:Illinois|\
United States:Indiana:Indiana|\
United States:Iowa:Iowa|\
United States:Kansas:Kansas|\
United States:Kentucky:Kentucky|\
United States:Louisiana:Louisiana|\
United States:Maine:Maine|\
United States:Maryland:Maryland|\
United States:Massachusetts:Massachusetts|\
United States:Michigan:Michigan|\
United States:Minnesota:Minnesota|\
United States:Mississippi:Mississippi|\
United States:Missouri:Missouri|\
United States:Montana:Montana|\
United States:Nebraska:Nebraska|\
United States:Nevada:Nevada|\
United States:New Hampshire:New Hampshire|\
United States:New Jersey:New Jersey|\
United States:New Mexico:New Mexico|\
United States:New York:New York|\
United States:North Carolina:North Carolina|\
United States:North Dakota:North Dakota|\
United States:Ohio:Ohio|\
United States:Oklahoma:Oklahoma|\
United States:Oregon:Oregon|\
United States:Pennsylvania:Pennsylvania|\
United States:Rhode Island:Rhode Island|\
United States:South Carolina:South Carolina|\
United States:South Dakota:South Dakota|\
United States:Tennessee:Tennessee|\
United States:Texas:Texas|\
United States:Utah:Utah|\
United States:Vermont:Vermont|\
United States:Virginia:Virginia|\
United States:Washington:Washington|\
United States:West Virginia:West Virginia|\
United States:Wisconsin:Wisconsin|\
United States:Wyoming:Wyoming|\
Canada:Alberta:Alberta|\
Canada:British Columbia:British Columbia|\
Canada:Manitoba:Manitoba|\
Canada:New Brunswick:New Brunswick|\
Canada:Newfoundland:Newfoundland|\
Canada:Nova Scotia:Nova Scotia|\
Canada:Ontario:Ontario|\
Canada:Quebec:Quebec|\
Canada:Saskatchewan:Saskatchewan|\
';

// Country data table
//
// To edit the list, just delete a line or add a line. Order is important.
// The order displayed here is the order it appears on the drop down.
//
var country = '\
United States:United States|\
Canada:Canada|\
Abkhazia:Abkhazia|\
Afghanistan:Afghanistan|\
Albania:Albania|\
Algeria:Algeria|\
American Samoa:American Samoa|\
Andorra:Andorra|\
Angola:Angola|\
Anguilla:Anguilla|\
Antarctica:Antarctica|\
Antigua and Barbuda:Antigua and Barbuda|\
Argentina:Argentina|\
Armenia:Armenia|\
Aruba:Aruba|\
Ashmore and Cartier Islands:Ashmore and Cartier Islands|\
Australia:Australia|\
Austria:Austria|\
Azerbaijan:Azerbaijan|\
Bahamas:Bahamas|\
Bahrain:Bahrain|\
Baker Island:Baker Island|\
Bangladesh:Bangladesh|\
Barbados:Barbados|\
Belarus:Belarus|\
Belgium:Belgium|\
Belize:Belize|\
Benin:Benin|\
Bermuda:Bermuda|\
Bhutan:Bhutan|\
Bolivia:Bolivia|\
Bosnia and Herzegobina:Bosnia and Herzegobina|\
Botswana:Botswana|\
Bouvet Island:Bouvet Island|\
Brazil:Brazil|\
British Indian Ocean Territory:British Indian Ocean Territory|\
British Virgin Islands:British Virgin Islands|\
Brunei:Brunei|\
Bulgaria:Bulgaria|\
Burkina Faso:Burkina Faso|\
Burundi:Burundi|\
Cambodia:Cambodia|\
Cameroon:Cameroon|\
Cap Verde:Cap Verde|\
Cayman Islands:Cayman Islands|\
Central African Republic:Central African Republic|\
Chad:Chad|\
Chile:Chile|\
China:China|\
Christmas Island:Christmas Island|\
Clipperton Island:Clipperton Island|\
Cocos Islands:Cocos Islands|\
Colombia:Colombia|\
Comoros:Comoros|\
Democratic Republic of the Congo:Democratic Republic of the Congo|\
Republic of the Congo:Republic of the Congo|\
Cook Islands:Cook Islands|\
Coral Sea Islands:Coral Sea Islands|\
Costa Rica:Costa Rica|\
Cote d\'Ivoire:Cote d\'Ivoire|\
Croatia:Croatia|\
Cuba:Cuba|\
Cyprus:Cyprus|\
Czech Republic:Czech Republic|\
Denmark:Denmark|\
Djibouti:Djibouti|\
Dominica:Domenica|\
Dominican Republic:Dominican Republic|\
East Timor:East Timor|\
Ecuador:Ecuador|\
Egypt:Egypt|\
El Salvador:El Salvador|\
Equatorial Guinea:Equatorial Guinea|\
Eritrea:Eritrea|\
Estonia:Estonia|\
Ethiopia:Ethiopia|\
Europa Island:Europa Island|\
Falkland Islands (Islas Malvinas):Falkland Islands (Islas Malvinas)|\
Faroe Islands:Faroe Islands|\
Fiji:Fiji|\
Finland:Finland|\
France:France|\
French Guiana:French Guiana|\
French Polynesia:French Polynesia|\
French Southern and Antarctic Lands:French Southern and Antarctic Lands|\
Gabon:Gabon|\
Gambia:Gambia|\
Gaza Strip:Gaza Strip|\
Georgia (country):Georgia (country)|\
Germany:Germany|\
Ghana:Ghana|\
Gibraltar:Gibraltar|\
Glorioso Islands:Glorioso Islands|\
Greece:Greece|\
Greenland:Greenland|\
Grenada:Grenada|\
Guadeloupe:Guadeloupe|\
Guam:Guam|\
Guatemala:Guatemala|\
Guernsey:Guernsey|\
Guinea:Guinea|\
Guinea-Bissau:Guinea-Bissau|\
Guyana:Guyana|\
Haiti:Haiti|\
Heard Island and McDonald Islands:Heard Island and McDonald Islands|\
Honduras:Honduras|\
Hong Kong:Hong Kong|\
Howland Island:Howland Island|\
Hungary:Hungary|\
Iceland:Iceland|\
India:India|\
Indonesia:Indonesia|\
Iran:Iran|\
Iraq:Iraq|\
Ireland:Ireland|\
Isle of Man:Isle of Man|\
Israel:Israel|\
Italy:Italy|\
Jamaica:Jamaica|\
Jan Mayen:Jan Mayen|\
Japan:Japan|\
Jarvis Island:Jarvis Island|\
Jersey:Jersey|\
Johnston Atoll:Johnston Atoll|\
Jordan:Jordan|\
Juan de Nova Island:Juan de Nova Island|\
Kazakhstan:Kazakhstan|\
Kenya:Kenya|\
Kingman Reef:Kingman Reef|\
Kiribati:Kiribati|\
North Korea:North Korea|\
South Korea:South Korea|\
Kosovo:Kosovo|\
Kuwait:Kuwait|\
Kyrgyzstan:Krgyzstan|\
Laos:Laos|\
Latvia:Latvia|\
Lebanon:Lebanon|\
Lesotho:Lesotho|\
Liberia:Liberia|\
Libya:Libya|\
Liechtenstein:Liechtenstein|\
Lithuania:Lithuania|\
Luxembourg:Luxembourg|\
Macau:Macau|\
Madagascar:Madagascar|\
Malawi:Malawi|\
Malaysia:Malaysia|\
Maldives:Maldives|\
Mali:Mali|\
Malta:Malta|\
Marshall Islands:Marshall Islands|\
Martinique:Martinique|\
Mauritania:Mauritania|\
Mauritius:Mauritius|\
Mayotte:Mayotte|\
Mexico:Mexico|\
Federated States of Micronesia:Federated States of Micronesia|\
Midway Islands:Midway Islands|\
Moldova:Moldova|\
Monaco:Monaco|\
Mongolia:Mongolia|\
Montenegro:Montenegro|\
Montserrat:Montserrat|\
Morocco:Morocco|\
Mozambique:Mozambique|\
Myanmar:Myanmar|\
Nagorno-Karabakh:Nagorno-Karabakh|\
Namibia:Namibia|\
Nauru:Nauru|\
Navassa Island:Navassa Island|\
Nepal:Nepal|\
Netherlands:Netherlands|\
Netherlands Antilles:Netherlands Antilles|\
New Caledonia:New Caledonia|\
New Zealand:New Zealand|\
Nicaragua:Nicaragua|\
Niger:Niger|\
Nigeria:Nigeria|\
Niue:Niue|\
Norfolk Island:Norfolk Island|\
Northern Mariana Islands:Northern Mariana Islands|\
Norway:Norway|\
Oman:Oman|\
Pakistan:Pakistan|\
Palau:Palau|\
Palestinian Territories:Palestinian Territories|\
Palmyra Atoll:Palmyra Atoll|\
Panama:Panama|\
Papua New Guinea:Papua New Guinea|\
Paracel Islands:Paracel Islands|\
Paraguay:Paraguay|\
Peru:Peru|\
Philippines:Philppines|\
Pitcairn Islands:Pitcairn Island|\
Poland:Poland|\
Portugal:Portugal|\
Puerto Rico:Puerto Rico|\
Qatar:Qatar|\
Republic of Macedonia:Republic of Macedonia|\
Reunion:Reunion|\
Romania:Romania|\
Russia:Russia|\
Rwanda:Rwanda|\
Saint Helena (island):Saint Helena (island)|\
Saint Kitts and Nevis:Saint Kitts and Nevis|\
Saint Lucia:Saint Lucia|\
Saint Pierre and Miquelon:Saint Pierre and Miquelon|\
Saint Vincent and the Grenadines:Saint Vincent and the Grenadines|\
Samoa:Samoa|\
San Marino:San Marino|\
Sao Tome and Principe:Sao Tome and Principe|\
Saudi Arabia:Saudi Arabia|\
Senegal:Senegal|\
Serbia:Serbia|\
Seychelles:Seychelles|\
Sierra Leone:Sierra Leone|\
Singapore:Singapore|\
Slovakia:Slovakia|\
Slovenia:Slovenia|\
Solomon Islands:Solomon Islands|\
Somalia:Somalia|\
South Africa:South Africa|\
South Georgia and the South Sandwich Islands:South Georgia and the South Sandwich Islands|\
South Ossetia Spain:South Ossetia Spain|\
Spain:Spain|\
Spratly Islands:Spratly Islands|\
Sri Lanka:Sri Lanka|\
Sudan:Sudan|\
Suriname:Suriname|\
Svalbard:Svalbard|\
Swaziland:Swaziland|\
Sweden:Sweden|\
Switzerland:Switzerland|\
Syria:Syria|\
Taiwan:Taiwan|\
Tajikistan:Tajikistan|\
Tanzania:Tanzania|\
Thailand:Thailand|\
Togo:Togo|\
Tokelau:Tokelau|\
Tonga:Tonga|\
Trinidad and Tobago:Trinidad and Tobago|\
Tromelin Island:Tromelin Island|\
Tunisia:Tunisia|\
Turkey:Turkey|\
Turkmenistan:Turkmenistan|\
Turks and Caicos Islands:Turks and Caicos Islands|\
Tuvalu:Tuvalu|\
Uganda:Uganda|\
Ukraine:Ukraine|\
United Arab Emirates:United Arab Emirates|\
United Kingdom:United Kingdom|\
Uruguay:Uruguay|\
UM:US Minor Outlying Islands|\
Uzbekistan:Uzbekistan|\
Vanuatu:Vanuatu|\
Vatican City:Vatican City|\
Venezuela:Venezuela|\
Vietnam:Vietnam|\
Virgin Islands:Virgin Islands|\
Wales:Wales|\
Wallis and Futuna:Wallis and Futuna|\
West Bank:West Bank|\
Western Sahara:Western Sahara|\
Zambia:Zambia|\
Zimbabwe:Zimbabwe|\
';

function TrimString(sInString) {
  if ( sInString ) {
    sInString = sInString.replace( /^\s+/g, "" );// strip leading
    return sInString.replace( /\s+$/g, "" );// strip trailing
  }
}

// Populates the country selected with the counties from the country list
function populateCountry(defaultCountry) {
  if ( postCountry != '' ) {
    defaultCountry = postCountry;
  }
  var countryLineArray = country.split('|');  // Split into lines
  var selObj = document.getElementById('cCountry');
  selObj.options[0] = new Option('Please Select','');
  selObj.selectedIndex = 0;
  for (var loop = 0; loop < countryLineArray.length; loop++) {
    if(countryLineArray[loop]!="")
    {    
    lineArray = countryLineArray[loop].split(':');
    countryCode  = TrimString(lineArray[0]);
    countryName  = TrimString(lineArray[1]);
    if ( countryCode != '' ) {
      selObj.options[loop + 1] = new Option(countryName, countryCode);
    }
    if ( defaultCountry == countryCode ) {
      selObj.selectedIndex = loop + 1;
    }
    }
  }
}

function populateState() {
  var selObj = document.getElementById('cState');
  var foundState = false;
  // Empty options just in case new drop down is shorter
  if ( selObj.type == 'select-one' ) {
    for (var i = 0; i < selObj.options.length; i++) {
      selObj.options[i] = null;
    }
    selObj.options.length=null;
    selObj.options[0] = new Option('Please Select','');
    selObj.selectedIndex = 0;
  }
  // Populate the drop down with states from the selected country
  var stateLineArray = state.split("|");  // Split into lines
  var optionCntr = 1;
  for (var loop = 0; loop < stateLineArray.length; loop++) {
    lineArray = stateLineArray[loop].split(":");
    countryCode  = TrimString(lineArray[0]);
    stateCode    = TrimString(lineArray[1]);
    stateName    = TrimString(lineArray[2]);
  if (document.getElementById('cCountry').value == countryCode && countryCode != '' ) {
    // If it's a input element, change it to a select
      if ( selObj.type == 'text' ) {
        parentObj = document.getElementById('cState').parentNode;
        parentObj.removeChild(selObj);
        var inputSel = document.createElement("SELECT");
        inputSel.setAttribute("name","cState");
        inputSel.setAttribute("id","cState");
        inputSel.setAttribute("class","removeError");
        parentObj.appendChild(inputSel) ;
        jQuery(inputSel).closest("dd").addClass("selectBox");  
        selObj = document.getElementById('cState');
        selObj.options[0] = new Option('Please Select','');
        selObj.selectedIndex = 0;
        jQuery(selObj).closest("dl").find("dt").css('color','#fff');
      }
      if ( stateCode != '' ) {
        selObj.options[optionCntr] = new Option(stateName, stateCode);
      }
      // See if it's selected from a previous post
      if ( stateCode == postState && countryCode == postCountry ) {
        selObj.selectedIndex = optionCntr;
      }
      foundState = true;
      optionCntr++
    }
  }
  // If the country has no states, change the select to a text box
  if ( ! foundState ) {
    parentObj = document.getElementById('cState').parentNode;
    parentObj.removeChild(selObj);
  // Create the Input Field
    var inputEl = document.createElement("INPUT");
    inputEl.setAttribute("id", "cState");
    inputEl.setAttribute("type", "text");
    inputEl.setAttribute("name", "cState");
    inputEl.setAttribute("size", 30);
    inputEl.setAttribute("value", "");
    inputEl.setAttribute("disabled", "disabled");
    inputEl.setAttribute("style", "background-color:#63BADB;");
    parentObj.appendChild(inputEl) ;
    jQuery(inputEl).closest("dl").find("dt").css('color','#8DD2EC');
    jQuery(inputEl).closest("dd").removeClass("selectBox");  
  }
}

function initCountry(country) {
  populateCountry(country);
  populateState();
}

var invalidDomains = ["gmail.",
	 "mac.",
	 "yahoo.",
	 "hotmail.",
	 "sbcglobal.",
	 "earthlink.",
	 "att.",
	 "aol.",
	 "comcast.",
	 "me.",
	 "ymail.",
	 "googlemail.",
	 "163",
	 "msn.",
	 "rocketmail.",
	 "bellsouth.",
	 "cox.",
	 "live.",
	 "100m.hl.cninfo.net",
	 "123india.com",
	 "126.com",
	 "12move.nl",
	 "163.com",
	 "163.net",
	 "169.cc",
	 "188.net",
	 "188mail.com",
	 "2000net.com",
	 "21cn.com",
	 "24horas.com",
	 "2911.net",
	 "2bmail.co.uk",
	 "2bsure.com",
	 "2ndmail.com",
	 "2rd.net",
	 "2xs.net",
	 "363.net",
	 "371.net",
	 "39.net",
	 "3web.net",
	 "777.net.cn",
	 "8848.net",
	 "888.nu",
	 "88998.com",
	 "8d8d.com",
	 "909mail.dk",
	 "990.net",
	 "a4.no",
	 "aaronkwok.net",
	 "abcflash.net",
	 "abv.bg",
	 "adres.nl",
	 "advalvas.be",
	 "ahmedabad.net",
	 "albawaba.com",
	 "alinto.com",
	 "all.bg",
	 "allesklar.de",
	 "altavista.co.kr",
	 "altavista.co.uk",
	 "altavista.de",
	 "altavista.nl",
	 "altavista.se",
	 "alwaysbeconnected.com",
	 "amuro.net",
	 "anjungcafe.com",
	 "another.com",
	 "anyemail.net",
	 "aol.co.uk",
	 "aol.com",
	 "apenstaartje.com",
	 "apexmail.com",
	 "a-po.st",
	 "apollo.lv",
	 "ar.yahoo.com",
	 "arabia.com",
	 "arealcity.com",
	 "arsenal.co.uk",
	 "artic.net",
	 "asiafind.com",
	 "asiafind.com",
	 "asiafind.com",
	 "asia-links.com",
	 "asia-links.com",
	 "asia-links.com",
	 "asiancityweb.com",
	 "asiancityweb.com",
	 "asiancityweb.com",
	 "asianhome.net",
	 "asianhome.net",
	 "asiaone.com.sg",
	 "ask.co.uk",
	 "astaga.com",
	 "asturies.com",
	 "a-topmail.at",
	 "atozasia.com",
	 "aucland.es",
	 "aude.org",
	 "aufeminin.com",
	 "ausi.com",
	 "aussiemail.com.au",
	 "australia.edu",
	 "australianmalls.com",
	 "autonr.net",
	 "axis.org",
	 "axn-asia.com",
	 "b73.de",
	 "balitribune.com",
	 "bangladesh.net",
	 "bantu.com",
	 "basemail.com.br",
	 "beep.ru",
	 "belgique.com",
	 "belgrade.co.yu",
	 "Bellsouth.net",
	 "bentium.net",
	 "beograd.com",
	 "berlin.de",
	 "bigfoot.de",
	 "bigfot.de",
	 "bimamail.com",
	 "bip.net",
	 "bkkmail.com",
	 "blackbox.net",
	 "blackburnmail.com",
	 "bluemail.ch",
	 "bluemail.dk",
	 "bmypc.com",
	 "bnp-mail.com",
	 "bnp-mail.com",
	 "bogota.com",
	 "boitolet.com",
	 "boitolet.com",
	 "bol.com.br",
	 "bolehmail.com",
	 "bosnianmail.com",
	 "brasilia.net",
	 "brestonline.com",
	 "britishvirginislands.com",
	 "broadcastindia.com",
	 "burek.net",
	 "burgerking.de",
	 "businessnet.de",
	 "byte.it",
	 "cabana.net",
	 "canada-11.com",
	 "canadasown.net",
	 "canoe.ca",
	 "caramail.com",
	 "cari.com.my",
	 "caryon.com",
	 "ccnt.com.cn",
	 "centras.lt",
	 "centrum.cz",
	 "chaitime.com",
	 "channelnewsasia.com",
	 "Charter.net",
	 "chat.ru",
	 "check1check.com",
	 "chequemail.com",
	 "cheshiremail.com",
	 "chez.com",
	 "china.com",
	 "chinaarmy.net",
	 "chinabyte.com",
	 "chinahot.net",
	 "chinaice.com",
	 "chinanew.com",
	 "chinaren.com",
	 "chinese.com",
	 "chinese.net.my",
	 "chinese88.com",
	 "chinesemail.org",
	 "ciaoweb.it",
	 "citeweb.net",
	 "cityhot.com",
	 "citymail.net.nz",
	 "citynet.co.kr",
	 "ciudad.com.ar",
	 "claramail.com",
	 "click2asia.com",
	 "click2asia.com",
	 "click2asia.com",
	 "clickfish.com",
	 "club.lemonde.fr",
	 "cmmail.com",
	 "cn.joymail.com",
	 "cncou.com",
	 "cnnb.net",
	 "Comcast.net",
	 "community.s-one.net.sg",
	 "communityconnect.com",
	 "communityconnect.com",
	 "communityconnect.com",
	 "computerchannel.de",
	 "connectfree.co.uk",
	 "coolmail.ch",
	 "copacabana.com",
	 "coqualane.ch",
	 "core.lv",
	 "correio.com",
	 "correo.nu",
	 "correoweb.com",
	 "courrier.id-clic.com",
	 "courrier.remcomp.fr",
	 "courrier.yahoo.fr",
	 "Cox.net",
	 "csucs.hu",
	 "ctinets.com",
	 "ctn.com.cn",
	 "cumbriamail.com",
	 "curio-city.com",
	 "cxp.com.br",
	 "cyberdif.com",
	 "cyberinbox.com",
	 "cybernet.in.th",
	 "daum.net",
	 "dbzmail.com",
	 "dds.nl",
	 "de.lycosmail.com",
	 "decajon.com",
	 "delfi.lv",
	 "detik.com",
	 "deutschland.youpy.com",
	 "digibel.be",
	 "digitalmail.com",
	 "diktator.de",
	 "dindas.de",
	 "dl163.com",
	 "dolfijn.nl",
	 "domain.com.tw",
	 "doramail.com",
	 "downsouth.co.uk",
	 "dragonsurf.com",
	 "dreamer.com.cn",
	 "dreamer.com.tw",
	 "drotposta.hu",
	 "durschti.net",
	 "duse.net",
	 "earth9.com",
	 "Earthlink.net",
	 "eastciti.com",
	 "eastday.com.cn",
	 "eastmail.com",
	 "easypost.com",
	 "eazier.com",
	 "ecosse.net",
	 "ecuamail.com.ec",
	 "ecuamail.com.ec",
	 "edsamail.com.ph",
	 "efes.net.tr",
	 "egon.gyaloglo.hu",
	 "eguo.com",
	 "egyptsun.com",
	 "ehmail.com",
	 "eindia.com",
	 "einkaufzentrum.de",
	 "einsundeins.de",
	 "ekilat.com",
	 "elong.com",
	 "em365.com",
	 "e-mail.co.kr",
	 "email.co.yu",
	 "email.com.cn",
	 "email.cz",
	 "email.de",
	 "email.ireland.com",
	 "email.is",
	 "email.itl.net.ua",
	 "e-mail.ru",
	 "email.seznam.cz",
	 "email.si",
	 "emaila.nu",
	 "emailgaul.com",
	 "emailnow.com.au",
	 "emailnow.com.au",
	 "emailpinoy.com",
	 "emailplanet.com",
	 "emailplanet.com",
	 "emailplanet.com",
	 "emailplanet.com",
	 "emailplanet.com",
	 "emailplanet.com",
	 "emailpostbox.com",
	 "enelpunto.net",
	 "ennepetal.com",
	 "enter.vg",
	 "enzoy.com",
	 "eon.dk",
	 "epost.de",
	 "e-post.lt",
	 "es.lycosmail.com",
	 "espana.youpy.com",
	 "eszett.de",
	 "etang.com",
	 "everyday.com",
	 "everyday.com",
	 "everymail.net",
	 "everyroad.net",
	 "excite.ca",
	 "excite.com",
	 "excite.com.au",
	 "excite.es",
	 "excite.it",
	 "exit.de",
	 "extended.de",
	 "eyah.com.au",
	 "eyou.com",
	 "ez.info.com.ph",
	 "fast.rh.com.pe",
	 "fastmail.ca",
	 "fastmail.com",
	 "fcbayern.de",
	 "fcukmail.com",
	 "fetchmail.co.uk",
	 "ffnfuncity.de",
	 "firemail.de",
	 "flairmail.com",
	 "flytecrew.com",
	 "fm365.com",
	 "fr.bigfoot.com",
	 "fr.lycosmail.com",
	 "france-mail.com",
	 "free.fr",
	 "free.net.nz",
	 "free.polbox.pl",
	 "free.tri.at",
	 "free.xtel.com",
	 "free-hosting.lt",
	 "freemail.c3.hu",
	 "freemail.co.za",
	 "freemail.codec.ro",
	 "freemail.com.au",
	 "freemail.com.pk",
	 "freemail.fx.ro",
	 "freemail.goo.ne.jp",
	 "freemail.gr",
	 "freemail.it",
	 "freemail.ncs.net.hk",
	 "freemail.nl",
	 "freemail.org.mk",
	 "freemail.ru",
	 "free-online.net",
	 "freeweb.aspide.it",
	 "freeweb.essenet.it",
	 "freshmail.de",
	 "friko.internet.pl",
	 "friko.internet.pl",
	 "fronttraining.com",
	 "fsf.com.au",
	 "ft.com",
	 "funkytiger.co.uk",
	 "funmail.co.uk",
	 "future-online.net",
	 "fz.ml.org",
	 "gala.net",
	 "gate99.nl",
	 "gauch.ch",
	 "gaza.net",
	 "gedris.org",
	 "germanmail.com",
	 "germany.net",
	 "gigileung.org",
	 "glay.org",
	 "glormhaigheo.com",
	 "gmail.co.uk",
	 "gmail.com",
	 "gmx.net",
	 "goaworld.com",
	 "gocolchester.com",
	 "gohdirect.com",
	 "gomail.com.ua",
	 "gopinoy.com",
	 "grabmail.com",
	 "graffiti.net",
	 "gravity.net.au",
	 "grooveasia.com",
	 "grooveasia.com",
	 "grooveasia.com",
	 "gsel.com",
	 "guay.com",
	 "guil.eu.org",
	 "guju.net",
	 "gwapo.com",
	 "gzyp21.net",
	 "halee.com",
	 "halyava.ru",
	 "heike.net",
	 "helloasia.com",
	 "helloasia.com",
	 "helloasia.com",
	 "hikyaku.com",
	 "hk.joymail.com",
	 "hkem.com",
	 "hkepost.com",
	 "hkgx.com",
	 "hkid.com",
	 "hkmail.net",
	 "hkonly.com",
	 "hkwire.com",
	 "hl.cninfo.net",
	 "home.co.yu",
	 "home.se",
	 "home.sina.com",
	 "home.sina.com.cn",
	 "home.sina.com.hk",
	 "homeway.com.cn",
	 "hongen.com.cn",
	 "hongkong.com",
	 "hooger.ch",
	 "hotmail.co.il",
	 "hotmail.co.jp",
	 "Hotmail.co.jp",
	 "hotmail.co.th",
	 "hotmail.co.uk",
	 "Hotmail.co.uk",
	 "hotmail.com",
	 "hotmail.com",
	 "hotmail.com.ar",
	 "hotmail.com.br",
	 "hotmail.com.tr",
	 "hotmail.de",
	 "hotmail.es",
	 "hotmail.fr",
	 "hotmail.it",
	 "hotmail.jp",
	 "hotmail.se",
	 "hrvatskamail.com",
	 "humour.com",
	 "hurra.de",
	 "iboom.com",
	 "ice.is",
	 "ieg.com.br",
	 "ifrance.com",
	 "ilovehk.com",
	 "iloveindia.com",
	 "i-mail.com.au",
	 "immk.net",
	 "inbox.com.pk",
	 "inbox.lv",
	 "india.com",
	 "india-11.com",
	 "indiainfo.com",
	 "indiaseek.com",
	 "indiasite.com",
	 "indiatimes.com",
	 "indo-mail.com",
	 "infojobs.es",
	 "infoworld.sh.cn",
	 "inmail.sk",
	 "instuttgart.de",
	 "intellect.com.tw",
	 "interia.pl",
	 "inwind.it",
	 "iobox.de",
	 "iobox.fi",
	 "iobox.se",
	 "iol.it",
	 "iqiq.net",
	 "irish4ever.com",
	 "irol.net",
	 "iskon.hr",
	 "ismart.com.hk",
	 "issihk.net",
	 "it.lycosmail.com",
	 "italia.youpy.com",
	 "iupi.pt",
	 "jaydemail.com",
	 "jmail.co.jp",
	 "joongang.co.kr",
	 "jordan-net.de",
	 "jpopmail.com",
	 "jubii.dk",
	 "jumpy.it",
	 "juntos.com",
	 "juridica.com",
	 "juventusmail.net",
	 "kali.com.cn",
	 "kantone.net",
	 "kataweb.it",
	 "kellychen.com",
	 "kennzeichen.net",
	 "keromail.com",
	 "keyciti.com.tw",
	 "kichimail.com",
	 "kingnet.com.tw",
	 "kittymail.com",
	 "kittymail.com",
	 "kitznet.at",
	 "kki.net.pl",
	 "km169.net",
	 "kmail.com.au",
	 "korea.com",
	 "koreanmail.com",
	 "kschoice.net",
	 "kurir.net",
	 "kzinfo.net",
	 "ladymail.cz",
	 "lakmail.com",
	 "la-mano.com",
	 "lancsmail.com",
	 "lanetro.com",
	 "latinmail.com",
	 "latinsite.com",
	 "latinsite.com",
	 "lc1.law5.hotmail.passport.com",
	 "lemailparisien.com",
	 "leonlai.net",
	 "lettera.net",
	 "letterbox.com",
	 "letterindia.com",
	 "lexpress.net",
	 "libanismail.com",
	 "libemail.com",
	 "libero.iol.it",
	 "linomail.de",
	 "linuxmail.org",
	 "liquidinformation.net",
	 "live.at",
	 "live.be",
	 "live.ca",
	 "live.cl",
	 "live.cn",
	 "live.co.kr",
	 "live.co.za",
	 "live.com",
	 "live.com.ar",
	 "live.com.au",
	 "live.com.mx",
	 "live.com.my",
	 "live.com.sg",
	 "live.de",
	 "live.dk",
	 "live.fr",
	 "live.hk",
	 "live.ie",
	 "live.in",
	 "live.it",
	 "live.jp",
	 "live.nl",
	 "live.no",
	 "live.ru",
	 "live.se",
	 "liveclub.co.uk",
	 "locos.com",
	 "login.virtualjerusalem.com",
	 "loja.net",
	 "looksmart.co.uk",
	 "looksmart.com.au",
	 "lottos.com.au",
	 "lovecat.com",
	 "luso.pt",
	 "luukku.com",
	 "lycosbox.com",
	 "lycosbox.com",
	 "mail.168city.com",
	 "mail.2friend.com",
	 "mail.alibaba.com",
	 "mail.amei.cc",
	 "mail.asiapoint.net",
	 "mail.asiapoint.net",
	 "mail.asiapoint.net",
	 "mail.atlas.cz",
	 "mail.az",
	 "mail.bangkok.com",
	 "mail.bg",
	 "mail.bta.net.cn",
	 "mail.catcha.com",
	 "mail.chek.com",
	 "mail.chek.com",
	 "mail.co-co.cc",
	 "mail.com",
	 "mail.cz",
	 "mail.digiro.net",
	 "mail.dotcom.fr",
	 "mail.ee",
	 "mail.euroseek.net",
	 "mail.euroseek.net",
	 "mail.excite.co.jp",
	 "mail.excite.co.uk",
	 "mail.excite.de",
	 "mail.forum.dk",
	 "mail.fotofutura.com",
	 "mail.freenation.net",
	 "mail.gnetpri.com",
	 "mail.gr",
	 "mail.hkmag.com",
	 "mail.home.ro:81",
	 "mail.hutchcity.com",
	 "mail.kitty.cc",
	 "mail.kstop.co.kr",
	 "mail.latino.com",
	 "mail.lv",
	 "mail.lycos.co.kr",
	 "mail.lycos.com",
	 "mail.md",
	 "mail.naseej.com",
	 "mail.od.ua",
	 "mail.on.com.tw",
	 "mail.otelo-online.de",
	 "mail.pchome.com.tw",
	 "mail.pt",
	 "mail.ru",
	 "mail.seguros.com.br",
	 "mail.teddy.cc",
	 "mail.telkom.net",
	 "mail.tjohoo.se",
	 "mail.tonghua.com.cn",
	 "mail.tuner.fm",
	 "mail.unicum.de",
	 "mail.voila.fr",
	 "mail.webcity.ca",
	 "mail.x-stream.co.uk",
	 "mail.yahoo.ca",
	 "mail.yahoo.co.nz",
	 "mail.yahoo.com.au",
	 "mail.yahoo.com.br",
	 "mail.yahoo.com.mx",
	 "mail.yahoo.de",
	 "mail.yahoo.dk",
	 "mail.yahoo.ie",
	 "mail.yahoo.it",
	 "mail.yahoo.no",
	 "mail.yahoo.se",
	 "mail2000.com.tw",
	 "mail2india.com",
	 "mail2web.com",
	 "mail4u.nl",
	 "mail4you.de",
	 "mailasia.com",
	 "mailasia.com",
	 "mailasia.com",
	 "mailbank.ne.jp",
	 "mailbox.gr",
	 "mailbox.sk",
	 "mailbr.com.br",
	 "mailcity.lycos.co.jp",
	 "mailcityasia.lycos.com",
	 "mailclub.net",
	 "mailinator.com",
	 "mailit.com.au",
	 "mailje.nl",
	 "mailme.dk",
	 "mailmij.nl",
	 "mailnova.com",
	 "mail-online.dk",
	 "mailpanda.com",
	 "mailperso.com",
	 "mailreader.com",
	 "mails.ch",
	 "mails.hu",
	 "mailstart.com",
	 "mailstart.com",
	 "mailstart.com",
	 "mailthat.net",
	 "mailto.it",
	 "mailtw.com",
	 "maktoob.com",
	 "manager.de",
	 "mancity.net",
	 "manufree.net",
	 "marca.es",
	 "marchmail.com",
	 "marketing.lu",
	 "marketing.lu",
	 "markguide.com",
	 "martignan.com",
	 "mbox.com.au",
	 "mcrmail.com",
	 "mediaport.nl",
	 "medic.net.au",
	 "mediomail.com",
	 "megacity.com",
	 "megamail.pt",
	 "meloo.com",
	 "mensagem.cc",
	 "merseymail.com",
	 "mexico.com",
	 "mfinance.com",
	 "mfn.de",
	 "mighty.co.za",
	 "mixmail.com",
	 "mobemail.com.au",
	 "mol.com.cn",
	 "mol.mn",
	 "moncourrier.com",
	 "montecafe.com",
	 "montevideo.com.uy",
	 "msgbox.com",
	 "msn.com",
	 "msnhotmail.com",
	 "muder.net",
	 "multimania.fr",
	 "musikinfos.de",
	 "muzi.com",
	 "mweb.com.cn",
	 "mweb.com.cn",
	 "myanmars.net",
	 "mycity.com.cn",
	 "mygale.org",
	 "mymail.co.uk",
	 "mymail.com.au",
	 "mymail.ph",
	 "mypcera.com",
	 "myrice.com",
	 "myweb.de",
	 "nameplanet.com",
	 "nameplanet.com",
	 "nana.co.il",
	 "nederlands.com",
	 "netcityhk.com",
	 "netcrawler.com.pk",
	 "netian.com",
	 "netking.com",
	 "netlords.de",
	 "netmail.nl",
	 "netnet.com.sg",
	 "netposta.net",
	 "netpostbus.com",
	 "netvigator.ca",
	 "netvigator.com",
	 "netvigator.com.my",
	 "netvigator.com.tw",
	 "newmail.net",
	 "newmail.ru",
	 "nexus.hu",
	 "nexxmail.com",
	 "ningbo.net",
	 "nl.lycosmail.com",
	 "nmonline.com.cn",
	 "nomade.fr",
	 "norgesmail.com",
	 "norikomail.com",
	 "nz11.com",
	 "nzemail.co.nz",
	 "o2.pl",
	 "obsidiana.com",
	 "obsidiana.com.ar",
	 "obsidiana.com.ar",
	 "ofir.dk",
	 "oktw.net",
	 "olemail.com",
	 "onet.pl",
	 "online.ie",
	 "online.ie",
	 "online.no",
	 "online.sh.cn",
	 "online.tj.cn",
	 "online-today.de",
	 "operamail.com",
	 "organizer.net",
	 "otakumail.com",
	 "ourchina.net",
	 "outblaze.net",
	 "outgun.com",
	 "overcmail.de",
	 "ownmail.com",
	 "oznetwork.com.au",
	 "pagefrance.com",
	 "pajek.net",
	 "pakcenter.com",
	 "paki.com",
	 "pakistanmail.com",
	 "pakistans.com",
	 "pancevo.com",
	 "paracompra.com",
	 "paramas.com",
	 "passagen.se",
	 "pattayacitythailand.com",
	 "pcmail.com.tw",
	 "pearl-online.de",
	 "peoplemail.com.cn",
	 "personales.com",
	 "perthmail.com.",
	 "peru.com",
	 "philippines.to",
	 "phokat.com",
	 "pimail.be",
	 "pimail.com.pk",
	 "pinoymail.com",
	 "planet2000.de",
	 "planet-online.de",
	 "planet-samoa.com",
	 "plasa.com",
	 "pobox.sk",
	 "pochtamt.ru",
	 "poczta.fm",
	 "pokefan.com",
	 "pokemon.com.my",
	 "popaccount.com",
	 "popaccount.com",
	 "popsmail.com",
	 "portalen.no",
	 "portugalmail.pt",
	 "post.cz",
	 "post.de",
	 "post.sk",
	 "postaweb.com",
	 "postmanpat.org.uk",
	 "postmaster.co.uk",
	 "prim.hu",
	 "privacyx.com",
	 "privat.web-art.de",
	 "prontomail.ne.jp",
	 "proudcanadian.net",
	 "proudindians.com",
	 "purpleturtle.com",
	 "qmail.cz",
	 "rad-dresden.de",
	 "rdsnet.ro",
	 "Rediffmail.com",
	 "rediffmail.com",
	 "redom.edu.do",
	 "reflex.at",
	 "regards.net",
	 "renren.com",
	 "renren.com",
	 "repsol.com",
	 "respublica.fr",
	 "rexian.com",
	 "rileks.com",
	 "rinderwahnsinn.de",
	 "robotmail.ne.jp",
	 "rocketmail.com",
	 "rsprog.co.yu",
	 "rtl-online.de",
	 "sammimail.com",
	 "sanriotown.com",
	 "sarmail.com",
	 "satyamonline.com",
	 "schlingel.de",
	 "schweiz.ch",
	 "sd1.de",
	 "searcheuropemail.com",
	 "searcheuropemail.com",
	 "searcheuropemail.com",
	 "searcheuropemail.com",
	 "seedcity.com",
	 "serbiancity.com",
	 "seudominio.com.br",
	 "Shaw.ca",
	 "shikong.com",
	 "siammail.com",
	 "siliconbd.com",
	 "sina.com.tw",
	 "singmail.com",
	 "sites-internet.com",
	 "siutao.com",
	 "ski.com.au",
	 "skydiver.de",
	 "slartibartfast.pp.se",
	 "slo.net",
	 "slomail.com",
	 "slovenia-cafe.com",
	 "smapxsmap.net",
	 "smartvia.de",
	 "sobao.com",
	 "sofcom.com.au",
	 "sohu.com.cn",
	 "soim.net",
	 "soyou.com",
	 "sportasia.com",
	 "sportbarrio.com",
	 "spray.fr",
	 "spray.it",
	 "spray.net",
	 "spray.no",
	 "spray.se",
	 "starmate.com",
	 "starmedia.com",
	 "starmedia.com",
	 "starmedia.com",
	 "starmedia.com",
	 "start.com.au",
	 "start.no",
	 "sternpost.de",
	 "stetic.net",
	 "student.be",
	 "stutensee.net",
	 "subotica.com",
	 "sunpoint.net",
	 "surabayacity.com",
	 "surflondon.co.uk",
	 "surftimemag.com",
	 "surfway.de",
	 "sverige.nu",
	 "sy163.net",
	 "t2mail.com",
	 "taipeilink.net",
	 "taiwan.com",
	 "taiwandot.com",
	 "takas.lt",
	 "talk21.com",
	 "tantriks.com",
	 "telekbird.com.cn",
	 "terra.cl",
	 "terra.com",
	 "terra.com.ar",
	 "terra.com.co",
	 "terra.com.do",
	 "terra.com.do",
	 "terra.com.gt",
	 "terra.com.mx",
	 "terra.com.pa",
	 "terra.com.pe",
	 "terra.com.sv",
	 "terra.com.uy",
	 "terra.com.ve",
	 "terra.es",
	 "tesco.net",
	 "tf1.fr",
	 "thai.com",
	 "thaimail.com",
	 "thaimail.org",
	 "thaiservice.com",
	 "thatweb.com",
	 "themail.co.uk",
	 "timormail.com",
	 "tintin.org",
	 "today.com.au",
	 "tokyo24.com",
	 "tokyo24.com",
	 "tollon.co.uk",
	 "tom.com",
	 "tomcat.ru",
	 "topmail.co.uk",
	 "topmail.de",
	 "torget.se",
	 "toschi.de",
	 "tpemail.net.tw",
	 "tropicmail.com",
	 "tur.net",
	 "turbomail.net",
	 "turkiye.tc",
	 "tut.by",
	 "tutopia.com",
	 "tutoriais.com",
	 "tvnet.lt",
	 "tvnet.lv",
	 "tw.joymail.com",
	 "ucs.com.tw",
	 "uk.bigfoot.com",
	 "uk111.com",
	 "uk2.net",
	 "ukmax.com",
	 "ukr.net",
	 "ukrpost.net",
	 "unete.com",
	 "uni.de",
	 "unistudent.com.au",
	 "uol.com.br",
	 "uolmail.com",
	 "uolmail.com.ar",
	 "uolmail.com.co",
	 "uolmail.com.mx",
	 "uolmail.com.ve",
	 "up-to.net",
	 "url.com.tw",
	 "uymail.com",
	 "Verizon.net",
	 "verpiss-dich.de",
	 "verywoman.net",
	 "vietnammail.net",
	 "vip.gr",
	 "virgilio.it",
	 "virtualindia.com",
	 "visitmail.com",
	 "vol.vnn.vn",
	 "w3-graphixx.de",
	 "walla.co.il",
	 "wappi.com",
	 "waumail.com",
	 "wawasan2020.com",
	 "wbox.de",
	 "web-culture.com",
	 "webinfo.fi",
	 "webmail.co.yu",
	 "webmail.co.za",
	 "webmail.laposte.net",
	 "webmail.net.nz",
	 "webmail.ozbytes.net.au",
	 "webmail.sapo.pt",
	 "webmail.shinbiro.com",
	 "webmail.telstra.com",
	 "webmail.vnn.vn",
	 "webstar.com.my",
	 "westmail.net",
	 "windoms.sitek.net",
	 "windygates.co.uk",
	 "winmail.net",
	 "wireworm.com",
	 "wish.nl",
	 "wlf.de",
	 "wocall.com.cn",
	 "wonet.com",
	 "woodo.com.tw",
	 "world4fun.ch",
	 "worldatlas.com.sg",
	 "worldmexico.com",
	 "worldwidemail.co.uk",
	 "wp.pl",
	 "wprost.pl",
	 "www1.5415.com",
	 "www2.altnews.com.au",
	 "wx88.net",
	 "x9media.de",
	 "xd990.net",
	 "Yahoo.ca",
	 "yahoo.co.hk",
	 "Yahoo.co.in",
	 "yahoo.co.in",
	 "Yahoo.co.jp",
	 "yahoo.co.jp",
	 "yahoo.co.kr",
	 "yahoo.co.uk",
	 "yahoo.com",
	 "yahoo.com.cn",
	 "yahoo.com.sg",
	 "yahoo.com.tw",
	 "yam.com.tw",
	 "yandex.ru",
	 "yap.com.au",
	 "yawmail.com",
	 "yehey.com",
	 "yesbox.net",
	 "yifan.com",
	 "yo-mail.de",
	 "youpy.ch",
	 "youpy.co.uk",
	 "youpy.com",
	 "youpy.com",
	 "youpy.fr",
	 "yourmail.com.au",
	 "yoyo.pl",
	 "yp.com.mo",
	 "yupi.com",
	 "yyhmail.com",
	 "zahav.net.il",
	 "zaobao.com.sg",
	 "zdnetmail.ne.jp",
	 "zhaodaola.com.cn",
	 "ziplip.co.jp",
	 "zipmail.co.nz",
	 "zipmail.com.br",
	 "zmail.to",
	 "zonnet.nl",
	 "zworg.com",
	 "skyhighnetworks.com",
	 "netskope.com",
	 "perspecsys.com"];

	 function isCompanyEmailValid(email) 
	 {
	   for(i=0; i < invalidDomains.length; i++) 
	   {
		  var invalidDomain = invalidDomains[i].toLowerCase();
		  if (email.indexOf(invalidDomain) !== -1) 
		  {
			   return false;
		  }
		}
		return true;
	  }
//-->