<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
  version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:msxml="urn:schemas-microsoft-com:xslt"
  xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" xmlns:uForum="urn:uForum" xmlns:uForum.raw="urn:uForum.raw" xmlns:uWiki="urn:uWiki" xmlns:uSearh="urn:uSearh" xmlns:uPowers="urn:uPowers" xmlns:uEvents="urn:uEvents" xmlns:MemberLocator="urn:MemberLocator" xmlns:umbracoTags.library="urn:umbracoTags.library" xmlns:our.library="urn:our.library" xmlns:Notifications="urn:Notifications" 
  exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets uForum uForum.raw uWiki uSearh uPowers uEvents MemberLocator umbracoTags.library our.library Notifications ">


<xsl:output method="xml" omit-xml-declaration="yes"/>

<xsl:param name="currentPage"/>

<xsl:variable name="mem"><xsl:if test="umbraco.library:IsLoggedOn()"><xsl:value-of select="umbraco.library:GetCurrentMember()/@id"/></xsl:if></xsl:variable>

<xsl:template match="/">

<xsl:choose>
<xsl:when test="string(umbraco.library:GetCurrentMember()/bugMeNot) = '1'">
<div class="alert" style="width:600px">
Currently you will not receive any notifications since your profile preference is set to 'Do not send me any notifications or newsletters from our.umbraco.org'. To change this, please update the setting on your profile.
</div>
</xsl:when>
<xsl:otherwise>


<h2>Forum subscriptions</h2>
<small>You get notified whenever a new topic is added to the subscribed forums.</small>

<xsl:variable name="forumsubscriptions" select="Notifications:SubscribedForums($mem)" />

<xsl:choose>
<xsl:when test="count($forumsubscriptions//forum) = 0">
<p>Currently no active subscriptions.</p>
</xsl:when>
<xsl:otherwise>

<ul>
<xsl:for-each select="$forumsubscriptions//forum">
  <li>
    <a href="{umbraco.library:NiceUrl(@id)}"><xsl:value-of select="title" /></a>
    -
    <a href="#" rel="{@id}" class="NotificationForumUnsubscribe">Unsubscribe</a>
  </li>
</xsl:for-each>
</ul>
</xsl:otherwise>
</xsl:choose>

<h2>Topic subscriptions</h2>
<small>You get notified whenever a new reply is added to the subscribed topics.</small>

<xsl:variable name="topicsubscriptions" select="Notifications:SubscribedTopics($mem)" />

<xsl:choose>
<xsl:when test="count($topicsubscriptions//topic) = 0">
<p>Currently no active subscriptions.</p>
</xsl:when>
<xsl:otherwise>

<ul>
<xsl:for-each select="$topicsubscriptions//topic">
  <li>
    <a href="{uForum:NiceTopicUrl(@id)}"><xsl:value-of select="title" /></a>
    -
    <a href="#" rel="{@id}" class="NotificationTopicUnsubscribe">Unsubscribe</a>
  </li>
</xsl:for-each>
</ul>
</xsl:otherwise>
</xsl:choose>

</xsl:otherwise>
</xsl:choose>
</xsl:template>

</xsl:stylesheet>