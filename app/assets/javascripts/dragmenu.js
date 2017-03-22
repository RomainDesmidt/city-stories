var $MB = $('#menu_btn'),
    $M = $('#menu'),
    $DOM = $(document),
    startAtY = 10, // CSS px
    endAtY = 270,  // CSS #menu height px
    clickedAtY,
    clickEventType= document.ontouchstart !== null ? 'mousedown' : 'touchstart',
    moveEventType = document.ontouchmove  !== null ? 'mousemove' : 'touchmove' ,
    endEventType  = document.ontouchend   !== null ? 'mouseup'   : 'touchend'  ;

$MB.on(clickEventType, function( e ) {

    e.preventDefault();

    clickedAtY  = e.pageY - $(this).offset().top;
    if(clickEventType === 'touchstart'){
        clickedAtY = e.originalEvent.touches[0].pageY - $(this).offset().top;
  }
    $DOM.on('mousemove touchmove', moveHandler);
    $DOM.on(endEventType, function() {
       stopHandler();
    });

});

function moveHandler( e ) {
   var posY = e.pageY - clickedAtY;
    if(moveEventType === 'touchmove') {
        posY = e.originalEvent.touches[0].pageY - clickedAtY;
    }
    posY = Math.min( Math.max(0, posY), endAtY - startAtY);
    $M.css({top: posY});
}

function stopHandler() {
    $DOM.off(moveEventType, moveHandler)
        .off(endEventType,  stopHandler);
}
