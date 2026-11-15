<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Biblio</title>
            </head>
            <body>
                <h1>Liste des emprunts biblio</h1>
                <ul>
                    <xsl:for-each select="biblio/etudiant">
                        <li>
                            <b>Code : </b><xsl:value-of select="@code"/> | 
                            <b>Nom : </b><xsl:value-of select="@nom"/> | 
                            <b>Prénom : </b><xsl:value-of select="@prenom"/>
                            
                            <table border="1" width="90%">
                                <tr>
                                    <th>ID</th>
                                    <th>Titre</th>
                                    <th>Date Emprunt</th>
                                    <th>Rendu</th>
                                </tr>
                                <xsl:for-each select="livre">
                                    <tr>
                                        <td><xsl:value-of select="@id"/></td>
                                        <td><xsl:value-of select="@titre"/></td>
                                        <td><xsl:value-of select="@datePret"/></td>
                                        <td><xsl:value-of select="@rendu"/></td>
                                    </tr>
                                </xsl:for-each>
                                <tr>
                                    <td colspan="3">Nombre total de livres empruntés</td>
                                    <td><xsl:value-of select="count(livre)"/></td>
                                </tr>
                                <tr>
                                    <td colspan="3">Nombre de livres rendus (oui)</td>
                                    <td><xsl:value-of select="count(livre[@rendu='oui'])"/></td>
                                </tr>
                                <tr>
                                    <td colspan="3">Nombre de livres non rendus (non)</td>
                                    <td><xsl:value-of select="count(livre[@rendu='non'])"/></td>
                                </tr>
                            </table>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>