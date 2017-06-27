* facturista.com - Archivo de inclusion para FoxPro

#define hcfdi INTEGER
#define scfdi STRING
#define cfdires INTEGER
#define hconcepto INTEGER
#define himpuesto INTEGER
#define hnode INTEGER


function init_libfacturista()

declare;
string libfacturista_version in libfacturista


declare;
hcfdi cfdi_xml_cargar in libfacturista hcfdi h, scfdi rutaFuente

declare;
integer cfdi_xml_guardar in libfacturista hcfdi h, scfdi rutaDestino, integer decorar

declare;
integer cfdi_xml_validar in libfacturista hcfdi h, scfdi archivoXML, scfdi archivoXSD, scfdi parametros


declare;
integer cfdi_sellar in libfacturista hcfdi h, scfdi rutaLlavePrivada, scfdi rutaCertificado, scfdi rutaDestino, integer decorar

declare;
integer cfdi_timbrar in libfacturista hcfdi h, scfdi rutaFuente, scfdi rutaDestino, integer numeroPAC, scfdi parametros

declare;
integer cfdi_cancelar in libfacturista hcfdi h, integer numeroPAC, scfdi parametros

declare;
integer cfdi_recuperar in libfacturista hcfdi h, scfdi rutaDestino, integer numeroPAC, scfdi parametros

declare;
string cfdi_estado_cuenta in libfacturista hcfdi h, integer numeroPAC, scfdi parametros

declare;
STRING cfdi_error in libfacturista hcfdi h

declare;
STRING cfdi_resultado in libfacturista hcfdi h


declare;
STRING cfdi_xml_atributo in libfacturista hcfdi h, scfdi ruta, scfdi nombre

declare;
integer cfdi_xml_atributo_agregar in libfacturista hcfdi h, scfdi ruta, scfdi nombre, scfdi valor

declare;
integer cfdi_xml_atributo_borrar in libfacturista hcfdi h, scfdi ruta, scfdi nombre


declare;
STRING cfdi_fecha in libfacturista hcfdi h

declare;
STRING cfdi_numero_certificado in libfacturista hcfdi h, scfdi rutaCertificado


*// Return the node handler for the path specified, if h==0 it will return the root node
declare;
hnode xml_node in libfacturista hnode h, scfdi path

*// Return the number of children nodes
declare;
integer xml_node_children_number in libfacturista hnode h

*// Return a node handler for the index-th child, it is 1-based
declare;
hnode xml_node_by_index in libfacturista hnode h, integer index

*// Return the node name
declare;
string xml_node_name in libfacturista hnode h

*// Return a node handler for the child with the asked name
declare;
hnode xml_node_by_name in libfacturista hnode h, scfdi name

*// Return the value of the asked attribute, empty if it does not exist
declare;
string xml_node_attribute in libfacturista hnode h, scfdi name

declare;
integer cfdi_timbrar_lote in libfacturista hcfdi h, scfdi rutaFuente, scfdi rutaDestino, scfdi parametrosLote, integer numeroPAC, scfdi parametrosPAC

declare;
integer xml_insert in libfacturista integer h, string path, string XMLstring, integer indexFather, integer indexChildren

declare;
string xml_serialize in libfacturista integer h, integer decorate

declare;
integer cfdi_validar in libfacturista hcfdi h, scfdi archivoXML, scfdi parametros

declare;
integer set_client_charset in libfacturista integer

declare;
integer set_mt in libfacturista integer mt

declare;
hcfdi cfdi_crear in libfacturista

declare;
integer cfdi_destruir in libfacturista hcfdi h


declare;
hcfdi cfdi_raiz in libfacturista hnode h

declare;
integer cfdis_activos in libfacturista


declare;
integer set_gc in libfacturista integer enable


declare;
integer ini_start in libfacturista hcfdi h

declare;
integer ini_value in libfacturista hcfdi h, scfdi atributo, scfdi valor

declare;
integer ini_section in libfacturista hcfdi h, scfdi seccion

declare;
integer ini_comment in libfacturista hcfdi h, scfdi comentario

declare;
scfdi ini_finish in libfacturista hcfdi h

declare;
scfdi cfdi_numero in libfacturista hcfdi h

*
declare integer exec in libfacturista scfdi scommand, integer nwait, integer nvisible

return .T.

endfunc



