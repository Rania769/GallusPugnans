<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
    <xsl:text>\documentclass[12pt]{book}
        \usepackage{xunicode}
        \usepackage{polyglossia}
	    \setmainlanguage {french}
    		\setotherlanguage{latin}
    		\renewenvironment{latin}
    	{\begin{hyphenrules}{latin}}
    	{\end{hyphenrules}}
        \usepackage{hyperref}
        \usepackage[noend,series={A,B},noeledsec, noledgroup]{reledmac}
            \Xarrangement[A]{paragraph}
        \usepackage{reledpar}
        \usepackage {lineno}
        \usepackage[a4paper]{geometry}
	       \geometry{margin=3.5cm}
	    \usepackage[onehalfspacing]{setspace}

        \begin{document}
        \title{</xsl:text><xsl:value-of select="//titleStmt/title"/><xsl:text> tiré de </xsl:text><xsl:value-of select="//sourceDesc/bibl/author"/><xsl:text>, \textit{</xsl:text><xsl:value-of select="//sourceDesc/bibl/title"/><xsl:text>}, </xsl:text><xsl:value-of select="//sourceDesc/bibl/date"/><xsl:text>}
        \author{Atelier de traduction du Groupe de théâtre antique\\
            Université de Neuchâtel, CLAM\\
            C. Aeby, N. Aeby, M. Cario, M. Durham,\\ 
            P. Jacsont, S. Moy, I. Muminovic, É. Paupe,\\
            J. Rafael Ribeiro da Silva, R. Richard. P. Schwab}
        \date{Semestre de printemps 2020}
        
        \maketitle
        \begin{pages}
        \begin{latin}
        \begin{Leftside}
        \beginnumbering 
            </xsl:text>
                <xsl:apply-templates select="//div[@type='source']"/>
            <xsl:text> 
        \endnumbering
        \end{Leftside}
        \end{latin}

        \begin{Rightside}
        \beginnumbering
            </xsl:text>
                <xsl:apply-templates select="//div[@type='traduction']"/>
            <xsl:text>
        \endnumbering
        \end{Rightside}
        \end{pages}
        \Pages
        \end{document}
    </xsl:text>
    </xsl:template>
    

    
    <xsl:template match="head">
        <xsl:text>\pstart\section*{</xsl:text><xsl:apply-templates/><xsl:text>}\pend</xsl:text>
    </xsl:template>
    
    <xsl:template match="note">
        <xsl:text>\footnote{</xsl:text><xsl:value-of select="."/><xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="stage">
        <xsl:text>\pstart\subsection*{</xsl:text><xsl:value-of select="."/><xsl:text>}\pend</xsl:text>
    </xsl:template>
    
    <xsl:template match="sp">
        <xsl:text>\pstart</xsl:text><xsl:apply-templates/><xsl:text>\pend</xsl:text>
    </xsl:template>
    
    <xsl:template match="speaker">
        <xsl:text>\textbf{</xsl:text><xsl:value-of select="."/><xsl:text>}\hspace{1cm} </xsl:text>
    </xsl:template>
    
    <xsl:template match="app">
        <xsl:text>\edtext{</xsl:text><xsl:value-of select="lem"/><xsl:text>}{\Afootnote{</xsl:text><xsl:value-of select="rdg"/><xsl:text>}}</xsl:text>
    </xsl:template>
    
    <xsl:template match="text()">
        <xsl:value-of select="replace(., '&amp;', '﻿\\ampersand\\')"/>
    </xsl:template>
    

</xsl:stylesheet>
