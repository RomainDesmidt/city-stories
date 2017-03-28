puts "Cleaning database..."
JourneyPOI.destroy_all
POI.destroy_all
Journey.destroy_all
User.destroy_all

puts "Creating users..."
mathilde = User.create!(
  pseudo: "mathilde",
  email: "mathilde@gmail.com",
  # TODO: avatar
  password: "123456",
  password_confirmation: "123456"
)
grégoire = User.create!(
  pseudo: "grégoire",
  email: "grégoire@gmail.com",
  # TODO: avatar
  password: "123456",
  password_confirmation: "123456"
)
nicolas = User.create!(
  pseudo: "nicolas",
  email: "nicolas@gmail.com",
  # TODO: avatar
  password: "123456",
  password_confirmation: "123456"
)
camille = User.create!(
  pseudo: "camille",
  email: "camille@gmail.com",
  # TODO: avatar
  password: "123456",
  password_confirmation: "123456"
)

puts "Creating POIs..."
rue_saint_leonard = POI.create!(latitude: 47.218232, longitude: -1.550893)
tram_50_otages = POI.create!(latitude: 47.220081, longitude: -1.555241)
bord_de_erdre = POI.create!(latitude: 47.242265, longitude: -1.547478)
cathedrale = POI.create!(latitude: 47.218232, longitude: -1.550893)
chateau_des_ducs = POI.create!(latitude: 47.216225, longitude: -1.549492)
chien_stupide = POI.create!(latitude: 47.216491, longitude: -1.551437)
cimetiere_misericorde = POI.create!(latitude: 47.223311, longitude: -1.567611)
gare_sncf = POI.create!(latitude: 47.217674, longitude: -1.541814)
parc_de_proce = POI.create!(latitude: 47.223744, longitude: -1.581836)
passage_pommeray = POI.create!(latitude: 47.213304, longitude: -1.559011)
petit_port = POI.create!(latitude: 47.245819, longitude: -1.560954)
pont_saint_mihiel = POI.create!(latitude: 47.222902, longitude: -1.552928)
quai_des_antilles = POI.create!(latitude: 47.199820, longitude: -1.574387)
rond_point_de_paris = POI.create!(latitude: 47.233968, longitude: -1.535798)
trentmoult = POI.create!(latitude: 47.195252, longitude: -1.581603)
ile_de_versaille = POI.create!(latitude: 47.226925, longitude: -1.554290)

puts "Creating journeys..."
journey_1 = Journey.create!(
  name: "night experience",
  user: mathilde,
  journey_pois: [
    JourneyPOI.new(
      name: "Chateau des ducs de bretagne",
      poi: chateau_des_ducs,
      video: "https://www.youtube.com/watch?v=6S9i9fV0i8E"
    ),
    JourneyPOI.new(
      name: "Ile de versailles",
      poi: ile_de_versaille,
      # remote_photo_url: "http://static.panoramio.com/photos/large/29223108.jpg"
      photo: File.new(Rails.root.join("db/fixtures/images/29223108.jpg"))
    ),
    JourneyPOI.new(
      name: "tram 50 otages",
      poi: tram_50_otages,
      text: <<~EOF
        L'arrêt de bus

        J'arrive à l'arrêt l'air de rien
        Regarde la fanfare des pantins
        Et demande ma route à un marin
        Dont la frimousse ne me dis rien

        Et puis je reste l'air déçu
        Le marin ne m'ayant pas répondu
        Préférant me dire qu'il s'est perdu
        Sur son navire à la barre caduque

        Alors alors en maugréant
        J'arrête la drogue et lui le temps
        Car à bord de son trimaran
        Il s'envole vers les firmaments
      EOF
    ),
    JourneyPOI.new(
      name: "Chien Stupide",
      poi: chien_stupide,
      # remote_photo_url: "http://scontent.cdninstagram.com/t51.2885-15/s480x480/e15/11242537_410899635758927_750236687_n.jpg?ig_cache_key=Mzc3NDQ4MTQ2Njc2NjI2MzIy.2"
      photo: File.new(Rails.root.join("db/fixtures/images/11242537_410899635758927_750236687_n.jpg"))
    ),
    JourneyPOI.new(
      name: "Pont saint Mihiel",
      poi: pont_saint_mihiel,
      text: <<~EOF
        Le pont: Vague est le pont qui passe à demain de naguère
        Et du milieu de l’âge on est des deux côtés
        Le mur ne fait pas l’ombre et n’est pas la lumière
        Qu’on appelait l’hiver qu’on nommera l’été

        Il n’est pierre de moi qui dorme quand tu danses
        Chacune est une oreille et chacune te voit
        Ton immobilité me tient lieu de silence
        Et chacun de tes mots tombe à l’envers de moi

        Je dis à mots petits de grands espaces d’âge
        Qui font en leur milieu croire qu’il est midi
        J’ai peur d’être le pont qui prend pour son voyage
        Le voyage de l’eau entre ses bras surpris

        Il va neiger tantôt d’une neige si calme
        Sur des rives de moi où j’hésite à courir
        Que je m’attache à tout ce qui me semble halte
        Sur la courbe attelée aux chevaux de mourir
      EOF
    )
  ]
)


