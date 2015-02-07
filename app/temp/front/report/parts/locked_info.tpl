<div class='info important' id='lockedInfo' {if empty($LOCKED)}style='display: none'{/if}>
    <div class='locked-attention' id='lockedIndicator' data-title="Донесение заблокированно другим пользователем и открыто в режиме 'Только чтение'">&nbsp;</div>
    <h1 style='color: #d14'>Донесение заблокировано</h1>
    <p>Пользователь <span id="userLockCredentials">{if !empty($LOCKED)}{$LOCKED.user.lastName} {$LOCKED.user.firstName|mb_truncate:1:''}.{$LOCKED.user.middleName|mb_truncate:1:''}. ({$LOCKED.user.login}){/if}</span> в данный момент редактирует донесение</p>
    <p>Донесение открыто в режиме 'Только чтение'</p>
</div>