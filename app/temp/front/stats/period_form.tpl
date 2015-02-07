<form id="period_form">
    <div style="width: 253px; display: block; position: relative">
        <label for="dtFrom">Дата от:</label><input type="text" name="dtFrom" id="dtFrom" class="datepicker" style="width: 158px" value="{"-1 month"|strtotime|date_format:"%d.%m.%Y / %H:%M"}">
        <a data-for="#dtFrom" class="dateTimePicker" >data</a>
    </div>
    <div style="width: 253px; display: block; position: relative">
        <label for="dtTo">Дата до:</label><input type="text" name="dtTo" id="dtTo" class="datepicker" style="width: 158px" value="{$smarty.now|date_format:"%d.%m.%Y / %H:%M"}">
        <a data-for="#dtTo" class="dateTimePicker" >data</a>
    </div>
    <button type="submit">Просмотр</button>
</form>