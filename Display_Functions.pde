// Uses mouseOver to call appropriate funtion for choosing next page.
void checkLocation() {
  if (mouseOver != null) {
    if (screens[HOME]) {
      if (mouseOver == "Hydrogen")            showPictures(1);
      else if (mouseOver == "Alkali")         showPictures(2);
      else if (mouseOver == "Alkaline Earth") showPictures(3);
      else if (mouseOver == "Transition")     showPictures(4);
      else if (mouseOver == "Metals")         showPictures(5);
      else if (mouseOver == "Non Metals")     showPictures(6);
      else if (mouseOver == "Halogens")       showPictures(7);
      else if (mouseOver == "Noble Gas")      showPictures(8);
      else if (mouseOver == "Rare Earth")     showPictures(9);
      else if (mouseOver == "Credits") {
        credits(1); transitionFlag = 'V';
      }
    }
    else if (screens[PICTURES]) {
      if (page == "alkali") {
        if (mouseOver == "Element 1")      alkali(1);
        else if (mouseOver == "Element 2") alkali(2);
        else if (mouseOver == "Element 3") alkali(3);
        else if (mouseOver == "Element 4") alkali(4);
        else if (mouseOver == "Element 5") alkali(5);
        else if (mouseOver == "Element 6") alkali(6);
      } else if (page == "alkalineEarth") {
        if (mouseOver == "Element 1")      alkaline(1);
        else if (mouseOver == "Element 2") alkaline(2);
        else if (mouseOver == "Element 3") alkaline(3);
        else if (mouseOver == "Element 4") alkaline(4);
        else if (mouseOver == "Element 5") alkaline(5);
        else if (mouseOver == "Element 6") alkaline(6);
      } else if (page == "transitionMetals") {
        if (mouseOver == "Transition 1")      transitionMetalPage(1);
        else if (mouseOver == "Transition 2") transitionMetalPage(2);
        else if (mouseOver == "Transition 3") transitionMetalPage(3);
        else if (mouseOver == "Transition 4") transitionMetalPage(4);
        else if (mouseOver == "Transition 5") transitionMetalPage(5);

        if (transitionMetalPage == 1) {
          if (mouseOver == "Element 1")      transitionMetalElement(1);
          else if (mouseOver == "Element 2") transitionMetalElement(2);
          else if (mouseOver == "Element 3") transitionMetalElement(3);
          else if (mouseOver == "Element 4") transitionMetalElement(4);
          else if (mouseOver == "Element 5") transitionMetalElement(5);
          else if (mouseOver == "Element 6") transitionMetalElement(6);
        } else if (transitionMetalPage == 2) {
          if (mouseOver == "Element 1")      transitionMetalElement(7);
          else if (mouseOver == "Element 2") transitionMetalElement(8);
          else if (mouseOver == "Element 3") transitionMetalElement(9);
          else if (mouseOver == "Element 4") transitionMetalElement(10);
          else if (mouseOver == "Element 5") transitionMetalElement(11);
          else if (mouseOver == "Element 6") transitionMetalElement(12);
        } else if (transitionMetalPage == 3) {
          if (mouseOver == "Element 1")      transitionMetalElement(13);
          else if (mouseOver == "Element 2") transitionMetalElement(14);
          else if (mouseOver == "Element 3") transitionMetalElement(15);
          else if (mouseOver == "Element 4") transitionMetalElement(16);
          else if (mouseOver == "Element 5") transitionMetalElement(17);
          else if (mouseOver == "Element 6") transitionMetalElement(18);
        } else if (transitionMetalPage == 4) {
          if (mouseOver == "Element 1")      transitionMetalElement(19);
          else if (mouseOver == "Element 2") transitionMetalElement(20);
          else if (mouseOver == "Element 3") transitionMetalElement(21);
          else if (mouseOver == "Element 4") transitionMetalElement(22);
          else if (mouseOver == "Element 5") transitionMetalElement(23);
          else if (mouseOver == "Element 6") transitionMetalElement(24);
        } else if (transitionMetalPage == 5) {
          if (mouseOver == "Element 1")      transitionMetalElement(25);
          else if (mouseOver == "Element 2") transitionMetalElement(26);
          else if (mouseOver == "Element 3") transitionMetalElement(27);
          else if (mouseOver == "Element 4") transitionMetalElement(28);
          else if (mouseOver == "Element 5") transitionMetalElement(29);
          else if (mouseOver == "Element 6") transitionMetalElement(30);
        }
      } else if (page == "metals") {
        if (mouseOver == "Element 1")      metals(1);
        else if (mouseOver == "Element 2") metals(2);
        else if (mouseOver == "Element 3") metals(3);
        else if (mouseOver == "Element 4") metals(4);
        else if (mouseOver == "Element 5") metals(5);
        else if (mouseOver == "Element 6") metals(6);
        else if (mouseOver == "Element 7") metals(7);
        else if (mouseOver == "Element 8") metals(8);
      } else if (page == "nonMetals") {
        if (mouseOver == "Nonmetal 1")      nonmetalPage(1);
        else if (mouseOver == "Nonmetal 2") nonmetalPage(2);

        if (nonmetalPage == 1) {
          if (mouseOver == "Element 1")      nonMetalElement(1);
          else if (mouseOver == "Element 2") nonMetalElement(2);
          else if (mouseOver == "Element 3") nonMetalElement(3);
          else if (mouseOver == "Element 4") nonMetalElement(4);
          else if (mouseOver == "Element 5") nonMetalElement(5);
          else if (mouseOver == "Element 6") nonMetalElement(6);
        } else if (nonmetalPage == 2) {
          if (mouseOver == "Element 1")      nonMetalElement(7);
          else if (mouseOver == "Element 2") nonMetalElement(8);
          else if (mouseOver == "Element 3") nonMetalElement(9);
          else if (mouseOver == "Element 4") nonMetalElement(10);
          else if (mouseOver == "Element 5") nonMetalElement(11);
          else if (mouseOver == "Element 6") nonMetalElement(12);
        }
      } else if (page == "halogens") {
        if (mouseOver == "Element 1")      halogens(1);
        else if (mouseOver == "Element 2") halogens(2);
        else if (mouseOver == "Element 3") halogens(3);
        else if (mouseOver == "Element 4") halogens(4);
        else if (mouseOver == "Element 5") halogens(5);
      } else if (page == "nobleGases") {
        if (mouseOver == "Element 1")      noble_gases(1);
        else if (mouseOver == "Element 2") noble_gases(2);
        else if (mouseOver == "Element 3") noble_gases(3);
        else if (mouseOver == "Element 4") noble_gases(4);
        else if (mouseOver == "Element 5") noble_gases(5);
        else if (mouseOver == "Element 6") noble_gases(6);
      } else if (page == "rareEarths") {
        if (mouseOver == "Rare Earth 1")      rareEarthPage(1);
        else if (mouseOver == "Rare Earth 2") rareEarthPage(2);
        else if (mouseOver == "Rare Earth 3") rareEarthPage(3);

        if (rareEarthPage == 1) {
          if (mouseOver == "Element 1")      rareEarthElement(1);
          else if (mouseOver == "Element 2") rareEarthElement(2);
          else if (mouseOver == "Element 3") rareEarthElement(3);
          else if (mouseOver == "Element 4") rareEarthElement(4);
          else if (mouseOver == "Element 5") rareEarthElement(5);
          else if (mouseOver == "Element 6") rareEarthElement(6);
        } else if (rareEarthPage == 2) {
          if (mouseOver == "Element 1")      rareEarthElement(7);
          else if (mouseOver == "Element 2") rareEarthElement(8);
          else if (mouseOver == "Element 3") rareEarthElement(9);
          else if (mouseOver == "Element 4") rareEarthElement(10);
          else if (mouseOver == "Element 5") rareEarthElement(11);
          else if (mouseOver == "Element 6") rareEarthElement(12);
        } else if (rareEarthPage == 3) {
          if (mouseOver == "Element 1")      rareEarthElement(13);
          else if (mouseOver == "Element 2") rareEarthElement(14);
          else if (mouseOver == "Element 3") rareEarthElement(15);
          else if (mouseOver == "Element 4") rareEarthElement(16);
          else if (mouseOver == "Element 5") rareEarthElement(17);
          else if (mouseOver == "Element 6") rareEarthElement(18);
        }
      }
    }
    else if (screens[CREDITS]) {
      if (mouseOver == "Credits 1")      credits(1);
      else if (mouseOver == "Credits 2") credits(2);
      else if (mouseOver == "Credits 3") credits(3);
      else if (mouseOver == "Credits 4") credits(4);
      else if (mouseOver == "Credits 5") credits(5);
      else if (mouseOver == "Credits 6") credits(6);
      else if (mouseOver == "Credits 7") credits(7);
      else if (mouseOver == "Credits 8") credits(8);

      if (mouseOver == "Hydrogen Credits")          subCredits(1);   // Hydrogen
      else if (mouseOver == "Helium Credits")       subCredits(2);   // Helium
      else if (mouseOver == "Lithium Credits")      subCredits(3);   // Lithium
      else if (mouseOver == "Beryllium Credits")    subCredits(4);   // Beryllium
      else if (mouseOver == "Boron Credits")        subCredits(5);   // Boron
      else if (mouseOver == "Carbon Credits")       subCredits(6);   // Carbon
      else if (mouseOver == "Nitrogen Credits")     subCredits(7);   // Nitrogen
      else if (mouseOver == "Oxygen Credits")       subCredits(8);   // Oxygen
      else if (mouseOver == "Fluorine Credits")     subCredits(9);   // Fluorine
      else if (mouseOver == "Neon Credits")         subCredits(10);  // Neon
      else if (mouseOver == "Sodium Credits")       subCredits(11);  // Sodium
      else if (mouseOver == "Magnesium Credits")    subCredits(12);  // Magnesium
      else if (mouseOver == "Aluminum Credits")     subCredits(13);  // Aluminum
      else if (mouseOver == "Silicon Credits")      subCredits(14);  // Silicon
      else if (mouseOver == "Phosphorus Credits")   subCredits(15);  // Phosphorus
      else if (mouseOver == "Sulfur Credits")       subCredits(16);  // Sulfur
      else if (mouseOver == "Chlorine Credits")     subCredits(17);  // Chlorine
      else if (mouseOver == "Argon Credits")        subCredits(18);  // Argon
      else if (mouseOver == "Potassium Credits")    subCredits(19);  // Potassium
      else if (mouseOver == "Calcium Credits")      subCredits(20);  // Calcium
      else if (mouseOver == "Scandium Credits")     subCredits(21);  // Scandium
      else if (mouseOver == "Titanium Credits")     subCredits(22);  // Titanium
      else if (mouseOver == "Vandium Credits")      subCredits(23);  // Vandium
      else if (mouseOver == "Chromium Credits")     subCredits(24);  // Chromium
      else if (mouseOver == "Manganese Credits")    subCredits(25);  // Manganese
      else if (mouseOver == "Iron Credits")         subCredits(26);  // Iron
      else if (mouseOver == "Cobalt Credits")       subCredits(27);  // Cobalt
      else if (mouseOver == "Nickle Credits")       subCredits(28);  // Nickle
      else if (mouseOver == "Copper Credits")       subCredits(29);  // Copper
      else if (mouseOver == "Zinc Credits")         subCredits(30);  // Zinc
      else if (mouseOver == "Gallium Credits")      subCredits(31);  // Gallium
      else if (mouseOver == "Germanium Credits")    subCredits(32);  // Germanium
      else if (mouseOver == "Arsenic Credits")      subCredits(33);  // Arsenic
      else if (mouseOver == "Selenium Credits")     subCredits(34);  // Selenium
      else if (mouseOver == "Bromine Credits")      subCredits(35);  // Bromine
      else if (mouseOver == "Krypton Credits")      subCredits(36);  // Krypton
      else if (mouseOver == "Rubidium Credits")     subCredits(37);  // Rubidium
      else if (mouseOver == "Strontium Credits")    subCredits(38);  // Strontium
      else if (mouseOver == "Yttrium Credits")      subCredits(39);  // Yttrium
      else if (mouseOver == "Zirconium Credits")    subCredits(40);  // Zirconium
      else if (mouseOver == "Niobium Credits")      subCredits(41);  // Niobium
      else if (mouseOver == "Molybdenum Credits")   subCredits(42);  // Molybdenum
      else if (mouseOver == "Technetium Credits")   subCredits(43);  // Technetium
      else if (mouseOver == "Ruthenium Credits")    subCredits(44);  // Ruthenium
      else if (mouseOver == "Rhodium Credits")      subCredits(45);  // Rhodium
      else if (mouseOver == "Palladium Credits")    subCredits(46);  // Palladium
      else if (mouseOver == "Silver Credits")       subCredits(47);  // Silver
      else if (mouseOver == "Cadmium Credits")      subCredits(48);  // Cadmium
      else if (mouseOver == "Indium Credits")       subCredits(49);  // Indium
      else if (mouseOver == "Tin Credits")          subCredits(50);  // Tin
      else if (mouseOver == "Antimony Credits")     subCredits(51);  // Antimony
      else if (mouseOver == "Tellurium Credits")    subCredits(52);  // Tellurium
      else if (mouseOver == "Iodine Credits")       subCredits(53);  // Iodine
      else if (mouseOver == "Xenon Credits")        subCredits(54);  // Xenon
      else if (mouseOver == "Cesium Credits")       subCredits(55);  // Cesium
      else if (mouseOver == "Barium Credits")       subCredits(56);  // Barium
      else if (mouseOver == "Lanthanium Credits")   subCredits(57);  // Lanthanium
      else if (mouseOver == "Cerium Credits")       subCredits(58);  // Cerium
      else if (mouseOver == "Praseodymium Credits") subCredits(59);  // Praseodymium
      else if (mouseOver == "Neodymium Credits")    subCredits(60);  // Neodymium
      else if (mouseOver == "Promethium Credits")   subCredits(61);  // Promethium
      else if (mouseOver == "Samarium Credits")     subCredits(62);  // Samarium
      else if (mouseOver == "Europium Credits")     subCredits(63);  // Europium
      else if (mouseOver == "Gadolinium Credits")   subCredits(64);  // Gadolinium
      else if (mouseOver == "Terbium Credits")      subCredits(65);  // Terbium
      else if (mouseOver == "Dysprosium Credits")   subCredits(66);  // Dysprosium
      else if (mouseOver == "Holmium Credits")      subCredits(67);  // Holmium
      else if (mouseOver == "Erbium Credits")       subCredits(68);  // Erbium
      else if (mouseOver == "Thulium Credits")      subCredits(69);  // Thulium
      else if (mouseOver == "Ytterbium Credits")    subCredits(70);  // Ytterbium
      else if (mouseOver == "Lutentium Credits")    subCredits(71);  // Lutentium
      else if (mouseOver == "Hafnium Credits")      subCredits(72);  // Hafnium
      else if (mouseOver == "Tantalum Credits")     subCredits(73);  // Tantalum
      else if (mouseOver == "Tungsten Credits")     subCredits(74);  // Tungsten
      else if (mouseOver == "Rhenium Credits")      subCredits(75);  // Rhenium
      else if (mouseOver == "Osmium Credits")       subCredits(76);  // Osmium
      else if (mouseOver == "Iridium Credits")      subCredits(77);  // Iridium
      else if (mouseOver == "Platinum Credits")     subCredits(78);  // Platinum
      else if (mouseOver == "Gold Credits")         subCredits(79);  // Gold
      else if (mouseOver == "Mercury Credits")      subCredits(80);  // Mercury
      else if (mouseOver == "Thallium Credits")     subCredits(81);  // Thallium
      else if (mouseOver == "Lead Credits")         subCredits(82);  // Lead
      else if (mouseOver == "Bismuth Credits")      subCredits(83);  // Bismuth
      else if (mouseOver == "Polonium Credits")     subCredits(84);  // Polonium
      else if (mouseOver == "Astatine Credits")     subCredits(85);  // Astatine
      else if (mouseOver == "Radon Credits")        subCredits(86);  // Radon
      else if (mouseOver == "Francium Credits")     subCredits(87);  // Francium
      else if (mouseOver == "Radium Credits")       subCredits(88);  // Radium
      else if (mouseOver == "Actinium Credits")     subCredits(89);  // Actinium
      else if (mouseOver == "Thorium Credits")      subCredits(90);  // Thorium
      else if (mouseOver == "Proactinium Credits")  subCredits(91);  // Proactinium
      else if (mouseOver == "Uranium Credits")      subCredits(92);  // Uranium
    }
    if (nextPage == null) nextPage = elementPics[0];
  } else return;
}

