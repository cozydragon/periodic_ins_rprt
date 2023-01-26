$(document).ready(function() {

    var ckmenu = $.cookie('ckmenu');
    if(ckmenu == 1) {
        $(".navcheck").prop("checked", true);
        navToggle();
        navMenu();
        NavScroll();
    }
    //SIDE NAV
    navToggle();
    navMenu();
    NavScroll();

    $(window).resize(function() {
        resize_mini();
        resize_big();
        NavScroll();
    })

    $(".nav_toggle").change(function() {
        
        if($(".navcheck").prop("checked")) {
            $.cookie('ckmenu', $(".navcheck").val());
        } else {
            $.removeCookie("ckmenu");
        }

        $('.nav_mini .nav_1d li').unbind();
        $('.nav_big .nav_1d li a').unbind();

        navToggle();
        navMenu();
        NavScroll();
    });

    function resize_mini() {
        var Whight = $(window).height();
        var conHeight = $('.content').innerHeight();
        if (conHeight > Whight) {
            $("#nav").css({ 'height': conHeight + 70 + 'px' });
        } else {
            $("#nav").css({ 'height': 100 + '%' });
        };
    }

    function resize_big() {
        var Whight = $(window).height() - 70;
        var scH = $(".nav_big .scroll_style").height()
        $(".scroll_style").css({ 'height': Whight + 'px' });
    }

    function navToggle() {
        var navtog = $(".navcheck").is(":checked");
        if (navtog == true) {
            $('.nav_2d').css('display', 'none');
            $("#nav").removeClass('nav_big').addClass('nav_mini');
            $("#nav > div").removeClass('scroll_style');
            $(".logo,.contain").removeClass('left');
            resize_mini();
            NavScroll();

        } else if (navtog == false) {
            $('.nav_2d').css('display', 'none');
            $("#nav").removeClass('nav_mini').addClass('nav_big');
            $('.nav_big .nav_2d li.on').parent().css('display', 'block').parent().addClass('active');
            $("#nav > div").addClass('scroll_style');
            $(".logo,.contain").addClass('left');
            resize_big();
            NavScroll();
        };
    };

    function navMenu(gnbclass) {
        var gnbclass = $('#nav').attr('class');
        if (gnbclass == 'nav_big') {
            $('.nav_big .nav_1d > li > a').on('click', function() {
                if ($(this).next().css("display") == "none") {
                    $(this).parent().addClass('active').find('.nav_2d').slideDown('200');
                    $(this).parent().siblings().removeClass('active').find('.nav_2d').slideUp('200');

                } else {
                    $(this).parent().removeClass('active').find('.nav_2d').slideUp('200');
                }
            });
            $('.nav_big .nav_2d > li > a').on('click', function(e) {
                e.preventdefault();
                $('.nav_big .nav_2d li').removeClass('on');
            });

        } else if (gnbclass == 'nav_mini') {
            $('.nav_mini .nav_1d li').on('mouseover', function() {
                $(this).addClass('active');
                $(this).children('.nav_2d').css('display', 'block');
            });

            $('.nav_mini .nav_1d li').on('mouseout', function() {
                $(this).removeClass('active');
                $(this).children('.nav_2d').css('display', 'none');
            });
        };
    };

    function NavScroll() {
        var gnbclass = $('#nav').attr('class');
        var element = $('#nav > div').jScrollPane();
        var api = element.data('jsp');

        if (gnbclass == 'nav_big') {
            element.jScrollPane({ autoReinitialise: true });
        } else if (gnbclass == 'nav_mini') {
            api.destroy();
        }
    };

    // side_bar animate
    // $('.sidebar-toggle').on('click', function(){
    //     $('.side-toggle').removeClass('open');
    //     $('.side_bar').stop().animate({'right':'-301px'},300);
    //     $('.contain').stop().animate({'margin-right':'0'},300, function(){
    //         layout_ui();
    //     });
    //     if( $('.side_bar').css('right') == '-301px'){
    //         $('.side-toggle').addClass('open');
    //         $('.side_bar').stop().animate({'right':'0'},300);
    //         $('.contain').stop().animate({'margin-right':'301px'}, 300, function(){
    //             layout_ui();
    //         });
    //     }
    // });

    $('.sidebar-toggle').on('click', function(){
        if( $('.side_bar').css('right') == '-301px'){
            $('.side-toggle').addClass('open');
            $('.side_bar').css({'right':'0'});
            $('.contain').css({'margin-right':'301px'});
        } else if( $('.side_bar').css('right') == '0px'){
            $('.side-toggle').removeClass('open');
            $('.side_bar').css({'right':'-301px'});
            $('.contain').css({'margin-right':'0'});
        }
    });

    $('.scroll_wrap').jScrollPane({autoReinitialise: true});
    //form 

    // Allcheck
    $(".checkAll").change(function() {
        $(".checkSel").prop('checked', $(this).prop("checked"));
    });
    $(".checkSel").change(function() {
        var allcount = $(".checkSel").length;
        var ckcount = $(".checkSel:checked").length;
        $(".checkAll").prop('checked', false);
        if (allcount == ckcount) {
            $(".checkAll").prop('checked', true);
        };
    });

    // file
    $('.hide_file').change(function() {
        $('.subfile').val($(this).val());
    });

    $(".tab_sel").click(function(){
    	var idx = $(".tab_sel").index($(this));

    	$(this).css({
    		"background-color":"#787997",
    		"color":"#fff"
    	});
    	
    	$(".tabcontent").each(function(didx){
    		if(idx == didx){
    			$(this).show();
    		}else{
    			$(this).hide();
    			$(".tab_sel").eq(didx).css({
    				"background-color":"#fff",
    				"color":"#000"
    			});
    		}
    	});
    });
});
