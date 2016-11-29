/* @group Common Style */ 

h1{
    font-family: 'Open Sans', sans-serif;
    font-weight:600;
    color:#0c172b;
    font-size:22px;
    line-height:26px;
    display:block;
}
h2{
    font-family: 'Open Sans', sans-serif;
    font-weight:400;
    color:#fff;
    font-size:20px;
    line-height:24px;
}
.show{
    display:block;
}
.hide{
    display:none;
}
.flt{float:left}
.frt{float:right;} 
.splashScreen img{
    max-width:100%;
}
.marB20{
    margin-bottom:20px !important;
}
.noSidebarCell{padding:5px !important;}
/* @end */ 

/* Header styles */  

.viewer_head{
    overflow: hidden;
    padding:15px 0 10px 0;
 }
.headingTxt img{
    float:left;
    padding-right: 4px;
}
.poweredBy{
    font-family: 'Open Sans', sans-serif;
    font-weight:100;
    color:#999999;
    font-size:10px;
    line-height:14px; 
    margin-top: 8px;
}
.logDetailsCtnr .poweredBy{
    margin-top: 18px;
}
.poweredBy img{
    margin-left:8px;
    vertical-align: bottom;
}
.upgrade{
    font-family: 'Open Sans', sans-serif;
    font-weight:100;
    color:#666666;
    font-size:11px;
    line-height:14px;
}
.upgrade a{
    color:#6095b9;
    font-weight:600;
    text-decoration:none;
}
.upgrade a:hover{
    color:#6095b9;
    text-decoration:underline;
}
.tblHead{
    background:url(/resource/CloudLock_ELF__tblHeadBg) repeat-x left top;
}
.tblHead th{
    font-family: 'Open Sans', sans-serif;
    font-weight:100;
    color:#fff;
    text-transform: uppercase;
    font-size:12px;
    line-height:15px;
    text-shadow: 1px 0 1px #565656;
    background:url(/resource/CloudLock_ELF__tblHeadDivider) no-repeat 0 0;
}
.tblHead th:first-child{
    background-image:none;
}
.logCount{
    font-family: 'Open Sans', sans-serif;
    font-weight:600;
    color:#0c172b;
    font-size:13px;
    line-height:18px;
    margin:5px 20px 0 0;
}
.logCount span{
    color:#666666;
    font-weight:400;
}
.view{
    font-family: 'Open Sans', sans-serif;
    font-weight:100;
    color:#666666;
    font-size:12px;
    line-height:15px;
    padding: 5px 0;
}
.view a{
    color:#6095b9;
    text-decoration:none;
}
.view a:hover{
    color:#6095b9;
    text-decoration:underline;
}
.selectBox select {
    font-family: 'Open Sans', sans-serif;
    padding:3px 10px;
    margin: 0;
    background: #ffffff;
    color:#666666;
    border-top:none;
    border-left:none;
    border-right:solid 1px #c6cfd6;
    border-bottom:solid 1px #c6cfd6;
    outline:none;
    display: inline-block;
    -webkit-appearance:none;
    -moz-appearance:none;
    appearance:none;
    cursor:pointer;
    font-size:12px;
    line-height:15px;
    -webkit-border-radius:0px;
    -moz-border-radius:0px;
    border-radius:0px;
    width:214px;
    height:25px;
}
.selectBox {position:relative;}
.selectBox:after { 
    content: " ";           
    right:12px; top:10px;
    padding:0;
    position:absolute;
    pointer-events:none;
    background:transparent url("/resource/CloudLock_ELF__dropdownArrow") no-repeat left top;
    width:11px;
    height:6px;
}
.selectBox:before {
    content:'';
    right:1px; top:0px;
    width:35px; height:24px;
    /*background:#fff;*/
    position:absolute;
    pointer-events:none;
    display:block;
}
.sticky-component .selectBox:before{
    background:#fff;
}
.eventType{margin-right:12px;}
.date select{
    width:165px !important;
}

/* @end */ 