void showPictures(int screen) {
  if (screen == 1) {
    setScreens(INFO);
    nextPage = elementPics[1];
    page = "hydrogen";
    transitionFlag = 'U';
  } else {
    setScreens(PICTURES);
    if (screen == 2) {
      nextPage = groupPics[0];
      page = "alkali";
    } else if (screen == 3) {
      nextPage = groupPics[1];
      page = "alkalineEarth";
    } else if (screen == 4) {
      nextPage = groupPics[2];
      page = "transitionMetals";
    } else if (screen == 5) {
      nextPage = groupPics[7];
      page = "metals";
    } else if (screen == 6) {
      nextPage = groupPics[8];
      page = "nonMetals";
    } else if (screen == 7) {
      nextPage = groupPics[10];
      page = "halogens";
    } else if (screen == 8) {
      nextPage = groupPics[11];
      page = "nobleGases";
    } else if (screen == 9) {
      nextPage = groupPics[12];
      page = "rareEarths";
    }
    transitionFlag = 'B';
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  ________    __         ________    _____      _____    ________    _____    __    ____________     ______. //
// |   _____|  |  |       |   _____|  |     \    /     |  |   _____|  |     \  |  |  |____    ____|   /      | //
// |  |___     |  |       |  |___     |  |\  \  /  /|  |  |  |___     |  |\  \ |  |       |  |       |   (---' //
// |   ___|    |  |       |   ___|    |  | \  \/  / |  |  |   ___|    |  | \  \|  |       |  |        \   \    //
// |  |_____   |  |____   |  |_____   |  |  \    /  |  |  |  |_____   |  |  \     |       |  |     .---)   |   //
// |________|  |_______|  |________|  |__|   \__/   |__|  |________|  |__|   \____|       |__|     |______/    //
//                                                                                                             //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void alkali(int element) {
  setScreens(INFO);
  if (element == 1)      nextPage = elementPics[3];
  else if (element == 2) nextPage = elementPics[11];
  else if (element == 3) nextPage = elementPics[19];
  else if (element == 4) nextPage = elementPics[37];
  else if (element == 5) nextPage = elementPics[55];
  else if (element == 6) nextPage = elementPics[87];
  transitionFlag = 'U';
}

void alkaline(int element) {
  setScreens(INFO);
  if (element == 1)      nextPage = elementPics[4];
  else if (element == 2) nextPage = elementPics[12];
  else if (element == 3) nextPage = elementPics[20];
  else if (element == 4) nextPage = elementPics[38];
  else if (element == 5) nextPage = elementPics[56];
  else if (element == 6) nextPage = elementPics[88];
  transitionFlag = 'U';
}

void transitionMetalPage(int page) {
  setScreens(PICTURES);
  if (page == 1)      nextPage = groupPics[2];
  else if (page == 2) nextPage = groupPics[3];
  else if (page == 3) nextPage = groupPics[4];
  else if (page == 4) nextPage = groupPics[5];
  else if (page == 5) nextPage = groupPics[6];

  if (transitionMetalPage < page) transitionFlag = 'H';
  else if (transitionMetalPage > page) transitionFlag = 'h';
  else transitionFlag = '\n';
  transitionMetalPage = page;
}

void transitionMetalElement(int element) {
  setScreens(INFO);
  if (element == 1) nextPage = elementPics[48];
  else if (element == 2) nextPage = elementPics[24];
  else if (element == 3) nextPage = elementPics[27];
  else if (element == 4) nextPage = elementPics[29];
  else if (element == 5) nextPage = elementPics[79];
  else if (element == 6) nextPage = elementPics[72];
  else if (element == 7) nextPage = elementPics[77];
  else if (element == 8) nextPage = elementPics[26];
  else if (element == 9) nextPage = elementPics[71];
  else if (element == 10) nextPage = elementPics[25];
  else if (element == 11) nextPage = elementPics[80];
  else if (element == 12) nextPage = elementPics[42];
  else if (element == 13) nextPage = elementPics[28];
  else if (element == 14) nextPage = elementPics[41];
  else if (element == 15) nextPage = elementPics[76];
  else if (element == 16) nextPage = elementPics[46];
  else if (element == 17) nextPage = elementPics[78];
  else if (element == 18) nextPage = elementPics[75];
  else if (element == 19) nextPage = elementPics[45];
  else if (element == 20) nextPage = elementPics[44];
  else if (element == 21) nextPage = elementPics[21];
  else if (element == 22) nextPage = elementPics[47];
  else if (element == 23) nextPage = elementPics[73];
  else if (element == 24) nextPage = elementPics[43];
  else if (element == 25) nextPage = elementPics[22];
  else if (element == 26) nextPage = elementPics[74];
  else if (element == 27) nextPage = elementPics[23];
  else if (element == 28) nextPage = elementPics[39];
  else if (element == 29) nextPage = elementPics[30];
  else if (element == 30) nextPage = elementPics[40];

  if (nextPage != elementPics[0]) transitionFlag = 'U';
  else transitionFlag = 'C';
}

void metals(int element) {
  setScreens(INFO);
  if (element == 1) nextPage = elementPics[13];
  else if (element == 2) nextPage = elementPics[31];
  else if (element == 3) nextPage = elementPics[49];
  else if (element == 4) nextPage = elementPics[50];
  else if (element == 5) nextPage = elementPics[81];
  else if (element == 6) nextPage = elementPics[82];
  else if (element == 7) nextPage = elementPics[83];
  else if (element == 8) nextPage = elementPics[84];

  if (nextPage != elementPics[0]) transitionFlag = 'U';
  else transitionFlag = 'C';
}

void nonmetalPage(int page) {
  setScreens(PICTURES);
  if (page == 1) {
    nextPage = groupPics[8];
    transitionFlag = 'h';
  }
  else if (page == 2) {
    nextPage = groupPics[9];
    transitionFlag = 'H';
  }
}

void nonMetalElement(int element) {
  setScreens(INFO);
  if (element == 1) nextPage = elementPics[51];
  else if (element == 2) nextPage = elementPics[33];
  else if (element == 3) nextPage = elementPics[5];
  else if (element == 4) nextPage = elementPics[6];
  else if (element == 5) nextPage = elementPics[32];
  else if (element == 6) nextPage = elementPics[7];
  else if (element == 7) nextPage = elementPics[8];
  else if (element == 8) nextPage = elementPics[15];
  else if (element == 9) nextPage = elementPics[34];
  else if (element == 10) nextPage = elementPics[14];
  else if (element == 11) nextPage = elementPics[16];
  else if (element == 12) nextPage = elementPics[52];

  if (nextPage != elementPics[0]) transitionFlag = 'U';
  else transitionFlag = 'C';
}

void halogens(int element) {
  setScreens(INFO);
  if (element == 1) nextPage = elementPics[9];
  else if (element == 2) nextPage = elementPics[17];
  else if (element == 3) nextPage = elementPics[35];
  else if (element == 4) nextPage = elementPics[53];
  else if (element == 5) nextPage = elementPics[85];
  transitionFlag = 'U';
}

void noble_gases(int element) {
  setScreens(INFO);
  if (element == 1) nextPage = elementPics[2];
  else if (element == 2) nextPage = elementPics[10];
  else if (element == 3) nextPage = elementPics[18];
  else if (element == 4) nextPage = elementPics[36];
  else if (element == 5) nextPage = elementPics[53];
  else if (element == 6) nextPage = elementPics[85];
  transitionFlag = 'U';
}

void rareEarthPage(int page) {
  setScreens(PICTURES);
  if (page == 1) nextPage = groupPics[12];
  else if (page == 2) nextPage = groupPics[13];
  else if (page == 3) nextPage = groupPics[14];

  if (rareEarthPage < page) transitionFlag = 'H';
  else if (rareEarthPage > page) transitionFlag = 'h';
  rareEarthPage = page;
}

void rareEarthElement(int element) {
  setScreens(INFO);
  if (element == 1) nextPage = elementPics[89];
  else if (element == 2) nextPage = elementPics[58];
  else if (element == 3) nextPage = elementPics[66];
  else if (element == 4) nextPage = elementPics[68];
  else if (element == 5) nextPage = elementPics[63];
  else if (element == 6) nextPage = elementPics[64];
  else if (element == 7) nextPage = elementPics[67];
  else if (element == 8) nextPage = elementPics[57];
  else if (element == 9) nextPage = elementPics[60];
  else if (element == 10) nextPage = elementPics[59];
  else if (element == 11) nextPage = elementPics[61];
  else if (element == 12) nextPage = elementPics[91];
  else if (element == 13) nextPage = elementPics[62];
  else if (element == 14) nextPage = elementPics[65];
  else if (element == 15) nextPage = elementPics[90];
  else if (element == 16) nextPage = elementPics[69];
  else if (element == 17) nextPage = elementPics[92];
  else if (element == 18) nextPage = elementPics[70];

  if (nextPage != elementPics[0]) transitionFlag = 'U';
  else transitionFlag = 'C';
}

void credits(int page) {
  setScreens(CREDITS);
  if (page == 1)      nextPage = creditPics[0];
  else if (page == 2) nextPage = creditPics[1];
  else if (page == 3) nextPage = creditPics[2];
  else if (page == 4) nextPage = creditPics[3];
  else if (page == 5) nextPage = creditPics[4];
  else if (page == 6) nextPage = creditPics[5];
  else if (page == 7) nextPage = creditPics[6];
  else if (page == 8) nextPage = creditPics[7];

  if (creditsPage < page) transitionFlag = 'H';
  else if (creditsPage > page) transitionFlag = 'h';
  creditsPage = page;
}

void parseSubCredits() {
  elements = dataSource.getChildren("element");
  sources = dataSource.getChildren("element/sources");
}

void subCredits(int elementNum) {
  background(155);          // Draw blank screen
  setScreens(SUBCREDITS);   // Set location
  drawButtons();            // Draw the buttons in the up position

  // Write titles for each source
  fill(0); textAlign(LEFT); textFont(Belgium);  // Set font properties
  text("Sample Picture:", 50, 125);
  text("Symbol:", 50, 225);
  text("Electron Configuration:", 50, 325);
  text("Example Picture:", 50, 425);
  text("Phase Info:", 50, 525);
  text("Other Info:", 50, 625);

  textAlign(CENTER); textFont(Georgia);                       // Set up text for writing name of element
  text(elements[elementNum].getString("name"), width/2, 75);  // Show the contents of the xml name element
  textAlign(LEFT); textFont(Arial);                           // Change font properties for sources
  text(sources[elementNum].getChild("sample").getContent(), 75, 175);   // Show the contents of the xml sources elements
  text(sources[elementNum].getChild("symbol").getContent(), 75, 275);
  text(sources[elementNum].getChild("config").getContent(), 75, 375);
  text(sources[elementNum].getChild("example").getContent(), 75, 475);
  text(sources[elementNum].getChild("phase").getContent(), 75, 575);
  text(sources[elementNum].getChild("info").getContent(), 75, 675);
}