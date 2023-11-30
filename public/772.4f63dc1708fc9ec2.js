"use strict";(self.webpackChunkecuador=self.webpackChunkecuador||[]).push([[772],{7772:(q,g,u)=>{u.r(g),u.d(g,{RegistrationModule:()=>k});var _=u(9808),l=u(4175),e=u(4893),n=u(2382),d=u(9783),m=u(5146),c=u(5887),f=u(4036),p=u(845);let v=(()=>{class i{constructor(t,o,r,a,U){this.service=t,this.router=o,this.apiService=r,this.fb=a,this.cookieService=U,this.formValidityChanged=new e.vpe,this.msgs=[],this.user_types=[{id:1,name:"Regular User"},{id:2,name:"Admin"}],this.genders=[{id:1,name:"Male"},{id:2,name:"Female"}],this.civil_statuses=[{id:1,name:"Single"},{id:2,name:"Married"},{id:2,name:"Widowed"}],this.batch_years=[{id:1,year:2023},{id:2,year:2022},{id:1,year:2021},{id:2,year:2020},{id:1,year:2019},{id:2,year:2018}],this.selectedState=null,this.personalForm=this.fb.group({first_name:["",n.kI.required],middle_name:[""],last_name:[""],batch_year:[null],dob:[null],age:[""],civil_status:[null],gender:[""],region:[""],province:[""],municipality:[""],barangay:[""],course:[""],year_graduated:[""],email_address:[""],phone_number:[""]}),this.personalForm.valueChanges.subscribe(()=>{this.formValidityChanged.emit(this.personalForm.valid)})}ngOnInit(){}confirm(){var t;let o=this.personalForm.value;o.batch_year=o.year_graduated,o.civil_status=o.civil_status.id,o.gender=o.gender.id,o.user_id=null!==(t=parseInt(this.cookieService.getToken("user_id")))&&void 0!==t?t:1,o.batch_years=o.year_graduated,console.log("confirm",o),this.apiService.createAlumniMain({user:o}).subscribe(a=>{console.log("createAlumniMain",a),this.router.navigate(["registration/work"]),this.service.add({key:"tst",severity:"success",summary:"Success Message",detail:"Personal profile created!"})},a=>{console.log(a),this.msgs=[],this.msgs.push({severity:"error",summary:"Error Message",detail:"Please check required fields!"})})}isFirstComplete(){return this.personalForm.get("first_name").valid&&this.personalForm.get("last_name").valid}}return i.\u0275fac=function(t){return new(t||i)(e.Y36(d.ez),e.Y36(l.F0),e.Y36(m.s),e.Y36(n.qu),e.Y36(c.n))},i.\u0275cmp=e.Xpm({type:i,selectors:[["app-personal"]],outputs:{formValidityChanged:"formValidityChanged"},features:[e._Bn([d.ez])],decls:94,vars:6,consts:[[1,"container"],["role","form",3,"formGroup"],[1,"sign-up-panel"],[1,"grid"],[1,"col-12","md:col-3"],[1,"field"],["for","first_name"],["type","text","id","first_name","pInputText","","formControlName","first_name",1,"custom-input"],["for","middle_name"],["type","text","id","middle_name","pInputText","","formControlName","middle_name",1,"custom-input"],["for","last_name"],["type","text","id","last_name","pInputText","","formControlName","last_name",1,"custom-input"],["for","dob"],["type","date","id","dob","pInputText","","formControlName","dob",1,"custom-input"],["for","age"],["type","number","id","age","pInputText","","formControlName","age",1,"custom-input"],[1,"grid","p-fluid"],[1,"col-12"],["for","civil_status"],["inputId","civil_status","optionLabel","name","formControlName","civil_status",3,"autoDisplayFirst","options"],["for","gender"],["inputId","gender","optionLabel","name","formControlName","gender",3,"autoDisplayFirst","options"],[1,"mt-2"],["for","region"],["type","text","id","region","pInputText","","formControlName","region",1,"custom-input"],["for","province"],["type","text","id","province","pInputText","","formControlName","province",1,"custom-input"],["for","municipality"],["type","text","id","municipality","pInputText","","formControlName","municipality",1,"custom-input"],["for","barangay"],["type","text","id","barangay","pInputText","","formControlName","barangay",1,"custom-input"],["for","course"],["type","text","id","course","pInputText","","formControlName","course",1,"custom-input"],["for","year_graduated"],["type","text","id","year_graduated","pInputText","","formControlName","year_graduated",1,"custom-input"],["for","email_address"],["type","text","id","email_address","pInputText","","formControlName","email_address",1,"custom-input"],["for","phone_number"],["type","text","id","phone_number","pInputText","","formControlName","phone_number",1,"custom-input"],["pButton","","pRipple","","type","button","label","NEXT",1,"p-button-raised","p-button-success","mr-2","mb-2",3,"disabled","click"]],template:function(t,o){1&t&&(e.TgZ(0,"div",0)(1,"form",1)(2,"div",2)(3,"div",3)(4,"div",4)(5,"div",5)(6,"label",6),e._uU(7,"First Name"),e.qZA(),e._UZ(8,"input",7),e.qZA()(),e.TgZ(9,"div",4)(10,"div",5)(11,"label",8),e._uU(12,"Middle Name"),e.qZA(),e._UZ(13,"input",9),e.qZA()(),e.TgZ(14,"div",4)(15,"div",5)(16,"label",10),e._uU(17,"Last Name"),e.qZA(),e._UZ(18,"input",11),e.qZA()(),e.TgZ(19,"div",4)(20,"div",5)(21,"label",12),e._uU(22,"Date of Birth"),e.qZA(),e._UZ(23,"input",13),e.qZA()(),e.TgZ(24,"div",4)(25,"div",5)(26,"label",14),e._uU(27,"Age"),e.qZA(),e._UZ(28,"input",15),e.qZA()(),e.TgZ(29,"div",4)(30,"div",16)(31,"div",17)(32,"div",5)(33,"label",18),e._uU(34,"Civil Status"),e.qZA(),e._UZ(35,"p-dropdown",19),e.qZA()()()(),e.TgZ(36,"div",4)(37,"div",5)(38,"label",20),e._uU(39,"Gender"),e.qZA(),e._UZ(40,"p-dropdown",21),e.qZA()()(),e.TgZ(41,"p",22)(42,"b"),e._uU(43,"Home Address"),e.qZA()(),e.TgZ(44,"div",3)(45,"div",4)(46,"div",5)(47,"label",23),e._uU(48,"Region"),e.qZA(),e._UZ(49,"input",24),e.qZA()(),e.TgZ(50,"div",4)(51,"div",5)(52,"label",25),e._uU(53,"Province"),e.qZA(),e._UZ(54,"input",26),e.qZA()(),e.TgZ(55,"div",4)(56,"div",5)(57,"label",27),e._uU(58,"Municipality"),e.qZA(),e._UZ(59,"input",28),e.qZA()(),e.TgZ(60,"div",4)(61,"div",5)(62,"label",29),e._uU(63,"Barangay"),e.qZA(),e._UZ(64,"input",30),e.qZA()()(),e.TgZ(65,"p",22)(66,"b"),e._uU(67,"Educational Background"),e.qZA()(),e.TgZ(68,"div",3)(69,"div",4)(70,"div",5)(71,"label",31),e._uU(72,"Course/Degree"),e.qZA(),e._UZ(73,"input",32),e.qZA()(),e.TgZ(74,"div",4)(75,"div",5)(76,"label",33),e._uU(77,"Year Graduated"),e.qZA(),e._UZ(78,"input",34),e.qZA()()(),e.TgZ(79,"p",22)(80,"b"),e._uU(81,"Contact Information"),e.qZA()(),e.TgZ(82,"div",3)(83,"div",4)(84,"div",5)(85,"label",35),e._uU(86,"Email Address"),e.qZA(),e._UZ(87,"input",36),e.qZA()(),e.TgZ(88,"div",4)(89,"div",5)(90,"label",37),e._uU(91,"Phone Number"),e.qZA(),e._UZ(92,"input",38),e.qZA()()(),e.TgZ(93,"button",39),e.NdJ("click",function(){return o.confirm()}),e.qZA()()()()),2&t&&(e.xp6(1),e.Q6J("formGroup",o.personalForm),e.xp6(34),e.Q6J("autoDisplayFirst",!1)("options",o.civil_statuses),e.xp6(5),e.Q6J("autoDisplayFirst",!1)("options",o.genders),e.xp6(53),e.Q6J("disabled",o.personalForm.invalid))},dependencies:[n._Y,n.Fj,n.wV,n.JJ,n.JL,n.sg,n.u,f.Lt,p.Hq],styles:[".custom-input[_ngcontent-%COMP%]{width:100%;border:1px solid rgb(206,212,218);height:30.33px}"]}),i})(),y=(()=>{class i{constructor(t,o,r){this.apiService=t,this.router=o,this.cookieService=r,this.formValidityChanged=new e.vpe,this.componentInitialized=new e.vpe,this.accountForm=new n.cw({username:new n.NI("",[n.kI.required]),password:new n.NI("",[n.kI.required,n.kI.minLength(8)]),confirm_password:new n.NI("",[n.kI.required,n.kI.minLength(8)]),user_type_id:new n.NI(1)}),this.batch_years=[{id:1,year:2023},{id:2,year:2022},{id:1,year:2021},{id:2,year:2020},{id:1,year:2019},{id:2,year:2018}],this.user_types=[{id:1,name:"Regular User"},{id:2,name:"Admin"}],this.accountForm.valueChanges.subscribe(()=>{this.formValidityChanged.emit(this.accountForm.valid)})}ngOnInit(){}confirm(){let t=this.accountForm.value;t.user_type_id=1,t.is_active=!0,console.log("sign_up",t),this.apiService.registerUser({user:t}).subscribe(r=>{console.log(r),localStorage.setItem("user_id",r.id),this.cookieService.setToken("user_id",r.user.id),alert(r.message),this.router.navigate(["registration/personal"])},r=>{console.log(r),alert(r.error.error)})}ngAfterViewInit(){this.componentInitialized.emit()}}return i.\u0275fac=function(t){return new(t||i)(e.Y36(m.s),e.Y36(l.F0),e.Y36(c.n))},i.\u0275cmp=e.Xpm({type:i,selectors:[["app-account"]],outputs:{formValidityChanged:"formValidityChanged",componentInitialized:"componentInitialized"},decls:24,vars:2,consts:[[1,"container"],["role","form",3,"formGroup"],[1,"account-panel"],[1,"grid","mt-3"],[1,"col-12","md:col-4"],[1,"account-form"],[1,"p-col-12"],[1,"field"],["for","username"],["type","text","id","username","pInputText","","formControlName","username",1,"custom-input"],["for","password"],["type","password","autocomplete","off","id","password","pInputText","","formControlName","password",1,"custom-input"],["for","confirm_password"],["type","password","autocomplete","off","id","confirm_password","pInputText","","formControlName","confirm_password",1,"custom-input"],[1,"grid","p-fluid"],[1,"col-12"],["pButton","","pRipple","","type","button","label","NEXT",1,"p-button-raised","p-button-success","mr-2","mb-2",3,"disabled","click"]],template:function(t,o){1&t&&(e.TgZ(0,"div",0)(1,"form",1)(2,"div",2)(3,"div",3)(4,"div",4)(5,"div",5)(6,"div",6)(7,"div",7)(8,"label",8),e._uU(9,"Email"),e.qZA(),e._UZ(10,"input",9),e.qZA()(),e.TgZ(11,"div",6)(12,"div",7)(13,"label",10),e._uU(14,"Password"),e.qZA(),e._UZ(15,"input",11),e.qZA()(),e.TgZ(16,"div",6)(17,"div",7)(18,"label",12),e._uU(19,"Confirm Password"),e.qZA(),e._UZ(20,"input",13),e.qZA()(),e.TgZ(21,"div",14)(22,"div",15)(23,"button",16),e.NdJ("click",function(){return o.confirm()}),e.qZA()()()()()()()()()),2&t&&(e.xp6(1),e.Q6J("formGroup",o.accountForm),e.xp6(22),e.Q6J("disabled",o.accountForm.invalid))},dependencies:[n._Y,n.Fj,n.JJ,n.JL,n.sg,n.u,p.Hq],styles:[".custom-input[_ngcontent-%COMP%]{width:100%;border:1px solid rgb(206,212,218);height:30.33px}"]}),i})();var b=u(2886),h=u(3542);let C=(()=>{class i{constructor(t){this.breadcrumbService=t,this.pageIndex=0,this.routeItems=[{label:"Personal",routerLink:["/registration/personal"]},{label:"Account",routerLink:["/registration/account"]}],this.canNavigateToNextStep=[!1,!1],this.breadcrumbService.setItems([{label:"UI Kit"},{label:"Menu"}])}ngOnInit(){this.routeItems=[{label:"Account",routerLink:"account"},{label:"Personal",routerLink:"personal"},{label:"Work",routerLink:"work"}]}checkPages(){var t,o;console.log(null===(t=this.personalComponent)||void 0===t?void 0:t.personalForm),console.log(null===(o=this.accountComponent)||void 0===o?void 0:o.accountForm)}ngAfterViewInit(){var t;null===(t=this.accountComponent)||void 0===t||t.componentInitialized.subscribe(()=>{})}areAllStepsValid(){return this.canNavigateToNextStep.every(t=>t)}}return i.\u0275fac=function(t){return new(t||i)(e.Y36(b.p))},i.\u0275cmp=e.Xpm({type:i,selectors:[["ng-component"]],viewQuery:function(t,o){if(1&t&&(e.Gf(v,5),e.Gf(y,5)),2&t){let r;e.iGM(r=e.CRH())&&(o.personalComponent=r.first),e.iGM(r=e.CRH())&&(o.accountComponent=r.first)}},decls:8,vars:1,consts:[[1,"grid","p-fluid","m-5"],[1,"col-12"],[1,"card","card-w-title","flex","flex-wrap"],[1,"col-12","md:col-12","h-full"],["styleClass","mb-5",3,"model"]],template:function(t,o){1&t&&(e.TgZ(0,"div",0)(1,"div",1)(2,"div",2)(3,"div",3)(4,"h5"),e._uU(5,"Registration"),e.qZA(),e._UZ(6,"p-tabMenu",4)(7,"router-outlet"),e.qZA()()()()),2&t&&(e.xp6(6),e.Q6J("model",o.routeItems))},dependencies:[l.lC,h.d],encapsulation:2}),i})();var Z=u(9603);function A(i,s){1&i&&(e.TgZ(0,"div",17)(1,"div",18)(2,"label",28),e._uU(3,"Type of Business"),e.qZA(),e._UZ(4,"input",29),e.qZA(),e.TgZ(5,"div",18)(6,"label",30),e._uU(7,"Area of Business"),e.qZA(),e._UZ(8,"input",31),e.qZA(),e.TgZ(9,"div",18)(10,"label",32),e._uU(11,"Business Related"),e.qZA(),e._UZ(12,"input",33),e.qZA(),e.TgZ(13,"div",18)(14,"label",34),e._uU(15,"Line of Business"),e.qZA(),e._UZ(16,"input",35),e.qZA(),e.TgZ(17,"div",18)(18,"label",36),e._uU(19,"Business Address"),e.qZA(),e._UZ(20,"input",37),e.qZA(),e.TgZ(21,"div",18)(22,"label",38),e._uU(23,"Business Name"),e.qZA(),e._UZ(24,"input",39),e.qZA(),e.TgZ(25,"div",18)(26,"label",40),e._uU(27,"Business Acronym"),e.qZA(),e._UZ(28,"input",41),e.qZA()())}function T(i,s){if(1&i){const t=e.EpF();e.TgZ(0,"div")(1,"p",3),e._uU(2,"If YES, Please check:"),e.qZA(),e.TgZ(3,"div",4)(4,"div",5)(5,"div",6)(6,"p-radioButton",13),e.NdJ("ngModelChange",function(r){e.CHM(t);const a=e.oxw();return e.KtG(a.workType=r)}),e.qZA(),e.TgZ(7,"label",14),e._uU(8,"Working"),e.qZA()()(),e.TgZ(9,"div",5)(10,"div",6)(11,"p-radioButton",15),e.NdJ("ngModelChange",function(r){e.CHM(t);const a=e.oxw();return e.KtG(a.workType=r)}),e.qZA(),e.TgZ(12,"label",16),e._uU(13,"Self-Emplyed(In business)"),e.qZA()()()(),e.TgZ(14,"div",4)(15,"div",17)(16,"div",18)(17,"label",19),e._uU(18,"Work Position"),e.qZA(),e._UZ(19,"input",20),e.qZA(),e.TgZ(20,"div",18)(21,"label",21),e._uU(22,"Company Name"),e.qZA(),e._UZ(23,"input",22),e.qZA(),e.TgZ(24,"div",18)(25,"label",23),e._uU(26,"Company Address"),e.qZA(),e._UZ(27,"input",24),e.qZA(),e.TgZ(28,"div",18)(29,"label",25),e._uU(30,"Company Acronym"),e.qZA(),e._UZ(31,"input",26),e.qZA()(),e.YNc(32,A,29,0,"div",27),e.qZA()()}if(2&i){const t=e.oxw();e.xp6(6),e.Q6J("ngModel",t.workType),e.xp6(5),e.Q6J("ngModel",t.workType),e.xp6(21),e.Q6J("ngIf","private"==t.workType)}}let I=(()=>{class i{constructor(t,o,r,a){this.apiService=t,this.router=o,this.service=r,this.cookieService=a,this.workType="private",this.msgs=[],this.workForm=new n.cw({is_working:new n.NI("",n.kI.required),work_type:new n.NI(""),work_position:new n.NI(""),business_name:new n.NI(""),company_name:new n.NI(""),company_address:new n.NI(""),company_acronym:new n.NI(""),type_of_business:new n.NI(""),area_of_business:new n.NI(""),business_address:new n.NI(""),business_acronym:new n.NI(""),business_related:new n.NI(""),line_of_busines:new n.NI("")})}ngOnInit(){}confirm(){let t=this.workForm.value;t.user_id=parseInt(this.cookieService.getToken("user_id")),this.apiService.createWork({user:t}).subscribe(r=>{console.log("createAlumniMain",r),this.service.add({key:"tst",severity:"success",summary:"Success Message",detail:"Work profile created!"})},r=>{console.log(r),this.msgs=[],this.msgs.push({severity:"error",summary:"Error Message",detail:"Please check required fields!"})})}}return i.\u0275fac=function(t){return new(t||i)(e.Y36(m.s),e.Y36(l.F0),e.Y36(d.ez),e.Y36(c.n))},i.\u0275cmp=e.Xpm({type:i,selectors:[["app-work"]],features:[e._Bn([d.ez])],decls:18,vars:5,consts:[[1,"container"],["role","form",3,"formGroup"],[1,"sign-up-panel"],[1,"mt-2"],[1,"grid"],[1,"col-12","md:col-4"],[1,"field-radiobutton"],["name","is_working","value","yes","formControlName","is_working","id","yes",3,"ngModel","ngModelChange"],["for","yes"],["name","is_working","value","no","formControlName","is_working","id","no",3,"ngModel","ngModelChange"],["for","no"],[4,"ngIf"],["pButton","","pRipple","","type","button","label","SUBMIT",1,"p-button-raised","p-button-success","mr-2","mb-2",3,"disabled","click"],["name","work_type","value","private","formControlName","work_type","id","private",3,"ngModel","ngModelChange"],["for","private"],["name","work_type","value","self employed","formControlName","work_type","id","self",3,"ngModel","ngModelChange"],["for","self"],[1,"col-12","md:col-6"],[1,"field"],["for","work_position",1,"mr-2"],["type","text","id","work_position","pInputText","","formControlName","work_position",1,"custom-input"],["for","company_name",1,"mr-2"],["type","text","id","company_name","pInputText","","formControlName","company_name",1,"custom-input"],["for","company_address",1,"mr-2"],["type","text","id","company_address","pInputText","","formControlName","company_address",1,"custom-input"],["for","company_acronym",1,"mr-2"],["type","text","id","company_acronym","pInputText","","formControlName","company_acronym",1,"custom-input"],["class","col-12 md:col-6",4,"ngIf"],["for","type_of_business",1,"mr-2"],["type","text","id","type_of_business","pInputText","","formControlName","type_of_business",1,"custom-input"],["for","area_of_business",1,"mr-2"],["type","text","id","area_of_business","pInputText","","formControlName","area_of_business",1,"custom-input"],["for","business_related",1,"mr-2"],["type","text","id","business_related","pInputText","","formControlName","business_related",1,"custom-input"],["for","line_of_busines",1,"mr-2"],["type","text","id","line_of_busines","pInputText","","formControlName","line_of_busines",1,"custom-input"],["for","business_address",1,"mr-2"],["type","text","id","business_address","pInputText","","formControlName","business_address",1,"custom-input"],["for","business_name",1,"mr-2"],["type","text","id","business_name","pInputText","","formControlName","business_name",1,"custom-input"],["for","business_acronym",1,"mr-2"],["type","text","id","business_acronym","pInputText","","formControlName","business_acronym",1,"custom-input"]],template:function(t,o){1&t&&(e.TgZ(0,"div",0)(1,"form",1)(2,"div",2)(3,"p",3),e._uU(4,"Are you presently working or engaged in business?"),e.qZA(),e.TgZ(5,"div",4)(6,"div",5)(7,"div",6)(8,"p-radioButton",7),e.NdJ("ngModelChange",function(a){return o.isWorking=a}),e.qZA(),e.TgZ(9,"label",8),e._uU(10,"Yes"),e.qZA()()(),e.TgZ(11,"div",5)(12,"div",6)(13,"p-radioButton",9),e.NdJ("ngModelChange",function(a){return o.isWorking=a}),e.qZA(),e.TgZ(14,"label",10),e._uU(15,"No"),e.qZA()()()(),e.YNc(16,T,33,3,"div",11),e.TgZ(17,"button",12),e.NdJ("click",function(){return o.confirm()}),e.qZA()()()()),2&t&&(e.xp6(1),e.Q6J("formGroup",o.workForm),e.xp6(7),e.Q6J("ngModel",o.isWorking),e.xp6(5),e.Q6J("ngModel",o.isWorking),e.xp6(3),e.Q6J("ngIf","yes"==o.isWorking),e.xp6(1),e.Q6J("disabled",o.workForm.invalid))},dependencies:[n._Y,n.Fj,n.JJ,n.JL,n.sg,n.u,Z.EU,p.Hq,_.O5]}),i})(),k=(()=>{class i{}return i.\u0275fac=function(t){return new(t||i)},i.\u0275mod=e.oAB({type:i}),i.\u0275inj=e.cJS({imports:[n.u5,n.UX,f.kW,Z.cc,p.hJ,_.ez,l.Bz.forChild([{path:"",component:C,children:[{path:"",redirectTo:"account",pathMatch:"full"},{path:"personal",component:v},{path:"account",component:y},{path:"work",component:I}]}]),l.Bz]}),i})()}}]);