/* Sticky Component styles */        
        
.sticky-component {
    margin: 0 auto;            
    overflow-x: auto;
    overflow-y: hidden;
    position:relative;
    width:100%;
    max-width: 0;
    min-width: 100%;
    height:auto;
}
.sticky-component table {
    border-collapse: collapse;
    width: 100%;
    background: #fff;
}
.sticky-component td{
    padding: 10px 15px;
    text-align: left;
    border-right:solid 1px #e5e9ed;
    color:#666666;
    font-size:13px;
    line-height:18px;
    white-space:nowrap;
}
.sticky-component td a{
    color:#6095b9;
    text-decoration:none;
    font-weight:400;
}
.sticky-component td a:hover{
    text-decoration:underline;
}
.sticky-component tbody{
    border-right:solid 1px #e5e9ed;
    border-bottom:solid 1px #e5e9ed;
    border-left:solid 1px #e5e9ed;
}
.sticky-component td:last-child{
    border-right:none;
}
.sticky-component th {
    padding: 10px 15px 11px 15px;
    text-align: left;
}
.sticky-component td.err {
    background-color: #e992b9;
    color: #fff;
    font-size: 0.75em;
    text-align: center;
    line-height: 1;
}
.sticky-component th {
    white-space: nowrap;
}
.sticky-component tbody th {
     
}
.sticky-component tbody tr:nth-child(2n) {
    background-color: #f9fafb;
    transition: all .125s ease-in-out;
}
.sticky-component tbody tr:hover {
    background-color: #ecf4fa;
}

/* For appearance */
.sticky-wrap {
    /*overflow: hidden;*/
    position: relative;
    margin: 0;
    width: 100%;
}
.sticky-wrap .sticky-thead,
.sticky-wrap .sticky-col,
.sticky-wrap .sticky-intersect {
    opacity: 0;
    position: absolute;
    top: 0;
    left: 0;
    /*transition: all .125s ease-in-out;*/
    z-index: 50;
    width: auto; /* Prevent table from stretching to full size */
}
.sticky-wrap .sticky-thead {
    /*box-shadow: 0 0.25em 0.1em -0.1em rgba(0,0,0,.125);*/
    z-index: 100;
    width: 100%; /* Force stretch */
    min-width:100%;
    opacity:1;
}
.sticky-wrap .sticky-intersect {
    opacity: 1;
    z-index: 150;

}
.sticky-wrap .sticky-intersect th {
    
}
.sticky-wrap td,
.sticky-wrap th {
    box-sizing: border-box;
}

/* Not needed for sticky header/column functionality */
td.user-name {
    text-transform: capitalize;
}
.sticky-wrap.overflow-y {
    overflow-y: auto;
    max-height: 500px;
}
.scroll{
    overflow: visible;
}

/* @end */ 


/* Map Popup styles */  
.mapOverlay{
    display:none;
    position:fixed;
    left:0;
    top:0;
    background:rgba(0,0,0, .6);
    width:100%;
    height:100%;
    z-index:999;
}
.mapWrap{
    position:absolute;
    top:0;
    right:0;
    bottom:0;
    left:0;
    margin:auto;
    overflow:hidden;
    width:525px;
    height:510px;
    padding:20px;
    background: #fff;
    box-shadow:0 0 15px #0f0f0f;
    -webkit-border-radius:10px;
    -moz-border-radius:10px;
    border-radius:10px;
}
.mapHeading{
    font-family: 'Open Sans', sans-serif;
    font-weight:600;
    color:#0c172b;
    font-size:22px;
    line-height:23px;
    display:block;
    margin-bottom:8px;
}
.mapEventType{
    font-family: 'Open Sans', sans-serif;
    font-weight:600;
    color:#0c172b;
    font-size:13px;
    line-height:17px;
    display:block;
}
.mapEventType span{
    color:#666;
    font-weight: 400;
}
.closeBtn{
    float:right;
    cursor:pointer;
    background:url("/resource/CloudLock_ELF__closedBtn") no-repeat left top;
    width:20px;
    height:20px;
    opacity:0.7;
}
.closeBtn:hover{
    opacity:1;
}
body .prevAct .btn{
    display:inline-block;
    cursor:pointer;
    background:transparent url("/resource/CloudLock_ELF__mapControlls") no-repeat right top;
    width:21px;
    height:27px;
    border:none;
    -webkit-border-radius:0px;
    -moz-border-radius:0px;
    border-radius:0px;
}
body .prevAct .btn:hover{
    background-position:right top;
}
body .nextAct .btn:hover{
    background-position:left top;
}
body .nextAct .btn{
    display:inline-block;
    cursor:pointer;
    background:transparent url("/resource/CloudLock_ELF__mapControlls") no-repeat left top;
    width:21px;
    height:27px;
    border:none;
    -webkit-border-radius:0px;
    -moz-border-radius:0px;
    border-radius:0px;
}

