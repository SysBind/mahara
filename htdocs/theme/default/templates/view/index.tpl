{include file="header.tpl"}
{include file="sidebar.tpl"}
{include file="columnleftstart.tpl"}

<span class="addicon fr"><a href="{$WWWROOT}view/edit.php">{str tag="createview" section="view"}</a></span>
<h2>{$heading}</h2>

{if $views}
<table id="myviewstable">

{foreach from=$views item=view}
    <tr class="{cycle values=r0,r1}">
    <td>
    {if !$view.submittedto}
        <a href="{$WWWROOT}view/delete.php?id={$view.id}" class="fr" id="btn-deletethisview">{str tag="deletethisview" section="view"}</a>
    {/if}
    <h3><a href="{$WWWROOT}view/view.php?id={$view.id}">{$view.title|escape}</a></h3>
    <div class="viewitem">
    {if !$view.submittedto}
        <a href="{$WWWROOT}view/edit.php?id={$view.id}" id="editviewdetails">{str tag="editviewnameanddescription" section="view"}</a>
    {/if}
    {if $view.description}
        {if !$view.submittedto}<br>{/if}
        {$view.description}
    {/if}
    </div>
    <div class="viewitem">
        {if !$view.submittedto}<a href="{$WWWROOT}view/blocks.php?id={$view.id}" id="editthisview">{str tag ="editthisview" section="view"}</a><br>{/if}
    {if $view.artefacts}
        {str tag="artefacts" section="view"}:
        {foreach from=$view.artefacts item=artefact name=artefacts}<a href="{$WWWROOT}view/artefact.php?artefact={$artefact.id}&amp;view={$view.id}" id="link-artefacts">{$artefact.title|escape}</a>{if !$smarty.foreach.artefacts.last}, {/if}{/foreach}
    {/if}
    </div>
    <div class="viewitem">
    <a href="{$WWWROOT}view/access.php?id={$view.id}" id="editviewaccess">{str tag="editviewaccess" section="view"}</a>
    <br>
    {if $view.access}
        {$view.access}
        <br>
    {/if}
    {if $view.accessgroups}
        {str tag="whocanseethisview" section="view"}:
        {foreach from=$view.accessgroups item=accessgroup name=artefacts}
        {* this is messy, but is like this so there aren't spaces between links and commas *}
            {if $accessgroup.accesstype == 'loggedin'}
                {str tag="loggedinlower" section="view"}{elseif $accessgroup.accesstype == 'public'}
                {str tag="publiclower" section="view"}{elseif $accessgroup.accesstype == 'friends'}
                <a href="{$WWWROOT}user/myfriends.php" id="link-myfriends">{str tag="friendslower" section="view"}</a>{elseif $accessgroup.accesstype == 'group'}
                <a href="{$WWWROOT}group/view.php?id={$accessgroup.id}">{$accessgroup.name|escape}</a>{elseif $accessgroup.accesstype == 'tutorgroup'}
                <a href="{$WWWROOT}group/view.php?id={$accessgroup.id}">{$accessgroup.name|escape}</a> ({str tag="tutors" section="view"}){elseif $accessgroup.accesstype == 'user'}
                <a href="{$WWWROOT}user/view.php?id={$accessgroup.id}">{$accessgroup.id|display_name|escape}</a>{/if}{if !$smarty.foreach.artefacts.last},{/if}
        {/foreach}
    {else}
        {str tag="nobodycanseethisview" section="view"}
    {/if}
    </div>
    {if $view.submittedto}
        <div class="viewitem">
        {$view.submittedto}
        </div>
    {/if}
    {if $view.submitto}
        <div class="viewitem">
        {$view.submitto}
        </div>
    {/if}
    </td>
    </tr>
{/foreach}

</table>

<div class="center">{$pagination}</div>

{else}
<div class="message">{str tag="noviews" section="view"}</div>
{/if}

{include file="columnleftend.tpl"}
{include file="footer.tpl"}
