<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="US-trade" page-height="22.86cm" page-width="15.24cm" margin-top="1.96cm" margin-bottom="1.96cm" margin-left="3cm" margin-right="3cm">
                    <fo:region-body/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="US-trade">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="9pt" font-family="JansonText">
                        <xsl:apply-templates/>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="month">
        <fo:block break-before="page" keep-with-next.within-page="always" text-align="center" font-weight="bold" font-size="14pt" space-before="15pt" space-after="24pt">
            <xsl:value-of select="@name"/>
        </fo:block>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="name">
        <fo:inline font-weight="bold">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <xsl:template match="link">
        <fo:inline color="gray">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <xsl:template match="hashtag">
        <fo:inline font-style="italic">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <xsl:template match="day">
        <fo:block text-align="center" keep-with-next.within-page="always" font-style="italic" space-before="24pt" space-after="15pt">
            <xsl:value-of select="@name"/>
        </fo:block>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tweet">
        <fo:block space-before="6pt" space-after="6pt" text-indent="-4.8em" start-indent="4em" text-align="left"><xsl:value-of select="@time"/>  <xsl:apply-templates/></fo:block>
    </xsl:template>

</xsl:stylesheet>
