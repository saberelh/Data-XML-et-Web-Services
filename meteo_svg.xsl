<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg" width="950" height="520" viewBox="0 0 950 520">
            <!-- Fond du graphique -->
            <rect width="100%" height="100%" fill="#F8F9F9"/>
            
            <!-- Titre dynamique récupérant la date de la première mesure -->
            <text x="475" y="40" font-family="Arial" font-size="20" font-weight="bold" text-anchor="middle" fill="#2C3E50">
                Histogramme Animé des Températures (Relevé du : <xsl:value-of select="meteo/mesure[1]/@date"/>)
            </text>
            
            <!-- Axe X (Horizontale) et Axe Y (Verticale) -->
            <line x1="80" y1="420" x2="900" y2="420" stroke="#34495E" stroke-width="3"/>
            <line x1="80" y1="80" x2="80" y2="420" stroke="#34495E" stroke-width="3"/>
            
            <!-- Grille d'arrière-plan et repères de température (Lignes horizontales) -->
            <text x="70" y="425" font-family="Arial" font-size="12" text-anchor="end" fill="#7F8C8D">0°C</text>
            
            <line x1="80" y1="320" x2="900" y2="320" stroke="#BDC3C7" stroke-dasharray="4"/>
            <text x="70" y="325" font-family="Arial" font-size="12" text-anchor="end" fill="#7F8C8D">10°C</text>
            
            <line x1="80" y1="220" x2="900" y2="220" stroke="#BDC3C7" stroke-dasharray="4"/>
            <text x="70" y="225" font-family="Arial" font-size="12" text-anchor="end" fill="#7F8C8D">20°C</text>
            
            <line x1="80" y1="120" x2="900" y2="120" stroke="#BDC3C7" stroke-dasharray="4"/>
            <text x="70" y="125" font-family="Arial" font-size="12" text-anchor="end" fill="#7F8C8D">30°C</text>
            
            <!-- Boucle sur chaque élément <ville> de la première mesure <mesure> -->
            <xsl:for-each select="meteo/mesure[1]/ville">
                <!-- 1. Récupération de l'index de la ville (1, 2, 3...) -->
                <xsl:variable name="i" select="position()"/>
                
                <!-- 2. Extraire la valeur numérique de la température -->
                <xsl:variable name="temp" select="number(@temperature)"/>
                
                <!-- 3. Calcul de la hauteur du rectangle (1°C = 10 pixels) -->
                <xsl:variable name="height" select="$temp * 10"/>
                
                <!-- 4. Calcul de l'abscisse X de chaque barre -->
                <xsl:variable name="x" select="80 + ($i - 1) * 98 + 15"/>
                
                <!-- 5. Calcul de l'ordonnée Y (L'origine 0 de SVG est en haut à gauche) -->
                <xsl:variable name="y" select="420 - $height"/>
                
                <!-- 6. Choix dynamique de la couleur selon la température -->
                <xsl:variable name="color">
                    <xsl:choose>
                        <xsl:when test="$temp &gt;= 25">#E74C3C</xsl:when>
                        <xsl:when test="$temp &gt;= 20">#F39C12</xsl:when>
                        <xsl:otherwise>#3498DB</xsl:otherwise>              <!-- Bleu si < 20°C -->
                    </xsl:choose>
                </xsl:variable>
                
                <!-- Dessin de la barre SVG (<rect>) avec Animation -->
                <rect x="{$x}" y="{$y}" width="60" height="{$height}" fill="{$color}" rx="5">
                    <!-- Animation d'étirement vers le haut -->
                    <animate attributeName="height" from="0" to="{$height}" dur="1.2s" fill="freeze"/>
                    <!-- Animation de déplacement vertical de la ligne de base y=420 vers la position finale y -->
                    <animate attributeName="y" from="420" to="{$y}" dur="1.2s" fill="freeze"/>
                </rect>
                
                <!-- Affichage du texte de la température au-dessus de la barre -->
                <text x="{$x + 30}" y="{$y - 8}" font-family="Arial" font-size="13" font-weight="bold" fill="{$color}" text-anchor="middle">
                    <xsl:value-of select="$temp"/>°C
                    <animate attributeName="opacity" from="0" to="1" dur="1.8s" fill="freeze"/>
                </text>
                
                <!-- Affichage du nom de la ville en dessous de l'axe X -->
                <text x="{$x + 30}" y="445" font-family="Arial" font-size="12" font-weight="bold" fill="#2C3E50" text-anchor="middle">
                    <xsl:value-of select="@nom"/>
                </text>
            </xsl:for-each>
        </svg>
    </xsl:template>
</xsl:stylesheet>