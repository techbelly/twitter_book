<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
            <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
                <fo:layout-master-set>
                    <!-- layout for the first page -->
                    <fo:simple-page-master master-name="first" page-height="22.86cm" page-width="15.24cm" margin-top="1.96cm" margin-bottom="1.96cm" margin-left="3cm" margin-right="3cm">
                        <fo:region-body margin-top="10cm" margin-bottom="2cm"/>
                        <fo:region-after region-name="non-blank-after" extent="2cm"/>
                    </fo:simple-page-master>
                    <!-- layout for odd pages -->
                    <fo:simple-page-master master-name="odd" page-height="22.86cm" page-width="15.24cm" margin-top="1.96cm" margin-bottom="1.96cm" margin-left="3cm" margin-right="2cm">
                        <fo:region-body margin-top="2cm" margin-bottom="2cm"/>
                        <fo:region-before region-name="odd-before" extent="2cm"/>
                        <fo:region-after region-name="non-blank-after" extent="2cm"/>
                    </fo:simple-page-master>
                    <!-- layout for even pages -->
                    <fo:simple-page-master master-name="even" page-height="22.86cm" page-width="15.24cm" margin-top="1.96cm" margin-bottom="1.96cm" margin-left="2cm" margin-right="3cm">
                        <fo:region-body margin-top="2cm" margin-bottom="2cm"/>
                        <fo:region-before region-name="even-before" extent="2cm"/>
                        <fo:region-after region-name="non-blank-after" extent="2cm"/>
                    </fo:simple-page-master>
                    <!-- layout for odd last page, blank or not-blank -->
                    <!-- Note that this is redundant in the example -->
                    <!-- layout for even last page, blank or not-blank -->
                    <fo:simple-page-master master-name="last_even" page-height="22.86cm" page-width="15.24cm" margin-top="1.96cm" margin-bottom="1.96cm" margin-left="2cm" margin-right="3cm">
                        <fo:region-body margin-top="2cm" margin-bottom="2cm"/>
                        <fo:region-before region-name="even-last-before" extent="2cm"/>
                        <fo:region-after region-name="last-after" extent="2cm"/>
                    </fo:simple-page-master>
                    <!-- layout for blank pages (non-last) -->
                    <fo:simple-page-master master-name="blank" page-height="22.86cm" page-width="15.24cm" margin-top="1.96cm" margin-bottom="1.96cm" margin-left="3cm" margin-right="3cm">
                        <fo:region-body margin-top="2cm" margin-bottom="2cm"/>
                        <fo:region-before region-name="blank-before" extent="2cm"/>
                        <fo:region-after region-name="blank-after" extent="2cm"/>
                    </fo:simple-page-master>
                    <fo:page-sequence-master master-name="chapter">
                        <fo:repeatable-page-master-alternatives>
                            <fo:conditional-page-master-reference master-reference="odd" page-position="rest" odd-or-even="odd"/>
                            <fo:conditional-page-master-reference master-reference="even" page-position="rest" odd-or-even="even"/>
                            <fo:conditional-page-master-reference master-reference="first" page-position="first"/>
                            <fo:conditional-page-master-reference master-reference="last_even" odd-or-even="even" page-position="last"/>
                            <fo:conditional-page-master-reference master-reference="blank" blank-or-not-blank="blank"/>
                        </fo:repeatable-page-master-alternatives>
                    </fo:page-sequence-master>
                </fo:layout-master-set>
            <fo:page-sequence master-reference="chapter">
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
