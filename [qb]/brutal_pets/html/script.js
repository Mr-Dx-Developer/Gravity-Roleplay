BigPos = localStorage.getItem("BigMenuPosition")
SmallPos = localStorage.getItem("SmallMenuPosition")
TaskPos = localStorage.getItem("TaskMenuPosition")
button_down = 0
InSmallMenuPos = false
InPetChooser = false
InPetMenu = false
InShop = false
HavePet = false
HideSmallMenu = false

if (localStorage.getItem("BigMenuPosition") === "null"){
  BigPos = "20, 250"
}

if (localStorage.getItem("SmallMenuPosition") === "null"){
  SmallPos = "20, 250"
}

if (localStorage.getItem("TaskMenuPosition") === "null"){
  TaskPos = "500, 800"
}

localStorage.setItem("TaskMenuPosition", TaskPos)
localStorage.setItem("BigMenuPosition", BigPos)
localStorage.setItem("SmallMenuPosition", SmallPos)

NameOpened = 0

panel = document.getElementById("pet-section")
tasks = document.getElementById("tasks_container")

tasks.style.left = TaskPos.split(',')[0] + 'px'
tasks.style.top = TaskPos.slice(TaskPos.indexOf(',') + 1) + 'px'

panel.style.left = SmallPos.split(',')[0] + 'px'
panel.style.top = SmallPos.slice(SmallPos.indexOf(',') + 1) + 'px'

