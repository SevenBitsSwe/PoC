DROP TABLE IF EXISTS nearyou.punto_interesse;
CREATE TABLE nearyou.punto_interesse(
  id UInt32,
  nome String,
  lon Float64,
  lat Float64,
  indirizzo String,
  tipologia String,
  descrizione String,
  PRIMARY KEY(id)
) ENGINE = MergeTree()
ORDER BY id;

INSERT INTO nearyou.punto_interesse (id, nome, lon, lat, indirizzo, tipologia, descrizione) VALUES
(1, 'Foscari-Verri s.r.l.', 11.8285626, 45.3933894, 'Via Mario Merlin, Voltabrusegana, Brusegana, Padova, Veneto, 35143, Italia', 'Sport', 'Campo da tennis'),
(2, 'Gargallo, Curci e Udinesi s.r.l.', 11.8927559, 45.3588598, 'Via Salboro, Pozzoveggiani, Salboro, Padova, Veneto, 35124, Italia', 'Sport', 'Campo da calcio'),
(3, 'Doria, Favata e Toninelli SPA', 11.8917415, 45.4126507, 'Via Niccolò Tommaseo, Stanga, Padova, Veneto, 35131, Italia', 'Sport', 'Campo da tennis'),
(4, 'Opizzi, Doglioni e Silvestri SPA', 11.8854478, 45.4192179, 'Vicolo Vincenzo Gazzotto, Arcella, Padova, Veneto, 35132, Italia', 'Sport', 'Campo da calcio'),
(5, 'Vitturi s.r.l.', 11.900466, 45.3734978, 'Voltabarozzo, Padova, Veneto, 35126, Italia', 'Cibo', 'Caffetteria'),
(6, 'Pareto SPA', 11.8347239, 45.389259, 'Via Decorati al Valore Civile, Voltabrusegana, Brusegana, Padova, Veneto, 35143, Italia', 'Cibo', 'Pizzeria'),
(7, 'Cesarotti-Leone e figli', 11.8846426, 45.3820397, 'Via Almorò Barbaro, Crocifisso, Padova, Veneto, 35124, Italia', 'Cibo', 'Pizzeria'),
(8, 'Munari-Trentini Group', 11.854989, 45.424785, 'Via Antonio Cecchi, Sant''Ignazio, Padova, Veneto, 35135, Italia', 'Sport', 'Campo da tennis'),
(9, 'Fornaciari-Zampa s.r.l.', 11.9058597, 45.3991056, 'Via Monsignor Girolamo Bortignon, Terranegra, Padova, Veneto, 35128, Italia', 'Sport', 'Centro yoga'),
(10, 'Cignaroli, Correr e Calarco SPA', 11.8331231, 45.3995511, 'Via Macedonio Melloni, Brusegana, Padova, Veneto, 35143, Italia', 'Sport', 'Centro yoga'),
(11, 'Antonacci e figli', 11.899075, 45.3773446, 'Via del Cristo, Voltabarozzo, Padova, Veneto, 35126, Italia', 'Cibo', 'Bar'),
(12, 'Bongiorno, Prada e Grifeo Group', 11.8692219, 45.4098452, 'Via San Pietro, San Giuseppe, Padova, Veneto, 35139, Italia', 'Cibo', 'Caffetteria'),
(13, 'Righi-Toselli e figli', 11.8993614, 45.4000859, 'Via Antonio Bonardi, Forcellini, Padova, Veneto, 35128, Italia', 'Sport', 'Campo da calcio'),
(14, 'Tasso Group', 11.8817407, 45.3658454, 'Via Bosco Wollemborg, Crocifisso, Salboro, Padova, Veneto, 35124, Italia', 'Cibo', 'Bar'),
(15, 'Cibin-Nugnes s.r.l.', 11.8747218, 45.4145645, 'Rotonda Lina Merlin, Arcella, Padova, Veneto, 35139, Italia', 'Sport', 'Campo da tennis'),
(16, 'Sollima-Orsini SPA', 11.8704559, 45.4019133, 'Riviera Tiso da Camposampiero, San Giuseppe, Padova, Veneto, 35112, Italia', 'Sport', 'Campo da tennis'),
(17, 'Sommaruga, Ricciardi e Galtarossa SPA', 11.8854621, 45.407501, 'Tabaccheria - cartoleria, 2, Via Gabriele Falloppio, Stanga, Padova, Veneto, 35121, Italia', 'Cibo', 'Caffetteria'),
(18, 'Zaccardo s.r.l.', 11.8935526, 45.4083332, 'Carichi Sospesi - Circolo Culturale, 12, Vicolo del Portello, Stanga, Padova, Veneto, 35131, Italia', 'Cibo', 'Caffetteria'),
(19, 'Tarchetti-Iadanza s.r.l.', 11.902105, 45.4093342, 'Via Antonio Grassi, Stanga, Padova, Veneto, 35129, Italia', 'Sport', 'Centro yoga'),
(20, 'Doglioni-Salandra s.r.l.', 11.8720363, 45.4069179, 'Via Arco Valaresso, San Giuseppe, Padova, Veneto, 35149, Italia', 'Sport', 'Palestra'),
(21, 'Malatesta s.r.l.', 11.9141748, 45.4130583, 'Via Elia Dalla Costa, San Lazzaro, Padova, Veneto, 35129, Italia', 'Cibo', 'Bar'),
(22, 'Busoni, Tomasetti e Columbo e figli', 11.8811264, 45.3871298, 'Via Gigliolo Scintilla, Madonna Pellegrina, Padova, Veneto, 35124, Italia', 'Cibo', 'Bar'),
(23, 'Adinolfi s.r.l.', 11.9056351, 45.3988822, 'Via Monsignor Girolamo Bortignon, Terranegra, Padova, Veneto, 35128, Italia', 'Sport', 'Campo da tennis'),
(24, 'Tagliafierro-Toninelli e figli', 11.8796184, 45.3922425, 'Via Fabrici Girolamo D''Acquapendente, Santa Rita, Madonna Pellegrina, Padova, Veneto, 35123, Italia', 'Cibo', 'Ristorante Italiano'),
(25, 'Caboto-Pergolesi e figli', 11.8944619, 45.4194989, 'Arcella, Padova, Veneto, 35132, Italia', 'Cibo', 'Caffetteria'),
(26, 'Aldobrandi, Curci e Badoglio s.r.l.', 11.8922511, 45.4251695, 'Via Tiziano Vecellio, San Carlo, Padova, Veneto, 35132, Italia', 'Cibo', 'Bar'),
(27, 'Piovani-Vittadello s.r.l.', 11.8565865, 45.4214735, 'Via Giovanni Bordiga, Sant''Ignazio, Padova, Veneto, 35135, Italia', 'Cibo', 'Ristorante Italiano'),
(28, 'Serlupi-Bramante s.r.l.', 11.8672532, 45.3565344, 'Via Santa Rosa, Albignasego, Padova, Veneto, 35020, Italia', 'Cibo', 'Caffetteria'),
(29, 'Gagliardi SPA', 11.8305646, 45.3679102, 'Servizi Funebri Trevisi, 101, Via Romana Aponense, Mandria, Padova, Veneto, 35142, Italia', 'Sport', 'Campo da calcio'),
(30, 'Grimani s.r.l.', 11.8237137, 45.3690984, 'Via Chioggia, Mandria, Padova, Veneto, 35142, Italia', 'Cibo', 'Caffetteria'),
(31, 'Gregori s.r.l.', 11.8722304, 45.3892857, 'Via Tre Garofani, Sacra Famiglia, Padova, Veneto, 35123, Italia', 'Sport', 'Campo da tennis'),
(32, 'Calgari, Murri e Accardo Group', 11.9091885, 45.4195084, 'Arco di Giano, San Lazzaro, Padova, Veneto, 35129, Italia', 'Sport', 'Palestra'),
(33, 'Pulci-Cerquiglini e figli', 11.8526559, 45.4250017, 'Via Vincenzo Maria Coronelli, Sant''Ignazio, Padova, Veneto, 35135, Italia', 'Sport', 'Piscina'),
(34, 'Salandra SPA', 11.8510456, 45.3754541, 'Via Galileo Galilei, Sant''Agostino, Albignasego, Padova, Veneto, 35020, Italia', 'Sport', 'Campo da calcio'),
(35, 'Morlacchi, Binaghi e Trapani Group', 11.8978347, 45.4024889, 'Via Pietro Barozzi, Forcellini, Padova, Veneto, 35128, Italia', 'Cibo', 'Caffetteria'),
(36, 'Verri-Turati s.r.l.', 11.9050869, 45.3992992, 'Via Gerolamo Dell''Angelo, Forcellini, Padova, Veneto, 35128, Italia', 'Sport', 'Campo da tennis'),
(37, 'Toscanini, Lopresti e Cuomo SPA', 11.8635997, 45.38723, 'Sacra Famiglia, Padova, Veneto, 35125, Italia', 'Sport', 'Centro yoga'),
(38, 'Filippini, Trebbi e Carpaccio Group', 11.9192326, 45.3735021, 'Via Vittorio Alfieri, Roncaglia, Ponte San Nicolò, Padova, Veneto, 35020, Italia', 'Cibo', 'Pizzeria'),
(39, 'Contarini-Belletini Group', 11.8754766, 45.4208978, 'Via Annibale da Bassano, Arcella, Padova, Veneto, 35100, Italia', 'Cibo', 'Bar'),
(40, 'Dossi, Santorio e Praga SPA', 11.8582382, 45.3993764, 'Vicolo Castelfidardo, San Giuseppe, Padova, Veneto, 35141, Italia', 'Sport', 'Campo da calcio'),
(41, 'Parri Group', 11.9120439, 45.4247038, 'Via Madonna della Salute, Mortise, Padova, Veneto, 35129, Italia', 'Cibo', 'Bar'),
(42, 'Gozzi-Grisoni Group', 11.8480772, 45.4086579, 'Via Thomas Alva Edison, Cave, Padova, Veneto, 35143, Italia', 'Cibo', 'Caffetteria'),
(43, 'Avogadro-Montalti Group', 11.9004708, 45.374404, 'Via Voltabarozzo, Voltabarozzo, Padova, Veneto, 35126, Italia', 'Sport', 'Palestra'),
(44, 'Maderno, Cusano e Cipolla s.r.l.', 11.8418348, 45.4078457, 'Via Pelosa, Cave, Padova, Veneto, 35143, Italia', 'Sport', 'Campo da tennis'),
(45, 'Peano e figli', 11.891573, 45.3976808, 'Via Luigi Padrin, Santa Rita, Sant''Osvaldo, Padova, Veneto, 35126, Italia', 'Cibo', 'Caffetteria'),
(46, 'Brancaccio e figli', 11.839618, 45.3684916, 'Via Portogruaro, Mandria, Padova, Veneto, 35142, Italia', 'Sport', 'Centro yoga'),
(47, 'Giolitti, Rossini e Missoni Group', 11.8753771, 45.4145825, 'Via Giotto, Arcella, Padova, Veneto, 35139, Italia', 'Sport', 'Palestra'),
(48, 'Conti, Cicilia e Pavarotti s.r.l.', 11.8986057, 45.3963618, 'Via Carlo Guido Patin, Santa Rita, Forcellini, Padova, Veneto, 35128, Italia', 'Sport', 'Centro yoga'),
(49, 'Zampa SPA', 11.871914, 45.3715427, 'Via Italo Svevo, Guizza, Padova, Veneto, 35125, Italia', 'Cibo', 'Pizzeria'),
(50, 'Scialpi-Pavone Group', 11.8683682, 45.4083406, 'Via Patriarcato, San Giuseppe, Padova, Veneto, 35139, Italia', 'Sport', 'Piscina'),
(51, 'Casaleggio, Ricolfi e Fagiani Group', 11.9023424, 45.4111644, 'Via Antonio Grassi, Stanga, Padova, Veneto, 35131, Italia', 'Sport', 'Campo da calcio'),
(52, 'Valmarana, Camicione e Guarato Group', 11.8252015, 45.4223273, 'Sarmeola, Rubano, Padova, Veneto, 35030, Italia', 'Cibo', 'Pizzeria'),
(53, 'Tron, Piazzi e Baglioni e figli', 11.8395579, 45.3698616, 'Scuola dell''infanzia Giovanni XXIII, 1, Via Ca'' Rasi, Mandria, Padova, Veneto, 35142, Italia', 'Sport', 'Piscina'),
(54, 'Pratesi, Crespi e Mastandrea s.r.l.', 11.842963, 45.3880652, 'Via Brianza, Voltabrusegana, Paltana, Padova, Veneto, 35142, Italia', 'Sport', 'Campo da tennis'),
(55, 'Gasperi, Tartini e Cammarata s.r.l.', 11.8779451, 45.4187849, 'Via Jacopo Avanzo, Arcella, Padova, Veneto, 35100, Italia', 'Cibo', 'Gelateria'),
(56, 'Fogazzaro e figli', 11.8501649, 45.4074887, 'Chiesa di Gesù Cristo dei Santi degli Ultimi Giorni, 8, Via Pelosa, Cave, Padova, Veneto, 35143, Italia', 'Cibo', 'Ristorante Italiano'),
(57, 'Caffarelli, Gucci e Galiazzo Group', 11.8915947, 45.423115, 'Via Arcangelo Corelli, Arcella, Padova, Veneto, 35132, Italia', 'Cibo', 'Pizzeria'),
(58, 'Gelli Group', 11.8584944, 45.4161584, 'Via Giuseppe Peano, Centrale Idrica di Montà - Ecocentro "Euganea", Sant''Ignazio, Padova, Veneto, 35138, Italia', 'Sport', 'Campo da calcio'),
(59, 'Gentilini, Staglieno e Muratori s.r.l.', 11.8663436, 45.4169139, 'Via Beato Pellegrino, San Giuseppe, Padova, Veneto, 35137, Italia', 'Sport', 'Centro yoga'),
(60, 'Boaga, Sagese e Colletti SPA', 11.9011875, 45.4052365, 'Stanga, Padova, Veneto, 35128, Italia', 'Sport', 'Piscina'),
(61, 'Babati-Nolcini e figli', 11.8798818, 45.3878965, 'Via Guglielmo Compagno, Madonna Pellegrina, Padova, Veneto, 35124, Italia', 'Cibo', 'Bar'),
(62, 'Bernardini, Accardo e Franzese Group', 11.8593811, 45.4203592, 'Centrale Idrica di Montà - Ecocentro "Euganea", Sant''Ignazio, Padova, Veneto, 35138, Italia', 'Sport', 'Palestra'),
(63, 'Castelli s.r.l.', 11.8723729, 45.4250915, 'Via Annibale da Bassano, Sacro Cuore, Padova, Veneto, 35138, Italia', 'Sport', 'Palestra'),
(64, 'Barese-Gritti Group', 11.8797597, 45.4196419, 'Via Pietro Liberi, Arcella, Padova, Veneto, 35100, Italia', 'Cibo', 'Gelateria'),
(65, 'Vismara Group', 11.8455157, 45.3622314, 'Via Guglielmo Marconi, Mandriola, Albignasego, Padova, Veneto, 35020, Italia', 'Sport', 'Piscina'),
(66, 'Benedetti Group', 11.8348728, 45.4236498, 'Via Caporello, Chiesanuova, Padova, Veneto, 35316, Italia', 'Cibo', 'Bar'),
(67, 'Bernini-Sauli e figli', 11.88162, 45.4197178, 'Via Giovanni da Gaibana, Arcella, Padova, Veneto, 35100, Italia', 'Cibo', 'Pizzeria'),
(68, 'Pucci-Cannizzaro Group', 11.8293837, 45.4002415, 'Via Vito Volterra, Brusegana, Padova, Veneto, 35143, Italia', 'Sport', 'Campo da calcio'),
(69, 'Morandini-Roero s.r.l.', 11.8651556, 45.4212835, 'Via Umberto Cagni, Sant''Ignazio, Padova, Veneto, 35138, Italia', 'Sport', 'Campo da tennis'),
(70, 'Galtarossa SPA', 11.8440714, 45.4170832, 'Via Augusto Righi, Chiesanuova, Padova, Veneto, 35143, Italia', 'Cibo', 'Pizzeria'),
(71, 'Prodi e figli', 11.8865601, 45.375401, 'Via Bosco Pedrocchi, Crocifisso, Padova, Veneto, 35124, Italia', 'Sport', 'Piscina'),
(72, 'Sordi e figli', 11.8568801, 45.3779413, 'Via Donatello, Sant''Agostino, Albignasego, Padova, Veneto, 35020, Italia', 'Sport', 'Palestra'),
(73, 'Tozzi, Vidoni e Grasso SPA', 11.8642928, 45.3911884, 'Via Narni, Sacra Famiglia, Padova, Veneto, 35141, Italia', 'Sport', 'Palestra'),
(74, 'Puglisi-Perini SPA', 11.8558301, 45.4249537, 'Via Giovanni Miani, Sant''Ignazio, Padova, Veneto, 35135, Italia', 'Cibo', 'Ristorante Italiano'),
(75, 'Scandone-Proietti s.r.l.', 11.8244417, 45.3758025, 'Via Carnia, Caldon-Lavezzolo, Padova, Veneto, 35142, Italia', 'Cibo', 'Bar'),
(76, 'Asmundo Group', 11.8991595, 45.4057144, 'Lungargine del Piovego, Stanga, Padova, Veneto, 35128, Italia', 'Sport', 'Centro yoga'),
(77, 'Greco SPA', 11.8613594, 45.3944077, 'Via Loreto, Sacra Famiglia, Padova, Veneto, 35141, Italia', 'Sport', 'Campo da tennis'),
(78, 'Solimena, Semitecolo e Metella SPA', 11.8855456, 45.3954255, 'Via Pier Paolo Vergerio, Santa Rita, Madonna Pellegrina, Padova, Veneto, 35126, Italia', 'Sport', 'Piscina'),
(79, 'Cabrini, Cainero e Campanella SPA', 11.8776574, 45.4233427, 'Via Michelangelo Buonarroti, Arcella, Padova, Veneto, 35100, Italia', 'Sport', 'Campo da calcio'),
(80, 'Frescobaldi e figli', 11.8703849, 45.3600028, 'Via Bosco Papadopoli, Albignasego, Padova, Veneto, 35125, Italia', 'Cibo', 'Bar'),
(81, 'Tarantino Group', 11.8561508, 45.3846532, 'Via Decorati al Valore Civile, Paltana, Padova, Veneto, 35125, Italia', 'Cibo', 'Bar'),
(82, 'Dulbecco-Vercelloni e figli', 11.8511984, 45.3803583, 'Via Iesolo, Paltana, Padova, Veneto, 35142, Italia', 'Cibo', 'Caffetteria'),
(83, 'Franceschi e figli', 11.8454604, 45.3993728, 'Via Sorio, Cave, Padova, Veneto, 35143, Italia', 'Sport', 'Campo da calcio'),
(84, 'Barozzi-Zacchia SPA', 11.8826354, 45.4119609, 'Hamerica''s, 2, Via Gaspare Gozzi, Arcella, Padova, Veneto, 35131, Italia', 'Sport', 'Campo da calcio'),
(85, 'Tencalla-Tolentino SPA', 11.8558441, 45.4200681, 'Via Giovanni Bordiga, Sant''Ignazio, Padova, Veneto, 35135, Italia', 'Sport', 'Centro yoga'),
(86, 'Filzi, Guariento e Falloppio e figli', 11.8704559, 45.4019133, 'Riviera Tiso da Camposampiero, San Giuseppe, Padova, Veneto, 35112, Italia', 'Sport', 'Centro yoga'),
(87, 'Jovinelli, Fabbri e Pedroni Group', 11.8705368, 45.4118448, 'Via dei Savonarola, San Giuseppe, Padova, Veneto, 35137, Italia', 'Cibo', 'Bar'),
(88, 'Iannuzzi s.r.l.', 11.8549169, 45.4012734, 'Via Amba Alagi, San Giuseppe, Padova, Veneto, 35141, Italia', 'Sport', 'Piscina'),
(89, 'Petruzzi Group', 11.8466589, 45.4129714, 'Via Leo Benvenuti, Cave, Padova, Veneto, 35136, Italia', 'Cibo', 'Gelateria'),
(90, 'Interminei, Sagnelli e Tamburi s.r.l.', 11.8687313, 45.374308, 'Via Giosuè Borsi, Guizza, Padova, Veneto, 35125, Italia', 'Sport', 'Palestra'),
(91, 'Cattaneo-Saffi Group', 11.899455, 45.3864206, 'Via Lando Landucci, Voltabarozzo, Padova, Veneto, 35126, Italia', 'Sport', 'Centro yoga'),
(92, 'Benussi e figli', 11.8932838, 45.3976794, 'Via dei Gatari, Santa Rita, Forcellini, Padova, Veneto, 35128, Italia', 'Sport', 'Palestra'),
(93, 'Callegari-Capecchi SPA', 11.8657964, 45.4117, 'Corso Milano, San Giuseppe, Padova, Veneto, 35137, Italia', 'Sport', 'Palestra'),
(94, 'Chinnici-Rusticucci s.r.l.', 11.8265605, 45.3683051, 'Via Gemona, Mandria, Padova, Veneto, 35142, Italia', 'Cibo', 'Bar'),
(95, 'Venturi, Bellucci e Moschino s.r.l.', 11.8936869, 45.4034812, 'Via Gattamelata, Forcellini, Padova, Veneto, 35128, Italia', 'Sport', 'Piscina'),
(96, 'Giolitti, Errani e Capecchi SPA', 11.8834821, 45.3871443, 'Via dei Giacinti, Madonna Pellegrina, Padova, Veneto, 35124, Italia', 'Sport', 'Centro yoga'),
(97, 'Soffici Group', 11.8812174, 45.3957019, 'Scuola dell''infanzia Giustina Pianta, 64, Via Michele Sanmicheli, Santa Rita, Madonna Pellegrina, Padova, Veneto, 35123, Italia', 'Sport', 'Campo da calcio'),
(98, 'Cardano-Aldobrandi e figli', 11.8190268, 45.4180875, 'Via Caselle, Caselle, Selvazzano Dentro, Padova, Veneto, 35030, Italia', 'Cibo', 'Caffetteria'),
(99, 'Rienzo-Dalla s.r.l.', 11.8971749, 45.400904, 'Casa di accoglienza San Camillo, 2, Via Giambattista Verci, Santa Rita, Forcellini, Padova, Veneto, 35128, Italia', 'Sport', 'Campo da tennis'),
(100, 'Palumbo e figli', 11.8393819, 45.3727585, 'Via Oderzo, Caldon-Lavezzolo, Padova, Veneto, 35142, Italia', 'Sport', 'Piscina'),
(101, 'Roth, Cianciolo e Battisti s.r.l.', 11.8986575, 45.3785931, 'Via Rainiero Vasco, Voltabarozzo, Padova, Veneto, 35126, Italia', 'Cibo', 'Caffetteria'),
(102, 'Bragaglia e figli', 11.9012174, 45.3988813, 'Via Antonio Bonardi, Forcellini, Padova, Veneto, 35128, Italia', 'Cibo', 'Bar'),
(103, 'Schicchi-Morabito Group', 11.891773, 45.4125316, 'Via Niccolò Tommaseo, Stanga, Padova, Veneto, 35131, Italia', 'Cibo', 'Gelateria'),
(104, 'Ginese, Cherubini e Cutrufo SPA', 11.8632434, 45.4033783, 'Genny''s Pizza, 4, Via Cernaia, San Giuseppe, Padova, Veneto, 35141, Italia', 'Cibo', 'Bar'),
(105, 'Rosiello, Napolitano e Pavone e figli', 11.8841835, 45.4178574, 'Via Jacopo Avanzo, Arcella, Padova, Veneto, 35100, Italia', 'Cibo', 'Ristorante Italiano'),
(106, 'Cherubini-Borromeo Group', 11.8694632, 45.4100634, 'Via San Pietro, San Giuseppe, Padova, Veneto, 35139, Italia', 'Sport', 'Campo da calcio'),
(107, 'Tafuri s.r.l.', 11.9025593, 45.4129162, 'Via Guido Puchetti, Stanga, Padova, Veneto, 35131, Italia', 'Sport', 'Campo da tennis'),
(108, 'Tolentino-Paolini s.r.l.', 11.8685469, 45.3875873, 'Viale Felice Cavallotti, Sacra Famiglia, Padova, Veneto, 35125, Italia', 'Cibo', 'Gelateria'),
(109, 'Tasca, Casale e Pasqua e figli', 11.8934512, 45.3903539, 'Via Lorenzo Pignoria, Santa Rita, Sant''Osvaldo, Padova, Veneto, 35126, Italia', 'Cibo', 'Gelateria'),
(110, 'Segrè, Nicolini e Zamorani SPA', 11.8630848, 45.3583734, 'Via Santa Lucia, Albignasego, Padova, Veneto, 35020, Italia', 'Sport', 'Palestra'),
(111, 'Tanzini Group', 11.8726988, 45.406652, 'Via dei Soncin, San Giuseppe, Padova, Veneto, 35149, Italia', 'Cibo', 'Ristorante Italiano'),
(112, 'Gaiatto, Majewski e Caironi Group', 11.9051088, 45.3994877, 'Via Gerolamo Dell''Angelo, Forcellini, Padova, Veneto, 35128, Italia', 'Sport', 'Centro yoga'),
(113, 'Spallanzani, Carullo e Paruta SPA', 11.8640563, 45.3873517, 'Trattoria Basso Isonzo, 1, Via Monte Pertica, Sacra Famiglia, Padova, Veneto, 35125, Italia', 'Cibo', 'Caffetteria'),
(114, 'Bataglia Group', 11.8728447, 45.4165796, 'Via delle Palme, Arcella, Padova, Veneto, 35137, Italia', 'Cibo', 'Bar'),
(115, 'Gemito SPA', 11.8237697, 45.3691923, 'Via Chioggia, Mandria, Padova, Veneto, 35142, Italia', 'Cibo', 'Gelateria'),
(116, 'Comboni, Pezzali e Offredi SPA', 11.9142894, 45.4195687, 'Via Orlando Galante, San Lazzaro, Padova, Veneto, 35129, Italia', 'Cibo', 'Pizzeria'),
(117, 'Satriani-Treccani SPA', 11.8645832, 45.4199379, 'Via Giovanni Ameglio, Sant''Ignazio, Padova, Veneto, 35138, Italia', 'Sport', 'Piscina'),
(118, 'Traversa s.r.l.', 11.8693907, 45.3809609, 'Via Paolo Diacono, Guizza, Padova, Veneto, 35125, Italia', 'Sport', 'Palestra'),
(119, 'Stefanelli s.r.l.', 11.8969819, 45.4228126, 'Via Ludovico Beethoven, San Carlo, Padova, Veneto, 35132, Italia', 'Sport', 'Piscina'),
(120, 'Giannelli SPA', 11.8784758, 45.4002355, 'Via Beato Luca Belludi, Madonna Pellegrina, Padova, Veneto, 35123, Italia', 'Cibo', 'Caffetteria'),
(121, 'Pacetti SPA', 11.8607529, 45.4197629, 'Via Giuseppe Peano, Sant''Ignazio, Padova, Veneto, 35138, Italia', 'Sport', 'Palestra'),
(122, 'Spallanzani, Tremonti e Baglioni Group', 11.8244417, 45.3758025, 'Via Carnia, Caldon-Lavezzolo, Padova, Veneto, 35142, Italia', 'Cibo', 'Pizzeria'),
(123, 'Rizzo, Palazzo e Pedrazzini s.r.l.', 11.819292, 45.4117983, 'Caselle, Selvazzano Dentro, Padova, Veneto, 35030, Italia', 'Sport', 'Centro yoga'),
(124, 'Navarria s.r.l.', 11.8784983, 45.425152, 'Naue Bonà, 25, Via Tiziano Minio, Arcella, Padova, Veneto, 35134, Italia', 'Sport', 'Campo da tennis'),
(125, 'Santi Group', 11.8800134, 45.3867808, 'Via Pataro Buzzaccarini, Madonna Pellegrina, Padova, Veneto, 35124, Italia', 'Sport', 'Palestra'),
(126, 'Anastasi, Poerio e Tosto Group', 11.8405719, 45.3972765, 'Cavalcavia Brusegana, Brusegana, Padova, Veneto, 35143, Italia', 'Sport', 'Campo da tennis'),
(127, 'Endrizzi, Nonis e Pascarella e figli', 11.8615717, 45.411562, 'Via Piave, San Giuseppe, Padova, Veneto, 35138, Italia', 'Cibo', 'Caffetteria'),
(128, 'Galvani, Mazzacurati e Duse e figli', 11.8814228, 45.3936589, 'Via Jacopo Crescini, Santa Rita, Madonna Pellegrina, Padova, Veneto, 35123, Italia', 'Sport', 'Centro yoga'),
(129, 'Botta-Canetta s.r.l.', 11.9072439, 45.3942589, 'Via Pietro Pinton, Terranegra, Padova, Veneto, 35128, Italia', 'Cibo', 'Caffetteria'),
(130, 'Zabarella-Mazzacurati s.r.l.', 11.853889, 45.3846007, 'Via Decorati al Valore Civile, Paltana, Padova, Veneto, 35142, Italia', 'Sport', 'Campo da tennis'),
(131, 'Paolucci-Cannizzaro Group', 11.8771596, 45.423674, 'Via Raffaello Sanzio, Arcella, Padova, Veneto, 35100, Italia', 'Cibo', 'Ristorante Italiano'),
(132, 'Giannelli Group', 11.8935526, 45.4083332, 'Carichi Sospesi - Circolo Culturale, 12, Vicolo del Portello, Stanga, Padova, Veneto, 35131, Italia', 'Cibo', 'Gelateria'),
(133, 'Pisano, Villadicani e Abatantuono Group', 11.8349656, 45.3677389, 'Via Eraclea, Mandria, Padova, Veneto, 35142, Italia', 'Sport', 'Palestra'),
(134, 'Chinnici-Rizzoli e figli', 11.8733134, 45.3677233, 'Via Guizza, Crocifisso, Padova, Veneto, 35125, Italia', 'Cibo', 'Caffetteria'),
(135, 'Boldù s.r.l.', 11.868776, 45.3763111, 'Via Guido Cavalcanti, Guizza, Padova, Veneto, 35125, Italia', 'Sport', 'Piscina'),
(136, 'Manzoni, Anichini e Montanariello s.r.l.', 11.9019378, 45.3772935, 'Via Giovanni Acuto, Voltabarozzo, Padova, Veneto, 35126, Italia', 'Sport', 'Centro yoga'),
(137, 'Querini s.r.l.', 11.8905449, 45.3676385, 'Bembo Est, Corso Primo Maggio, Voltabarozzo, Salboro, Padova, Veneto, 35124, Italia', 'Sport', 'Piscina'),
(138, 'Pagnotto, Nibali e Rienzo e figli', 11.8547055, 45.4022067, 'Via Gino Allegri, San Giuseppe, Padova, Veneto, 35141, Italia', 'Cibo', 'Bar'),
(139, 'Paolucci-Cundari Group', 11.8570255, 45.389052, 'Via La Spezia, Paltana, Padova, Veneto, 35125, Italia', 'Cibo', 'Ristorante Italiano'),
(140, 'Vergerio, Cimini e Poerio e figli', 11.8706039, 45.4214679, 'Corso delle Tre Venezie, Sacro Cuore, Padova, Veneto, 35138, Italia', 'Sport', 'Piscina'),
(141, 'Tomasetti SPA', 11.8572422, 45.4042234, 'Via Attilio Galvani, San Giuseppe, Padova, Veneto, 35141, Italia', 'Cibo', 'Ristorante Italiano'),
(142, 'Calvo e figli', 11.894939, 45.3896958, 'Via Pietro Brandolese, Santa Rita, Sant''Osvaldo, Padova, Veneto, 35126, Italia', 'Cibo', 'Caffetteria'),
(143, 'Guinizzelli-Accardo s.r.l.', 11.8784222, 45.3895528, 'Via delle Rose, Madonna Pellegrina, Padova, Veneto, 35124, Italia', 'Cibo', 'Ristorante Italiano'),
(144, 'Donini, Pareto e Blasi e figli', 11.8641127, 45.41236, 'Piazzale di Porta Savonarola, San Giuseppe, Padova, Veneto, 35138, Italia', 'Sport', 'Campo da tennis'),
(145, 'Letta-Armellini Group', 11.8696366, 45.3604153, 'Vicolo Giacomo Zanella, Albignasego, Padova, Veneto, 35020, Italia', 'Cibo', 'Caffetteria'),
(146, 'Rosiello, Sordi e Buonauro SPA', 11.8517667, 45.3830977, 'Corti e Buoni, 25, Via Rovigo, Paltana, Padova, Veneto, 35142, Italia', 'Sport', 'Piscina'),
(147, 'Randazzo, Maggioli e Navarria Group', 11.8991595, 45.4057144, 'Lungargine del Piovego, Stanga, Padova, Veneto, 35128, Italia', 'Cibo', 'Pizzeria'),
(148, 'Bocca-Aldobrandi Group', 11.8698091, 45.3571466, 'Via Roma, Albignasego, Padova, Veneto, 35020, Italia', 'Sport', 'Campo da calcio'),
(149, 'Giammusso, Majorana e Vespucci s.r.l.', 11.8672062, 45.4015656, 'Bar la Specola, 66, Riviera Paleocapa, San Giuseppe, Padova, Veneto, 35141, Italia', 'Cibo', 'Bar'),
(150, 'Granatelli SPA', 11.9028963, 45.408926, 'Via Venezia, Stanga, Padova, Veneto, 35128, Italia', 'Cibo', 'Bar'),
(151, 'Caboto, Fermi e Faggiani SPA', 11.8783675, 45.417704, 'Piazzale della Stazione, Arcella, Padova, Veneto, 35100, Italia', 'Sport', 'Palestra'),
(152, 'Gibilisco-Beffa SPA', 11.881859, 45.4234486, 'Via Gioacchino Rossini, Arcella, Padova, Veneto, 35134, Italia', 'Cibo', 'Caffetteria'),
(153, 'Rocca, Angeli e Chiappetta e figli', 11.8763271, 45.3913881, 'Vicolo delle Ortensie, Madonna Pellegrina, Padova, Veneto, 35123, Italia', 'Cibo', 'Ristorante Italiano'),
(154, 'Ligorio e figli', 11.8689888, 45.3977264, 'Via Paolo Camillo Thaon di Revel, Sacra Famiglia, Padova, Veneto, 35123, Italia', 'Sport', 'Palestra'),
(155, 'Lucciano, Greggio e Marconi Group', 11.844402, 45.3650009, 'Via Don Giovanni Minzoni, Mandriola, Albignasego, Padova, Veneto, 35020, Italia', 'Sport', 'Palestra'),
(156, 'Bosio, Troisi e Ferraris s.r.l.', 11.888367, 45.4184598, 'Via Antonio Stradivari, Arcella, Padova, Veneto, 35132, Italia', 'Cibo', 'Pizzeria'),
(157, 'Monteverdi, Venier e Trincavelli Group', 11.8727783, 45.3566027, 'Albignasego, Padova, Veneto, 35020, Italia', 'Cibo', 'Pizzeria'),
(158, 'Piccio, Pucci e Rosselli s.r.l.', 11.9077022, 45.4056733, 'Via Jacopo Corrado, Stanga, Padova, Veneto, 35128, Italia', 'Cibo', 'Bar'),
(159, 'Cremonesi e figli', 11.8509451, 45.419787, 'Via Max Planck, Sant''Ignazio, Padova, Veneto, 35135, Italia', 'Sport', 'Palestra'),
(160, 'Filippini-Orlando s.r.l.', 11.8889642, 45.3631875, 'Via Monsignor Placido Ponchia, Salboro, Padova, Veneto, 35124, Italia', 'Sport', 'Centro yoga'),
(161, 'Gori, Guarana e Tresoldi e figli', 11.8465101, 45.3656354, 'Via Don Lorenzo Milani, Mandriola, Albignasego, Padova, Veneto, 35020, Italia', 'Cibo', 'Pizzeria'),
(162, 'Raurica, Peano e Trentini s.r.l.', 11.9101685, 45.3749803, 'Via Guglielmo Marconi, Roncaglia, Ponte San Nicolò, Padova, Veneto, 35020, Italia', 'Cibo', 'Pizzeria'),
(163, 'Giradello-Tron SPA', 11.8569384, 45.4219949, 'Via Montà, Sant''Ignazio, Padova, Veneto, 35135, Italia', 'Sport', 'Campo da calcio'),
(164, 'Ostinelli-Filippini SPA', 11.8952505, 45.4218958, 'Via Riccardo Wagner, San Carlo, Padova, Veneto, 35132, Italia', 'Sport', 'Piscina'),
(165, 'Caironi, Interminelli e Varano e figli', 11.8981696, 45.3719772, 'Via Girolamo Savorgnan, Crocifisso, Salboro, Padova, Veneto, 35126, Italia', 'Sport', 'Palestra'),
(166, 'Tagliafierro-Vismara SPA', 11.8324759, 45.4010149, 'Via Stanislao Cannizzaro, Brusegana, Padova, Veneto, 35143, Italia', 'Sport', 'Palestra'),
(167, 'Camuccini-Piovani SPA', 11.8770179, 45.401137, 'Via Antonio Locatelli, Madonna Pellegrina, Padova, Veneto, 35123, Italia', 'Sport', 'Palestra'),
(168, 'Ferrata-Trapani SPA', 11.9155497, 45.371614, 'Via Vincenzo Bellini, Roncaglia, Ponte San Nicolò, Padova, Veneto, 35020, Italia', 'Cibo', 'Caffetteria'),
(169, 'Valguarnera, Maderna e Nolcini SPA', 11.870742, 45.3663749, 'Via Grazia Deledda, Crocifisso, Padova, Veneto, 35125, Italia', 'Sport', 'Piscina'),
(170, 'Ferrara-Fo s.r.l.', 11.8965756, 45.3999856, 'Via Nazareth, Santa Rita, Forcellini, Padova, Veneto, 35128, Italia', 'Sport', 'Piscina'),
(171, 'Monte-Tamburi e figli', 11.8863991, 45.4218237, 'Via Beata Elena Enselmini, Arcella, Padova, Veneto, 35132, Italia', 'Cibo', 'Ristorante Italiano'),
(172, 'Iannucci, Vergerio e Farinelli s.r.l.', 11.8861382, 45.4196403, 'Via Riccardo Drigo, Arcella, Padova, Veneto, 35132, Italia', 'Cibo', 'Bar'),
(173, 'Rizzoli-Tencalla SPA', 11.8409426, 45.4082173, 'Sport & Kombat, 70, Via delle Cave, Cave, Padova, Veneto, 35136, Italia', 'Sport', 'Campo da calcio'),
(174, 'Aporti, Agnesi e Guarana e figli', 11.900034, 45.4030911, 'Via Gattamelata, Forcellini, Padova, Veneto, 35128, Italia', 'Cibo', 'Gelateria'),
(175, 'Gradenigo, Pasolini e Guarato Group', 11.8621061, 45.385121, 'Via Vittorio Veneto, Paltana, Padova, Veneto, 35125, Italia', 'Cibo', 'Gelateria'),
(176, 'Scotto, Gulotta e Stucchi s.r.l.', 11.8626005, 45.4142741, 'Via Garigliano, San Giuseppe, Padova, Veneto, 35138, Italia', 'Cibo', 'Caffetteria'),
(177, 'Gentileschi-Boccaccio e figli', 11.852066, 45.4019985, 'Via Col Berretta, San Giuseppe, Padova, Veneto, 35141, Italia', 'Sport', 'Piscina'),
(178, 'Manunta, Rocca e Balla e figli', 11.8794168, 45.4216954, 'Via Tintoretto, Arcella, Padova, Veneto, 35100, Italia', 'Cibo', 'Caffetteria'),
(179, 'Pagliaro Group', 11.8879084, 45.3900611, 'Via Francesco Flores D''Arcais, Santa Rita, Sant''Osvaldo, Padova, Veneto, 35126, Italia', 'Cibo', 'Caffetteria'),
(180, 'Federici, Nitto e Segrè s.r.l.', 11.8855729, 45.4136104, 'Galleria Fratelli Ruffini, Arcella, Padova, Veneto, 35121, Italia', 'Sport', 'Campo da tennis'),
(181, 'Romagnoli s.r.l.', 11.8744352, 45.3978886, '18, Corso Vittorio Emanuele II, Sacra Famiglia, Padova, Veneto, 35123, Italia', 'Cibo', 'Gelateria'),
(182, 'Duodo, Manolesso e Battaglia Group', 11.8484216, 45.381072, 'Paltana, Padova, Veneto, 35142, Italia', 'Cibo', 'Pizzeria'),
(183, 'Bragadin, Marinetti e Lombardo Group', 11.8722853, 45.3839898, 'Via Jacopo Sadoleto, Guizza, Padova, Veneto, 35125, Italia', 'Cibo', 'Gelateria'),
(184, 'Petrucci-Pisacane SPA', 11.889536, 45.4233312, 'Via Augusto Caratti, Arcella, Padova, Veneto, 35132, Italia', 'Sport', 'Palestra'),
(185, 'Faugno-Scandone SPA', 11.907432, 45.3792465, 'Via Ludovico Sambonifacio, Voltabarozzo, Padova, Veneto, 35126, Italia', 'Sport', 'Palestra'),
(186, 'Zoppetto s.r.l.', 11.8752169, 45.3907193, 'Via delle Rose, Madonna Pellegrina, Padova, Veneto, 35123, Italia', 'Sport', 'Campo da calcio'),
(187, 'Cipolla, Civaschi e Vanvitelli e figli', 11.8918151, 45.3700106, 'Via del Cristo, Crocifisso, Salboro, Padova, Veneto, 35124, Italia', 'Cibo', 'Bar'),
(188, 'Lombroso Group', 11.8209432, 45.4106375, 'Via Nazario Sauro, Caselle, Selvazzano Dentro, Padova, Veneto, 35030, Italia', 'Sport', 'Palestra'),
(189, 'Trillini, Prodi e Querini s.r.l.', 11.8905785, 45.3877068, 'Via Ildebrandino Mezzabati, Sant''Osvaldo, Padova, Veneto, 35126, Italia', 'Cibo', 'Caffetteria'),
(190, 'Gasperi, Grassi e Navarria s.r.l.', 11.8690006, 45.3818063, 'Via Guizza, Guizza, Padova, Veneto, 35125, Italia', 'Cibo', 'Caffetteria'),
(191, 'Sibilia-Avogadro e figli', 11.8226067, 45.4147433, 'Via Damiano Chiesa, Caselle, Selvazzano Dentro, Padova, Veneto, 35030, Italia', 'Cibo', 'Gelateria'),
(192, 'Buonauro-Comencini e figli', 11.8721603, 45.3945508, 'Via Armando Diaz, Sacra Famiglia, Padova, Veneto, 35123, Italia', 'Sport', 'Piscina'),
(193, 'Ceschi Group', 11.8852906, 45.3803896, 'Via Pietro Pomponazzi, Crocifisso, Padova, Veneto, 35124, Italia', 'Cibo', 'Ristorante Italiano'),
(194, 'Sanudo-Gussoni e figli', 11.88344, 45.3953371, 'Via Giacomo Leopardi, Santa Rita, Madonna Pellegrina, Padova, Veneto, 35123, Italia', 'Cibo', 'Ristorante Italiano'),
(195, 'Accardo, Borromini e Malaparte Group', 11.8393115, 45.4114774, 'Via Nazzareno Strampelli, Cave, Padova, Veneto, 35136, Italia', 'Sport', 'Campo da tennis'),
(196, 'Boezio, Vecellio e Ginese e figli', 11.8616631, 45.4154317, 'Via Stefano Turr, San Giuseppe, Padova, Veneto, 35138, Italia', 'Sport', 'Palestra'),
(197, 'Tirabassi, Bocelli e Venditti SPA', 11.8632919, 45.4175983, 'Via Paolo Sambin, Sant''Ignazio, Padova, Veneto, 35138, Italia', 'Cibo', 'Caffetteria'),
(198, 'Burcardo-Papafava e figli', 11.8189112, 45.4198898, 'Via della Provvidenza, Sarmeola, Rubano, Padova, Veneto, 35030, Italia', 'Cibo', 'Gelateria'),
(199, 'Carosone e figli', 11.8842497, 45.3804053, 'Via Pietro Bembo, Crocifisso, Padova, Veneto, 35124, Italia', 'Sport', 'Campo da calcio'),
(200, 'Petrucci, Morricone e Petrassi SPA', 11.899462, 45.4177176, 'Via Eugenio Curiel, Stanga, Padova, Veneto, 35131, Italia', 'Cibo', 'Caffetteria');