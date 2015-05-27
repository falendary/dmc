jQuery(document).ready(function() {
  // jQuery('.log tbody').perfectScrollbar();
  jQuery('.select2').select2();
  meterCounter(); // обработчик добавления/удаления километров в форме поиска
  //$("#mo-table").mCustomScrollbar();
  jqueryGrid(); // jqGrid на табличку
  coordHl(".i-coords"); // подсвечиваем инпуты с координатами 
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
	   		{name:'mo',index:'mo', width:800},
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