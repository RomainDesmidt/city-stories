puts "Cleaning database..."
JourneyPOI.destroy_all
POI.destroy_all
Journey.destroy_all
User.destroy_all

puts "Creating users..."
url = "http://lorempixel.com/50/50/people/"
victoire = User.create!(
  pseudo: "Victoire",
  email: "victoire@gmail.com",
  password: "123456",
  password_confirmation: "123456"
)
victoire.remote_avatar_url = "db/fixtures/images/victoire.jpg"
victoire.save!

gregoire = User.create!(
  pseudo: "gregoire",
  email: "gregoire@gmail.com",
  password: "123456",
  password_confirmation: "123456"
)
gregoire.remote_avatar_url = "db/fixtures/images/gregoire.jpg"
gregoire.save!

thomas = User.create!(
  pseudo: "Thomas",
  email: "thomas@gmail.com",
  password: "123456",
  password_confirmation: "123456"
)

thomas.remote_avatar_url = "db/fixtures/images/thomas.png"
thomas.save!

camille = User.create!(
  pseudo: "Camille",
  email: "camille@gmail.com",
  password: "123456",
  password_confirmation: "123456"
)

camille.remote_avatar_url = "db/fixtures/images/camille.jpg"
camille.save!

puts "Creating POIs..."
machine_de_l_ile = POI.create!(latitude: 47.205517, longitude: -1.564228);
trentmoult = POI.create!(latitude: 47.195252, longitude: -1.581603);
parc_de_proce = POI.create!(latitude: 47.223744, longitude: -1.581836)
passage_pommeray = POI.create!(latitude: 47.213304, longitude: -1.559011);
ile_de_versaille = POI.create!(latitude: 47.226925, longitude: -1.554290);
gare_sncf = POI.create!(latitude: 47.217674, longitude: -1.541814);
cathedrale = POI.create!(latitude: 47.218232, longitude: -1.550893);
pont_arche_seche = POI.create!(latitude: 47.216771,longitude: -1.558394);
l_erdre = POI.create!(latitude: 47.236000,longitude: -1.549751);
talensac = POI.create!(latitude: 47.220869,longitude: -1.557682);
jardin_confluent = POI.create!(latitude: 47.196828,longitude: -1.545764);
parc_carpa = POI.create!(latitude: 47.220869,longitude: -1.557682);

puts "Creating journeys..."
journey_1 = Journey.create!(
  name: "Night experience",
  user: thomas,
  journey_pois: [
    JourneyPOI.new(
      name: "Île de versaille",
      description: "Après une soirée qui se finit tard dans la nuit et avec quelques amis, on aime se retrouver sur le ponton au bout de l’île de Versailles finir les bières. Idéalement nous attendons l’ouverture des boulangeries pour prendre le petit déjeuner isolé de la ville.",
      poi: ile_de_versaille,
      photo: File.new(Rails.root.join("db/fixtures/images/29223108.jpg"))

    ),
    JourneyPOI.new(
      name: "Le toit de la Cathédrale",
      description: "Histoire complétement folle. Avec une amie (qui sortait d »une relation difficile) nous avons grimpé par l’échafaudage de la cathédrale pour atteindre son toit. Nous avons passé 4h à déambuler entre les contreforts, les toits, les ornements pour finalement finir sur la façade et fumé une cigarette en silence. Je lui ai écrit un poème pour lui remonter le moral.",
      poi: cathedrale,
      text: <<~EOF
        Sur les toits, les poumons amples.

        Les gens qui arrivent à ressentir ne sont pas les plus heureux,
        Mais sont certainement les plus vivants,
        Et dès lors ou ils installent la souffrance du cœur aux firmaments,
        Ils feront partis de Celles et Ceux des cimes des cieux.

        Ces rares, qui à leurs derniers lendemains
        Seront arrimés au bastingage du courage et,
        Penchés par-dessus le pont, ils verront leurs anciens démons chantés,
        « J’ai aimé ».

        Et là tu peux être que tous les autres connards qui
        Marchent dans la rue comme des cadavres ambulants,
        Te regardant avec leurs airs auto-suffisants et méprisants,
        Seront épris du seul sentiment qui leur reste : la Jalousie.

        Mais ne leur en veut pas.
        Ils n’ont que ça pour se sentir là,
        Et ils feront tout pour se nourrir de tes joies,
        Partagées entre ton aimé et toi.

        Et ne lui en veut pas.
        Tu es femme et il est homme
        Et comment peut-il oublier tes anciennes caresses lunaires,
        Comment peut-il lutter contre la paresse de la chaire ?

        Et ne t’en veux pas.
        Toi qui tombe sans cesse dans ses bras,
        Toi qui n’arrive pas à oublier celui qui essaye de t’oublier.
        Regarde donc vers le ciel et écoute les étoiles te murmurer :

        « La vie ne devrait exister que par l’amour.
        Alors quitte ce monde et rejoins nous pour toujours
        Dans les citadelles de la pensée, là où on distille
        Le combat d’une vie en air pur.
        Et laisse celui-ci suivre le périple des vents,
        Parfois chaud, parfois froid,
        Laisse-le te prendre physiquement
        Comme un nouveau souffle,
        Comme un nouvel émoi,
        Comme une nouvelle vie,
        Que tu pourras prendre de tout ton corps
        Les poumons amples. »

        Les poumons amples saturés d’un air nouveau,
        Qui fait gonfler ta poitrine vers le ciel,
        Qui fait voir du bleu dans tes yeux noirs,
        Qui te fait sourire, d’un sourire qui fait rougir le monde entier.

        C’est pour ces poumons-là,
        Que les chamanes des terres indiennes ont dansé,
        Au rythme frénétique d’un feu endiablé.
        Allez, danse, danse, danse dans les rêves indiens, remplis de fierté.

        Thomas Ollivier
        EOF
    ),
    JourneyPOI.new(
      name: "Sous le pont de l'arche sèche",
      description: "Avec un ami nous collons des phrases  découpées dans du papier peint sur les murs de Nantes. Celle-là est installée sous un pont dégueullasse, à la lumière vitreuse, et à l’odeur douteuse. Il y a plusieurs phrases de ce type caché dans les entrailles de Nantes, partez à leurs recherche !",
      poi: pont_arche_seche,
      # remote_photo_url: "http://static.panoramio.com/photos/large/29223108.jpg"
      photo: File.new(Rails.root.join("db/fixtures/images/ilyabeauté.jpg")),
    ),
    JourneyPOI.new(
      name: "Marché talensac",
      description: "Avec un ami nous collons des phrases  découpées dans du papier peint sur les murs de Nantes. Celle-là est destiné aux travailleurs du marché de Talensac. Nous voulions laisser un message à ces travailleurs de l’aube.  Il y a plusieurs phrases de ce type caché dans les entrailles de Nantes, partez à leurs recherche !",
      poi: talensac,
      # remote_photo_url: "http://static.panoramio.com/photos/large/29223108.jpg"
      photo: File.new(Rails.root.join("db/fixtures/images/ilyacourage.jpg"))
    )
  ]
)