/* @end */ 

/* Loading styles */ 

.loadingOverlay > span > span:first-child{
    position:fixed;
    left:0;
    top:0;
    background:rgba(0,0,0, .8);
    width:100%;
    height:100%;
    z-index:999;
}
.loadingOverlay img{
	position:absolute;
    top:0;
    right:0;
    bottom:0;
    left:0;
    margin:auto;
    overflow:hidden;
    width:64px;
    height:64px;    
}


.signupLoader{
    position:absolute;
    left:0;
    top:0;
    background:rgba(0,0,0, .8);
    width:100%;
    height:100%;
    z-index:999;
    display:none;
}
.signupLoader img{
	position:absolute;
    top:0;
    right:0;
    bottom:0;
    left:0;
    margin:auto;
    overflow:hidden;
    width:64px;
    height:64px;    
}


/* @end */


/* CTA styles */  
.CTA{
    background:url("/resource/CloudLock_ELF__CTABg") repeat-x left top;
    text-align:center;
    position:fixed;
    bottom:-1px;
    left:0;
    width:100%;
    padding:29px 0 19px 0;
    z-index:1;
}
.CTA h2{
    display:inline-block;
}
.whiteBtn{
    font-family: 'Open Sans', sans-serif;
    display:inline-block;
    background:#fff;
    font-size:14px;
    line-height:17px;
    font-weight:600;
    color:#75a9cd;
    -webkit-border-radius:30px;
    -moz-border-radius:30px;
    border-radius:30px;
    text-decoration:none;
    padding:10px 25px;
    margin-left:15px;
}
.whiteBtn:hover{
    text-decoration:none;
    background:#0d172b;
    color: #fff;
}

/* @end */ 

/* Screens styles */  
.mainSection{
    overflow:hidden;
    padding:0 0 80px 0;
}
.logViewerCtnr{
    overflow:hidden;
    padding:5px;
}
.actionCount{
    width:35%;
}
.actionCount img{
    float:left;
}
.actionCount span{
    float:left;
    color:#666666;
    font-size:13px;
    line-height:18px;
    font-weight:300;
    margin:3px 0 0 10px;
}
.actionBtn{
    margin:0;
    position: relative;
}
.actionBtn .btn, body .gMapBtn{
    font-family: 'Open Sans', sans-serif;
    color:#6da4ca;
    font-size:13px;
    line-height:18px;
    font-weight:400;
    background:none;
    border:none;
    padding:0;
    margin-right: 10px;
}

.whiteBtn2 .btn, input.whiteBtn2{
    font-family: 'Open Sans', sans-serif;
    color:#6da4ca;
    font-size:13px;
    line-height:18px;
    font-weight:400;
    border:none;
    padding:5px 7px !important;
    background:#ffffff;
    box-shadow: 2px 2px 1px #d1dbe1;
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
    border-radius: 0;
    position: relative;
    margin: 0 20px 0 0;
}
.whiteBtn2 .btn:hover, input.whiteBtn2:hover{
    text-decoration:none;
    background:#6da4ca;
    color:#ffffff;
    opacity:1;
}
.actionBtn .btn:hover, body .btn.gMapBtn:hover{
    text-decoration:underline;
}

