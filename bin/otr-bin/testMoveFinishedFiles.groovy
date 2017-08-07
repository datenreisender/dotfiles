#!/usr/bin/env groovy -c UTF8

// import static org.junit.Assert.*

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

class ScriptTest {
  def script, binding

  @Before void parseScript() {
    binding = new Binding()
    def shell = new GroovyShell(binding)
    def scriptDir = new File(getClass().protectionDomain.codeSource.location.path).parent
    script = shell.parse(new File(scriptDir, 'moveFinishedFiles.groovy'))
  }

  @Test void farbenLassenSichPerNameRufen() {
    def fooRotGefärbt = "\u001b[31mfoo\u001b[39m"

    assert script.red("foo") == fooRotGefärbt
  }

  // Datei wird …
  def datei = [name: "Foo Bar Baz"]
  @Test void nachNamenGematcht()           { assert   script.passt(datei, "Foo Bar Baz") }
  @Test void amEndeDarfEtwasFehlen()       { assert   script.passt(datei, "Foo Bar"    ) }
  @Test void derAnfangMussKorrektSein()    { assert ! script.passt(datei,     "Bar Baz") }
  @Test void großschreibungWirdIgnoriert() { assert   script.passt(datei, "foo BAR"    ) }

  @Test void zielverzeichnisWirdAusMusterErstellt() {
    binding.baseDir = "base"
    binding.ersetzungsmuster = [:]
    assert script.zielverzeichnis(key: "Name_der_Serie", value: "Zielordner").path ==
    "base/Zielordner/Name der Serie"
  }

  @Test void zielverzeichnisRespektiertErsetzungsmuster() {
    binding.baseDir = "base"
    binding.ersetzungsmuster = [alt: "neu"]
    assert script.zielverzeichnis(key: "Name_alt").path.endsWith("Name neu")
  }

  @Test void indiziertMusterMapNachMustern() {
    def verschiebeMuster = [
    'Ordner A': 'Serie_1 Serie_2',
    'Ordner B': 'Serie_3'
    ]

    assert script.nachMusterIndiziert(verschiebeMuster) == [
    Serie_1: 'Ordner A',
    Serie_2: 'Ordner A',
    Serie_3: 'Ordner B',
    ]
  }

  // Law&Order-Sonderbehandlung raus
}
