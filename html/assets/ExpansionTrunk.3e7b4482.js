import{h as y,r as o,o as i,f as g,w as l,e as a,_ as w,p as I,a as z,c as u,F as b,b as c,t as D,d as C,i as U,A as S,g as k}from"./index.c0f1642d.js";const x={props:["vehicleData","onWantToGetVehicle","colorCode","getDataFromServer"]},A=y("Owner infromation"),F=y(" Get nearby vehicle ");function N(e,n,t,h,d,f){const p=o("f7-block-title"),r=o("f7-list-input"),s=o("f7-icon"),m=o("f7-list"),v=o("f7-button"),_=o("f7-block");return i(),g(_,{strong:"",inset:""},{default:l(()=>[a(p,null,{default:l(()=>[A]),_:1}),a(m,{"inline-labels":"","no-hairlines-md":""},{default:l(()=>[a(r,{label:"Name",type:"text",placeholder:"Your name",disabled:"",value:`${t.vehicleData.personalInfo.firstname} ${t.vehicleData.personalInfo.lastname}`},null,8,["value"]),a(r,{label:"Owner ID",type:"tel",placeholder:"Owner ID number",value:t.vehicleData.ownerID},{default:l(()=>[a(s,{icon:"demo-list-icon"})]),_:1},8,["value"]),a(r,{label:"Phone",type:"tel",placeholder:"Owner phone number",value:t.vehicleData.personalInfo.phone},{default:l(()=>[a(s,{icon:"demo-list-icon"})]),_:1},8,["value"]),a(r,{label:"Gender",type:"text",value:t.vehicleData.personalInfo.gender?"Female":"Male",disabled:""},{default:l(()=>[a(s,{icon:"demo-list-icon"})]),_:1},8,["value"]),a(r,{label:"Birthdate",type:"text",value:t.vehicleData.personalInfo.birthdate,disabled:""},{default:l(()=>[a(s,{icon:"demo-list-icon"})]),_:1},8,["value"])]),_:1}),a(v,{fill:"",preloader:"",loading:t.onWantToGetVehicle,color:t.colorCode,onClick:t.getDataFromServer},{default:l(()=>[F]),_:1},8,["loading","color","onClick"])]),_:1})}var G=w(x,[["render",N]]);const M={props:["vehicleData","showSwiper"]};const B=y("Vehicle Model"),W=["src"];function E(e,n,t,h,d,f){const p=o("f7-block-title"),r=o("f7-swiper-slide"),s=o("f7-swiper"),m=o("f7-block");return i(),u(b,null,[a(p,null,{default:l(()=>[B]),_:1}),a(m,{strong:"",inset:""},{default:l(()=>[c("h2",null,D(t.vehicleData.model),1),t.showSwiper==!0?(i(),g(s,{key:0,pagination:"",navigation:"",scrollbar:""},{default:l(()=>[(i(!0),u(b,null,C(t.vehicleData.images,v=>(i(),g(r,{key:v,style:{"justify-content":"center",display:"flex"}},{default:l(()=>[c("img",{src:v,alt:"",srcset:""},null,8,W)]),_:2},1024))),128))]),_:1})):U("",!0)]),_:1})],64)}var O=w(M,[["render",E],["__scopeId","data-v-4bc59336"]]);const j={props:["vehicleUpgradeData","testValue"]},L={label:"Trunk size"},R=["value","selected"];function Y(e,n,t,h,d,f){const p=o("f7-list-item"),r=o("f7-list");return i(),g(r,{inset:""},{default:l(()=>[a(p,{title:"Upgrades","smart-select":"","smart-select-params":{openIn:"popup",searchbar:!0,searchbarPlaceholder:"Search updgrades"}},{default:l(()=>[c("select",{name:"Weight",multiple:"",onChange:n[0]||(n[0]=(...s)=>t.testValue&&t.testValue(...s))},[c("optgroup",L,[(i(!0),u(b,null,C(t.vehicleUpgradeData.upgradesAvailableForThisVehicle,s=>(i(),u("option",{key:s.lable,value:s.size,selected:s.upgraded},D(s.lable),9,R))),128))])],32)]),_:1})]),_:1})}var q=w(j,[["render",Y]]),H="assets/dark.ca21ee15.png";const J={props:["vehicleData"]},K=e=>(I("data-v-1f138e52"),e=e(),z(),e),Q={class:""},X=y(" Show Plate "),Z={class:"plate"},ee=K(()=>c("img",{src:H},null,-1));function te(e,n,t,h,d,f){const p=o("f7-button"),r=o("f7-block"),s=o("f7-page-content"),m=o("f7-sheet");return i(),u("div",Q,[a(p,{fill:"","sheet-open":".demo-sheet-swipe-to-close",disabled:t.vehicleData.plate===""},{default:l(()=>[X]),_:1},8,["disabled"]),t.vehicleData.plate!==""?(i(),g(m,{key:0,class:"demo-sheet-swipe-to-close",style:{height:"auto","--f7-sheet-bg-color":"#fff"},"swipe-to-close":"",backdrop:""},{default:l(()=>[a(s,null,{default:l(()=>[a(r,null,{default:l(()=>[c("div",Z,[ee,c("span",null,D(this.vehicleData.plate),1)])]),_:1})]),_:1})]),_:1})):U("",!0)])}var ae=w(J,[["render",te],["__scopeId","data-v-1f138e52"]]);const le={props:["vehicleUpgradeData","readyToPay","payColorCode","commissionPercentage","onPayment","paymentAndUpgrade"]},oe=y(" Check bill "),se={class:"sheet-modal-swipe-step"},ie={class:"display-flex padding justify-content-space-between align-items-center"},ne=c("div",{style:{"font-size":"18px"}},[c("b",null,"Total:")],-1),re={style:{"font-size":"22px"}},ce={class:"padding-horizontal padding-bottom"},de=y(" Make Payment "),he=c("div",{class:"margin-top text-align-center"}," Swipe up for more details ",-1),pe=y("Your order:"),_e={class:"text-color-green"},ue={class:"text-color-red"};function fe(e,n,t,h,d,f){const p=o("f7-button"),r=o("f7-block-title"),s=o("f7-list-item"),m=o("f7-list"),v=o("f7-sheet");return i(),u(b,null,[a(p,{fill:"","sheet-open":".demo-sheet-swipe-to-step",disabled:t.readyToPay!==!0},{default:l(()=>[oe]),_:1},8,["disabled"]),t.readyToPay===!0?(i(),g(v,{key:0,class:"demo-sheet-swipe-to-step",style:{height:"auto","--f7-sheet-bg-color":"#fff"},"swipe-to-close":"","swipe-to-step":"",backdrop:"",closeByBackdropClick:""},{default:l(()=>[c("div",se,[c("div",ie,[ne,c("div",re,[c("b",null,"$"+D(t.vehicleUpgradeData.billPrice),1)])]),c("div",ce,[a(p,{large:"",fill:"",preloader:"",onClick:t.paymentAndUpgrade,color:t.payColorCode,loading:t.onPayment,disabled:t.vehicleUpgradeData.billPrice==0},{default:l(()=>[de]),_:1},8,["onClick","color","loading","disabled"]),he])]),a(r,{medium:"",class:"margin-top"},{default:l(()=>[pe]),_:1}),a(m,{"no-hairlines":""},{default:l(()=>[(i(!0),u(b,null,C(t.vehicleUpgradeData.selectedUpdgrades,_=>(i(),u(b,{key:_.lable},[_.serverSideUpgraded!==!0?(i(),g(s,{key:0,title:`+${_.lable}`},{after:l(()=>[c("b",_e,"$"+D(_.price),1)]),_:2},1032,["title"])):U("",!0)],64))),128)),(i(!0),u(b,null,C(t.vehicleUpgradeData.deselectedUpdgrades,_=>(i(),u(b,{key:_.lable},[_.serverSideUpgraded===!0?(i(),g(s,{key:0,title:`-${_.lable}`},{after:l(()=>[c("b",ue," $"+D(_.price*t.commissionPercentage),1)]),_:2},1032,["title"])):U("",!0)],64))),128))]),_:1})]),_:1})):U("",!0)],64)}var me=w(le,[["render",fe]]);const ge={components:{OwnerInformation:G,VehicleInfromation:O,VehicleUpgradeList:q,VehiclePlate:ae,UpgradeBill:me},data(){return{appName:"expansiontrunk",vehicleData:{ownerID:"",personalInfo:{firstname:"",lastname:"",phone:"",gender:"",birthdate:""},model:"",images:[],plate:"",hash:""},vehicleUpgradeData:{upgradesAvailableForThisVehicle:[],currentSize:0,maxUpgradeSize:0,selectedUpdgrades:[],deselectedUpdgrades:[],billPrice:0},onPayment:!1,onWantToGetVehicle:!1,colorCode:"blue",payColorCode:"blue",readyToPay:!1,showSwiper:!1,commissionPercentage:.2,appMetaData:[]}},methods:{getImage(e){fetch("").then(n=>n.json()).then(n=>{let t=[];Object.keys(n.images).forEach(h=>{t.push(n.images[h])}),this.vehicleData.images=t,this.showSwiper=!0}).catch(()=>{this.vehicleData.images=[],this.showSwiper=!1})},getCurrentPageMetaData(){this.$root.globalAppMetaData.forEach(e=>{e.name==this.appName&&(this.appMetaData=e)})},seprateSelectedUpgrades(e){let n=[],t=[];this.vehicleUpgradeData.upgradesAvailableForThisVehicle.forEach((d,f)=>{e.findIndex(r=>r==d.size)===-1?t.push({lable:d.lable,size:d.size,price:d.price,serverSideUpgraded:d.upgraded}):n.push({lable:d.lable,size:d.size,price:d.price,serverSideUpgraded:d.upgraded})}),this.vehicleUpgradeData.selectedUpdgrades=n,this.vehicleUpgradeData.deselectedUpdgrades=t,n.length!=0||t.length!=0?this.readyToPay=!0:this.readyToPay=!1},calBillPrice(){let e=this.vehicleUpgradeData.selectedUpdgrades,n=this.vehicleUpgradeData.deselectedUpdgrades,t=0;e.forEach(h=>{h.serverSideUpgraded===!1&&(t+=h.price)}),n.forEach(h=>{h.serverSideUpgraded===!0&&(t+=h.price*this.commissionPercentage)}),this.vehicleUpgradeData.billPrice=t},paymentAndUpgrade(){this.getCurrentPageMetaData(),this.onPayment=!0,S.post("callbackDispatcher",{type:"update",content:{selected:this.vehicleUpgradeData.selectedUpdgrades,deselected:this.vehicleUpgradeData.deselectedUpdgrades,billPrice:this.vehicleData.billPrice,metaData:this.appMetaData,vehicleData:this.vehicleData}}).then(e=>{this.onPayment=!1,e==!0&&(this.payColorCode="green",setTimeout(()=>{this.$root.toggle(!1),k.sheet.close(".demo-sheet-swipe-to-step",!0),this.payColorCode="blue",k.views.main.router.back()},1500))}).catch(e=>{this.onPayment=!1,this.payColorCode="red",this.$root.showNotificationCloseOnClick({title:"network error",subtitle:e}),setTimeout(()=>{this.payColorCode="blue",k.sheet.close(".demo-sheet-swipe-to-step",!0)},2500)})},testValue(){let e=k.smartSelect.get(".smart-select").getValue();this.seprateSelectedUpgrades(e),this.calBillPrice()},getDataFromServer(){this.getCurrentPageMetaData(),this.onWantToGetVehicle=!0,S.post("callbackDispatcher",{type:"openApp",content:{appName:this.appName,metaData:this.appMetaData}}).then(e=>{this.onWantToGetVehicle=!1,this.vehicleData={personalInfo:e.vehicleData.personalInfo,ownerID:e.vehicleData.ownerID,model:e.vehicleData.model,plate:e.vehicleData.plate,hash:e.vehicleData.hash},this.vehicleUpgradeData={upgradesAvailableForThisVehicle:e.vehicleUpgradeData.upgradesAvailableForThisVehicle,currentSize:e.vehicleUpgradeData.currentSize,maxUpgradeSize:e.vehicleUpgradeData.maxUpgradeSize}}).catch(e=>{this.onWantToGetVehicle=!1,this.$root.showNotificationCloseOnClick({title:"Error",subtitle:e}),this.colorCode="red",setTimeout(()=>{this.colorCode="blue"},2500)})}}};function ve(e,n,t,h,d,f){const p=o("f7-navbar"),r=o("owner-information"),s=o("f7-col"),m=o("vehicle-infromation"),v=o("vehicle-upgrade-list"),_=o("vehicle-plate"),T=o("upgrade-bill"),P=o("f7-row"),V=o("f7-block"),$=o("f7-page");return i(),g($,null,{default:l(()=>[a(p,{title:"Notifications","back-link":"Back"}),a(P,null,{default:l(()=>[a(s,{width:"40"},{default:l(()=>[a(r,{vehicleData:e.vehicleData,onWantToGetVehicle:e.onWantToGetVehicle,colorCode:e.colorCode,getDataFromServer:f.getDataFromServer},null,8,["vehicleData","onWantToGetVehicle","colorCode","getDataFromServer"])]),_:1}),a(s,{width:"60"},{default:l(()=>[a(m,{vehicleData:e.vehicleData},null,8,["vehicleData"]),a(v,{vehicleUpgradeData:e.vehicleUpgradeData,showSwiper:e.showSwiper,testValue:f.testValue},null,8,["vehicleUpgradeData","showSwiper","testValue"]),a(V,null,{default:l(()=>[a(P,{class:"row-justbet"},{default:l(()=>[a(s,{width:"40"},{default:l(()=>[a(_,{vehicleData:e.vehicleData},null,8,["vehicleData"])]),_:1}),a(s,{width:"40"},{default:l(()=>[a(T,{vehicleUpgradeData:e.vehicleUpgradeData,readyToPay:e.readyToPay,payColorCode:e.payColorCode,paymentAndUpgrade:f.paymentAndUpgrade,onPayment:e.onPayment,commissionPercentage:e.commissionPercentage},null,8,["vehicleUpgradeData","readyToPay","payColorCode","paymentAndUpgrade","onPayment","commissionPercentage"])]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})}var ye=w(ge,[["render",ve],["__scopeId","data-v-6815d588"]]);export{ye as default};
