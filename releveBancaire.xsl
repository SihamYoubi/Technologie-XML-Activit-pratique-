<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
    <html>
        <head>
            <title>releve bancaire</title>
        </head>
        <body>
            <h1>Relevé bancaire</h1>
           <ul>
                <li>RIB: <xsl:value-of select="releve/@rib" /></li>
                <li>Date Releve:<xsl:value-of select="releve/dateReleve" /></li>
                <li>Solde: <xsl:value-of select="releve/solde" /></li>
            </ul>
            
            <h2>1. Les données d'un relevé bancaire</h2>
            <table border="1" width="100%">        
                <tr>
                    <th>Type</th>
                    <th>Date</th>
                    <th>Montant</th>
                    <th>Description</th>
                </tr>
                
            <xsl:for-each select="releve/operations/operation">
                <tr>
                    <td><xsl:value-of select="@type" /></td>
                    <td><xsl:value-of select="@date" /></td>
                    <td><xsl:value-of select="@montant" /></td>
                    <td><xsl:value-of select="@description" /></td>
                </tr>             
            </xsl:for-each>
                <tr>
                    <td>Le total des opérations de débit:
                    </td>
                    <td colspan="3" align="center"><xsl:value-of select="sum(releve/operations/operation[@type='debit']/@montant)"/></td>
                </tr>
                
                <tr>
                    <td>Le total des opérations de crédit:
                    </td>
                    <td colspan="3" align="center"><xsl:value-of select="sum(releve/operations/operation[@type='credit']/@montant)"/></td>
                </tr>
            </table>
            
            <h2>2. Les opérations de type CREDIT </h2>
            <table border="1" width="100%">
                <tr>
                <th colspan="3">Type d'opérations: CREDIT</th>
                </tr>
                <tr>
                    <th>Date</th>
                    <th>Montant</th>
                    <th>Description</th>
                </tr>
                <xsl:for-each select="releve/operations/operation[@type='credit']">
                <tr>
                    <td><xsl:value-of select="@date" /></td>
              
                    <td><xsl:value-of select="@montant"/></td>
               
                    <td><xsl:value-of select="@description" /></td>
                </tr>
                </xsl:for-each>
            </table>
        </body>
    </html>
    </xsl:template>
</xsl:stylesheet>