window.addEventListener('message', function(event) {
    let data = event.data
   
    if (data.action === "SendDefaults") {
      Pets = data.petlist
      MoneyForm = data.moneyform
      PremiumForm = data.premiumform
      Itemlist = data.items

      $(".tasks_container").css("top", data.top+"%")
      $(".tasks_container").css("left", data.left+"%")
      $(".pet_elements_container").html("")
      for (let i = 0; i < Pets.length; i++) {
        $(".pet_elements_container").append(`
        <button class="pet_element" id="${i}" onclick="ChangePet(id)"> 
            <table>
                <tr>
                    <th class="image"><img class="elm_img" src="pets/${Pets[i].model}.png"></th>
                    <th class="name">${Pets[i].label}</th>
                </tr>
            </table>
        </button>
        `)
        if (Pets[i].price.money > 0 && Pets[i].price.premium > 0){
          $(`.pet_elements_container #${i} table tr`).append(`
          <th class="price"><a>Price</a> <br> ${Pets[i].price.money}<money>${MoneyForm}</money> / ${Pets[i].price.premium}<premium>${PremiumForm}</premium></th>
          `)
        }
        else if (Pets[i].price.money === 0 && Pets[i].price.premium > 0){
          $(`.pet_elements_container #${i} table tr`).append(`
          <th class="price"><a>Price</a> <br> ${Pets[i].price.premium}<premium>${PremiumForm}</premium></th>
          `)
        }
        else if (Pets[i].price.premium === 0 && Pets[i].price.money > 0){
          $(`.pet_elements_container #${i} table tr`).append(`
          <th class="price"><a>Price</a> <br> ${Pets[i].price.money}<money>${MoneyForm}</money></th>
          `)
        }
        else if (Pets[i].price.premium === 0 && Pets[i].price.money === 0){
          $(`.pet_elements_container #${i} table tr`).append(`
          <th class="price"><a>Price</a> <br> Free</th>
          `)
        }
      }
      $(".shop_elements_container").html("")
      for (let i = 0; i < Itemlist.length; i++) {
        $(".shop_elements_container").append(`
        <div class="shop_element">
        <img class="item" src="assets/${Itemlist[i].Item}.png">
        <h11 id="item_${i}">${Itemlist[i].Label}</h11>
        </img>
        <div class="arrow1 left" id="${Itemlist[i].Item}/left" onclick="shopbtn(id)"><i class="fa-solid fa-chevron-left"></i></div>
        <div class="num" id="${Itemlist[i].Item}">0</div>
        <div class="arrow1 right" id="${Itemlist[i].Item}/right" onclick="shopbtn(id)"><i class="fa-solid fa-chevron-right"></i></div>
        </div>`)

        if (Itemlist[i].Label.length > 15){
          $("#item_"+i).css("font-size", "17px")
        }
      }
    }
    else if (data.action === "HavePet") {
      if (data.info === true && InPetMenu === false && InShop === false && HideSmallMenu === false){
        HavePet = true
        show(".pet-section")
        show(".small-mode")
        $(".pet-section .small-mode .pet_img_small").attr("src", "pets/"+data.img+".png")
        PetShowDatas(data.thirst, data.hunger, data.hp)
      }
      else if(data.info === false && InPetMenu === false){
        HavePet = false
        hide(".small-mode")
        hide(".pet-section")
      }
    }
    else if (data.action === "OpenBuyMenu") {
      InShop = true
      LastOpened = 0
      PlayerJob = data.playerjob
      show(".buy_section")
      show(".btn_container")
      hide(".pet-section")
      $(".tasks_container").css("opacity", "0")
    }
    else if (data.action === "OpenPetMenu") {
      if (InPetMenu === false){
        $(".small-mode").css("display", "none")
        hide(".small-mode")
        show(".pet-section")
        setTimeout(function(){
          if (InPetMenu === false){
            show(".big-mode")
            setTimeout(function(){
              InPetMenu = true
            },400)
          }
        },800)
        $(".pet-section").css({
          "height": "550px",
          "width": "350px",
        })
        panel.style.left = BigPos.split(',')[0] + 'px'
        panel.style.top = BigPos.slice(BigPos.indexOf(',') + 1) + 'px'

        $(".pet-section .big-mode .pet_img_big").attr("src", "pets/"+data.img+".png")
        $(".pet-section .small-mode .pet_img_small").attr("src", "pets/"+data.img+".png")
        $(".pet-section .big-mode h1").html(data.name+'<button class="rename_btn" onclick="rename_pet()" onmousedown="Mousedown()" onmouseup="Mouseup()" onmouseout="Mouseup()"><i class="fa-solid fa-pen"></i></button>')

        PetShowDatas(data.thirst, data.hunger, data.hp)
        $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"nuifocus"}))
      }
    }
    else if (data.action === "RefreshPetMenu") {
      $(".pet-section .big-mode .pet_img_big").attr("src", "pets/"+data.img+".png")
      $(".pet-section .small-mode .pet_img_small").attr("src", "pets/"+data.img+".png")
      $(".pet-section .big-mode h1").html(data.name+'<button class="rename_btn" onclick="rename_pet()" onmousedown="Mousedown()" onmouseup="Mouseup()" onmouseout="Mouseup()"><i class="fa-solid fa-pen"></i></button>')
      PetShowDatas(data.thirst, data.hunger, data.hp)
    }
    else if (data.action === "OpenNameMenu") {
      show(".name-container")
    }
    else if (data.action === "StartTask") {
      $(".tasks_container").append(`
      <div class="inprogress ${data.petnum}">
        <img class="pet_img" src="pets/${data.petmodel}.png">
        <div class="name">${data.petname}</div>
        <hr>
        <div class="state" id="state">${data.state}</div>
      </div>
      `)
      setTimeout(function(){
        $(".tasks_container ."+data.petnum).css("opacity", "1")
      }, 10)
    }
    else if (data.action === "FinishTask") {
      $(".tasks_container ."+data.petnum).css("opacity", "0")
      setTimeout(function(){
        $(".tasks_container ."+data.petnum).remove()
      },400)
    }
    else if (data.action === "SmallMenuPos") {
      panel = panel
      hide(".big-mode")
      show(".pet-section")
      setTimeout(function(){
        $(".pet-section").css({
          "height": "60px",
          "width": "200px",
        })
        panel.style.left = SmallPos.split(',')[0] + 'px'
        panel.style.top = SmallPos.slice(SmallPos.indexOf(',') + 1) + 'px'
      },300)
      setTimeout(function(){
        show(".small-mode")
      },800)
      InSmallMenuPos = true
    }
    else if (data.action === "HideSmallMenu") {
      if (HideSmallMenu === false){
        HideSmallMenu = true
        hide(".pet-section")
        hide(".small-mode")
      }
      else{
        HideSmallMenu = false
        show(".pet-section")
        show(".small-mode")
      }
    }
    else if (data.action === "Close") {
      hide(".name-container")
      hide(".bg")
      hide(".buy_section")
      hide(".sure")
      hide(".pet_container")
      hide(".buy_container")
      $(".tasks_container").css("opacity", "1")
      hide(".shop_container")
      hide(".buy_section h4")
      if (HavePet === true && HideSmallMenu === false){
        show(".pet-section")
      }
      InSmallMenuPos = false
      InShop = false
      $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"close"}))
      ClosePetMenu()
    }
})

document.onkeydown = function(data) {
  if (event.key == 'Escape') {
    Close()
    ClosePetMenu()
  }

  if (InPetChooser === true){
    if (event.key == 'ArrowLeft') {
      RotatePet(0)
    }
    else if(event.key == 'ArrowRight') {
      RotatePet(1)
    }
  }
}