journey_2 = Journey.create!(
  name: "Les amoureux",
  user: camille,
  journey_pois: [

    JourneyPOI.new(
      name: "Ruelles de trentmoult",
      description: "Et hop, nous prenons nos vélos direction trentmoult pour passer une après-midi avec nos enfants. Ce n’est pas très loin et le déplacement vaut le coup. Ses petites rues sinueuses, et ses couleurs vives rendent ce petit bout de ville très touchant.",
      poi: trentmoult,
      # remote_photo_url: "http://img.over-blog-kiwi.com/0/93/43/01/20160726/ob_60456d_p1130331.jpg"
      video: "https://www.youtube.com/watch?v=9oXFAp7Epx8"
    ),

    JourneyPOI.new(
      name: "Gare sncf",
      description: "Après 6 mois de stage à l’étranger notre fille nous est enfin revenue ! Mon compagnon à filmer la scène qui s’est passé dans la gare, au milieu des gens. C’était très drôle !",
      poi: gare_sncf,
      # remote_photo_url: "http://images.marredelapluie.fr/membres/0/2/photos/167/1675/167528_cimetiere-misericorde_600.jpg"
      video: "https://www.youtube.com/watch?v=OiJ75m__rZ8"
    ),

    JourneyPOI.new(
      name: "Île de versaille",
      description: "Avec mon petit copain nous aimons se balader le dimanche sur l’île de Versailles. C’est un petit coin de paradis à l’abri du bruit de la ville, parfait pour se ressourcer.",
      poi: ile_de_versaille,
      photo: File.new(Rails.root.join("db/fixtures/images/versailles.jpg"))
    ),
    JourneyPOI.new(
      name: "Parc de procé",
      description: "Grosse sieste sur la pelouse du parc de Procé. Nous avons été réveillés par le son de la nature, le chant des oiseaux et le bruit de l’eau. C’était vraiment agréable de se déconnecté de temps en temps.",
      poi: parc_de_proce,
      sound: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/250167020&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"
    )
  ]
)

