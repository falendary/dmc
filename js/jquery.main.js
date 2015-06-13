"use strict";
jQuery(document).ready(function() {
	var UI = {
		body: $("body"), 
		wrapper: $("#wrapper"),
		layout : $("#page-content-wrapper"), // рабочая поверхность
		overlay : $(".modal-overlay"), // оверлей
		sidebar: function() {
			var primaryMenuBtn	  = this.layout.find(".btn-grey.btn-menu"), // Кнопка обычного меню
				secondaryMenuBtn  = this.overlay.find(".btn-grey.btn-menu"); // Кнопка под оверлеем

			var showSidebar = function()
			{
				$("#wrapper").toggleClass("active"); // Актив на глобальный враппер
				$(".holder-time").toggleClass("active"); // Актив на глобальный враппер
				var map = $("#map>ymaps"),
					mapW = map.width();
				if ($("#wrapper").hasClass("active")) {
					map.width(mapW-268); 
				}
				else
				{
					map.width(mapW+268);
				}
			};

			/* Обработчик обычной нопки*/
			primaryMenuBtn.on("click", function(e) {
				e.preventDefault();
				$(this).toggleClass("active"); // Актив на кнопку
				secondaryMenuBtn.toggleClass("active"); // Актив на кнопку в оверлее (sync)
				showSidebar();
			});

			/* Обработчик кнопки из оверлея*/
			secondaryMenuBtn.on("click", function(e)
			{
				e.preventDefault();
				$(this).toggleClass("active"); // актив стейт на кнопку оверлея
				primaryMenuBtn.toggleClass("active"); // актив стейт на обычную кнопку
				$("#page-content-wrapper .panel-top").removeClass("hided");
				$(".modal-overlay").fadeOut("slow");
				$(".view-modal").fadeOut("slow");
				$("#page-content-wrapper>.panel-top").removeClass("hided");
				$(".modal-overlay .panel-top").removeClass("sticky");
				$(".modal-overlay .panel-top .navbar").removeClass("sticky");
				showSidebar();
			});
		},
		table: function () {
			jQuery("#mo-table").jqGrid({ // Привязка плагина к таблице
				regional: "ru",
				datatype: "local",
				scrollerbar: true,
				height: "192",
			   	colNames:['', 'ПОЛНОЕ НАИМЕНОВАНИЕ МО', 'РАЙОН', 'МИН','КМ'],
			   	colModel:[
			   		{name:'status',	key : true,	index:'status',	width:24},
			   		{name:'mo',index:'mo', formatter:'showlink', width:600, formatoptions:{baseLinkUrl:'#'}},
			   		{name:'district', width:200, index:'district'},
			   		{name:'arrivetime',index:'arrivetime', width:80, align:"right"},
			   		{name:'kilometers',index:'kilometers', width:40, align:"right"}
			   	],
			   	rowNum:10,
			   	rowList:[10,20,30],
			   	//pager: '#tabletoolbar', // Привязка к таблице тулбара
			   	sortname: 'kilometers'
			   	// viewrecords: true,
			   	// sortorder: "desc"
			});
			var mydata = [
				{id:"1",status:"ТЦ1",mo:"Муниципальное бюджетное учреждение 'Каневская центральная районная больница' муниципального образования ...",district:"Каневской район",arrivetime:"4",kilometers:"8"},
				{id:"2",status:"ТЦ2",mo:"Муниципальное бюджетное учреждение здравоохранения 'Кореновская центральная районная больница'",district:"Кореновский район",arrivetime:"6",kilometers:"10"},
				{id:"3",status:"ТЦ3",mo:"Муниципальное бюджетное учреждение здравоохранения 'Курганинская центральная районная больница'",district:"Курганинский район",arrivetime:"8",kilometers:"12"},
				{id:"4",mo:"Муниципальное бюджетное учреждение здравоохранения 'Центральная районная больница' Брюховецкого район",district:"Брюховецкий район",arrivetime:"10",kilometers:"14"},
				{id:"5",mo:"Муниципальное бюджетное учреждение здравоохранения 'Центральная районная больница муниципального' ...",district:"Новопокровский ...",arrivetime:"12",kilometers:"16"},
				{id:"6",mo:"Муниципальное бюджетное учреждение здравоохранения 'Центральная районная больница' Брюховецкого района",district:"Брюховецкий район",arrivetime:"14",kilometers:"32"},
				{id:"7",mo:"Муниципальное бюджетное учреждение здравоохранения 'Курганинская центральная районная больница'",district:"Курганинский район",arrivetime:"16",kilometers:"64"},
				{id:"8",mo:"Муниципальное бюджетное учреждение здравоохранения 'Центральная районная больница' Брюховецкого района",district:"Брюховецкий район",arrivetime:"32",kilometers:"128"},
				{id:"9",mo:"Муниципальное бюджетное учреждение 'Каневская центральная районная больница' муниципального образования ...",district:"Каневской район",arrivetime:"34",kilometers:"134"},
				{id:"9",mo:"Муниципальное бюджетное учреждение 'Каневская центральная районная больница' муниципального образования ...",district:"Каневской район",arrivetime:"34",kilometers:"134"},
				{id:"9",mo:"Муниципальное бюджетное учреждение 'Каневская центральная районная больница' муниципального образования ...",district:"Каневской район",arrivetime:"34",kilometers:"134"}
				];
			// Добавляем данные
			for(var i=0;i<=mydata.length;i++) {
				jQuery("#mo-table").jqGrid('addRowData',i+1,mydata[i]);
			}
			$(window).resize(function() {
			    var newWidth = jQuery("#mo-table").closest(".ui-jqgrid").parent().width();
			    jQuery("#mo-table").jqGrid("setGridWidth", newWidth, true);
			});


			// jQuery("#mo-table").jqGrid('navGrid','#tabletoolbar',  // Управление тулбаром таблицы
			//     {edit:false,add:false,del:false}, // Отключаем от тулбара редактирование, добавление и удаление записей. На тулбаре останутся только две кнопки: "Поиск" и "Обновить"
			//     {}, // Опции окон редактирования
			//     {}, // Опции окон добавления
			//     {}, // Опции окон удаления
			//     {
			//         multipleSearch:true, // Поиск по нескольким полям
			//         multipleGroup:true, // Сложный поиск с подгруппами условий
			//         showQuery: true // Показывать превью условия
			//     }
			// );
		},
		inputHighlight: function(selector)
		{
			$(selector).each(function()
			{
				$(this).on("change", function()
				{
					var input = $(this) // инпут
					// Если value не пустое, то добавляем класс, в противном случае убираем
					input.val() != '' ? input.addClass("highlighted") :input.removeClass("highlighted");
				})
			});
		},
		meterCounter: function()
		{
			var minus 	= jQuery(".btn.btn-square-sm.btn-minus"); // кнопка вычета
			var plus 	= jQuery(".btn.btn-square-sm.btn-plus"); // кнопка прибавления
			var holder  = jQuery(".meter-holder .quantities"); // сам инпут
		    var meter   = jQuery(".mo-search div.radius");
			var val 	= parseInt(holder.val(), 10); // его значение
			//console.log(val);

			var inc = function() {
		        val += 1;
				holder.val(val);
				return;
		    }

		    var dec = function() {
		        val <= 1 ? val = 0 : val -=1;
				holder.val(val);
				return;
		    }

		    // увеличиваем, ограничения нет
			plus.bind("click", inc);
			// уменьшаем, меньше нуля не существует
			minus.bind("click", dec);

		    meter.on('mousewheel', function(e) {
		        (e.deltaY < 0) ? dec() : inc();
		        return false;
		    });

			return;
		},
		adaptiveSwitcher: function()
		{
			$(".btn-swap").bind("click", function(e)
			{
				e.preventDefault();
				$(this).parent(".adaptive-block").toggleClass("legend");
				$(".side-block").toggle();
				$(".table-block").toggle();
			});
		},
		jsTimer: function()
		{
			var holderTime = $(".holder-time"),
				utcTime = moment.utc(),
				localTime = moment.utc(utcTime).toDate();
			setInterval(function(){
				holderTime.find("span.hours").text(moment(localTime).format("HH"));
				holderTime.find("span.minutes").text(moment(localTime).format("mm"));
				holderTime.find("span.year").text(moment(localTime).format("YYYY"));
				holderTime.find("span.month").text(moment(localTime).format("MM"));
				holderTime.find("span.day").text(moment(localTime).format("DD"));
			}, 1000)
		},
		textareaResizer: function()
		{
			$(".nav.nav-tabs>li").on("click", function()
			{
				jQuery('textarea.form-input').elastic();
			});
		},
		preloader: function(){
				this.wrapper.animsition({
					inClass : "fade-in",
					outClass : "fade-out",
					inDuration : 1500,
					outDuration : 900,
					linkElement : '.animsition-link',
					loading : true,
					loadingParentElement : 'body',
					unSupportCss : [
									 'animation-duration',
									 '-webkit-animation-duration',
									 '-o-animation-duration'
								   ],
					overlay : false,
					overlayClass : 'animsition-overlay-slide',
					overlayParentElement : 'body'
				});
		},
		init: function()
		{
			this.preloader();
			this.jsTimer(); // часы
			this.sidebar(); // сайдбар
			this.table(); // jqgrid
			this.textareaResizer(); // ресайзим текстовые поля
			this.meterCounter(); // обработчик добавления/удаления километров в форме поиска
			this.inputHighlight(".i-coords"); // подсвечиваем инпуты с координатами
			this.adaptiveSwitcher();
			this.inputHighlight(".quantities"); // подсвечиваем инпуты с километром
			jQuery('.select2').select2();

		}
	};
	UI.init();
	$.when(UI.table).then(function()
	{
		var holder 		= $(".log"),
			scrollbox	= holder.find(".ui-jqgrid-bdiv"),
			table 		= jQuery("#mo-table"),
			tr 			= table.find("tr"),
			td 			= tr.find("td:first-child"),
			td2			= tr.find("td:nth-child(2)");
		// Раскрашиваем статусы
		(function()
			{
				$.each(td, function()
				{
					var status = jQuery(this).html() // С
					if (status != "&nbsp;" && status != "") {
						jQuery(this).html("<span class='status'>"+status+"</span>");
					}
				})
			})();
		// Добавляем синюю полосочку на ховер tr
		(function()
			{
				scrollbox.bind("scroll", function()
				{
					trHover(); // реинициализируем на скролле, чтобы не ломалась линия
				});
				trHover(); // простой вызов 
			})();
		function trHover () {
			var hoverline 	= $("#hoverline"), // сама синия линия
				trOffset  	= null, // Позиция tr, меняется от скролла
				trH 		= null, // высота tr
				// Превьюшка при наведение на второую ячейку
				previewtr = '<div class="preview">'+
							'	<p>ЦРБ</p>'+
							'<div class="row">'+
							'	<div class="item beds">524</div>'+
							'	<div class="item beds">58</div>'+
							'</div>'+
							'<div class="row">'+
							'	<div class="item">182</div>'+
							'	<div class="item">63</div>'+
							'</div>'+
							'<div class="row">'+
							'	<div class="item">56</div>'+
							'	<div class="item">0</div>'+
							'</div>'+
							'<div class="row">'+
							'	<div class="item">45</div>'+
							'	<div class="item">0</div>'+
							'</div>'+
							'<div class="row">'+
							'	<div class="item">182</div>'+
							'	<div class="item">63</div>'+
							'</div>'+
							'<div class="row">'+
							'	<div class="item">56</div>'+
							'	<div class="item">0</div>'+
							'</div>'+
							'<div class="row">'+
							'	<div class="item">45</div>'+
							'	<div class="item">0</div>'+
							'</div>'+
							'<div class="row">'+
							'	<div class="item">45</div>'+
							'	<div class="item">0</div>'+
							'</div>'+
						'</div>';
			tr.bind("mouseenter", function()
			{
				trOffset = $(this).offset(); // берем отступ строки
				// console.log(trOffset.top);
				hoverline.offset({top: trOffset.top, left: trOffset.left-5}); // делаем у линии такойже
				trH = $(this).height(); // берем  высоту строки
				hoverline.height(trH); // стави значение линии
				hoverline.show(); // показываем синюю линию
				//console.log(previewtr);
				$("#page-content-wrapper").append(previewtr); // создаем превьюшку
				var previewholder = $("#page-content-wrapper").find(".preview"); // Находим ее в DOM
				$(this).on("mousemove", function(e)
				{
					previewholder.css({left: (e.pageX+20)+"px", top: (e.pageY+10)+"px"});
				});
			}).bind("mouseleave", function()
			{
				hoverline.offset({top: 0, left: 0}); // обнуляем координаты
				hoverline.css({top: "0px", left: "0px"}); // обнуляем координаты (2)
				hoverline.hide(); // прячем синию линию
				$("#page-content-wrapper").find(".preview").remove(); // удаляем превьюшку
			})
		}
	}); // jqGrid на табличку
	
	$('#mo-table td>a').bind("click", function(e)
      {
        e.preventDefault();
        $(".modal-overlay").fadeIn("slow");
        $(".view-modal").fadeIn("slow");
        $(".tablesettings-holder").hide();
        if ($(".btn-square.btn-grey.btn-menu").hasClass('active')) {
        	$(".btn-square.btn-grey.btn-menu")[0].click();
        };
        var textareas = jQuery('textarea.form-input');
        textareas.elastic();
        return 
      });

	$(".window-close.w-icon").bind("click", function(e)
	{
		e.preventDefault();
		$(".view-modal").fadeOut("slow");
		$(".modal-overlay").fadeOut("slow");
	});
	$(".table-settings").bind("click", function(e)
	{
		e.preventDefault();
		$(".modal-overlay").fadeIn("slow");
		$(".tablesettings-holder").fadeIn("slow");
		if ($(".btn-square.btn-grey.btn-menu").hasClass('active')) {
        	$(".btn-square.btn-grey.btn-menu")[0].click();
        };
	});

	$(".results-holder").mCustomScrollbar();
	$("#sortable-columns").sortable();
	
	var availableTags = [
      "ActionScript",
      "AppleScript",
      "Asp",
      "BASIC",
      "C",
      "C++",
      "Clojure",
      "COBOL",
      "ColdFusion",
      "Erlang",
      "Fortran",
      "Groovy",
      "Haskell",
      "Java",
      "JavaScript",
      "Lisp",
      "Perl",
      "PHP",
      "Python",
      "Ruby",
      "Scala",
      "Scheme"
    ];
	$("#searchquery").autocomplete({
		source: availableTags
	});

	
});
$(window).load(function(){
	// Запускаем кастомный скроллбар
	var scrollHeight = $(window).height();
    $(".modal-window").mCustomScrollbar(
    	{
    		setHeight: scrollHeight,
    		setLeft: "42px",
    		mouseWheel:{ scrollAmount: 100 },
	    	callbacks:{
	    		  onInit: function()
	    		  {
	    		  	$(".mCSB_scrollTools.mCSB_2_scrollbar.mCSB_scrollTools_vertical").css({top: "-140px"});
	    		  	$("#mCSB_2_dragger_vertical").css({height: 250});
			      	$(".mCSB_dragger_bar").css({height: 250});
	    		  	// var scrollbar = $(".mCSB_1_scrollbar"), // скроллбар
	    		  	// 	scrollbarHeight = scrollbar.height()  // храним высчитанную высоту скроллбара
	    		  	
	    		  	// scrollbar.height(scrollbarHeight*3); // искусственно увеличиваем размер скроллиса
	    		  },
			      whileScrolling: function(){	
			      	$("#mCSB_2_dragger_vertical").css({height: 250});
			      	$(".mCSB_dragger_bar").css({height: 250});
			      	var offset 			= parseInt($("#mCSB_1_container").css("top"),10), // получаем из блока скрипта css top, приводим в целлосисленый
			    		holder 			= $(".modal-window"), // Один из холдеров модального окна
			    		tablist 		= holder.find(".nav.nav-tabs"), // прилипающее меню
			    		tabcontent 		= holder.find(".tab-content"), // Таб-плейт, хранит в себе текущий раздел
			    		tablistOffset 	= tabcontent.offset(); // берем его оффсет, чтобы отлепить меню

			    	//console.log(tablistH);

			    	// Обрабатываем липучесть меню
		    		if (tablistOffset.top < 30)
		    		{
		    			$("#page-content-wrapper>.panel-top").addClass("hided");
		    			$(".modal-overlay .panel-top").addClass("sticky");
		    			tablist.addClass("sticky");
		    		}
		    		else if (tablistOffset.top > 60)
		    		{
		    			$("#page-content-wrapper>.panel-top").removeClass("hided");
		    			$(".modal-overlay .panel-top").removeClass("sticky");
		    			tablist.removeClass("sticky");
		    		}       
		   		}
			}
		}
    );
});