function Close(){
  if (InShop === true || InSmallMenuPos === true){
    hide(".name-container")
    hide(".bg")
    hide(".buy_section")
    hide(".sure")
    hide(".pet_container")
    hide(".buy_container")
    $(".tasks_container").css("opacity", "1")
    hide(".shop_container")
    hide(".buy_section h4")
    if (HavePet === true && HideSmallMenu === false){
      show(".pet-section")
    }
    $(".tasks_container .test").css("opacity", "0")
    InSmallMenuPos = false
    InShop = false
    $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"close"}))
  }
}

function ClosePetMenu(){
  if (InPetMenu === true){
    hide(".big-mode")
    setTimeout(function(){
      $(".pet-section").css({
        "height": "60px",
        "width": "200px",
      })
      panel.style.left = SmallPos.split(',')[0] + 'px'
      panel.style.top = SmallPos.slice(SmallPos.indexOf(',') + 1) + 'px'
    },300)
    setTimeout(function(){
      if (HideSmallMenu === false){
        show(".small-mode")
      }
      else{
        hide(".pet-section")
      }
      setTimeout(function(){
        InPetMenu = false
      },500)
    },800)
    $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"close"}))
  }
}

function RotatePet(value){
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"RotatePet", value}))
}

function UseButton(id) {
  let data = JSON.stringify({action:id})

  if(id === 'pets'){
    hide(".btn_container")
    show(".pet_container")
    show(".buy_container")
    show(".buy_section h4")
    Buy_btn(0)
    InPetChooser = true
  }
  else if (id === "shop"){
    hide(".btn_container")
    show(".shop_container")
  }
  else if (id === "backpetshop"){
    hide(".bg")
  }
  else if (id === "backmainmenu"){
    show(".btn_container")
    hide(".shop_container")
    hide(".pet_container")
    hide(".buy_container")
    hide(".buy_section h4")
    InPetChooser = false
  }
  else if (id === "backmini"){
    if (InPetMenu === true){
      hide(".big-mode")
      setTimeout(function(){
        $(".pet-section").css({
          "height": "60px",
          "width": "200px",
        })
        panel.style.left = SmallPos.split(',')[0] + 'px'
        panel.style.top = SmallPos.slice(SmallPos.indexOf(',') + 1) + 'px'
      },300)
      setTimeout(function(){
        if (HideSmallMenu === false){
          show(".small-mode")
        }
        else{
        hide(".pet-section")
        }
        InPetMenu = false
      },800)
    }
  }
  else if (id === "backname"){
    hide(".name-container")
  }

  $.post('https://'+GetParentResourceName()+'/UseButton', data)
}

function PetShowDatas(thirst, hunger, hp){
  Thirst = thirst
  Hunger = hunger
  Hp = hp
  $(".pet_datas #drink h2").html(Thirst+"%")
  $(".pet_datas #food h2").html(Hunger+"%")
  $(".pet_datas #healt h2").html(Hp+"%")
  Thirst = 100 - (Thirst * 0.6 + 20)
  Hunger = 100 - (Hunger * 0.6 + 20)
  Hp = 100 - (Hp * 0.6 + 20)
  $(".pet_datas #drink").css("background-image", `linear-gradient(rgba(255, 255, 255, 0.447) ${Thirst}%, #147cea ${Thirst}%)`)
  $(".pet_datas #food").css("background-image", `linear-gradient(rgba(255, 255, 255, 0.447) ${Hunger}%, #eae314 ${Hunger}%)`)
  $(".pet_datas #healt").css("background-image", `linear-gradient(rgba(255, 255, 255, 0.447) ${Hp}%, #ea1414 ${Hp}%)`)
}

function BuyPet(){
  let petid = +LastOpened + +1
  if (Pets[LastOpened].price.money > 0 && Pets[LastOpened].price.premium > 0){
    show(".bg")
  }
  else if (Pets[LastOpened].price.money === 0 && Pets[LastOpened].price.premium > 0){
    $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"buypet", petid, moneytype:"premium"}))
  }
  else if (Pets[LastOpened].price.premium === 0 && Pets[LastOpened].price.money > 0){
    $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"buypet", petid, moneytype:"money"}))
  }
  else if (Pets[LastOpened].price.premium === 0 && Pets[LastOpened].price.money === 0){
    $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"buypet", petid, moneytype:"free"}))
  }
}

function BuyPetwithmoney(id){
  hide(".bg")
  let petid = +LastOpened + +1
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"buypet", petid, moneytype:id}))
}

function ChangePet(id){
  let HaveRang = false
  if (Pets[id].Jobs != false){
    for (let i = 0; i < Pets[id].Jobs.length; i++) {
      if (PlayerJob === Pets[id].Jobs[i]){
        HaveRang = true
        break
      }
    }
  }
  else{
    HaveRang = true
  }

  if (HaveRang === true){
    LastOpened = id
    let petid = +id + +1
    Buy_btn(id)
    $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"changepet", petid}))
  }
  else{
    $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"NoCopsJob"}))
  }
}