.backToEvent{
    font-family: 'Open Sans', sans-serif;
    color:#6da4ca;
    font-size:12px;
    line-height:16px;
    font-weight:400;
    text-decoration:none;
    margin:0 0 3px 0;
    display: inline-block;
}
.backToEvent:hover{
    color:#6da4ca;
    text-decoration:underline;
}
.logDetailsCtnr{
    display:none;
    padding:5px;
}
.logDetailsCtnr .viewer_head{
    padding-top:5px;
}
.splashContent{
    overflow: hidden;
    padding:26px 0 0 3%;
    position: relative;
}
.splashHead{    
    padding:0 0 45px 0;
    overflow:hidden;
    float:left;
    clear:both;
}
.splashHead h1 img{
    margin-right: 4px;
  	vertical-align: bottom;
}
.splashScreen{
    overflow: hidden;
    background:url(/resource/CloudLock_ELF__blueBg) repeat-x left top;
    border-top:solid 1px #d3d3d3;
    border-right:solid 1px #d3d3d3;
    border-left:solid 1px #d3d3d3;
    /*-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;*/
}
.splashScreenBor{
    overflow: hidden;
    border-bottom:solid 28px #0c172b;    
}
.poweredby{
    font-family: 'Open Sans', sans-serif;
    color:#ffffff;
    font-size:12px;
    line-height:15px;
    font-weight:300;
    text-align: left;
    text-shadow:1px 1px 0px #3c89a8;
    margin: 8px 0 0 0;
}
.poweredby img{
    margin-left:6px;
    vertical-align: bottom;
}
.textBlock{
    float:left;
    /*max-width:380px;*/
    width:37%;
    padding-right:3%;
    margin-top:7px;
}
.textBlock h1{
    font-family: 'Open Sans', sans-serif;
    color:#ffffff;
    font-size:30px;
    line-height:33px;
    font-weight:400;
    text-shadow:1px 1px 0px #3c89a8;
}
.textBlock p{
    font-family: 'Open Sans', sans-serif;
    color:#ffffff;
    font-size:18px;
    line-height:26px;
    font-weight:300;
    letter-spacing: .4px;
    margin:0;
    clear:both;
}
.textBlock > span{
    display:block;
    font-family: 'Open Sans', sans-serif;
    color:#ffffff;
    font-size:14px;
    line-height:20px;
    font-weight:300;
    margin: 8px 0 15px 0;
}
.steps{
    list-style-type:none;
    margin:0;
    padding:0;
}
.steps li{
    font-family: 'Open Sans', sans-serif;
    color:#ffffff;
    font-size:16px;
    line-height:35px;
    font-weight:300;
    margin:0 0 15px 0;
    padding:0 0 0 0;
    letter-spacing: .4px;
}
.steps li a{    
    font-family: 'Open Sans', sans-serif;
    display:inline-block;
    background:#fff;
    font-size:14px;
    line-height:17px;
    font-weight:400;
    color:#75a9cd;
    -webkit-border-radius:30px;
    -moz-border-radius:30px;
    border-radius:30px;
    text-decoration:none;
    padding:6px 20px 7px 20px;
    margin-right: 5px;
}
.steps li a:hover{
    text-decoration: none;
  	background: #0d172b;
  	color: #fff;
}
.steps li span{
    font-family: 'Open Sans', sans-serif;
    color:#ffffff;
    font-size:16px;
    line-height:30px;
    font-weight:400;
    display:inline-block;
    background:rgba(255, 255, 255, .1);
    -webkit-border-radius: 50%;
    -moz-border-radius: 50%;
    border-radius: 50%;
    padding: 2px 12px;
    margin-right: 10px;
    vertical-align: middle;
    float:left;
}
.steps li strong{
    font-weight:400;
}
.imgBlock{
    float:right;
    /*max-width:878px;*/
    width: 60%;
}

