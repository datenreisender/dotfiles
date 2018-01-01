#!/usr/bin/env groovy

def color(code) {"\u001b[${code}m"};

def methodMissing(String colorname, args) {
  colors = [
    red: color(31),
    green: color(32),
    yellow: color(33),
    white: color(37),
    default: color(39),
  ]

  if (colors["$colorname"])
     colors["$colorname"]+args[0]+colors['default']
}

baseDir = directory(System.getProperty('user.home'), 'OTR')

def nachMusterIndiziert(verschiebeMuster) {
  verschiebeMuster.collectEntries { ziel, alle_muster ->
    alle_muster.split().collectEntries { muster -> [muster, ziel] }
  }
}

verschiebeMuster = nachMusterIndiziert([
  'Lager/Serien': """
        Arrow
        Being_Human
        Blue_Bloods
        Case_Histories
        Cleverman
        Criminal_Minds
        Damages
        Danni_Lowinski
        Death_Valley
        Dexter
        Hatufim
        Homeland
        House_of_Cards
        Law_und_Order__UK
        Longmire
        Lost_Girl
        Misfits
        Navy_CIS__L_A
        Once_Upon_A_Time
        Real_Humans
        Ripper_Street
        Silent_Witness
        Sleepy_Hollow
        Southland
        Spooks
        The_Fades
        The_Following
        The_Walking_Dead
        Blutsbande
        Borgen
        Die_Musketiere
        Game_Of_Thrones
        Paris
        Ray_Donovan
        Rectify
        The_Neighbors
        The_Returned
        The_Wrong_Mans
        Welcome_to_Sweden
        """
  , 'Gemeinsamer Kram/_für Marko': """
        The_100
        """
  , 'Gemeinsamer Kram/_für Meike': """
        Line_of_Duty
        Navy_CIS
        Blindspot
        """
  , 'Gemeinsamer Kram': """
        Black_Books
        Candice_Renoir
        Class
        Die_Bruecke
        Death_in_Paradise
        Der_Tatortreiniger
        Elementary
        Good_Wife
        Grimm
        How_to_Get_Away_with_Murder
        Justified
        Luther
        Major_Crimes
        Orphan_Black
        Person_of_Interest
        Psych
        Sherlock
        The_Mentalist
        Under_the_Dome
        Broadchurch
        Detective_Laura_Diamond
        Gotham
        Inspector_Mathias
        Lilyhammer
        Perception
        The_Blacklist
        Quantico
        Orange_is_the_New_Black
        Agatha_Christie__Moerderische_Spiele
        The_Magicians
        Fargo
        """
  , 'Meike': """
        Prime_Suspect
        """
  , 'Jannis': """
        Die_Sendung_mit_der_Maus
        Sesamstrasse
        """
  , 'Marko': """
        American_Horror_Story
        Archer
        Bei_Olli
        CSI
        Der_Kriminalist
        Hard_Times
        Hattrick_2__Bundesliga
        Ijon_Tichy
        In_Treatment
        KDD
        Taras_Welten
        Tatort
        """
])

ersetzungsmuster = [
  Navy_CIS__L_A: "Navy CIS - L.A.",
  Law_und_Order__UK: "Law und Order - UK",
]



def verschiebeAlleDateienVon(ausgandsDir) {
  System.out.println "${yellow("Verschiebe Dateien:")}"

  ausgandsDir.eachFileMatch(~/.*?\.(avi|mkv|mp4|txt)/){ datei ->
    passendesMuster = verschiebeMuster.find { muster, ziel -> passt(datei, muster) }

    if (passendesMuster)
      verschiebeDatei(datei, zielverzeichnis(passendesMuster))
//   else
//     System.out.println "$datei.name ... ${yellow("Kein passendes Muster gefunden!")}"
  }
}

def passt(datei, muster) {
  datei.name =~ /(?i)^(S\d+_E\d+_)?$muster/
}

def zielverzeichnis(passendesMuster) {
  serienname = passendesMuster.key
  zielordner = passendesMuster.value
  ersetzungsmuster.each { von, nach -> serienname = serienname.replace(von, nach)}
  new File(directory(baseDir, zielordner, serienname.replace('_', ' ')))
}

def schiebeVorhandeneZieldateiZurSeite(zielDatei) {
  if (zielDatei.exists()) {
    print red("vorhandenes Ziel → -broken? … ")
    zielDatei.renameTo("$zielDatei-broken?")
  }
}

def verschiebeDatei(datei, zielverzeichnis) {
  print "$datei.name → $zielverzeichnis … "
  schiebeVorhandeneZieldateiZurSeite(new File(zielverzeichnis, datei.name))
  if (verschiebenErfolgreich(datei, zielverzeichnis))
    println green("OK ")
  else
    println red("fehlgeschlagen")
}

def verschiebenErfolgreich(datei, zielverzeichnis) {
  zielverzeichnis.mkdirs()
  datei.renameTo(new File(zielverzeichnis, datei.name))
}

def directory(Object... pathElements) {
  pathElements.join(File.separator)
}

// Main
verschiebeAlleDateienVon(new File(baseDir, 'kodierte Dateien'))