function Buy_btn(num){
  price = $(`.pet_elements_container #${num} table tr .price`).html()
  price = price.slice(price.indexOf('b') + 1)

  $(".buy_section .buy_container #first #price").html(price.slice(price.indexOf('>') + 1))
  $(".buy_section .buy_container #second #petname").html($(`.pet_elements_container #${num} table tr .name`).html())
}

function ChangePetType(){
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"ChangeSkin"}))
}

function ChangePetCollar(){
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"ChangeCollar"}))
}

function NameFunction() {
  var name = document.getElementById("name").value
  let data = JSON.stringify({action:name, value:NameOpened})
  document.getElementById("name").value = ""

  $.post('https://'+GetParentResourceName()+'/Name', data)
}

function shopbtn(id){
  let Direction = id.slice(id.indexOf('/') + 1)
  let ItemName = id.split('/')[0]
  if (Direction === "left" && document.getElementById(ItemName).innerHTML != 0){
    $('#'+ItemName).html(+document.getElementById(ItemName).innerHTML - +1)
  }
  else if (Direction === "right" && document.getElementById(ItemName).innerHTML < 9){
    $('#'+ItemName).html(+document.getElementById(ItemName).innerHTML + +1)
  }
  changemoney()
}

function changemoney(){
  let AllMoney = 0
  for (let i = 0; i < Itemlist.length; i++) {
    AllMoney += Itemlist[i].price * document.getElementById(Itemlist[i].Item).innerHTML
  }
  $('.buy_section .shop_container h3').html(AllMoney)
  $('.buy_section .shop_container h3').append('<money> '+MoneyForm+'</money>')
}

function BuyInShop(){
  BuyItems = []
  for (let i = 0; i < Itemlist.length; i++) {
    if (document.getElementById(Itemlist[i].Item).innerHTML > 0){
      BuyItems.push([Itemlist[i].Item, document.getElementById(Itemlist[i].Item).innerHTML, Itemlist[i].price])
    }
  }

  if (BuyItems.length > 0){
    $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"BuyInShop", BuyItems}))
  }

  setTimeout(function(){
    for (let i = 0; i < Itemlist.length; i++) {
      $('#'+Itemlist[i].Item).html(0)
    }
    changemoney()
  }, 200)
}

var mousePosition;
var offset = [0,0];
var isDown = false;

function Mousedown(){button_down = 1}
function Mouseup(){button_down = 0}

panel.onmousedown = function(e){
  if ((button_down) == 0) {
    panel.style.cursor = "move"
    panel.style.opacity = "0.6"
    panel.style.scale = "1.05"
    panel.style.transition = " 0s"
    panel.style.transition = "opacity 0.4s, scale 0.2s"

      isDown = true;
      offset = [
        panel.offsetLeft - e.clientX,
        panel.offsetTop - e.clientY
      ]
  }
}

document.addEventListener('mouseup', function() {
    isDown = false;
    panel.style.transition = "all 0.7s"
    panel.style.cursor = ""
    panel.style.scale = "1"
    panel.style.opacity = "1"
}, true);

document.addEventListener('mousemove', function(event) {
    event.preventDefault();
    if (isDown) {
        mousePosition = {

            x : event.clientX,
            y : event.clientY

        };
        panel.style.left = (mousePosition.x + offset[0]) + 'px'
        panel.style.top  = (mousePosition.y + offset[1]) + 'px'
        if (InSmallMenuPos === true){
          SmallPos = [mousePosition.x + offset[0], mousePosition.y + offset[1]]
          localStorage.setItem("SmallMenuPosition", SmallPos)
          SmallPos = localStorage.getItem("SmallMenuPosition")
        }
        else{
          BigPos = [mousePosition.x + offset[0], mousePosition.y + offset[1]]
          localStorage.setItem("BigMenuPosition", BigPos)
          BigPos = localStorage.getItem("BigMenuPosition")
        }
      
    }
}, true)

function delete_pet(){
  show(".sure")
}

function switch_pet(id){
  if (id === "right"){
    Type = "1"
  }else{
    Type = "-1"
  }
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"SwitchPet", Type}))
}

function returnsure(id){
  if (id === "yes"){
    hide(".sure")
    Close()
    $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"DeletePed"}))
  }else{
    hide(".sure")
  }
}

function show(element){
  $(element).css("display", "block")
  setTimeout(function(){
      $(element).css("opacity", "1")
  }, 10);
}

function hide(element){
  $(element).css("opacity", "0")
  setTimeout(function(){
    $(element).css("display", "none")
  }, 400)
}

function rename_pet(){
  NameOpened = 1
  show(".name-container")
}