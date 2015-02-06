<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:param name="file1" select="document('timezone.xml')"/>
  <xsl:param name="file2" select="document('countrywise-timezone.xml')"/>

  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <timezones>
   
        <xsl:for-each select="$file1/timezones/timezone">
          <timezone>
            <name><xsl:value-of select="timezone-name"/></name>
            <code><xsl:value-of select="timezone-code"/></code>
            
            <country-code> 
                <xsl:call-template name="find-country-for-timezone">
                    <xsl:with-param name="pname" select="timezone-name" />
                </xsl:call-template>
            </country-code>

          </timezone>
        </xsl:for-each>

    </timezones>
  </xsl:template>
 
  
  <xsl:template name="find-country-for-timezone">
    <xsl:param name="pname" />
    
    <xsl:for-each select="$file2/timezone-data/country">
        <xsl:variable name="country-code" select="country-code"/>
       
		    <xsl:for-each select="timezones/timezone">
		       <xsl:variable name="code" select="code"/>
		       
		       <xsl:if test="$code = $pname">
		          <xsl:value-of select="$country-code"/>
		       </xsl:if> 
		                
		    </xsl:for-each> 
		    
    </xsl:for-each> 
    
  </xsl:template>
    
    
</xsl:stylesheet>
