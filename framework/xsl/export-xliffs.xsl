<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs">
    
    <xsl:param name="fluenta-id" as="xs:string"/>
    <xsl:output method="text" indent="false"/>
    
    <xsl:template match="/">
        <xsl:value-of select="'{id:' || //project[@id = $fluenta-id]/@id || ',&#xa;'"/>
        <xsl:value-of select="'title:&quot;' || //project[@id = $fluenta-id]/name/text() || '&quot;,&#xa;'"/>
        <xsl:value-of select="'description:&quot;' || normalize-space(//project[@id = $fluenta-id]/description/text()) || '&quot;,&#xa;'"/>
        <xsl:value-of select="'map:&quot;' || //project[@id = $fluenta-id]/@map || '&quot;,&#xa;'"/>
        <xsl:value-of select="'srcLang:&quot;' || //project[@id = $fluenta-id]/@srcLang || '&quot;,&#xa;'"/>
        <xsl:value-of select="'tgtLang:['"/>
        <xsl:for-each select="tokenize(//project[@id = $fluenta-id]/@tgtLang, ',')">
            <xsl:value-of select="if (position() lt last()) then '&quot;' || . || '&quot;,' else '&quot;' || . || '&quot;'"/>
        </xsl:for-each>
        <xsl:value-of select="']&#xa;}'"/>
    </xsl:template>
    
    <!--{ id:12345678, 
    title:"JSON test", 
    description:"project created using JSON and CLI", 
    map:"D:\\sample content\\en\\User_Guide-use-only.ditamap", 
    srcLang:"en-US", 
    tgtLang:["es","fr"]
    }
    -->
    
</xsl:stylesheet>