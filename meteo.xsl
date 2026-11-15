<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
        <xsl:template match="/">
            <html>
                <head>
                    <title>Relevé Météo</title>
                    <style>
                        body { font-family: Arial, sans-serif; margin: 20px; }
                        table { border-collapse: collapse; width: 60%; margin-bottom: 20px; }
                        th, td { border: 1px solid #BDC3C7; padding: 8px 12px; }
                        th { background-color: #3498DB; color: white; }
                        tr:nth-child(even) { background-color: #F2F2F2; }
                        .stats { font-weight: bold; background-color: #E8F8F5; }
                    </style>
                </head>
                <body>
                    <h1>Relevé des Températures par Date</h1>
                    <xsl:for-each select="meteo/mesure">
                        <h2>Mesure du : <xsl:value-of select="@date"/></h2>
                        <table>
                            <tr>
                                <th>Ville</th>
                                <th>Température (°C)</th>
                            </tr>
                            <xsl:for-each select="ville">
                                <tr>
                                    <td><xsl:value-of select="@nom"/></td>
                                    <td><xsl:value-of select="@temperature"/> °C</td>
                                </tr>
                            </xsl:for-each>
                            <tr class="stats">
                                <td>Moyenne des températures</td>
                                <td>
                                    <xsl:value-of select="format-number(avg(ville/@temperature), '0.00')"/> °C
                                </td>
                            </tr>
                        </table>
                    </xsl:for-each>
                </body>
            </html>
        </xsl:template>

</xsl:stylesheet>