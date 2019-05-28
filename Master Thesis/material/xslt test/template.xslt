<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/list">
		<ul>
			<xsl:apply-templates select="entry"/>
		</ul>
	</xsl:template>
	<xsl:template match="entry">
		<li>
			<xsl:value-of select="." />
		</li>
	</xsl:template>
</xsl:stylesheet>