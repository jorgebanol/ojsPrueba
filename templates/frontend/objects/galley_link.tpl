{**
 * templates/frontend/objects/galley_link.tpl
 *
 * Copyright (c) 2014-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of a galley object as a link to view or download the galley, to be used
 *  in a list of galleys.
 *
 * @uses $galley Galley
 * @uses $parent Issue|Article Object which these galleys are attached to
 * @uses $hasAccess bool Can this user access galleys for this context?
 * @uses $restrictOnlyPdf bool Is access only restricted to PDF galleys?
 * @uses $purchaseArticleEnabled bool Can this article be purchased?
 * @uses $currentJournal Journal The journal context
 *}

{* Determine galley type and URL op *}
{if $galley->isPdfGalley()}
	{assign var="type" value="pdf"}
	{assign var="op" value="viewPdf"}
{else}
	{assign var="type" value="file"}
	{assign var="op" value="viewInterstitial"}
{/if}

{* Get page and parentId for URL *}
{if $parent instanceOf Issue}
	{assign var="page" value="issue"}
	{assign var="parentId" value=$parent->getBestIssueID()}
{else}
	{assign var="page" value="article"}
	{assign var="parentId" value=$parent->getBestArticleID()}
{/if}

{* Get user access flag *}
{if !$hasAccess}
	{if $restrictOnlyPdf && type=='pdf'}
		{assign var=restricted value="1"}
	{elseif !$restrictOnlyPdf}
		{assign var=restricted value="1"}
	{/if}
{/if}

{* Don't be frightened. This is just a link *}
<a class="obj_galley_link {$type}{if $restricted} restricted{/if}" href="{url page=$page op=$op path=$parentId|to_array:$galley->getBestGalleyId($currentJournal)}">

	{* Add some screen reader text to indicate if a galley is restricted *}
	{if $restricted}
		<span class="pkp_screen_reader">
			{if $purchaseArticleEnabled}
				{translate key="reader.subscriptionOrFeeAccess"}
			{else}
				{translate key="reader.subscriptionAccess"}
			{/if}
		</span>
	{/if}

	{$galley->getGalleyLabel()|escape}
</a>
