<?php

$wmgGlobalSkins = [
	'MonoBook',
	'Timeless',
];

// Incompatibility between UTVector from UT/DR and WMF Vector
if (
	in_array( 'UTVector', MirahezeFunctions::getCacheArray()['extensions'] ?? [], true ) &&
	file_exists( "$IP/skins/UTVector/skin.json" )
) {
	$wmgGlobalSkins[] = 'UTVector';
} else {
	$wmgGlobalSkins[] = 'Vector';
}

wfLoadSkins( $wmgGlobalSkins );

unset( $wmgGlobalSkins );
