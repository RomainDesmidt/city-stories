$(document).ready(function() {
    $(".tabs-menu a").click(function(event) {
        event.preventDefault();

        $(this).parent().addClass("current");
        $(this).parent().siblings().removeClass("current");

        $('h4').removeClass("hidden-content");
        var classToRem = $(this).attr('class');
        var h4ToChange = $('h4.' + classToRem);
        h4ToChange.siblings().addClass("hidden-content");

        $('div.tab > div').removeClass("hidden-content");
        var divToChange = $('div.' + classToRem)
        divToChange.siblings().addClass("hidden-content");

        // console.log(h4ToChange);
        // h4ToChange.removeClass('hidden-content');
        //$('h4').addClass('hidden-content');
        // console.log($(this).attr('class'))
       // $('journeys-footer-title').children().find($(this).attr('class')).addClass('hidden-content');
        //var dir = $('.journeys-footer-title').children().siblings().addClass("hidden-content");

        // console.log(dir);
        //$('journeys-footer-title').child().addClass("hidden-content");

        // var tab = $(this).attr("href");
        // $(".tab-content").not(tab).css("display", "none");
        // $(tab).fadeIn();
    });
});

