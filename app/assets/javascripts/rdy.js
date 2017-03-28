$(document).ready(function() {
    $(".tabs-menu a").click(function(event) {
        event.preventDefault();
        var classToRem = $(this).attr('class');
        var h4ToChange = $('h4.' + classToRem);
        var divToChange = $('div.' + classToRem);
        $(this).parent().addClass("current");
        $(this).parent().siblings().removeClass("current");
        $('h4').removeClass("hidden-content");
        h4ToChange.siblings().addClass("hidden-content");
        $('div.tab > div').attr('style', '');
        divToChange.siblings().attr('style', 'display: none;');
    });
});

