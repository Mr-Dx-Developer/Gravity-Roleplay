$(document).ready(function(){
    window.addEventListener('message', function(event) {
        switch(event.data.action) {
            case "StartUP":
                $('.qb-BodyMain').fadeIn(200);
            break;
            case "RefreshIP":
                SetupGPSs(event.data.data)
            break;
        }
    })
});

$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27: // ESCAPE
            CloseFunction();
        break;
    }
});

$(document).on('click', '#CloseGpsMenu', function(e){
    e.preventDefault();
    CloseFunction()
});

CloseFunction = function(){
    $('.qb-BodyMain').fadeOut(200);
    $.post('https://qb-gpsveh/CloseGpsMenu', JSON.stringify({}));
}

$(document).on('click', '#InsertTableGPS', function(e){
    e.preventDefault();
    $('.AddIPMenu').fadeIn(200);
    $(".InputPass").val("");
    $(".InputIP").val("");
});

$(document).on('click', '.RedBTN', function(e){
    e.preventDefault();
    $('.AddIPMenu').fadeOut(200);
});

$(document).on('click', '.GreenBTN', function(e){
    e.preventDefault();
    var IP = $(".InputIP").val();
    var Pass = $(".InputPass").val();
    $.post('https://qb-gpsveh/GetCheckIP', JSON.stringify({
        IP: IP,
        Pass: Pass,
    }), function(data){
        SetupGPSs(data)
    });

    $('.AddIPMenu').fadeOut(200);
});

SetupGPSs = function(data){
    $(".qb-GPS-List").html('');
    for (const [k, v] of Object.entries(data)) {
        var AddOption = '<div class="GPS-Class">'+v.IP+'<div data-ip="'+v.IP+'" class="GPS-Close-Class">Delete</div></div>';
        $('.qb-GPS-List').append(AddOption);
    }
}

$(document).on('click', '.GPS-Close-Class', function(e){
    e.preventDefault();
    var IP = $(this).data('ip');
    $.post('https://qb-gpsveh/DeleteRefreshGPS', JSON.stringify({
        IP: IP,
    }));
});