.scroll-pane
{
	width: 100%;
    overflow-x: auto;
    overflow-y: hidden;
}
.horizontal-only
{
	height: auto;
    overflow-x: auto;
    overflow-y: hidden;
}
.logFilePanel{
    min-width:100%;
}

/* @end */

/* Attributes Popup styles */
.attributesOverlay{
    display:none;
    position:fixed;
    left:0;
    top:0;
    background:rgba(0,0,0, .8);
    width:100%;
    height:100%;
    z-index:999;
}
.attributesWrap{
    background:#fff;
    position:absolute;
    top:0;
    right:0;
    bottom:0;
    left:0;
    margin:auto;
    overflow:hidden;
    max-height:500px;
    width:50%;
    height:auto;
    box-shadow:0 0 15px #0f0f0f;
    -webkit-border-radius:10px;
    -moz-border-radius:10px;
    border-radius:10px;
}
.attributesWrap h2{
    color:#0c172b;
    display:block;
}
.sticky-wrap .attrBtn{
    border:none;
    background-color:transparent;
}
.attributesWrap .attrHead{
    padding:20px;
    position:relative;
}
.attPanelTbl{
    width:auto !important;
    overflow:hidden; 
    height:auto;
}
.attributesWrap .closeBtn{
    position:absolute;
    right:20px;
    top:20px;
    opacity:0.7;
}
.attributesWrap .closeBtn:hover{
    opacity:1;
}

/* @end */

/* Map Popup styles */
.popupOverlay{
    display:none;
    position:fixed;
    left:0;
    top:0;
    background:rgba(0,0,0, .8);
    width:100%;
    height:100%;
    z-index:999;
}
.popupWrap{
    background:#49aed5;
    position:absolute;
    top:0;
    right:0;
    bottom:0;
    left:0;
    margin:auto;
    overflow:hidden;
    width:485px;
    height:520px;
    padding:20px;
    box-shadow:0 0 15px #0f0f0f;
    -moz-border-radius: 10px !important;
	-webkit-border-radius: 10px !important;
	border-radius: 10px !important;
    border:solid 1px #9fe4fe !important;
}
.popupOverlay .closeBtn{
    background:url(/resource/CloudLock_ELF__closedBtnWhite);
    opacity:0.7;
}
.popupOverlay .closeBtn:hover{
    opacity:1;
}
.fieldsMdtry{
    font-family: 'Open Sans', sans-serif;
    color:#ffffff;
    font-size:11px;
    line-height:15px;
    font-weight:300;
    text-align:right;
    margin: 0 80px 8px 0;
}
.popupWrap h2{
    font-family: 'Open Sans', sans-serif;
    color:#ffffff;
    font-size:30px;
    line-height:36px;
    font-weight:400;
    text-shadow:1px 1px 1px #275d72;
    margin:15px 0 15px 0;
    text-align:center;
    display:block;
}
.getStarted{
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background:#49aed5;
    text-align:center;
    padding:160px 0 0 0;
}
.getStarted span{
    display: block;
    width:91px;
    height:91px;
    margin: auto;
    background:url(/resource/CloudLock_ELF__getStarted);
}
.getStarted h2{
    font-family: 'Open Sans', sans-serif;
    color:#ffffff;
    font-size:30px;
    line-height:36px;
    font-weight:400;
    text-shadow:1px 1px 1px #275d72;
    margin: 10px 0 0px 0;
}
.getStarted p{
    font-family: 'Open Sans', sans-serif;
    color:#ffffff;
    font-size:14px;
    line-height:20px;
    font-weight:300;
    margin: 10px 0 0px 0;
}

/* @end */

/* @group Signup Form */