journey_2 = Journey.create!(
  name: "les amoureux",
  user: grégoire,
  journey_pois: [
    JourneyPOI.new(
      name: "Passage Pommeray",
      poi: passage_pommeray,
      sound: "https://soundcloud.com/made-hater/bruitage-ville-foule"
    ),
    JourneyPOI.new(
      name: "gare sncf",
      poi: gare_sncf,
      # remote_photo_url: "http://cache.20minutes.fr/img/photos/afp/2008-11/2008-11-16/article_photo_1226826800024-5-0.jpg"
      photo: File.new(Rails.root.join("db/fixtures/images/0.jpg"))
    ),
    JourneyPOI.new(
      name: "petit pont",
      poi: pont_saint_mihiel,
      # remote_photo_url: "https://c1.staticflickr.com/1/712/20785471772_3932b28bd2_b.jpg"
      photo: File.new(Rails.root.join("db/fixtures/images/20785471772_3932b28bd2_b.jpg"))
    ),
    JourneyPOI.new(
      name: "30 moult",
      poi: trentmoult,
      video: "https://www.youtube.com/watch?v=ycoHuRyImds"
    ),
    JourneyPOI.new(
      name: "versailles",
      poi: ile_de_versaille,
      # remote_photo_url: "http://photos.tourisme-en-france.com/pois/54485_1_nantes-le-jardin-japonais-sur-l-ile-de-versailles.jpg"
      photo: File.new(Rails.root.join("db/fixtures/images/versailles.jpg"))
    ),
  ]
)

journey_3 = Journey.create!(
  name: "Bons vieux touristes",
  user: nicolas,
  journey_pois: [
    JourneyPOI.new(
      name: "la cathedrale",
      poi: cathedrale,
      sound: "https://soundcloud.com/carolinel3fle/cloche-deglise"
    ),
    JourneyPOI.new(
      name: "quai des en TA",
      poi: quai_des_antilles,
      # remote_photo_url: "http://img.over-blog-kiwi.com/0/93/43/01/20160726/ob_60456d_p1130331.jpg"
      photo: File.new(Rails.root.join("db/fixtures/images/ob_60456d_p1130331.jpg"))
    ),
    JourneyPOI.new(
      name: "parc",
      poi: parc_de_proce,
      text: "Le parc de Proce est situé dans l'ouest de la ville, sur les quartiers Hauts-Pavés - Saint-Félix et Dervallières - Zola (la Chézine qui travers le parc au sud-ouest marque la limites entre les deux). Avec 11,3 ha, il s'agit de l'un des principaux espaces verts de Nantes, après les parcs du Petit_Port (49,4 ha), du Grand-Blottereau (19,3 ha), de la Chantrerie (17,7 ha), de la Beaujoire (13,3 ha) et de la Gaudinière (12,5 ha)."
    ),
    JourneyPOI.new(
      name: "cimetiere",
      poi: cimetiere_misericorde,
      # remote_photo_url: "http://images.marredelapluie.fr/membres/0/2/photos/167/1675/167528_cimetiere-misericorde_600.jpg"
      photo: File.new(Rails.root.join("db/fixtures/images/misericorde_600.jpg"))
    ),
    JourneyPOI.new(
      name: "l'ile",
      poi: ile_de_versaille,
      video: "https://www.youtube.com/watch?v=f668txV74Pg"
    )
  ]
)

journey_4 = Journey.create!(
  name: "balade solitaire",
  user: camille,
  journey_pois: [
    JourneyPOI.new(
      name: "leonard est un genie",
      poi: rue_saint_leonard,
      # remote_photo_url: "https://imgs.nestimg.com/appartement_3_pieces_69_m_1520044478785553450.jpg"
      photo: File.new(Rails.root.join("db/fixtures/images/appartement_3_pieces_69_m_1520044478785553450.jpg"))
    ),
    JourneyPOI.new(
      name: "lerdre ",
      poi: bord_de_erdre,
      # remote_photo_url: "https://media-cdn.tripadvisor.com/media/photo-s/0c/c6/c6/a8/belle-demeure-au-bord.jpg"
      photo: File.new(Rails.root.join("db/fixtures/images/bord.jpg"))
    ),
    JourneyPOI.new(
      name: "petit port quand tu...",
      poi: petit_port,
      # remote_photo_url: "https://www.francebleu.fr/s3/cruiser-production/2016/04/be77a965-f883-4b53-971f-edf287ae0a72/870x489_img_1907.jpg"
      photo: File.new(Rails.root.join("db/fixtures/images/870x489_img_1907.jpg"))
    ),
    JourneyPOI.new(
      name: "le fameux rond point",
      poi: rond_point_de_paris,
      # remote_photo_url: "http://img.20mn.fr/IcMIOlrmTtybOfCvdl8idw/2048x1536-fit_pataugeoire-parc-proce-nantes.jpg"
      photo: File.new(Rails.root.join("db/fixtures/images/nantes.jpg"))
    ),
    JourneyPOI.new(
      name: "le chien",
      poi: chien_stupide,
      text: <<~EOF
        Le bar: Il y aura encor de petits bars canaille
        Avec des viandes d’Extême-Orient
        Pour abriter ce nouvel an.

        De petits bars avec des marins légendaires
        Dont les pipes consumeront d’anciens poisons
        Des bars légers avec les fumées qui les gonflent
        De petits bars évanouis dans l’aube claire.

        Des bars où tourne le soleil et son train
        Dans la laque rougie et profonde des verres ;
        Des bars aux tables animées, aux vitres mortes
        Où ne trempera pas le nez des facultés.
      EOF
    ),
    JourneyPOI.new(
      name: "l'ile de versailles",
      poi: ile_de_versaille,
      video: "https://www.youtube.com/watch?v=JYJhHfryywM"
    )
  ]
)

puts "Finished!"