journey_3 = Journey.create!(
  name: "Les touristes parisiens",
  user: victoire,
  journey_pois: [
    JourneyPOI.new(
      name: "Bord de l'Erdre",
      description: "Nous avons fait un pique-nique au bord de l’erdre pour se reposer un peu. Et quelle n’était pas notre suprise quand le club de voile d’à coté faisait une sortie bateau un peu particulière à bord de superbe bateaux à voiles .",
      poi: l_erdre,
      # remote_photo_url: "https://imgs.nestimg.com/appartement_3_pieces_69_m_1520044478785553450.jpg"
      photo: File.new(Rails.root.join("db/fixtures/images/erdrebateau.jpg"))
    ),
    JourneyPOI.new(
      name: "Par de procé ",
      description: "Je ne pensais pas que Nantes était aussi verte ! Des parcs partout, sauvages, dense en faune et en flore. J’aurais aimé visité le jardin botanique de Nantes mais nous nous n’aurons pas le temps. La prochaine fois peut être.",
      poi: parc_de_proce,
      # remote_photo_url: "https://media-cdn.tripadvisor.com/media/photo-s/0c/c6/c6/a8/belle-demeure-au-bord.jpg"
      photo: File.new(Rails.root.join("db/fixtures/images/parcdeprocé.jpg"))
    ),
    JourneyPOI.new(
      name: "Passage Pommeray",
      description: "Pour la fin de notre séjour à Nantes, nous avions demandé à un Nantais ou nous pouvions acheter des souvenirs. Et bien tenez-vous bien mais le type nous a fait une visite in.té.grale du passage Pommeray. C’était incroyable et nous avons pu repartir combler.",
      poi: passage_pommeray,
      # remote_photo_url: "https://www.francebleu.fr/s3/cruiser-production/2016/04/be77a965-f883-4b53-971f-edf287ae0a72/870x489_img_1907.jpg"
      photo: File.new(Rails.root.join("db/fixtures/images/passagepommeray.jpg"))
    ),
    JourneyPOI.new(
      name: "Les machines de l'île",
      description: "Nous avons tant  entendu parler de ces “machines de lîle que ce sont pour elles que nous avons décidé de visiter Nantes. Nous avons nagé en pleine science-fiction de l’univers Jules verniens. Je n’oublierais jamais l’éléphant et le dragon. Quelle histoire !",
      poi: machine_de_l_ile,
      # remote_photo_url: "http://img.20mn.fr/IcMIOlrmTtybOfCvdl8idw/2048x1536-fit_pataugeoire-parc-proce-nantes.jpg"
      video: "https://www.youtube.com/embed/DlzG1X9vq8E",
    )
  ]
)


journey_4 = Journey.create!(
  name: "Balade solitaire",
  user: gregoire,
  journey_pois: [
    JourneyPOI.new(
      name: "Le Carroussel des Machines",
      description: "J’aime trainer et observer les gens qui s’extasient devant l’éléphant et le carrousel. De temps en temps je me pause et je lis un livre. Et justement je suis en train de lire un passage de “20000 lieues sous les mers” de Jules Verne quand le capitaine némo fait une description des machines du nautilus. Je découvre que le carrousel pourrait correspondre à cette description.",
      poi: machine_de_l_ile,
      text: <<~EOF

        Je  fus surpris, tout  d’abord, de  l’odeur sui
        generis   qui   emplissait   ce   compartiment.   Le
        capitaine Nemo s’aperçut de mon impression.

        « Ce sont, me dit-il, quelques dégagements de
        gaz, produits par l’emploi du sodium
        ; mais ce n’est qu’un léger inconvénient. Tous les matins,
        d’ailleurs, nous purifions le navire en le ventilant
        à grand air. »

        Cependant, j’examinais avec un intérêt facile à
        concevoir la machine du Nautilus.

        « Vous le voyez, me dit le capitaine Nemo,
        j’emploie des éléments Bunzen, et non des
        éléments Ruhmkorff.Ceux-ci eussent été
        impuissants. Les éléments Bunzen sont peu
        nombreux, mais forts et grands, ce qui vaut
        mieux, expérience faite. L’électricité produite se
        rend à l’arrière, où elle agit par des électro-
        aimants de grande dimension sur un système
        192 particulier de leviers et d’engrenages qui
        transmettent le mouvement à l’arbre de l’hélice.
        Celle-ci, dont le diamètre est de six mètres et le
        pas de sept mètres cinquante, peut donner jusqu’à
        cent vingt tours par seconde.
        EOF
    ),
    JourneyPOI.new(
      name: "Jardin_confluent",
      description: "Un besoin de se poser devant la faune marécageuse du jardin du confluent. Tout est vert dans un monde de bitume. Ça fait du bien.",
      poi: jardin_confluent,
      photo: File.new(Rails.root.join("db/fixtures/images/jardinconfluent.jpg"))
    ),
    JourneyPOI.new(
      name: "Parc du carpa",
      description: "Le parc du carpa possède des barbec laissé en libre-service. On groupe de jeune m’a invité à manger un morceau. Je n’ai pas pu refuser ! Ils étaient super sympa. Si vous l’occasion de passer par là, vous vous ferez surement inviter aussi.",
      poi: parc_carpa,
      photo: File.new(Rails.root.join("db/fixtures/images/parccapra.jpg"))
    )
  ]
)

puts "Finished!"
