<%@ taglib uri="/WEB-INF/lib/reports_tld.jar" prefix="rw" %> 
<%@ page language="java" import="java.io.*" errorPage="/rwerror.jsp" session="false" %>
<%@ page contentType="text/html;charset=ISO-8859-1" %>
<!--
<rw:report id="report"> 
<rw:objects id="objects">
<?xml version="1.0" encoding="WINDOWS-1252" ?>
<report name="InformationDepartement" DTDVersion="9.0.2.0.10">
  <xmlSettings xmlTag="INFORMATIONDEPARTEMENT" xmlPrologType="text">
  <![CDATA[<?xml version="1.0" encoding="&Encoding"?>]]>
  </xmlSettings>
  <reportHtmlEscapes>
    <beforePageHtmlEscape>
    <![CDATA[#NULL#]]>
    </beforePageHtmlEscape>
  </reportHtmlEscapes>
  <data>
    <systemParameter name="MODE" initialValue="Default" display="yes"/>
    <systemParameter name="ORIENTATION" initialValue="Default" display="yes"/>
    <dataSource name="Q_1">
      <select canParse="no">
      <![CDATA[select distinct nomdepartement,departements.chefdepartement,
       NVL((select emp1.nomemploye from employes emp1 where departements.chefdepartement=emp1.numeroemploye),'-------') "nomChef",
       NVL(count(numeroemploye),0) "nbreEmployes",NVL(sum(salaireemploye),0) "salaireTotal",
       NVL(min(salaireemploye),0) "salaireMinimal",NVL(max(salaireemploye),0)"salaireMaximal",
       NVL(avg(salaireemploye),0) "salaireMoyen"
from departements,employes
where departements.numerodepartement=employes.numerodepartement(+)
group by  departements.numerodepartement,nomdepartement,departements.chefdepartement
order by nomdepartement;]]>
      </select>
      <displayInfo x="1.65002" y="1.00000" width="0.69995" height="0.19995"/>
      <group name="G_1">
        <displayInfo x="1.12097" y="1.94995" width="1.75818" height="1.62695"
        />
        <dataItem name="NOMDEPARTEMENT" datatype="vchar2" columnOrder="11"
         width="30" defaultWidth="100000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Nom département">
          <dataDescriptor expression="NOMDEPARTEMENT"
           descriptiveExpression="NOMDEPARTEMENT" order="1" width="30"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="CHEFDEPARTEMENT" oracleDatatype="number"
         columnOrder="12" width="22" defaultWidth="110000"
         defaultHeight="10000" columnFlags="33"
         defaultLabel="Numéro chef département">
          <dataDescriptor expression="CHEFDEPARTEMENT"
           descriptiveExpression="CHEFDEPARTEMENT" order="2" width="22"
           precision="9"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="nomChef" datatype="vchar2" columnOrder="13" width="20"
         defaultWidth="100000" defaultHeight="10000" columnFlags="33"
         defaultLabel="Nom chef département">
          <dataDescriptor expression="nomChef" descriptiveExpression="nomChef"
           order="3" width="20"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="nbreEmployes" oracleDatatype="number" columnOrder="14"
         width="22" defaultWidth="90000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Nbreemployes">
          <dataDescriptor expression="nbreEmployes"
           descriptiveExpression="nbreEmployes" order="4" width="22"
           precision="38"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="salaireTotal" oracleDatatype="number" columnOrder="15"
         width="22" defaultWidth="90000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Salairetotal">
          <dataDescriptor expression="salaireTotal"
           descriptiveExpression="salaireTotal" order="5" width="22"
           precision="38"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="salaireMinimal" oracleDatatype="number"
         columnOrder="16" width="22" defaultWidth="90000"
         defaultHeight="10000" columnFlags="33" defaultLabel="Salaireminimal">
          <dataDescriptor expression="salaireMinimal"
           descriptiveExpression="salaireMinimal" order="6" width="22"
           precision="38"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="salaireMaximal" oracleDatatype="number"
         columnOrder="17" width="22" defaultWidth="90000"
         defaultHeight="10000" columnFlags="33" defaultLabel="Salairemaximal">
          <dataDescriptor expression="salaireMaximal"
           descriptiveExpression="salaireMaximal" order="7" width="22"
           precision="38"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="salaireMoyen" oracleDatatype="number" columnOrder="18"
         width="22" defaultWidth="90000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Salairemoyen">
          <dataDescriptor expression="salaireMoyen"
           descriptiveExpression="salaireMoyen" order="8" width="22"
           precision="38"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
      </group>
    </dataSource>
    <summary name="MinsalaireMinimalPerReport" source="salaireMinimal"
     function="minimum" width="22" precision="38" reset="report"
     compute="report" defaultWidth="90000" defaultHeight="10000"
     columnFlags="552" defaultLabel="Minimum :">
      <displayInfo x="0.00000" y="0.00000" width="0.79993" height="0.19995"/>
    </summary>
    <summary name="CountnbreEmployesPerReport" source="nbreEmployes"
     function="count" precision="8" reset="report" compute="report"
     defaultWidth="100000" defaultHeight="10000" columnFlags="552"
     defaultLabel="Décompte :">
      <displayInfo x="0.79993" y="0.00000" width="0.79993" height="0.19995"/>
    </summary>
    <summary name="SumsalaireTotalPerReport" source="salaireTotal"
     function="sum" width="22" precision="38" reset="report" compute="report"
     defaultWidth="90000" defaultHeight="10000" columnFlags="552"
     defaultLabel="Total :">
      <displayInfo x="1.59985" y="0.00000" width="0.79993" height="0.19995"/>
    </summary>
    <summary name="AvgsalaireMoyenPerReport" source="salaireMoyen"
     function="average" width="22" precision="38" reset="report"
     compute="report" defaultWidth="90000" defaultHeight="10000"
     columnFlags="552" defaultLabel="Moyenne :">
      <displayInfo x="2.39978" y="0.00000" width="0.79993" height="0.19995"/>
    </summary>
    <summary name="SumnbreEmployesPerReport" source="nbreEmployes"
     function="sum" width="22" precision="38" reset="report" compute="report"
     defaultWidth="90000" defaultHeight="10000" columnFlags="552"
     defaultLabel="Total :">
      <displayInfo x="3.19971" y="0.00000" width="0.79993" height="0.19995"/>
    </summary>
    <summary name="MaxsalaireMaximalPerReport" source="salaireMaximal"
     function="maximum" width="22" precision="38" reset="report"
     compute="report" defaultWidth="90000" defaultHeight="10000"
     columnFlags="552" defaultLabel="Maximum :">
      <displayInfo x="3.99963" y="0.00000" width="0.79993" height="0.19995"/>
    </summary>
  </data>
  <layout>
  <section name="main">
    <body>
      <frame name="M_G_1_GRPFR">
        <geometryInfo x="0.00000" y="0.00000" width="7.43750" height="2.81128"
        />
        <generalLayout verticalElasticity="variable"/>
        <repeatingFrame name="R_G_1" source="G_1" printDirection="down"
         minWidowRecords="1" columnMode="no">
          <geometryInfo x="0.00000" y="0.50000" width="7.43750"
           height="0.18750"/>
          <generalLayout verticalElasticity="expand"/>
          <field name="F_NOMDEPARTEMENT" source="NOMDEPARTEMENT"
           minWidowLines="1" spacing="0" alignment="start">
            <font face="Courier New" size="10" bold="yes"/>
            <geometryInfo x="0.00000" y="0.50000" width="1.68750"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_nomChef" source="nomChef" minWidowLines="1"
           spacing="0" alignment="start">
            <font face="Courier New" size="9"/>
            <geometryInfo x="1.75000" y="0.50000" width="0.93750"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_nbreEmployes" source="nbreEmployes" minWidowLines="1"
           spacing="0" alignment="center">
            <font face="Courier New" size="9" bold="yes"/>
            <geometryInfo x="2.75000" y="0.50000" width="0.81250"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_salaireTotal" source="salaireTotal" minWidowLines="1"
           formatMask="NNN,NN0.NN" spacing="0" alignment="center">
            <font face="Courier New" size="9"/>
            <geometryInfo x="3.56250" y="0.50000" width="0.93750"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_salaireMinimal" source="salaireMinimal"
           minWidowLines="1" formatMask="NNN,NN0.NN" spacing="0"
           alignment="center">
            <font face="Courier New" size="9"/>
            <geometryInfo x="4.68750" y="0.50000" width="0.93750"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_salaireMaximal" source="salaireMaximal"
           minWidowLines="1" formatMask="NNN,NN0.NN" spacing="0"
           alignment="center">
            <font face="Courier New" size="9"/>
            <geometryInfo x="5.68750" y="0.50000" width="0.87500"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_salaireMoyen" source="salaireMoyen" minWidowLines="1"
           formatMask="NNN,NN0.NN" spacing="0" alignment="center">
            <font face="Courier New" size="9"/>
            <geometryInfo x="6.62500" y="0.50000" width="0.81250"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
        </repeatingFrame>
        <frame name="M_G_1_FTR">
          <geometryInfo x="0.00000" y="0.75000" width="7.43750"
           height="1.68628"/>
          <advancedLayout printObjectOnPage="lastPage"
           basePrintingOn="anchoringObject"/>
          <field name="F_SumnbreEmployesPerReport"
           source="SumnbreEmployesPerReport" minWidowLines="1" spacing="0"
           alignment="center">
            <font face="Courier New" size="10" bold="yes"/>
            <geometryInfo x="3.00000" y="1.06250" width="0.43750"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <text name="B_Total_1" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="0.00000" y="1.31250" width="3.62500"
             height="0.18750"/>
            <textSegment>
              <font face="Courier New" size="9" bold="yes" italic="yes"/>
              <string>
              <![CDATA[Total de tous les salaires de la société : ......]]>
              </string>
            </textSegment>
          </text>
          <text name="B_Total_2" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="0.00000" y="1.56250" width="4.75000"
             height="0.25000"/>
            <textSegment>
              <font face="Courier New" size="9" bold="yes" italic="yes"
               textColor="r0g0b50"/>
              <string>
              <![CDATA[Le salaire minimal de la société : .............................]]>
              </string>
            </textSegment>
          </text>
          <text name="B_Total_3" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="0.00000" y="1.81250" width="5.62500"
             height="0.25000"/>
            <textSegment>
              <font face="Courier New" size="9" bold="yes" italic="yes"/>
              <string>
              <![CDATA[Le salaire maximal de la société : ..........................................]]>
              </string>
            </textSegment>
          </text>
          <text name="B_Total_4" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="0.00000" y="2.06250" width="6.56250"
             height="0.25000"/>
            <textSegment>
              <font face="Courier New" size="9" bold="yes" italic="yes"
               textColor="r0g0b50"/>
              <string>
              <![CDATA[Le salaire moyen de la société : .........................................................]]>
              </string>
            </textSegment>
          </text>
          <field name="F_SumsalaireTotalPerReport"
           source="SumsalaireTotalPerReport" minWidowLines="1"
           formatMask="NNN,NN0.NN" spacing="0" alignment="start">
            <font face="Courier New" size="10" bold="yes"/>
            <geometryInfo x="3.62500" y="1.31250" width="1.12500"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_MinsalaireMinimalPerReport"
           source="MinsalaireMinimalPerReport" minWidowLines="1"
           formatMask="NNN,NN0.NN" spacing="0" alignment="start">
            <font face="Courier New" size="10" bold="yes"/>
            <geometryInfo x="4.75000" y="1.56250" width="0.87500"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_MaxsalaireMaximalPerReport"
           source="MaxsalaireMaximalPerReport" minWidowLines="1"
           formatMask="NNN,NN0.NN" spacing="0" alignment="start">
            <font face="Courier New" size="10" bold="yes"/>
            <geometryInfo x="5.62500" y="1.81250" width="0.93750"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_AvgsalaireMoyenPerReport"
           source="AvgsalaireMoyenPerReport" minWidowLines="1"
           formatMask="NNN,NN0.NN" spacing="0" alignment="start">
            <font face="Courier New" size="10" bold="yes"/>
            <geometryInfo x="6.56250" y="2.06250" width="0.87500"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <text name="B_Total_" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="0.00000" y="1.06250" width="3.00000"
             height="0.25000"/>
            <textSegment>
              <font face="Courier New" size="9" bold="yes" italic="yes"
               textColor="r0g0b50"/>
              <string>
              <![CDATA[Nombre d'employés de la société : ......]]>
              </string>
            </textSegment>
          </text>
          <line name="B_2" arrow="none">
            <geometryInfo x="0.00000" y="0.81250" width="7.43750"
             height="0.00000"/>
            <visualSettings fillPattern="transparent" linePattern="solid"
             lineForegroundColor="r0g0b50"/>
            <points>
              <point x="0.00000" y="0.81250"/>
              <point x="7.43750" y="0.81250"/>
            </points>
          </line>
          <frame name="M_1">
            <geometryInfo x="0.00000" y="0.87500" width="7.43750"
             height="1.50000"/>
            <visualSettings linePattern="solid" lineForegroundColor="r0g0b50"
             dash="longDash" hideLeftBorder="yes" hideRightBorder="yes"/>
          </frame>
        </frame>
        <frame name="M_G_1_HDR">
          <geometryInfo x="0.00000" y="0.00000" width="7.43750"
           height="0.50000"/>
          <advancedLayout printObjectOnPage="allPage"
           basePrintingOn="anchoringObject"/>
          <text name="B_NOMDEPARTEMENT" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="0.00000" y="0.06250" width="1.68750"
             height="0.43750"/>
            <textSegment>
              <font face="Courier New" size="11" bold="yes"
               textColor="r0g0b50"/>
              <string>
              <![CDATA[Nom du département]]>
              </string>
            </textSegment>
          </text>
          <text name="B_nomChef" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="1.75000" y="0.00000" width="0.93750"
             height="0.37500"/>
            <textSegment>
              <font face="Courier New" size="9" bold="yes" textColor="r0g0b50"
              />
              <string>
              <![CDATA[Nom chef du
]]>
              </string>
            </textSegment>
            <textSegment>
              <font face="Courier New" size="9" bold="yes" textColor="r0g0b50"
              />
              <string>
              <![CDATA[département]]>
              </string>
            </textSegment>
          </text>
          <text name="B_nbreEmployes" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="2.75000" y="0.00000" width="0.81250"
             height="0.50000"/>
            <textSegment>
              <font face="Courier New" size="9" bold="yes" textColor="r0g0b50"
              />
              <string>
              <![CDATA[Nombre 
]]>
              </string>
            </textSegment>
            <textSegment>
              <font face="Courier New" size="9" bold="yes" textColor="r0g0b50"
              />
              <string>
              <![CDATA[d'employes]]>
              </string>
            </textSegment>
          </text>
          <text name="B_salaireTotal" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="3.56250" y="0.00000" width="0.93750"
             height="0.50000"/>
            <textSegment>
              <font face="Courier New" size="9" bold="yes" textColor="r0g0b50"
              />
              <string>
              <![CDATA[Salaire
]]>
              </string>
            </textSegment>
            <textSegment>
              <font face="Courier New" size="9" bold="yes" textColor="r0g0b50"
              />
              <string>
              <![CDATA[total]]>
              </string>
            </textSegment>
          </text>
          <text name="B_salaireMinimal" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="4.68750" y="0.00000" width="0.93750"
             height="0.50000"/>
            <textSegment>
              <font face="Courier New" size="9" bold="yes" textColor="r0g0b50"
              />
              <string>
              <![CDATA[Salaire
]]>
              </string>
            </textSegment>
            <textSegment>
              <font face="Courier New" size="9" bold="yes" textColor="r0g0b50"
              />
              <string>
              <![CDATA[minimal]]>
              </string>
            </textSegment>
          </text>
          <text name="B_salaireMaximal" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="5.68750" y="0.00000" width="0.87500"
             height="0.50000"/>
            <textSegment>
              <font face="Courier New" size="9" bold="yes" textColor="r0g0b50"
              />
              <string>
              <![CDATA[Salaire
]]>
              </string>
            </textSegment>
            <textSegment>
              <font face="Courier New" size="9" bold="yes" textColor="r0g0b50"
              />
              <string>
              <![CDATA[maximal]]>
              </string>
            </textSegment>
          </text>
          <text name="B_salaireMoyen" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="6.68750" y="0.00000" width="0.75000"
             height="0.50000"/>
            <textSegment>
              <font face="Courier New" size="9" bold="yes" textColor="r0g0b50"
              />
              <string>
              <![CDATA[Salaire
]]>
              </string>
            </textSegment>
            <textSegment>
              <font face="Courier New" size="9" bold="yes" textColor="r0g0b50"
              />
              <string>
              <![CDATA[moyen]]>
              </string>
            </textSegment>
          </text>
          <line name="B_1" arrow="none">
            <geometryInfo x="0.00000" y="0.37500" width="7.43750"
             height="0.00000"/>
            <visualSettings fillPattern="transparent" linePattern="solid"
             lineForegroundColor="r0g0b50"/>
            <points>
              <point x="0.00000" y="0.37500"/>
              <point x="7.43750" y="0.37500"/>
            </points>
          </line>
        </frame>
      </frame>
    </body>
    <margin>
      <text name="B_OR$BODY_SECTION" minWidowLines="1">
        <textSettings justify="center" spacing="0"/>
        <geometryInfo x="1.25000" y="0.25000" width="5.50000" height="0.31250"
        />
        <textSegment>
          <font face="Courier New" size="20" bold="yes" underline="yes"
           textColor="r0g0b100"/>
          <string>
          <![CDATA[Informations sur les départements]]>
          </string>
        </textSegment>
      </text>
      <text name="B_PAGENUM1" minWidowLines="1">
        <textSettings justify="center" spacing="0"/>
        <geometryInfo x="2.53638" y="10.52087" width="2.55212"
         height="0.16663"/>
        <textSegment>
          <font face="Courier New" size="9" bold="yes" italic="yes"/>
          <string>
          <![CDATA[Page &<PageNumber> de &<TotalPages>]]>
          </string>
        </textSegment>
      </text>
      <field name="F_DATE1" source="CurrentDate" minWidowLines="1"
       formatMask="DD/MM/RRRR" spacing="0" alignment="center">
        <font face="Courier New" size="9" bold="yes"/>
        <geometryInfo x="7.62500" y="0.06250" width="0.97913" height="0.18750"
        />
        <generalLayout horizontalElasticity="variable"/>
      </field>
      <text name="B_3" minWidowLines="1">
        <textSettings spacing="0"/>
        <geometryInfo x="7.06250" y="0.06250" width="0.43750" height="0.18750"
        />
        <textSegment>
          <font face="Courier New" size="9" bold="yes"/>
          <string>
          <![CDATA[Date :]]>
          </string>
        </textSegment>
      </text>
      <line name="B_4" arrow="none">
        <geometryInfo x="7.06250" y="0.25000" width="1.31250" height="0.00000"
        />
        <advancedLayout printObjectOnPage="allPage"
         basePrintingOn="anchoringObject"/>
        <visualSettings fillPattern="transparent" linePattern="solid"/>
        <points>
          <point x="7.06250" y="0.25000"/>
          <point x="8.37500" y="0.25000"/>
        </points>
      </line>
    </margin>
  </section>
  </layout>
  <reportPrivate defaultReportType="tabular" versionFlags2="0" templateName=""
   sectionTitle="Informations sur les départements"/>
  <reportWebSettings>
  <![CDATA[#NULL#]]>
  </reportWebSettings>
</report>
</rw:objects>
-->

<html>

<head>
<meta name="GENERATOR" content="Oracle 11gR1 Reports Developer"/>
<title> Your Title </title>



</head>


<body>

<!-- Data Area Generated by Reports Developer -->
<rw:dataArea id="MG1GRPFR126">
<table>
<caption> Informations sur les départements </caption>
 <!-- Header -->
 <thead>
  <tr>
   <th <rw:id id="HBNOMDEPARTEMENT126" asArray="no"/>> Nom
département </th>
   <th <rw:id id="HBCHEFDEPARTEMENT126" asArray="no"/>> Numéro chef
département </th>
   <th <rw:id id="HBnomChef126" asArray="no"/>> Nom chef
département </th>
   <th <rw:id id="HBnbreEmployes126" asArray="no"/>> Nbreemployes </th>
   <th <rw:id id="HBsalaireTotal126" asArray="no"/>> Salairetotal </th>
   <th <rw:id id="HBsalaireMinimal126" asArray="no"/>> Salaireminimal </th>
   <th <rw:id id="HBsalaireMaximal126" asArray="no"/>> Salairemaximal </th>
   <th <rw:id id="HBsalaireMoyen126" asArray="no"/>> Salairemoyen </th>
  </tr>
 </thead>
 <!-- Body -->
 <tbody>
  <rw:foreach id="RG11261" src="G_1">
   <tr>
    <td <rw:headers id="HFNOMDEPARTEMENT126" src="HBNOMDEPARTEMENT126"/>><rw:field id="FNOMDEPARTEMENT126" src="NOMDEPARTEMENT" nullValue="&nbsp;"> F_NOMDEPARTEMENT </rw:field></td>
    <td <rw:headers id="HFCHEFDEPARTEMENT126" src="HBCHEFDEPARTEMENT126"/>><rw:field id="FCHEFDEPARTEMENT126" src="CHEFDEPARTEMENT" nullValue="&nbsp;"> F_CHEFDEPARTEMENT </rw:field></td>
    <td <rw:headers id="HFnomChef126" src="HBnomChef126"/>><rw:field id="FnomChef126" src="nomChef" nullValue="&nbsp;"> F_nomChef </rw:field></td>
    <td <rw:headers id="HFnbreEmployes126" src="HBnbreEmployes126"/>><rw:field id="FnbreEmployes126" src="nbreEmployes" nullValue="&nbsp;"> F_nbreEmployes </rw:field></td>
    <td <rw:headers id="HFsalaireTotal126" src="HBsalaireTotal126"/>><rw:field id="FsalaireTotal126" src="salaireTotal" nullValue="&nbsp;"> F_salaireTotal </rw:field></td>
    <td <rw:headers id="HFsalaireMinimal126" src="HBsalaireMinimal126"/>><rw:field id="FsalaireMinimal126" src="salaireMinimal" nullValue="&nbsp;"> F_salaireMinimal </rw:field></td>
    <td <rw:headers id="HFsalaireMaximal126" src="HBsalaireMaximal126"/>><rw:field id="FsalaireMaximal126" src="salaireMaximal" nullValue="&nbsp;"> F_salaireMaximal </rw:field></td>
    <td <rw:headers id="HFsalaireMoyen126" src="HBsalaireMoyen126"/>><rw:field id="FsalaireMoyen126" src="salaireMoyen" nullValue="&nbsp;"> F_salaireMoyen </rw:field></td>
   </tr>
  </rw:foreach>
 </tbody>
 <!-- Report Level Summary -->
 <tr>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
  <td <rw:headers id="HFSumnbreEmployesPerReport126" src="HBnbreEmployes126"/>>Total : <rw:field id="FSumnbreEmployesPerReport126" src="SumnbreEmployesPerReport" nullValue="&nbsp;"> F_SumnbreEmployesPerReport </rw:field></td>
  <td <rw:headers id="HFSumsalaireTotalPerReport126" src="HBsalaireTotal126"/>>Total : <rw:field id="FSumsalaireTotalPerReport126" src="SumsalaireTotalPerReport" nullValue="&nbsp;"> F_SumsalaireTotalPerReport </rw:field></td>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
 </tr>
 <tr>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
  <td <rw:headers id="HFAvgsalaireMoyenPerReport126" src="HBsalaireMoyen126"/>>Moyenne : <rw:field id="FAvgsalaireMoyenPerReport126" src="AvgsalaireMoyenPerReport" nullValue="&nbsp;"> F_AvgsalaireMoyenPerReport </rw:field></td>
 </tr>
 <tr>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
  <td <rw:headers id="HFMinsalaireMinimalPerReport126" src="HBsalaireMinimal126"/>>Minimum : <rw:field id="FMinsalaireMinimalPerReport126" src="MinsalaireMinimalPerReport" nullValue="&nbsp;"> F_MinsalaireMinimalPerReport </rw:field></td>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
 </tr>
 <tr>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
  <td <rw:headers id="HFMaxsalaireMaximalPerReport126" src="HBsalaireMaximal126"/>>Maximum : <rw:field id="FMaxsalaireMaximalPerReport126" src="MaxsalaireMaximalPerReport" nullValue="&nbsp;"> F_MaxsalaireMaximalPerReport </rw:field></td>
  <th> &nbsp; </th>
 </tr>
 <tr>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
  <td <rw:headers id="HFCountnbreEmployesPerReport126" src="HBnbreEmployes126"/>>Décompte : <rw:field id="FCountnbreEmployesPerReport126" src="CountnbreEmployesPerReport" nullValue="&nbsp;"> F_CountnbreEmployesPerReport </rw:field></td>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
  <th> &nbsp; </th>
 </tr>
</table>
</rw:dataArea> <!-- id="MG1GRPFR126" -->
<!-- End of Data Area Generated by Reports Developer -->




</body>
</html>

<!--
</rw:report> 
-->
