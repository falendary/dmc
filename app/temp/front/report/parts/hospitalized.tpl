<div class="triple triple-big">
    <div class="left">
        <label class="only" for='hospitalizedTotal'>Всего</label>
        <span class="inf-only">
            <span class="text-center">
                <span class="text-inner">
                    <span class="text-last">
                        взрослых
                    </span>
                </span>
            </span>
        </span>
        <span class="inf-only inf-only-new">
            <span class="text-center">
                <span class="text-inner">
                    <span class="text-last">
                        детей
                    </span>
                </span>
            </span>
        </span>
    </div>
    <div class="right">
        <div class="holder-small">
            <input class="new-small-inp" id='hospitalizedTotal' type="text" disabled="disabled" placeholder="" alt="">
        </div>
        <div class="holder-small">
            <div class="block main-in">
                <input type="text" placeholder="" id='hospitalizedAdult' value='{$REPORT.hospitalizedAdult|default}' disabled="disabled" />
            </div>
            <div class="block red">
                <span class="top">&nbsp;</span>
                <input type="text" data-title="tex ..." placeholder="" id='hospitalizedTotalExtHeavy' value='{$REPORT.hospitalizedTotalExtHeavy|default}' disabled="disabled" />
                <a class="plus" href="#">&nbsp;</a>
                <div class="tolltip">
                    <a class="add-new{if empty($EDITABLE)} disabled{/if}" href="#">add-new</a>
                    <span class="top-tool">&nbsp;</span>
                    <strong class="title-in">Состояние: крайне тяжелые</strong>
                    <div class="holder-lab">
                        <label>Госпит. чел</label>
                        <label>Навание МО</label>
                        <label>Местонахождение</label>
                    </div>
                    <ul class="list-lin">
                        {if empty($REPORT.hospitalized.total.extHeavy)}
                            <li>
                                <input type="text" class="numeric" name="hospitalized[total][extHeavy][peopleNumber][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                <input type="text" name="hospitalized[total][extHeavy][medicalOrganization][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                <input type="text" class="text-big" name="hospitalized[total][extHeavy][location][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                            </li>
                        {else}
                            {foreach from=$REPORT.hospitalized.total.extHeavy item=HOSP_DATA}
                                <li>
                                    <input type="text" class="numeric" name="hospitalized[total][extHeavy][peopleNumber][]" value="{$HOSP_DATA.peopleNumber}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <input type="text" name="hospitalized[total][extHeavy][medicalOrganization][]" value="{$HOSP_DATA.medicalOrganization}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <input type="text" class="text-big" name="hospitalized[total][extHeavy][location][]" value="{$HOSP_DATA.location}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                </li>
                            {/foreach}
                        {/if}
                    </ul>
                </div>
            </div>
            <div class="block orange">
                <span class="top">&nbsp;</span>
                <input type="text" data-title="tex ..." placeholder="" id='hospitalizedTotalHeavy' value='{$REPORT.hospitalizedTotalHeavy|default}' disabled="disabled" />
                <a class="plus" href="#">&nbsp;</a>
                <div class="tolltip">
                    <a class="add-new{if empty($EDITABLE)} disabled{/if}" href="#">add-new</a>
                    <span class="top-tool">&nbsp;</span>
                    <strong class="title-in">Состояние: тяжелые</strong>
                    <div class="holder-lab">
                        <label>Госпит. чел</label>
                        <label>Навание МО</label>
                        <label>Местонахождение</label>
                    </div>
                    <ul class="list-lin">
                        {if empty($REPORT.hospitalized.total.heavy)}
                            <li>
                                <input type="text" class="numeric" name="hospitalized[total][heavy][peopleNumber][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                <input type="text" name="hospitalized[total][heavy][medicalOrganization][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                <input type="text" class="text-big" name="hospitalized[total][heavy][location][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                            </li>
                        {else}
                            {foreach from=$REPORT.hospitalized.total.heavy item=HOSP_DATA}
                                <li>
                                    <input type="text" class="numeric" name="hospitalized[total][heavy][peopleNumber][]" value="{$HOSP_DATA.peopleNumber}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <input type="text" name="hospitalized[total][heavy][medicalOrganization][]" value="{$HOSP_DATA.medicalOrganization}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <input type="text" class="text-big" name="hospitalized[total][heavy][location][]" value="{$HOSP_DATA.location}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                </li>
                            {/foreach}
                        {/if}
                    </ul>
                </div>
            </div>
            <div class="block yellow">
                <span class="top">&nbsp;</span>
                <input type="text" data-title="tex ..." placeholder="" id='hospitalizedTotalMedium' value='{$REPORT.hospitalizedTotalMedium|default}' disabled="disabled" />
                <a class="plus" href="#">&nbsp;</a>
                <div class="tolltip">
                    <a class="add-new{if empty($EDITABLE)} disabled{/if}" href="#">add-new</a>
                    <span class="top-tool">&nbsp;</span>
                    <strong class="title-in">Состояние: средние</strong>
                    <div class="holder-lab">
                        <label>Госпит. чел</label>
                        <label>Навание МО</label>
                        <label>Местонахождение</label>
                    </div>
                    <ul class="list-lin">
                        {if empty($REPORT.hospitalized.total.medium)}
                            <li>
                                <input type="text" class="numeric" name="hospitalized[total][medium][peopleNumber][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                <input type="text" name="hospitalized[total][medium][medicalOrganization][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                <input type="text" class="text-big" name="hospitalized[total][medium][location][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                            </li>
                        {else}
                            {foreach from=$REPORT.hospitalized.total.medium item=HOSP_DATA}
                                <li>
                                    <input type="text" class="numeric" name="hospitalized[total][medium][peopleNumber][]" value="{$HOSP_DATA.peopleNumber}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <input type="text" name="hospitalized[total][medium][medicalOrganization][]" value="{$HOSP_DATA.medicalOrganization}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <input type="text" class="text-big" name="hospitalized[total][medium][location][]" value="{$HOSP_DATA.location}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                </li>
                            {/foreach}
                        {/if}
                    </ul>
                </div>
            </div>
            <div class="block green">
                <span class="top">&nbsp;</span>
                <input type="text" data-title="tex ..." placeholder="" id='hospitalizedTotalLight' value='{$REPORT.hospitalizedTotalLight|default}' disabled="disabled" />
                <a class="plus" href="#">&nbsp;</a>
                <div class="tolltip">
                    <a class="add-new{if empty($EDITABLE)} disabled{/if}" href="#">add-new</a>
                    <span class="top-tool">&nbsp;</span>
                    <strong class="title-in">Состояние: легкие</strong>
                    <div class="holder-lab">
                        <label>Госпит. чел</label>
                        <label>Навание МО</label>
                        <label>Местонахождение</label>
                    </div>
                    <ul class="list-lin">
                        {if empty($REPORT.hospitalized.total.light)}
                            <li>
                                <input type="text" class="numeric" name="hospitalized[total][light][peopleNumber][]" />
                                <input type="text" name="hospitalized[total][light][medicalOrganization][]" />
                                <input type="text" class="text-big" name="hospitalized[total][light][location][]" />
                                <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                            </li>
                        {else}
                            {foreach from=$REPORT.hospitalized.total.light item=HOSP_DATA}
                                <li>
                                    <input type="text" class="numeric" name="hospitalized[total][light][peopleNumber][]" value="{$HOSP_DATA.peopleNumber}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <input type="text" name="hospitalized[total][light][medicalOrganization][]" value="{$HOSP_DATA.medicalOrganization}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <input type="text" class="text-big" name="hospitalized[total][light][location][]" value="{$HOSP_DATA.location}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                </li>
                            {/foreach}
                        {/if}
                    </ul>
                </div>
            </div>
        </div>
        <div class="holder-small">
            <div class="block main-in">
                <input type="text" placeholder="" id='hospitalizedChildren' value='{$REPORT.hospitalizedChildren|default}' disabled="disabled" />
            </div>
            <div class="block red">
                <span class="top">&nbsp;</span>
                <input type="text" data-title="tex ..." placeholder="" id='hospitalizedChildrenExtHard' value='{$REPORT.hospitalizedChildrenExtHard|default}' disabled="disabled" />
                <a class="plus" href="#">&nbsp;</a>
                <div class="tolltip">
                    <a class="add-new{if empty($EDITABLE)} disabled{/if}" href="#">add-new</a>
                    <span class="top-tool">&nbsp;</span>
                    <strong class="title-in">Состояние: крайне тяжелые</strong>
                    <div class="holder-lab">
                        <label>Госпит. чел</label>
                        <label>Навание МО</label>
                        <label>Местонахождение</label>
                    </div>
                    <ul class="list-lin">
                        {if empty($REPORT.hospitalized.children.extHeavy)}
                            <li>
                                <input type="text" class="numeric" name="hospitalized[children][extHeavy][peopleNumber][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                <input type="text" name="hospitalized[children][extHeavy][medicalOrganization][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                <input type="text" class="text-big" name="hospitalized[children][extHeavy][location][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                            </li>
                        {else}
                            {foreach from=$REPORT.hospitalized.children.extHeavy item=HOSP_DATA}
                                <li>
                                    <input type="text" class="numeric" name="hospitalized[children][extHeavy][peopleNumber][]" value="{$HOSP_DATA.peopleNumber}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <input type="text" name="hospitalized[children][extHeavy][medicalOrganization][]" value="{$HOSP_DATA.medicalOrganization}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <input type="text" class="text-big" name="hospitalized[children][extHeavy][location][]" value="{$HOSP_DATA.location}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                </li>
                            {/foreach}
                        {/if}
                    </ul>
                </div>
            </div>
            <div class="block orange">
                <span class="top">&nbsp;</span>
                <input type="text" data-title="tex ..." placeholder="" id='hospitalizedChildrenHard' value='{$REPORT.hospitalizedChildrenHard|default}' disabled="disabled" />
                <a class="plus" href="#">&nbsp;</a>
                <div class="tolltip">
                    <a class="add-new{if empty($EDITABLE)} disabled{/if}" href="#">add-new</a>
                    <span class="top-tool">&nbsp;</span>
                    <strong class="title-in">Состояние: тяжелые</strong>
                    <div class="holder-lab">
                        <label>Госпит. чел</label>
                        <label>Навание МО</label>
                        <label>Местонахождение</label>
                    </div>
                    <ul class="list-lin">
                        {if empty($REPORT.hospitalized.children.heavy)}
                            <li>
                                <input type="text" class="numeric" name="hospitalized[children][heavy][peopleNumber][]" />
                                <input type="text" name="hospitalized[children][heavy][medicalOrganization][]" />
                                <input type="text" class="text-big" name="hospitalized[children][heavy][location][]" />
                                <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                            </li>
                        {else}
                            {foreach from=$REPORT.hospitalized.children.heavy item=HOSP_DATA}
                                <li>
                                    <input type="text" class="numeric" name="hospitalized[children][heavy][peopleNumber][]" value="{$HOSP_DATA.peopleNumber}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <input type="text" name="hospitalized[children][heavy][medicalOrganization][]" value="{$HOSP_DATA.medicalOrganization}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <input type="text" class="text-big" name="hospitalized[children][heavy][location][]" value="{$HOSP_DATA.location}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                </li>
                            {/foreach}
                        {/if}
                    </ul>
                </div>
            </div>
            <div class="block yellow">
                <span class="top">&nbsp;</span>
                <input type="text" data-title="tex ..." placeholder="" id='hospitalizedChildrenMedium' value='{$REPORT.hospitalizedChildrenMedium|default}' disabled="disabled" />
                <a class="plus" href="#">&nbsp;</a>
                <div class="tolltip">
                    <a class="add-new{if empty($EDITABLE)} disabled{/if}" href="#">add-new</a>
                    <span class="top-tool">&nbsp;</span>
                    <strong class="title-in">Состояние: средние</strong>
                    <div class="holder-lab">
                        <label>Госпит. чел</label>
                        <label>Навание МО</label>
                        <label>Местонахождение</label>
                    </div>
                    <ul class="list-lin">
                        {if empty($REPORT.hospitalized.children.medium)}
                            <li>
                                <input type="text" class="numeric" name="hospitalized[children][medium][peopleNumber][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                <input type="text" name="hospitalized[children][medium][medicalOrganization][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                <input type="text" class="text-big" name="hospitalized[children][medium][location][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                            </li>
                        {else}
                            {foreach from=$REPORT.hospitalized.children.medium item=HOSP_DATA}
                                <li>
                                    <input type="text" class="numeric" name="hospitalized[children][medium][peopleNumber][]" value="{$HOSP_DATA.peopleNumber}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <input type="text" name="hospitalized[children][medium][medicalOrganization][]" value="{$HOSP_DATA.medicalOrganization}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <input type="text" class="text-big" name="hospitalized[children][medium][location][]" value="{$HOSP_DATA.location}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                </li>
                            {/foreach}
                        {/if}
                    </ul>
                </div>
            </div>
            <div class="block green">
                <span class="top">&nbsp;</span>
                <input type="text" data-title="tex ..." placeholder="" id='hospitalizedChildrenLight' value='{$REPORT.hospitalizedChildrenLight|default}' disabled="disabled" />
                <a class="plus" href="#">&nbsp;</a>
                <div class="tolltip">
                    <a class="add-new{if empty($EDITABLE)} disabled{/if}" href="#">add-new</a>
                    <span class="top-tool">&nbsp;</span>
                    <strong class="title-in">Состояние: легкие</strong>
                    <div class="holder-lab">
                        <label>Госпит. чел</label>
                        <label>Навание МО</label>
                        <label>Местонахождение</label>
                    </div>
                    <ul class="list-lin">
                        {if empty($REPORT.hospitalized.children.light)}
                            <li>
                                <input type="text" class="numeric" name="hospitalized[children][light][peopleNumber][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                <input type="text" name="hospitalized[children][light][medicalOrganization][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                <input type="text" class="text-big" name="hospitalized[children][light][location][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                            </li>
                        {else}
                            {foreach from=$REPORT.hospitalized.children.light item=HOSP_DATA}
                                <li>
                                    <input type="text" class="numeric" name="hospitalized[children][light][peopleNumber][]" value="{$HOSP_DATA.peopleNumber}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <input type="text" name="hospitalized[children][light][medicalOrganization][]" value="{$HOSP_DATA.medicalOrganization}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <input type="text" class="text-big" name="hospitalized[children][light][location][]" value="{$HOSP_DATA.location}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                    <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                </li>
                            {/foreach}
                        {/if}
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>