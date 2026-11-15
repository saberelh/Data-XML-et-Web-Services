<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Opérations de Crédit</title>
            </head>
            <body>
                <h2>Liste des Opérations de type CREDIT</h2>
                <table border="1" width="80%" cellspacing="0" cellpadding="5">
                    <tr bgcolor="#d4edda">
                        <th>Date</th>
                        <th>Montant (DH)</th>
                        <th>Description</th>
                    </tr>
                    <xsl:for-each select="releve/operations/operation[@type='CREDIT']">
                        <tr>
                            <td><xsl:value-of select="@date"/></td>
                            <td><xsl:value-of select="@montant"/> DH</td>
                            <td><xsl:value-of select="@description"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>