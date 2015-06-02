"use strict";
jQuery(document).ready(function() {
	$(window).resize(function() {
		console.log("resized");
		console.log($(window).width());
	    // var $grid = $("#mo-table"),
	    //     newWidth = $grid.closest(".ui-jqgrid").parent().width();
	    // $grid.jqGrid("setGridWidth", newWidth, true);
	});
	// jQuery('.log tbody').perfectScrollbar();
	jQuery('.select2').select2();
	meterCounter(); // обработчик добавления/удаления километров в форме поиска
	//$("#mo-table").mCustomScrollbar();
	$.when(jqueryGrid()).then(function()
	{
		var table 	= jQuery("#mo-table"),
			tr 		= table.find("tr"),
			td 		= tr.find("td:first-child");

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
				var hoverline = $("#hoverline");
				tr.bind("mouseenter", function()
				{
					var trOffset = $(this).offset();
					console.log(trOffset.top);
					hoverline.offset({top: trOffset.top, left: trOffset.left-5});
					hoverline.show();	
				}).bind("mouseleave", function()
				{
					hoverline.offset({top: 0, left: 0});
					hoverline.css({top: "0px", left: "0px"});
					hoverline.hide();
				})
			})();
	}); // jqGrid на табличку
	coordHl(".i-coords"); // подсвечиваем инпуты с координатами 

	jQuery('#mo-table td>a').bind("click", function(e)
      {
        e.preventDefault();
        $(".modal-overlay").fadeIn("slow");
        return 
      });

	$(".btn-square.btn-grey.btn-menu").click(function(e) {
		e.preventDefault();
		$("#wrapper").toggleClass("active"); // Актив на глобальный враппер
		$(".holder-time").toggleClass("active"); // Актив на глобальный враппер
		$(this).toggleClass("active"); // Актив на кнопку
		var map = $("#map>ymaps"),
			mapW = map.width();
		if ($("#wrapper").hasClass("active")) {
			map.width(mapW-268); 
		}
		else
		{
			map.width(mapW+268);
		}
	});
	$(".window-close.w-icon").bind("click", function(e)
	{
		e.preventDefault();
		$(".modal-overlay").fadeOut("slow");
	});
});

function meterCounter()
{
	var minus 	= jQuery(".btn.btn-square-sm.btn-minus"); // кнопка вычета
	var plus 	= jQuery(".btn.btn-square-sm.btn-plus"); // кнопка прибавления
	var holder  = jQuery(".meter-holder .quantities"); // сам инпут
	var val 	= parseInt(holder.val(), 10); // его значение
	//console.log(val);

	// увеличиваем, ограничения нет
	plus.bind("click", function()
	{
		val += 1;
		holder.val(val);
		return;
	});
	// уменьшаем, меньше нуля не существует
	minus.bind("click", function()
	{
		val <= 1 ? val = 0 : val -=1;
		holder.val(val);
		return;
	});
	return;
}
function coordHl(selector)
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
}
function jqueryGrid () {
	jQuery("#mo-table").jqGrid({ // Привязка плагина к таблице
		regional: "ru",
		datatype: "local",
		scrollerbar: true,
		height: "192",
	   	colNames:['', 'ПОЛНОЕ НАИМЕНОВАНИЕ МО', 'РАЙОН', 'МИН','КМ'],
	   	colModel:[
	   		{name:'status',	key : true,	index:'status',	width:24},
	   		{name:'mo',index:'mo', width:800, formatter:'showlink', formatoptions:{baseLinkUrl:'#'}},
	   		{name:'district', index:'district',	width:160},
	   		{name:'arrivetime',index:'arrivetime', width:70, align:"right"},
	   		{name:'kilometers',index:'kilometers', width:65, align:"right"}
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
}

$(window).load(function(){
	// Запускаем кастомный скроллбар
    $(".modal-window").mCustomScrollbar(
    	{
	    	callbacks:{
	    		  onInit: function()
	    		  {
	    		  	var scrollbar = $(".mCSB_1_scrollbar"), // скроллбар
	    		  		scrollbarHeight = scrollbar.height()  // храним высчитанную высоту скроллбара
	    		  	
	    		  	scrollbar.height(scrollbarHeight*3); // искусственно увеличиваем размер скроллиса
	    		  },
			      whileScrolling: function(){
			      	var offset 			= parseInt($("#mCSB_1_container").css("top"),10), // получаем из блока скрипта css top, приводим в целлосисленый
			    		holder 			= $(".modal-window"), // Один из холдеров модального окна
			    		tablist 		= holder.find(".nav.nav-tabs"), // прилипающее меню
			    		tablistH		= tablist.height(), // Высота прилипающего меню, на всяк случай
			    		tabcontent 		= holder.find(".tab-content"), // Таб-плейт, хранит в себе текущий раздел
			    		tablistOffset 	= tabcontent.offset(); // берем его оффсет, чтобы отлепить меню

			    	//console.log(tablistH);

			    	// Обрабатываем липучесть меню
		    		if (tablistOffset.top < 40)
		    		{
		    			tablist.css({
		    				position: "fixed",
		    				top: "0px",
		    				left: "50%",
		    				marginLeft: "-343px"
		    			})
		    			tabcontent.css("padding-top", tablistH+"px");
		    		}
		    		else if (tablistOffset.top <= 80)
		    		{
		    			tablist.css({
		    				position: "static",
		    				marginLeft: "0"
		    			})
		    			tabcontent.css({
		    				paddingTop: 0
		    			})
		    		}       
		   		}
			}
		}
    );
});