.signupForm{
    overflow:hidden;
    background:#49aed5;
    margin: auto;
  	width: 380px;
}
.signupForm dl{
    float:left;
    clear:both;
    margin:0 0 15px 0;
}
.signupForm dl dt{
    float:left;
    font-family: 'Open Sans', sans-serif;
    font-size: 15px;
    line-height:18px;
    color:#fff;
    font-weight:300;
    width:100px;
    margin-right:15px;
    text-align:right;
    padding-top: 4px;
}
.signupForm dl dd{
    float:left;
    position:relative;
    margin:0;
    padding:0;
}
.signupForm dl dd span{
    display:none;
}
.signupForm input[type="text"]{
    font-family: 'Open Sans', sans-serif;
    font-size: 13px;
    line-height:18px;
    padding: 7px 15px 7px 15px;
    resize: none;
    border:none;
    width: 204px;
    color: #999999;
    display: block;
    -moz-border-radius: 20px;
	-webkit-border-radius: 20px;
	border-radius: 20px;
    outline:none;
}
.error input, .error select{
    background-color:#ffd0d6;
}
.error select option{
    background-color:transparent;
}
.error label, .error label a{
    color:#ad4646;
    font-weight:400;
}
.error input[type="checkbox"]{
    border:solid 1px #ad4646;
}
.signupForm dl dd.error span{
    font-family: 'Open Sans', sans-serif;
    font-size: 12px;
    line-height:15px;
    color:#ad4646;
    position:absolute;
    top:9px;
    left:12px;
    margin:auto;
    display:block;
    background: #ffd0d6;
}
.signupForm .selectBox select{
    color:#666666;
    -moz-border-radius: 20px;
	-webkit-border-radius: 20px;
	border-radius: 20px;
    overflow:hidden;
    padding: 7px 15px 7px 15px;
    width: 232px;
    height: 34px;
}
.signupForm .error.selectBox:before {
    background-color:#ffd0d6;
}
.signupForm .selectBox:before {
    background-color:#fff;
    right:1px; top:0px;
    width:48px; height:33px;
    -moz-border-radius: 20px;
	-webkit-border-radius: 20px;
	border-radius: 20px;
}

.signupForm .selectBox:after{ 
  right: 15px;
  top: 15px;
}
.submitBtn{
    font-family: 'Open Sans', sans-serif;
	padding: 9px 25px;
	font-size: 14px;
    line-height:18px;
	color: #fff;
	-moz-border-radius: 20px;
	-webkit-border-radius: 20px;
	-khtml-border-radius: 20px;
	border-radius: 20px;
	border: none;
	cursor: pointer;
	background: #0c172b;
    font-weight: 400;
    outline:none;
}
.submitBtn:hover{
	background: #fff;
	color: #49aed5;
}
.cancelBtn{
    font-family: 'Open Sans', sans-serif;
	padding: 9px 10px;
	font-size: 14px;
    line-height:18px;
	color: #bbecff;
	-moz-border-radius: 20px;
	-webkit-border-radius: 20px;
	-khtml-border-radius: 20px;
	border-radius: 20px;
	border: none;
	cursor: pointer;
	background: transparent;
    font-weight: 300;
    outline:none;
}
.cancelBtn:hover{
    color: #fff;
}
.scrollbar{
    overflow:auto;
    width:100%;
    height:420px;
    margin-top: 15px;
}
.termsCheckbox{
    font-family: 'Open Sans', sans-serif;
    font-size: 12px;
    line-height: 25px;
    color: #fff;
    font-weight: 300;
}
.termsCheckbox a{
    font-family: 'Open Sans', sans-serif;
    font-size: 12px;
    color: #bbecff;
    font-weight: 300;
    text-decoration:none;
}
.termsCheckbox a:hover{
    color: #fff;
    text-decoration:none;
}

/*@end*/

@media (max-width: 1070px){
    .imgBlock{
        padding-top:7%;
    }
}

@media (max-width: 1024px){
    .CTA h2{
        font-size: 18px;
    }
     
    .textBlock h1{
        font-size:22px;
    }
    
}

@media (max-width: 1200px){

    .textBlock p br:first-child{
        display:none;
    }
    
}

@media (min-width: 1650px){
    .splashContent{
        width:1550px;
        margin:auto;
    }
}