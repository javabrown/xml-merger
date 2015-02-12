<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:param name="file1" select="document('data.xml')"/>

  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <beans>
   
        <xsl:for-each select="$file1/list/bean">
          <bean class='timeZone'>
            <xsl:for-each select="property">
               <xsl:if test="@name!='code'">
                  <property name="{@name}" value="{@value}" />
               </xsl:if>
            </xsl:for-each>
          </bean> 
        </xsl:for-each>

    </beans>
  </xsl:template>
   
</xsl:stylesheet>
