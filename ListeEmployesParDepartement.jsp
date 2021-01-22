<%@ taglib uri="/WEB-INF/lib/reports_tld.jar" prefix="rw" %> 
<%@ page language="java" import="java.io.*" errorPage="/rwerror.jsp" session="false" %>
<%@ page contentType="text/html;charset=ISO-8859-1" %>
<!--
<rw:report id="report"> 
<rw:objects id="objects">
<?xml version="1.0" encoding="WINDOWS-1252" ?>
<report name="ListeEmployesParDepartement" DTDVersion="9.0.2.0.10">
  <xmlSettings xmlTag="LISTEEMPLOYESPARDEPARTEMENT" xmlPrologType="text">
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
      <![CDATA[select (departements.numerodepartement) ,(departements.nomdepartement),
       NVL(departements.localdepartement,'-----') "localdepartement",NVL(departements.chefdepartement,0) "chefdepartement",
       NVL(TO_CHAR(departements.datecreationdepartement),'NA') "datecreationdepartement",employes.numeroemploye "numeroemploye",
       NVL(employes.nomemploye,'-----') "nomemploye",NVL(employes.prenomemploye,'-----') "prenomemploye",
       NVL(employes.posteemploye,'-----') "posteemploye",NVL(employes.salaireemploye,0)"salaireemploye" ,NVL(TO_CHAR(employes.dateembaucheemploye),'NA') "dateembaucheemploye",
       nvl((select emp1.nomemploye from employes emp1 where emp1.numeroemploye=employes.superieuremploye),'-----')  "nomSuperieur"
from departements,employes
where
departements.numerodepartement=employes.numerodepartement(+)  
order by nomdepartement,nomemploye;]]>
      </select>
      <displayInfo x="1.65002" y="1.00000" width="0.69995" height="0.19995"/>
      <group name="G_2">
        <displayInfo x="0.57166" y="1.94995" width="2.85681" height="1.45605"
        />
        <dataItem name="NUMERODEPARTEMENT" datatype="vchar2" columnOrder="11"
         width="6" defaultWidth="60000" defaultHeight="10000" columnFlags="32"
         defaultLabel="Numéro département" breakOrder="none">
          <dataDescriptor expression="NUMERODEPARTEMENT"
           descriptiveExpression="NUMERODEPARTEMENT" order="1" width="6"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="NOMDEPARTEMENT" datatype="vchar2" columnOrder="12"
         width="30" defaultWidth="100000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Nom département">
          <dataDescriptor expression="NOMDEPARTEMENT"
           descriptiveExpression="NOMDEPARTEMENT" order="2" width="30"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="localdepartement" datatype="vchar2" columnOrder="13"
         width="30" defaultWidth="100000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Local du département">
          <dataDescriptor expression="localdepartement"
           descriptiveExpression="localdepartement" order="3" width="30"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="chefdepartement" oracleDatatype="number"
         columnOrder="14" width="22" defaultWidth="90000"
         defaultHeight="10000" columnFlags="33"
         defaultLabel="Numéro chef du département">
          <dataDescriptor expression="chefdepartement"
           descriptiveExpression="chefdepartement" order="4"
           oracleDatatype="number" width="22" precision="38"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="datecreationdepartement" datatype="vchar2"
         columnOrder="15" width="8" defaultWidth="80000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Date de création du département">
          <dataDescriptor expression="datecreationdepartement"
           descriptiveExpression="datecreationdepartement" order="5" width="8"
          />
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <summary name="SumsalaireemployePerNUMERODEPA" source="salaireemploye"
         function="sum" width="22" precision="38" reset="G_2" compute="report"
         defaultWidth="90000" defaultHeight="10000" columnFlags="552"
         defaultLabel="Total :">
          <displayInfo x="0.00000" y="0.00000" width="0.00000"
           height="0.00000"/>
        </summary>
        <summary name="CountnumeroemployePerNUMERODEP" source="numeroemploye"
         function="count" precision="8" reset="G_2" compute="report"
         defaultWidth="100000" defaultHeight="10000" columnFlags="552"
         defaultLabel="Décompte :">
          <displayInfo x="0.00000" y="0.00000" width="0.00000"
           height="0.00000"/>
        </summary>
      </group>
      <group name="G_1">
        <displayInfo x="0.97449" y="4.21924" width="2.05115" height="1.45605"
        />
        <dataItem name="numeroemploye" oracleDatatype="number"
         columnOrder="16" width="22" defaultWidth="90000"
         defaultHeight="10000" columnFlags="32" defaultLabel="Numéro employé"
         breakOrder="none">
          <dataDescriptor expression="numeroemploye"
           descriptiveExpression="numeroemploye" order="6"
           oracleDatatype="number" width="22" precision="9"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="nomemploye" datatype="vchar2" columnOrder="17"
         width="20" defaultWidth="100000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Nom employé">
          <dataDescriptor expression="nomemploye"
           descriptiveExpression="nomemploye" order="7" width="20"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="prenomemploye" datatype="vchar2" columnOrder="18"
         width="20" defaultWidth="100000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Prenom employé">
          <dataDescriptor expression="prenomemploye"
           descriptiveExpression="prenomemploye" order="8" width="20"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="posteemploye" datatype="vchar2" columnOrder="19"
         width="20" defaultWidth="100000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Poste employé">
          <dataDescriptor expression="posteemploye"
           descriptiveExpression="posteemploye" order="9" width="20"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="salaireemploye" oracleDatatype="number"
         columnOrder="20" width="22" defaultWidth="90000"
         defaultHeight="10000" columnFlags="33" defaultLabel="Salaire employé">
          <dataDescriptor expression="salaireemploye"
           descriptiveExpression="salaireemploye" order="10"
           oracleDatatype="number" width="22" precision="38"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="dateembaucheemploye" datatype="vchar2"
         columnOrder="21" width="8" defaultWidth="80000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Date d&apos;embauche employé">
          <dataDescriptor expression="dateembaucheemploye"
           descriptiveExpression="dateembaucheemploye" order="11" width="8"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="nomSuperieur" datatype="vchar2" columnOrder="22"
         width="20" defaultWidth="100000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Nom du supérieur">
          <dataDescriptor expression="nomSuperieur"
           descriptiveExpression="nomSuperieur" order="12" width="20"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
      </group>
    </dataSource>
    <summary name="SumsalaireemployePerReport" source="salaireemploye"
     function="sum" width="22" precision="38" reset="report" compute="report"
     defaultWidth="90000" defaultHeight="10000" columnFlags="552"
     defaultLabel="Total :">
      <displayInfo x="0.00000" y="0.00000" width="0.79993" height="0.19995"/>
    </summary>
    <summary name="CountnumeroemployePerReport" source="numeroemploye"
     function="count" precision="8" reset="report" compute="report"
     defaultWidth="100000" defaultHeight="10000" columnFlags="552"
     defaultLabel="Décompte :">
      <displayInfo x="0.79993" y="0.00000" width="0.79993" height="0.19995"/>
    </summary>
  </data>
  <layout>
  <section name="main">
    <body>
      <location y="1.25000"/>
      <frame name="M_G_2_GRPFR">
        <geometryInfo x="0.00000" y="0.00000" width="7.50000" height="3.43872"
        />
        <generalLayout verticalElasticity="variable"/>
        <repeatingFrame name="R_G_2" source="G_2" printDirection="down"
         minWidowRecords="1" columnMode="no">
          <geometryInfo x="0.00000" y="0.00000" width="7.50000"
           height="2.68872"/>
          <generalLayout verticalElasticity="variable"/>
          <field name="F_NUMERODEPARTEMENT" source="NUMERODEPARTEMENT"
           minWidowLines="1" spacing="0" alignment="start">
            <font face="Courier New" size="11" bold="yes"/>
            <geometryInfo x="0.00000" y="0.43750" width="0.62500"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
          </field>
          <frame name="M_G_1_GRPFR">
            <geometryInfo x="0.00000" y="0.62500" width="7.50000"
             height="2.06372"/>
            <generalLayout verticalElasticity="variable"/>
            <repeatingFrame name="R_G_1" source="G_1" printDirection="down"
             minWidowRecords="1" columnMode="no">
              <geometryInfo x="0.00000" y="1.25000" width="7.50000"
               height="0.18750"/>
              <generalLayout verticalElasticity="expand"/>
              <field name="F_numeroemploye" source="numeroemploye"
               minWidowLines="1" spacing="0" alignment="center">
                <font face="Courier New" size="10" bold="yes" italic="yes"/>
                <geometryInfo x="0.00000" y="1.25000" width="0.75000"
                 height="0.18750"/>
                <generalLayout verticalElasticity="expand"/>
              </field>
              <field name="F_nomemploye" source="nomemploye" minWidowLines="1"
               spacing="0" alignment="start">
                <font face="Courier New" size="10" italic="yes"/>
                <geometryInfo x="0.75000" y="1.25000" width="0.93750"
                 height="0.18750"/>
                <generalLayout verticalElasticity="expand"/>
              </field>
              <field name="F_prenomemploye" source="prenomemploye"
               minWidowLines="1" spacing="0" alignment="start">
                <font face="Courier New" size="10" italic="yes"/>
                <geometryInfo x="1.68750" y="1.25000" width="0.68750"
                 height="0.18750"/>
                <generalLayout verticalElasticity="expand"/>
              </field>
              <field name="F_posteemploye" source="posteemploye"
               minWidowLines="1" spacing="0" alignment="start">
                <font face="Courier New" size="10" italic="yes"/>
                <geometryInfo x="2.87500" y="1.25000" width="1.75000"
                 height="0.18750"/>
                <generalLayout verticalElasticity="expand"/>
              </field>
              <field name="F_salaireemploye" source="salaireemploye"
               minWidowLines="1" formatMask="NNNGNN0.NNN" spacing="0"
               alignment="center">
                <font face="Courier New" size="10" italic="yes"/>
                <geometryInfo x="4.68750" y="1.25000" width="1.12500"
                 height="0.18750"/>
                <generalLayout verticalElasticity="expand"/>
              </field>
              <field name="F_dateembaucheemploye" source="dateembaucheemploye"
               minWidowLines="1" spacing="0" alignment="center">
                <font face="Courier New" size="10" italic="yes"/>
                <geometryInfo x="5.93750" y="1.25000" width="0.81250"
                 height="0.18750"/>
                <generalLayout verticalElasticity="expand"/>
              </field>
              <field name="F_nomSuperieur" source="nomSuperieur"
               minWidowLines="1" spacing="0" alignment="center">
                <font face="Courier New" size="10" bold="yes" italic="yes"/>
                <geometryInfo x="6.75000" y="1.25000" width="0.75000"
                 height="0.18750"/>
                <generalLayout verticalElasticity="expand"/>
              </field>
            </repeatingFrame>
            <frame name="M_G_1_FTR">
              <geometryInfo x="0.00000" y="1.43750" width="7.43750"
               height="1.25000"/>
              <advancedLayout printObjectOnPage="lastPage"
               basePrintingOn="anchoringObject"/>
              <field name="F_SumsalaireemployePerNUMERODE"
               source="SumsalaireemployePerNUMERODEPA" minWidowLines="1"
               formatMask="NNNGNN0.NN" spacing="0" alignment="start">
                <font face="Courier New" size="11" bold="yes"/>
                <geometryInfo x="4.75000" y="1.62500" width="1.25000"
                 height="0.18750"/>
                <generalLayout verticalElasticity="expand"/>
              </field>
              <text name="B_Total_" minWidowLines="1">
                <textSettings spacing="0"/>
                <geometryInfo x="0.12500" y="1.62500" width="2.62500"
                 height="0.18750"/>
                <textSegment>
                  <font face="Courier New" size="11" bold="yes"/>
                  <string>
                  <![CDATA[Total salaires département :]]>
                  </string>
                </textSegment>
              </text>
              <field name="F_NOMDEPARTEMENT1" source="NOMDEPARTEMENT"
               minWidowLines="1" spacing="0" alignment="start">
                <font face="Courier New" size="10" bold="yes"
                 textColor="r0g0b50"/>
                <geometryInfo x="2.75000" y="1.62500" width="1.87500"
                 height="0.18750"/>
                <generalLayout verticalElasticity="expand"/>
                <advancedLayout printObjectOnPage="allPage"
                 basePrintingOn="enclosingObject"/>
              </field>
              <field name="F_CountnumeroemployePerNUMEROD"
               source="CountnumeroemployePerNUMERODEP" minWidowLines="1"
               spacing="0" alignment="start">
                <font face="Courier New" size="11" bold="yes"/>
                <geometryInfo x="2.06250" y="1.87500" width="0.75000"
                 height="0.18750"/>
                <generalLayout verticalElasticity="expand"/>
              </field>
              <text name="B_Total_1" minWidowLines="1">
                <textSettings spacing="0"/>
                <geometryInfo x="0.12500" y="1.87500" width="1.93750"
                 height="0.18750"/>
                <textSegment>
                  <font face="Courier New" size="11" bold="yes"/>
                  <string>
                  <![CDATA[Nombre d'employés :]]>
                  </string>
                </textSegment>
              </text>
              <frame name="M_1">
                <geometryInfo x="0.00000" y="1.56250" width="7.43750"
                 height="0.56250"/>
                <visualSettings linePattern="solid"
                 lineForegroundColor="r0g88b0" dash="dot"/>
              </frame>
            </frame>
            <frame name="M_G_1_HDR">
              <geometryInfo x="0.00000" y="0.68750" width="7.50000"
               height="0.50000"/>
              <advancedLayout printObjectOnPage="allPage"
               basePrintingOn="enclosingObject"/>
              <text name="B_numeroemploye" minWidowLines="1">
                <textSettings justify="center" spacing="0"/>
                <geometryInfo x="0.00000" y="0.75000" width="0.75000"
                 height="0.37500"/>
                <textSegment>
                  <font face="Courier New" size="10" bold="yes" italic="yes"/>
                  <string>
                  <![CDATA[Numéro
]]>
                  </string>
                </textSegment>
                <textSegment>
                  <font face="Courier New" size="10" bold="yes" italic="yes"/>
                  <string>
                  <![CDATA[employé]]>
                  </string>
                </textSegment>
              </text>
              <text name="B_nomemploye" minWidowLines="1">
                <textSettings spacing="0"/>
                <geometryInfo x="0.75000" y="0.75000" width="0.93750"
                 height="0.37500"/>
                <textSegment>
                  <font face="Courier New" size="10" bold="yes" italic="yes"/>
                  <string>
                  <![CDATA[ Nom
]]>
                  </string>
                </textSegment>
                <textSegment>
                  <font face="Courier New" size="10" bold="yes" italic="yes"/>
                  <string>
                  <![CDATA[employé]]>
                  </string>
                </textSegment>
              </text>
              <text name="B_prenomemploye" minWidowLines="1">
                <textSettings spacing="0"/>
                <geometryInfo x="1.68750" y="0.75000" width="0.68750"
                 height="0.37500"/>
                <textSegment>
                  <font face="Courier New" size="10" bold="yes" italic="yes"/>
                  <string>
                  <![CDATA[Prenom
]]>
                  </string>
                </textSegment>
                <textSegment>
                  <font face="Courier New" size="10" bold="yes" italic="yes"/>
                  <string>
                  <![CDATA[employé]]>
                  </string>
                </textSegment>
              </text>
              <text name="B_posteemploye" minWidowLines="1">
                <textSettings spacing="0"/>
                <geometryInfo x="2.87500" y="0.75000" width="1.31250"
                 height="0.37500"/>
                <textSegment>
                  <font face="Courier New" size="10" bold="yes" italic="yes"/>
                  <string>
                  <![CDATA[Poste 
]]>
                  </string>
                </textSegment>
                <textSegment>
                  <font face="Courier New" size="10" bold="yes" italic="yes"/>
                  <string>
                  <![CDATA[employé]]>
                  </string>
                </textSegment>
              </text>
              <text name="B_salaireemploye" minWidowLines="1">
                <textSettings spacing="0"/>
                <geometryInfo x="4.93750" y="0.75000" width="0.87500"
                 height="0.37500"/>
                <textSegment>
                  <font face="Courier New" size="10" bold="yes" italic="yes"/>
                  <string>
                  <![CDATA[Salaire
]]>
                  </string>
                </textSegment>
                <textSegment>
                  <font face="Courier New" size="10" bold="yes" italic="yes"/>
                  <string>
                  <![CDATA[employé]]>
                  </string>
                </textSegment>
              </text>
              <text name="B_dateembaucheemploye" minWidowLines="1">
                <textSettings justify="center" spacing="0"/>
                <geometryInfo x="5.75000" y="0.75000" width="1.00000"
                 height="0.37500"/>
                <textSegment>
                  <font face="Courier New" size="10" bold="yes" italic="yes"/>
                  <string>
                  <![CDATA[Date 
]]>
                  </string>
                </textSegment>
                <textSegment>
                  <font face="Courier New" size="10" bold="yes" italic="yes"/>
                  <string>
                  <![CDATA[d'embauche]]>
                  </string>
                </textSegment>
              </text>
              <text name="B_nomSuperieur" minWidowLines="1">
                <textSettings justify="center" spacing="0"/>
                <geometryInfo x="6.75000" y="0.75000" width="0.75000"
                 height="0.37500"/>
                <textSegment>
                  <font face="Courier New" size="10" bold="yes" italic="yes"/>
                  <string>
                  <![CDATA[Nom du
]]>
                  </string>
                </textSegment>
                <textSegment>
                  <font face="Courier New" size="10" bold="yes" italic="yes"/>
                  <string>
                  <![CDATA[supérieur]]>
                  </string>
                </textSegment>
              </text>
              <line name="B_2" arrow="none">
                <geometryInfo x="0.06250" y="1.12500" width="7.43750"
                 height="0.00000"/>
                <visualSettings linePattern="solid"/>
                <points>
                  <point x="0.06250" y="1.12500"/>
                  <point x="7.50000" y="1.12500"/>
                </points>
              </line>
            </frame>
          </frame>
          <text name="B_NUMERODEPARTEMENT" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="0.00000" y="0.00000" width="0.93750"
             height="0.37500"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <textSegment>
              <font face="Courier New" size="10" bold="yes"
               textColor="r0g0b50"/>
              <string>
              <![CDATA[Numéro
]]>
              </string>
            </textSegment>
            <textSegment>
              <font face="Courier New" size="10" bold="yes"
               textColor="r0g0b50"/>
              <string>
              <![CDATA[département]]>
              </string>
            </textSegment>
          </text>
          <field name="F_NOMDEPARTEMENT" source="NOMDEPARTEMENT"
           minWidowLines="1" spacing="0" alignment="start">
            <font face="Courier New" size="11" bold="yes"/>
            <geometryInfo x="1.06250" y="0.43750" width="2.06250"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
          </field>
          <text name="B_NOMDEPARTEMENT" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="1.37500" y="0.00000" width="1.37500"
             height="0.37500"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <textSegment>
              <font face="Courier New" size="10" bold="yes"
               textColor="r0g0b50"/>
              <string>
              <![CDATA[Nom 
]]>
              </string>
            </textSegment>
            <textSegment>
              <font face="Courier New" size="10" bold="yes"
               textColor="r0g0b50"/>
              <string>
              <![CDATA[département]]>
              </string>
            </textSegment>
          </text>
          <field name="F_localdepartement" source="localdepartement"
           minWidowLines="1" spacing="0" alignment="start">
            <font face="Courier New" size="11" bold="yes"/>
            <geometryInfo x="3.12500" y="0.43750" width="1.75000"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
          </field>
          <text name="B_localdepartement" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="3.12500" y="0.00000" width="0.93750"
             height="0.37500"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <textSegment>
              <font face="Courier New" size="10" bold="yes"
               textColor="r0g0b50"/>
              <string>
              <![CDATA[Local du
]]>
              </string>
            </textSegment>
            <textSegment>
              <font face="Courier New" size="10" bold="yes"
               textColor="r0g0b50"/>
              <string>
              <![CDATA[département]]>
              </string>
            </textSegment>
          </text>
          <field name="F_chefdepartement" source="chefdepartement"
           minWidowLines="1" spacing="0" alignment="start">
            <font face="Courier New" size="11" bold="yes"/>
            <geometryInfo x="5.06250" y="0.43750" width="0.81250"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
          </field>
          <text name="B_chefdepartement" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="4.75000" y="0.00000" width="1.18750"
             height="0.37500"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <textSegment>
              <font face="Courier New" size="10" bold="yes"
               textColor="r0g0b50"/>
              <string>
              <![CDATA[Numéro chef
]]>
              </string>
            </textSegment>
            <textSegment>
              <font face="Courier New" size="10" bold="yes"
               textColor="r0g0b50"/>
              <string>
              <![CDATA[du département]]>
              </string>
            </textSegment>
          </text>
          <field name="F_datecreationdepartement"
           source="datecreationdepartement" minWidowLines="1" spacing="0"
           alignment="start">
            <font face="Courier New" size="11" bold="yes"/>
            <geometryInfo x="6.43750" y="0.43750" width="0.81250"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
          </field>
          <text name="B_datecreationdepartement" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="6.00000" y="0.00000" width="1.45300"
             height="0.37500"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <textSegment>
              <font face="Courier New" size="10" bold="yes"
               textColor="r0g0b50"/>
              <string>
              <![CDATA[Date de création 
]]>
              </string>
            </textSegment>
            <textSegment>
              <font face="Courier New" size="10" bold="yes"
               textColor="r0g0b50"/>
              <string>
              <![CDATA[du département]]>
              </string>
            </textSegment>
          </text>
          <line name="B_1" arrow="none">
            <geometryInfo x="0.00000" y="0.37500" width="7.43750"
             height="0.00000"/>
            <visualSettings lineWidth="2" linePattern="solid"
             lineForegroundColor="r0g0b50"/>
            <points>
              <point x="0.00000" y="0.37500"/>
              <point x="7.43750" y="0.37500"/>
            </points>
          </line>
        </repeatingFrame>
        <frame name="M_G_2_FTR">
          <geometryInfo x="0.00000" y="2.79297" width="7.43750"
           height="0.64453"/>
          <advancedLayout printObjectOnPage="lastPage"
           basePrintingOn="anchoringObject"/>
          <field name="F_SumsalaireemployePerReport"
           source="SumsalaireemployePerReport" minWidowLines="1"
           formatMask="NNN,NN0.NN" spacing="0" alignment="start">
            <font face="Courier New" size="12" bold="yes"/>
            <geometryInfo x="4.68750" y="2.87622" width="1.56250"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_CountnumeroemployePerReport"
           source="CountnumeroemployePerReport" minWidowLines="1" spacing="0"
           alignment="start">
            <font face="Courier New" size="12" bold="yes"/>
            <geometryInfo x="5.68750" y="3.12622" width="0.87500"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <text name="B_CountnumeroemployePerReport" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="1.25000" y="3.12622" width="4.43750"
             height="0.18750"/>
            <textSegment>
              <font face="Courier New" size="12" bold="yes"/>
              <string>
              <![CDATA[Nombre total des employés de la société :]]>
              </string>
            </textSegment>
          </text>
          <text name="B_SumsalaireemployePerReport" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="1.25000" y="2.87622" width="3.43750"
             height="0.18750"/>
            <textSegment>
              <font face="Courier New" size="12" bold="yes"/>
              <string>
              <![CDATA[Total salaires de la société :]]>
              </string>
            </textSegment>
          </text>
          <frame name="M_2">
            <geometryInfo x="0.00000" y="2.79297" width="7.43750"
             height="0.62500"/>
            <visualSettings linePattern="solid" lineForegroundColor="r0g0b100"
             dash="longDash"/>
          </frame>
        </frame>
      </frame>
    </body>
    <margin>
      <text name="B_OR$BODY_SECTION" minWidowLines="1">
        <textSettings justify="center" spacing="0"/>
        <geometryInfo x="1.31250" y="0.43750" width="5.37500" height="0.31250"
        />
        <textSegment>
          <font face="Courier New" size="18" bold="yes" italic="yes"
           underline="yes" textColor="r50g0b0"/>
          <string>
          <![CDATA[Liste d'employés par département]]>
          </string>
        </textSegment>
      </text>
      <text name="B_PAGENUM1" minWidowLines="1">
        <textSettings justify="center" spacing="0"/>
        <geometryInfo x="2.79163" y="10.83337" width="2.91663"
         height="0.16663"/>
        <textSegment>
          <font face="Courier New" size="11" bold="yes" italic="yes"/>
          <string>
          <![CDATA[Page &<PageNumber> de &<TotalPages>]]>
          </string>
        </textSegment>
      </text>
      <field name="F_DATE1" source="CurrentDate" minWidowLines="1"
       formatMask="fmDay, DD Month  RRRR" spacing="0" alignment="center">
        <font face="Courier New" size="10" bold="yes"/>
        <geometryInfo x="5.87500" y="0.06250" width="2.56250" height="0.16663"
        />
        <generalLayout horizontalElasticity="variable"/>
      </field>
      <text name="B_3" minWidowLines="1">
        <textSettings spacing="0"/>
        <geometryInfo x="5.12500" y="0.06250" width="0.75000" height="0.16663"
        />
        <visualSettings lineForegroundColor="r0g0b100"/>
        <textSegment>
          <font face="Courier New" size="11" bold="yes"/>
          <string>
          <![CDATA[Date :]]>
          </string>
        </textSegment>
      </text>
      <line name="B_4" arrow="none">
        <geometryInfo x="5.00000" y="0.25000" width="3.37500" height="0.00000"
        />
        <advancedLayout printObjectOnPage="allPage"
         basePrintingOn="anchoringObject"/>
        <visualSettings linePattern="transparent" lineBackgroundColor="black"/>
        <points>
          <point x="5.00000" y="0.25000"/>
          <point x="8.37500" y="0.25000"/>
        </points>
      </line>
    </margin>
  </section>
  </layout>
  <reportPrivate defaultReportType="masterDetail" versionFlags2="0"
   templateName=""/>
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
<rw:dataArea id="MG2GRPFR71">
<rw:foreach id="RG2711" src="G_2">
<!-- Start GetGroupHeader/n --> <table>
 <caption>  <br>Numéro
 <rw:field id="F_NUMERODEPARTEMENT" src="NUMERODEPARTEMENT" breakLevel="RG2711" breakValue="&nbsp;"> F_NUMERODEPARTEMENT </rw:field><br>
Nom département <rw:field id="F_NOMDEPARTEMENT" src="NOMDEPARTEMENT" breakLevel="RG2711" breakValue="&nbsp;"> F_NOMDEPARTEMENT </rw:field><br>
Local du
 <rw:field id="F_localdepartement" src="localdepartement" breakLevel="RG2711" breakValue="&nbsp;"> F_localdepartement </rw:field><br>
Numéro chef du
 <rw:field id="F_chefdepartement" src="chefdepartement" breakLevel="RG2711" breakValue="&nbsp;"> F_chefdepartement </rw:field><br>
Date de création du département <rw:field id="F_datecreationdepartement" src="datecreationdepartement" breakLevel="RG2711" breakValue="&nbsp;"> F_datecreationdepartement </rw:field><br>
 </caption>
<!-- End GetGroupHeader/n -->   <tr>
    <td valign="top">
    <table summary="">
     <!-- Header -->
     <thead>
      <tr>
       <th <rw:id id="HBnumeroemploye71" asArray="no"/>> Numéro
 </th>
       <th <rw:id id="HBnomemploye71" asArray="no"/>> Nom employé </th>
       <th <rw:id id="HBprenomemploye71" asArray="no"/>> Prenom
 </th>
       <th <rw:id id="HBposteemploye71" asArray="no"/>> Poste employé </th>
       <th <rw:id id="HBsalaireemploye71" asArray="no"/>> Salaire
 </th>
       <th <rw:id id="HBdateembaucheemploye71" asArray="no"/>> Date d'embauche
 </th>
       <th <rw:id id="HBnomSuperieur71" asArray="no"/>> Nom du
 </th>
      </tr>
     </thead>
     <!-- Body -->
     <tbody>
      <rw:foreach id="RG1711" src="G_1">
       <tr>
        <td <rw:headers id="HFnumeroemploye71" src="HBnumeroemploye71"/>><rw:field id="Fnumeroemploye71" src="numeroemploye" nullValue="&nbsp;"> F_numeroemploye </rw:field></td>
        <td <rw:headers id="HFnomemploye71" src="HBnomemploye71"/>><rw:field id="Fnomemploye71" src="nomemploye" nullValue="&nbsp;"> F_nomemploye </rw:field></td>
        <td <rw:headers id="HFprenomemploye71" src="HBprenomemploye71"/>><rw:field id="Fprenomemploye71" src="prenomemploye" nullValue="&nbsp;"> F_prenomemploye </rw:field></td>
        <td <rw:headers id="HFposteemploye71" src="HBposteemploye71"/>><rw:field id="Fposteemploye71" src="posteemploye" nullValue="&nbsp;"> F_posteemploye </rw:field></td>
        <td <rw:headers id="HFsalaireemploye71" src="HBsalaireemploye71"/>><rw:field id="Fsalaireemploye71" src="salaireemploye" nullValue="&nbsp;"> F_salaireemploye </rw:field></td>
        <td <rw:headers id="HFdateembaucheemploye71" src="HBdateembaucheemploye71"/>><rw:field id="Fdateembaucheemploye71" src="dateembaucheemploye" nullValue="&nbsp;"> F_dateembaucheemploye </rw:field></td>
        <td <rw:headers id="HFnomSuperieur71" src="HBnomSuperieur71"/>><rw:field id="FnomSuperieur71" src="nomSuperieur" nullValue="&nbsp;"> F_nomSuperieur </rw:field></td>
       </tr>
      </rw:foreach>
     </tbody>
     <tr>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <td <rw:headers id="HFSumsalaireemployePerNUMERODE71" src="HBsalaireemploye71"/>>Total : <rw:field id="FSumsalaireemployePerNUMERODE71" src="SumsalaireemployePerNUMERODEPA" nullValue="&nbsp;"> F_SumsalaireemployePerNUMERODE </rw:field></td>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
     </tr>
     <tr>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <td <rw:headers id="HFCountnumeroemployePerNUMEROD71" src="HBnumeroemploye71"/>>Décompte : <rw:field id="FCountnumeroemployePerNUMEROD71" src="CountnumeroemployePerNUMERODEP" nullValue="&nbsp;"> F_CountnumeroemployePerNUMEROD </rw:field></td>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
     </tr>
     <tr>
     </tr>
    </table>
   </td>
  </tr>
 </table>
</rw:foreach>
<table summary="">
 <tr>
  <th> Total : <rw:field id="F_SumsalaireemployePerReport" src="SumsalaireemployePerReport" nullValue="&nbsp;"> F_SumsalaireemployePerReport </rw:field></th>
  <th> Décompte : <rw:field id="F_CountnumeroemployePerReport" src="CountnumeroemployePerReport" nullValue="&nbsp;"> F_CountnumeroemployePerReport </rw:field></th>
 </tr>
</table>
</rw:dataArea> <!-- id="MG2GRPFR71" -->
<!-- End of Data Area Generated by Reports Developer -->




</body>
</html>

<!--
</rw:report> 
-->
