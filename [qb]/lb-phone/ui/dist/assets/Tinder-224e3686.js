import{al as Ce,aq as O,r as m,j as a,a as e,c0 as De,h as Re,p as L,O as we,m as ye,L as u,d as $,a4 as ee,co as ke,aW as xe,u as q,E as Le,P as Y,F as U,I as _e,f as Oe,cp as oe,bP as ie,C as B,b as re,az as Se,as as Te,q as Z,s as G,H as Ve,$ as Me,cq as Fe,a8 as Ne,a3 as de,ab as $e,ac as be,aR as We,cr as He,N as Ue,aj as Be,w as Ge,ao as Ye,bb as he,bh as ze}from"./index-2acb14b9.js";var je=function(s){return new Promise(function(r){setTimeout(r,s)})};const pe=Ce(je),x={snapBackDuration:300,maxTilt:5,bouncePower:.1,swipeThreshold:100},qe=t=>{const s=window.getComputedStyle(t),r=s.getPropertyValue("width"),g=Number(r.split("px")[0]),E=s.getPropertyValue("height"),w=Number(E.split("px")[0]);return{x:g,y:w}},Ee=(t,s)=>Math.sqrt(Math.pow(t,2)+Math.pow(s,2)),Ke=(t,s=1)=>{const r=Math.sqrt(Math.pow(t.x,2)+Math.pow(t.y,2));return{x:t.x*s/r,y:t.y*s/r}},me=async(t,s,r=!1)=>{const g=le(t),E=qe(document.body),w=Ee(E.x,E.y),o=Ee(s.x,s.y),f=w/o,l=w/o,v=fe(s.x*l+g.x,-s.y*l+g.y);let h="";const c=200;r?t.style.transition="ease "+f+"s":t.style.transition="ease-out "+f+"s",J(t)===0?h=X((Math.random()-.5)*c):J(t)>0?h=X(Math.random()*c/2+J(t)):h=X((Math.random()-1)*c/2+J(t)),t.style.transform=v+h,await pe(f*1e3)},Pe=async t=>{t.style.transition=x.snapBackDuration+"ms";const s=le(t),r=fe(s.x*-x.bouncePower,s.y*-x.bouncePower),g=X(J(t)*-x.bouncePower);t.style.transform=r+g,await pe(x.snapBackDuration*.75),t.style.transform="none",await pe(x.snapBackDuration),t.style.transition="10ms"},Ie=t=>{if(Math.abs(t.x)>Math.abs(t.y)){if(t.x>x.swipeThreshold)return"right";if(t.x<-x.swipeThreshold)return"left"}else{if(t.y>x.swipeThreshold)return"up";if(t.y<-x.swipeThreshold)return"down"}return"none"},Ae=(t,s)=>{const r=s.x-t.x,g=t.y-s.y,E=(s.time-t.time)/1e3;return{x:r/E,y:g/E}},fe=(t,s)=>"translate("+t+"px)",X=t=>"rotate("+t+"deg)",le=t=>{const s=window.getComputedStyle(t),r=new DOMMatrix(s.transform);return{x:r.m41,y:-r.m42}},J=t=>{const s=window.getComputedStyle(t),r=new DOMMatrix(s.transform);return-Math.asin(r.m21)/(2*Math.PI)*360},Je=(t,s,r,g)=>{const E={x:t.x+r.x,y:t.y+r.y},w={x:E.x,y:E.y,time:new Date().getTime()},o=fe(E.x),f=Ae(g,w).x/1e3,l=X(f*x.maxTilt);return s.style.transform=o+l,w},ue=t=>{const s=t.targetTouches[0];return{x:s.clientX,y:s.clientY}},ge=t=>({x:t.clientX,y:t.clientY}),Xe=O.forwardRef(({flickOnSwipe:t=!0,children:s,onSwipe:r,onCardLeftScreen:g,className:E,preventSwipe:w=[],swipeRequirementType:o="velocity",swipeThreshold:f=x.swipeThreshold,onSwipeRequirementFulfilled:l,onSwipeRequirementUnfulfilled:v},h)=>{x.swipeThreshold=f;const c=O.useRef(!1),p=O.useRef();O.useImperativeHandle(h,()=>({async swipe(T="right"){r&&r(T);const y=1e3,A=(Math.random()-.5)*100;T==="right"?await me(p.current,{x:y,y:A},!0):T==="left"&&await me(p.current,{x:-y,y:A},!0),p.current.style.display="none",g&&g(T)},async restoreCard(){p.current.style.display="block",await Pe(p.current)}}));const i=O.useCallback(async(T,y)=>{if(c.current)return;c.current=!0;const A=le(T),d=Ie(o==="velocity"?y:A);if(d!=="none"&&(r&&r(d),t&&!w.includes(d))){const P=o==="velocity"?y:Ke(A,600);await me(T,P),T.style.display="none",g&&g(d);return}Pe(T)},[c,t,r,g,w,o]),I=O.useCallback(()=>{c.current=!1},[c]);return O.useLayoutEffect(()=>{let T={x:null,y:null},y={x:0,y:0},A={x:0,y:0,time:new Date().getTime()},d=!1,P="none";p.current.addEventListener("touchstart",b=>{b.preventDefault(),I(),T={x:-ue(b).x,y:-ue(b).y}}),p.current.addEventListener("mousedown",b=>{b.preventDefault(),d=!0,I(),T={x:-ge(b).x,y:-ge(b).y}});const R=b=>{if(l||v){const n=Ie(o==="velocity"?y:le(p.current));n!==P&&(P=n,P==="none"?v&&v():l&&l(n))}const M=Je(b,p.current,T,A);y=Ae(A,M),A=M};p.current.addEventListener("touchmove",b=>{b.preventDefault(),R(ue(b))}),p.current.addEventListener("mousemove",b=>{b.preventDefault(),d&&R(ge(b))}),p.current.addEventListener("touchend",b=>{b.preventDefault(),i(p.current,y)}),p.current.addEventListener("mouseup",b=>{d&&(b.preventDefault(),d=!1,i(p.current,y))}),p.current.addEventListener("mouseleave",b=>{d&&(b.preventDefault(),d=!1,i(p.current,y))})},[]),O.createElement("div",{ref:p,className:E},s)});function ve(){const{View:t}=m.useContext(z),[s,r]=t;return a("div",{className:"home-header",children:[e(De,{onClick:()=>r("profile")}),e("img",{className:"logo",src:"./assets/img/icons/tinder/logo.svg",onClick:()=>r("home")}),e(Re,{onClick:()=>r("messageList")})]})}const W={account:{name:"James",bio:"I'm a cool guy",dob:9624888e5,photos:["https://r2.fivemanage.com/images/GRBUI6C4orbD.webp","https://r2.fivemanage.com/images/98avzSwlgzsg.webp","https://r2.fivemanage.com/images/rafgjPwSYnn2.png"],showMen:!1,showWomen:!0,isMale:!0,active:!0},accounts:[{number:"1",dob:9653888e5,name:"Jessica",bio:"Swipe right if you like dogs",photos:["https://r2.fivemanage.com/images/oRKcdeTA8oBy.png"],isMale:!1,matched:!0},{number:"2",dob:9653888e5,name:"Klara",bio:"Member of Lost MC, looking for a good time",photos:["https://r2.fivemanage.com/images/787FMzhn5xD5.png","https://r2.fivemanage.com/images/ZsmnyJOA2rc5.png"],isMale:!1,liked:!0},{number:"3",dob:9653888e5,name:"Steph",bio:"Evening strolls are my thing",photos:["https://r2.fivemanage.com/images/7zj3Xgy6FsXK.png"],matched:!0,isMale:!1,lastMessage:"I'm perfect, you look good!"}],messages:{3:[{sender:"1",content:"Im perfect, you look good!",timestamp:Date.now()-1e3*60*60*24*1},{sender:"1234567890",content:"I'm good, how about you?",timestamp:Date.now()-1e3*60*60*24*2},{sender:"1",content:"Hey, how are you?",timestamp:Date.now()-1e3*60*60*24*3}]}};function Ze(){const{View:t,User:s,Account:r}=m.useContext(z),[g,E]=t,[w,o]=s,[f,l]=r,[v,h]=m.useState([]),[c,p]=m.useState(0),[i,I]=m.useState(),T=m.useRef(c),y=m.useRef(0),[A,d]=m.useState([]),[P,R]=m.useState(0),[b,M]=m.useState(!1),[n,S]=m.useState(null);let[D,V]=m.useState("");m.useEffect(()=>{L("Tinder",{action:"getFeed",page:0},W.accounts.filter(N=>!N.matched)).then(N=>{N&&N.length>0?(h(N),p(N.length-1),y.current=N.length,d(Array(N.length).fill(0).map(C=>O.createRef()))):M(!0)})},[]);const H=N=>{p(N),T.current=N},j=c<v.length-1,te=c>=0,se=(N,C,_)=>{I(N),H(_-1),F(),N==="right"?L("Tinder",{action:"swipe",like:!0,number:C.number},W.accounts.find(ne=>ne.liked&&ne.number==C.number)).then(ne=>{ne&&S(C)}):N==="left"&&L("Tinder",{action:"swipe",like:!1,number:C.number})},ae=(N,C)=>{T.current>=C&&A[C].current.restoreCard()},K=async N=>{te&&c<v.length&&(await A[c].current.swipe(N),F())},k=async()=>{var C,_;if(!j)return;const N=c+1;H(N),await((_=(C=A[N])==null?void 0:C.current)==null?void 0:_.restoreCard())},F=()=>{if(y.current>1){y.current=y.current-1;return}L("Tinder",{action:"getFeed",page:P+1}).then(N=>{if(N)if(N&&N.length>0){R(P+1);let C=N.length+v.length;h(_=>(_=[..._,...N],_)),y.current=N.length,p(C-1),d(Array(C).fill(0).map(_=>O.createRef()))}else M(!0)})};return a("div",{className:`home-wrapper slide ${g=="profile"?"left":"right"}`,children:[e(ve,{}),e(we,{children:n&&a(ye.div,{initial:{opacity:0,scale:.1},animate:{opacity:1,scale:1},exit:{opacity:0,scale:.1},transition:{duration:.3,ease:"easeInOut"},className:"match",style:{backgroundImage:`url(${n.photos[0]})`},children:[e("img",{className:"match-image",src:"./assets/img/icons/tinder/match.png"}),a("div",{className:"likes-too",children:[n.name," ",u("APPS.TINDER.LIKES_YOU_TOO").toLowerCase()]}),a("div",{className:"input",children:[e($,{type:"text",placeholder:u("APPS.TINDER.SAY_SOMETHING_NICE"),onChange:N=>V(N.target.value)}),e("div",{className:"send",onClick:()=>{L("Tinder",{action:"sendMessage",data:{recipient:n.number,content:D}},!0).then(N=>{N&&(o(n),E("message"))})},children:u("APPS.TINDER.SEND")})]}),e("div",{className:"keep-swiping",onClick:()=>S(null),children:u("APPS.TINDER.KEEP_SWIPING")})]})}),a("div",{className:"home-body",children:[a("div",{className:"cards",children:[b&&e("div",{className:"card no-more",children:e("div",{children:u("APPS.TINDER.NO_MORE")})}),!f.active&&e("div",{className:"card no-more",children:e("div",{children:u("APPS.TINDER.HIDDEN_PROFILE")})}),f.active&&v.map((N,C)=>e(Xe,{ref:A[C],className:"swipe",onSwipe:_=>se(_,N,C),onCardLeftScreen:()=>ae(N,C),children:e(Qe,{user:N})},C))]}),a("div",{className:"actions",children:[e("div",{className:"button",onClick:()=>K("left"),children:e(ee,{style:{color:"#F24C65"}})}),e("div",{className:`button small ${j?"":"disabled"}`,onClick:()=>k(),children:e(ke,{style:{rotate:"180deg",color:"#F2B721"}})}),e("div",{className:"button",onClick:()=>K("right"),children:e(xe,{style:{color:"#3CDBA7"}})})]})]})]})}const Qe=t=>{let s=t.user;const[r,g]=m.useState(0),[E,w]=m.useState(0);return m.useEffect(()=>{w(Q(s.dob))},[s]),a("div",{className:"card",style:{backgroundImage:`url(${s.photos[r]})`},onClick:o=>{r<s.photos.length-1?g(r+1):g(0)},children:[s.photos.length>1&&e("div",{className:"image-count",children:s.photos.map((o,f)=>e("div",{className:`image ${f==r?"active":""}`,onClick:l=>{l.stopPropagation(),g(f)}}))}),a("div",{className:"card-content",children:[a("div",{className:"name",children:[s.name," ",e("span",{children:E})]}),e("div",{className:"description",children:s.bio})]})]})};function et(){const{LoggedIn:t,Account:s}=m.useContext(z),r=q(Y.PhoneNumber),[g,E]=s,[w,o]=t,[f,l]=m.useState("notLoggedIn"),[v,h]=m.useState(0),[c,p]=m.useState({});m.useEffect(()=>{Le("Tinder")&&(f=="notLoggedIn"?Y.Styles.TextColor.set("#ffffff"):Y.Styles.TextColor.set("#000000"))},[f]);const[i,I]=m.useState({name:null,photos:[],_dob:{day:"",month:"",year:""},dob:null,bio:null,showMen:!1,showWomen:!1,isMale:null}),T=d=>{var P,R,b;switch(d){case 0:let M=new Date(`${(P=i._dob)==null?void 0:P.year}/${(R=i._dob)==null?void 0:R.month}/${(b=i._dob)==null?void 0:b.day}`);if(y(M)){let n=Q(M);i.name&&i.name.length>=2&&n>=18&&n<=100&&(I({...i,dob:M.getTime()}),h(d+1))}break;case 1:i.photos.length>0&&h(d+1);break;case 2:i.bio&&i.bio.length>=10&&h(d+1);break;case 3:(i.showMen||i.showWomen)&&h(d+1);break;case 4:(i.isMale==!0||i.isMale==!1)&&L("Tinder",{action:"createAccount",data:{...i,dob:new Date(i.dob).toISOString().split("T")[0]}},!0).then(n=>{if(!n)return Z("error","Failed to create account");G.APPS.TINDER.account.set(i),E(i),o(!0)});break}},y=d=>d.getTime()===d.getTime();let A=[u("APPS.TINDER.CREATE_ACCOUNT"),u("APPS.TINDER.ADD_PHOTOS"),u("APPS.TINDER.DESCRIPTION"),u("APPS.TINDER.SHOW_ME"),u("APPS.TINDER.I_AM")];return e("div",{className:"login-container",style:{background:f==="notLoggedIn"?"linear-gradient(45deg, #ff4573, #ff5f65)":"#ffffff"},children:f==="notLoggedIn"?a(U,{children:[a("div",{className:"logo",children:[e("img",{src:"./assets/img/icons/tinder/logo-white.svg"}),e("div",{className:"logo-text",children:u("APPS.TINDER.TITLE").toLowerCase()})]}),a("div",{className:"buttons",children:[e("div",{className:"disclamer",children:u("APPS.TINDER.AGREE_TERMS")}),e("div",{className:"button create",onClick:()=>l("createAccount"),children:u("APPS.TINDER.CREATE_ACCOUNT")})]})]}):a("div",{className:"create-account",children:[a("div",{className:"login-header",children:[e(_e,{onClick:()=>{v>0?h(v-1):l("notLoggedIn")}}),e("div",{className:"title",children:A[v]})]}),v==0&&e(U,{children:a("div",{className:"form-body",children:[e($,{defaultValue:Oe(r),type:"text",disabled:!0}),e($,{placeholder:"Name",type:"text",maxLength:25,onChange:d=>{I({...i,name:d.target.value}),d.target.value.length>=3?p({...c,name:!0}):p({...c,name:!1})}}),a("div",{className:"dob",children:[a("div",{className:"inputs",children:[e($,{placeholder:"MM",type:"text",pattern:"/^-?\\d+\\.?\\d*$/",minLength:2,maxLength:2,onChange:d=>{I({...i,_dob:{...i._dob,month:d.target.value}})}}),e("span",{children:"/"}),e($,{placeholder:"DD",type:"text",pattern:"/^-?\\d+\\.?\\d*$/",minLength:2,maxLength:2,onChange:d=>{I({...i,_dob:{...i._dob,day:d.target.value}})}}),e("span",{children:"/"}),e($,{placeholder:"YYYY",type:"text",pattern:"/^-?\\d+\\.?\\d*$/",minLength:4,maxLength:4,onChange:d=>{var M,n,S;let P={...i,_dob:{...i._dob,year:d.target.value}};I(P);let R=new Date(`${(M=P._dob)==null?void 0:M.year}/${(n=P._dob)==null?void 0:n.month}/${(S=P._dob)==null?void 0:S.day}`),b=Q(R);b>=18&&b<100?p({...c,18:!0}):p({...c,18:!1})}})]}),e("div",{className:"disclamer",children:u("APPS.TINDER.AGE_PUBLIC")}),a("div",{className:"requirement",children:[c[18]?e(oe,{className:"green"}):e(ie,{className:"red"}),u("APPS.TINDER.BE_OVER_18")]}),a("div",{className:"requirement",children:[c.name?e(oe,{className:"green"}):e(ie,{className:"red"}),u("APPS.TINDER.NAME_MINIMUM")]})]})]})}),v==1&&a(U,{children:[e("div",{className:"photo-grid",children:[...Array(6)].map((d,P)=>{var b;let R=((b=i.photos)==null?void 0:b[P-1])||P==0;return i.photos[P]?e("div",{className:"photo",style:{backgroundImage:`url(${i.photos[P]})`},children:e("div",{className:"button remove",onClick:()=>{let M=i.photos;M.splice(P,1),I({...i,photos:M}),M.length==0&&p({...c,photos:!1})},children:e(ee,{})})}):e("div",{className:"photo",children:R&&e("div",{className:"button add",onClick:()=>{var M,n,S;B.Gallery.set({allowExternal:(S=(n=(M=re)==null?void 0:M.value)==null?void 0:n.AllowExternal)==null?void 0:S.Tinder,onSelect:D=>I({...i,photos:[...i.photos,D.src]})}),p({...c,photos:!0})},children:e(Se,{})})})})}),a("div",{className:"requirement",children:[c.photos?e(oe,{className:"green"}):e(ie,{className:"red"}),u("APPS.TINDER.PHOTOS_MINIMUM")]})]}),v==2&&a(U,{children:[e(Te,{placeholder:"Description",maxLength:200,onChange:d=>{I({...i,bio:d.target.value}),d.target.value.length>=10?p({...c,bio:!0}):p({...c,bio:!1})}}),a("div",{className:"requirement",children:[c.bio?e(oe,{className:"green"}):e(ie,{className:"red"}),u("APPS.TINDER.DESCRIPTION_MINIMUM")]})]}),v==3&&e(U,{children:a("div",{className:"showme",children:[e("div",{className:`button border ${i.showWomen&&!i.showMen?"active":""}`,onClick:()=>{I({...i,showMen:!1,showWomen:!0})},children:u("APPS.TINDER.WOMEN")}),e("div",{className:`button border ${i.showMen&&!i.showWomen?"active":""}`,onClick:()=>{I({...i,showMen:!0,showWomen:!1})},children:u("APPS.TINDER.MEN")}),e("div",{className:`button border ${i.showMen&&i.showWomen?"active":""}`,onClick:()=>{I({...i,showMen:!0,showWomen:!0})},children:u("APPS.TINDER.EVERYONE")})]})}),v==4&&e(U,{children:a("div",{className:"showme",children:[e("div",{className:`button border ${i.isMale===!0?"active":""}`,onClick:()=>{I({...i,isMale:!0})},children:u("APPS.TINDER.MALE")}),e("div",{className:`button border ${i.isMale===!1?"active":""}`,onClick:()=>{I({...i,isMale:!1})},children:u("APPS.TINDER.FEMALE")})]})}),e("div",{className:"button gradient",onClick:()=>T(v),children:u("APPS.TINDER.CONTINUE")})]})})}const ce=Ve(null);function tt(){var M;const{View:t,User:s}=m.useContext(z);q(Y.Settings);const r=q(Y.PhoneNumber),[g,E]=s,[w,o]=t,f=q(ce),[l,v]=m.useState([]),[h,c]=m.useState(0),[p,i]=m.useState(!1),[I,T]=m.useState(!1),y=m.useRef(null),A=m.useRef(0),[d,P]=m.useState({content:"",attachments:[]});m.useEffect(()=>{L("Tinder",{action:"getMessages",page:0,number:g.number},W.messages[g.number]).then(n=>{n&&n.length>0?v(n.reverse()):i(!0)})},[]);const R=()=>{if(d.content.length===0&&d.attachments.length===0)return;const n={sender:r,recipient:g.number,content:d.content,attachments:d.attachments,timestamp:new Date().getTime()};L("Tinder",{action:"sendMessage",data:n},!0).then(S=>{if(!S)return Z("error","Failed to send message");y.current.value="",P({content:"",attachments:[]}),v([...l,n])})},b=()=>{if(p||I)return;let n=document.querySelector("#last");if(!n)return;!Ue(n)&&(T(!0),L("Tinder",{action:"getMessages",page:h+1,number:g.number},null).then(D=>{if(D&&D.length>0){let V=document.querySelector(".message-container");A.current=V.scrollHeight,v([...D.reverse(),...l]),T(!1)}else i(!0)}),c(D=>D+1))};return m.useEffect(()=>{let n=document.querySelector(".message-container");const S=n.scrollHeight;n.scrollTop+=S-A.current,n.scroll},[l]),Me("tinder:newMessage",n=>{g.number===n.sender&&v([...l,n])}),a("div",{className:"home-wrapper slide left",children:[e(we,{children:f&&e(st,{})}),a("div",{className:"message-header",children:[e(Fe,{onClick:()=>{o("messageList"),E(null)}}),a("div",{className:"user",onClick:()=>ce.set(g),children:[e("img",{className:"profile-picture",src:(M=g.photos)==null?void 0:M[0]}),e("div",{className:"name",children:g.name})]})]}),e("div",{className:"message-container",onScroll:b,children:e("div",{className:"message-body",children:l.map((n,S)=>{var te,se,ae,K;let D,V=S===0?"last":"",H=n.sender===r?"self":"other",j=((te=l[S+1])==null?void 0:te.sender)===r?"self":"other";return l[S+1]?D=Math.abs(n.timestamp-l[S+1].timestamp)/36e5:j=void 0,a("div",{className:`message ${H}`,id:V,children:[H=="other"?a("div",{className:"message-with-pfp",children:[e("div",{className:`profile-picture ${H!==j?"show":"hide"}`,children:e("img",{src:(se=g.photos)==null?void 0:se[0]})}),a("div",{className:"message-content",children:[n.content&&e("div",{className:"content",children:Ne(n.content)}),((ae=n.attachments)==null?void 0:ae.length)>0&&e("div",{className:"attatchments",children:n.attachments.map((k,F)=>de(k)?e("video",{src:k,controls:!1,loop:!0,autoPlay:!0,muted:!0,onClick:N=>{B.FullscreenImage.set({display:!0,image:k})}},F):e($e,{src:k,onClick:()=>{B.FullscreenImage.set({display:!0,image:k})}},F))})]})]}):a(U,{children:[n.content&&e("div",{className:"content",children:Ne(n.content)}),((K=n.attachments)==null?void 0:K.length)>0&&e("div",{className:"attatchments",children:n.attachments.map((k,F)=>de(k)?e("video",{src:k,controls:!1,loop:!0,autoPlay:!0,muted:!0,onClick:()=>{B.FullscreenImage.set({display:!0,image:k})}},F):e("img",{src:k,onClick:()=>{B.FullscreenImage.set({display:!0,image:k})}},F))})]}),l[S+1]&&D>6?e("div",{className:"date",children:be(n.timestamp)}):H!==j&&e("div",{className:"date",children:be(n.timestamp)})]},S)})})}),e("div",{className:"attachments",children:d.attachments.map((n,S)=>a("div",{className:"attachment",children:[de(n)?e("video",{src:n,controls:!1,muted:!0,loop:!0,autoPlay:!0}):e("img",{src:n}),e(ee,{onClick:()=>{P({...d,attachments:d.attachments.filter((D,V)=>V!==S)})}})]}))}),a("div",{className:"message-bottom",children:[e(We,{className:"image",onClick:()=>{var n,S,D;d.attachments.length<3&&B.Gallery.set({includeVideos:!0,allowExternal:(D=(S=(n=re)==null?void 0:n.value)==null?void 0:S.AllowExternal)==null?void 0:D.Messages,onSelect:V=>P({...d,attachments:[...d.attachments,V.src]})})}}),a("div",{className:"input",children:[e($,{type:"text",placeholder:"Type a message...",ref:y,onChange:n=>{P({...d,content:n.target.value})},onKeyDown:n=>{n.key==="Enter"&&R()}}),e(He,{className:d.attachments.length>0||d.content.length>0?"active":"",onClick:()=>R()})]})]})]})}const st=()=>{const t=q(ce),[s,r]=m.useState(0);return t?a(ye.div,{initial:{opacity:0,y:500},animate:{opacity:1,y:0},exit:{opacity:0,y:500},className:"popup-profile-container",children:[a("div",{className:"gallery",children:[e("img",{src:t==null?void 0:t.photos[s],onClick:()=>{t&&r(s<(t==null?void 0:t.photos.length)-1?s+1:0)}}),(t==null?void 0:t.photos.length)>1&&e("div",{className:"image-count",children:t==null?void 0:t.photos.map((g,E)=>e("div",{className:Be("image",E==s&&"active"),onClick:w=>{w.stopPropagation(),r(E)}}))}),e("div",{className:"close",onClick:()=>ce.set(null),children:e(ee,{})})]}),a("div",{className:"card-content",children:[a("div",{className:"name",children:[t==null?void 0:t.name,", ",e("span",{children:Q(t==null?void 0:t.dob)})]}),e("div",{className:"divider"}),a("div",{className:"description",children:[e("div",{className:"title",children:"About Me"}),t==null?void 0:t.bio]})]})]}):null};function at(){const{View:t,User:s}=m.useContext(z),[r,g]=s,[E,w]=t,[o,f]=m.useState({newMatches:[],messages:[]});return m.useEffect(()=>{Y.Styles.TextColor.set("#000000"),L("Tinder",{action:"getMatches"},{newMatches:W.accounts.filter(l=>l.matched&&!W.messages[l.number]),messages:W.accounts.filter(l=>W.messages[l.number])}).then(l=>{if(!l)return Z("warning","No response received from Tinder getMatches");f(l)})},[]),Me("tinder:newMessage",l=>{let v=l.sender,h=JSON.parse(JSON.stringify(o)),c=h.messages.findIndex(p=>p.number===v);if(c!==-1)h.messages.unshift(h.messages.splice(c,1)[0]);else if(c=h.newMatches.findIndex(p=>p.number===v),c!==-1)h.messages.unshift(h.newMatches.splice(c,1)[0]);else return;h.messages[0].lastMessage=l.content,f(h)}),a("div",{className:"home-wrapper slide left",children:[e(ve,{}),e(Ge,{placeholder:u("APPS.TINDER.SEARCH_MATCHES"),onChange:()=>{}})," ",a("div",{className:"message-list-body",children:[a("div",{className:"new-matches",children:[a("div",{className:"title",children:[u("APPS.TINDER.NEW_MATCHES"),o.newMatches.length>0&&e("span",{children:o.newMatches.length})]}),e("div",{className:"matches",children:o.newMatches.map((l,v)=>{var h;return a("div",{className:"new-match",onClick:()=>{g(l),w("message")},children:[e("img",{className:"profile-picture",src:(h=l.photos)==null?void 0:h[0]}),e("div",{className:"name",children:l.name})]},v)})})]}),a("div",{className:"recent-messages",children:[e("div",{className:"title",children:u("APPS.TINDER.MESSAGES")}),e("div",{className:"messages",children:o.messages.map((l,v)=>{var h,c;return((h=l.lastMessage)==null?void 0:h.length)===0&&(l.lastMessage=u("APPS.MESSAGES.SENT_A_PHOTO")),a("div",{className:"message",onClick:()=>{g(l),w("message")},children:[e("img",{className:"profile-picture",src:(c=l.photos)==null?void 0:c[0]}),a("div",{className:"user",children:[e("div",{className:"name",children:l.name}),e("div",{className:"message",children:l.lastMessage.length>40?l.lastMessage.substring(0,40)+"...":l.lastMessage})]})]},v)})})]})]})]})}function nt(){var l,v;const{Account:t,LoggedIn:s}=m.useContext(z),[r,g]=s,[E,w]=t,[o,f]=m.useState(E);return a("div",{className:"home-wrapper slide right",style:{backgroundColor:"#F6F6F6"},children:[e(ve,{}),a("div",{className:"profile-body",children:[a("div",{className:"user",children:[e("img",{className:"profile-picture",src:o.photos[0]}),a("div",{className:"name",children:[o.name,", ",Q(o.dob)]})]}),a("div",{className:"inputs",children:[a("div",{className:"input",children:[e("div",{className:"label",children:u("APPS.TINDER.NAME")}),e($,{type:"text",defaultValue:o.name,maxLength:10,onChange:h=>{f({...o,name:h.target.value})}})]}),a("div",{className:"input center",children:[e("div",{className:"label",children:u("APPS.TINDER.PHOTOS")}),e("div",{className:"photo-grid",children:[...Array(6)].map((h,c)=>{var i;let p=((i=o.photos)==null?void 0:i[c-1])||c==0;return o.photos[c]?e("div",{className:"photo",style:{backgroundImage:`url(${o.photos[c]})`},children:e("div",{className:"photo-button remove",onClick:()=>{let I=o.photos;I.splice(c,1),f({...o,photos:I})},children:e(ee,{})})},c):e("div",{className:"photo",children:p&&e("div",{className:"photo-button add",onClick:()=>{var I,T,y;B.Gallery.set({allowExternal:(y=(T=(I=re)==null?void 0:I.value)==null?void 0:T.AllowExternal)==null?void 0:y.Tinder,onSelect:A=>f({...o,photos:[...o.photos,A.src]})})},children:e(Se,{})})})})})]}),a("div",{className:"input",children:[e("div",{className:"label",children:u("APPS.TINDER.ABOUT_ME")}),e(Te,{type:"text",defaultValue:o.bio,maxLength:100,onChange:h=>{f({...o,bio:h.target.value})}})]}),a("div",{className:"input",children:[e("div",{className:"label",children:u("APPS.TINDER.INTERESTED_IN")}),a("select",{value:o.showMen&&o.showWomen?"Everyone":o.showMen?"Men":"Women",onChange:h=>{switch(h.target.value){case"Everyone":f({...o,showMen:!0,showWomen:!0});break;case"Men":f({...o,showMen:!0,showWomen:!1});break;case"Women":f({...o,showMen:!1,showWomen:!0});break}},children:[e("option",{value:"Men",children:u("APPS.TINDER.MEN")}),e("option",{value:"Women",children:u("APPS.TINDER.WOMEN")}),e("option",{value:"Everyone",children:u("APPS.TINDER.EVERYONE")})]})]}),a("div",{className:"input",children:[e("div",{className:"label",children:u("APPS.TINDER.GENDER")}),a("select",{value:o.isMale?"male":"female",onChange:h=>{h.target.value=="male"?f({...o,isMale:!0}):f({...o,isMale:!1})},children:[e("option",{value:"male",children:u("APPS.TINDER.MALE")}),e("option",{value:"female",children:u("APPS.TINDER.FEMALE")})]})]}),a("div",{className:"input",children:[e("div",{className:"label",children:u("APPS.TINDER.VISIBILITY")}),a("select",{value:o.active?"visible":"hidden",onChange:h=>{let c=h.target.value;f({...o,active:c==="visible"})},children:[e("option",{value:"visible",children:u("APPS.TINDER.VISIBLE")}),e("option",{value:"hidden",children:u("APPS.TINDER.HIDDEN")})]}),!o.active&&e("div",{className:"warning",children:u("APPS.TINDER.HIDDEN_WARNING")})]})]}),((v=(l=re)==null?void 0:l.value)==null?void 0:v.DeleteAccount.Spark)&&e("div",{className:"button red",onClick:()=>{Ye("Tinder",()=>{w(null),g(!1)},!0)},children:u("APPS.TINDER.DELETE_ACCOUNT")}),e("div",{className:"button gradient",onClick:()=>{o.name.length>=2&&o.bio.length>=5&&o.photos.length>=1?L("Tinder",{action:"saveProfile",data:o},!0).then(h=>{if(!h)return Z("error","Issue saving tinder profile");G.APPS.TINDER.account.set(o),w(o)}):Z("error","Issue saving tinder profile, (name not 2 characters, bio not over 5 or no photos)")},children:u("APPS.TINDER.SAVE")})]})]})}const z=m.createContext(null);function it(){const t=q(Y.Settings),[s,r]=m.useState(!1),[g,E]=m.useState(null),[w,o]=m.useState(null),[f,l]=m.useState("home"),[v,h]=m.useState(!0),c={home:e(Ze,{}),profile:e(nt,{}),messageList:e(at,{}),message:e(tt,{})};return m.useEffect(()=>{if(G.APPS.TINDER.account.value){E(G.APPS.TINDER.account.value),r(!0),h(!1);return}else if(G.APPS.TINDER.account.value===!1)return h(!1);L("Tinder",{action:"isLoggedIn"},W.account).then(p=>{p?(E(p),r(!0),G.APPS.TINDER.account.set(p)):G.APPS.TINDER.account.set(!1),h(!1)})},[]),m.useEffect(()=>(f==="message"?he.ReceiveAppNotifications.set(!1):he.ReceiveAppNotifications.set(!0),()=>{he.ReceiveAppNotifications.set(!0)}),[f]),e("div",{className:"tinder-container",children:e(z.Provider,{value:{LoggedIn:[s,r],Account:[g,E],User:[w,o],View:[f,l]},children:v||t!=null&&t.airplaneMode?e("div",{className:"loading",children:e(ze,{size:40,lineWeight:5,speed:2,color:"#000000"})}):s?c[f]:e(et,{})})})}function Q(t){var s=+new Date(t);return~~((Date.now()-s)/315576e5)}export{z as TinderContext,it as default,Q as getAge};