<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Relevé Bancaire</title>
            </head>
            <body>
                <h2>Relevé de Compte RIB : <xsl:value-of select="releve/@RIB"/></h2>
                <p><b>Date du Relevé : </b><xsl:value-of select="releve/dateReleve"/></p>
                <p><b>Solde : </b><xsl:value-of select="releve/solde"/> DH</p>
                
                <h3>Liste des Opérations du <xsl:value-of select="releve/operations/@dateDebut"/> au <xsl:value-of select="releve/operations/@dateFin"/></h3>
                <table border="1" width="80%" cellspacing="0" cellpadding="5">
                    <tr bgcolor="#cccccc">
                        <th>Type</th>
                        <th>Date</th>
                        <th>Montant (DH)</th>
                        <th>Description</th>
                    </tr>
                    <xsl:for-each select="releve/operations/operation">
                        <tr>
                            <td><xsl:value-of select="@type"/></td>
                            <td><xsl:value-of select="@date"/></td>
                            <td><xsl:value-of select="@montant"/></td>
                            <td><xsl:value-of select="@description"/></td>
                        </tr>
                    </xsl:for-each>
                    <tr bgcolor="#e6f2ff">
                        <td colspan="2"><b>Total Crédit</b></td>
                        <td colspan="2"><b><xsl:value-of select="sum(releve/operations/operation[@type='CREDIT']/@montant)"/> DH</b></td>
                    </tr>
                    <tr bgcolor="#ffe6e6">
                        <td colspan="2"><b>Total Débit</b></td>
                        <td colspan="2"><b><xsl:value-of select="sum(releve/operations/operation[@type='DEBIT']/@montant)"/> DH</b></td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>