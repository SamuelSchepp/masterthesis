<?php
// Input
$xml = new DOMDocument;
$xml->load('data.xml');

// Template
$xsl = new DOMDocument;
$xsl->load('template.xslt');

// Transformer
$proc = new XSLTProcessor;
$proc->importStyleSheet($xsl);
$output = $proc->transformToXML($xml);

// Write to file
$file = fopen("./output.html", "w") or die("Unable to open file!");
fwrite($file, $output);
fclose($file);
?>
