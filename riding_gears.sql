-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2021 at 08:06 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `riding_gears`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_admin`
--

CREATE TABLE `app_admin` (
  `id` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_admin`
--

INSERT INTO `app_admin` (`id`, `full_name`, `image`, `mobile`, `user_id`) VALUES
(1, 'Nirajan Basnet', 'admins/userimage.png', '9828043279', 2),
(2, 'Nirajan Basnet', 'admins/userimage_hYeLFuF.png', '9828043279', 6);

-- --------------------------------------------------------

--
-- Table structure for table `app_cart`
--

CREATE TABLE `app_cart` (
  `id` int(11) NOT NULL,
  `total` int(10) UNSIGNED NOT NULL CHECK (`total` >= 0),
  `created_at` datetime(6) NOT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_cart`
--

INSERT INTO `app_cart` (`id`, `total`, `created_at`, `customer_id`) VALUES
(1, 1700, '2021-04-20 09:47:51.266888', 2),
(2, 1700, '2021-04-20 09:49:10.899879', 2),
(3, 22000, '2021-04-20 14:47:42.204737', 3),
(4, 86700, '2021-04-20 14:49:28.087658', 3),
(5, 86700, '2021-04-20 14:50:02.028566', 3),
(6, 2700, '2021-04-20 15:02:39.614195', 5),
(7, 1700, '2021-04-20 15:04:04.110037', 5);

-- --------------------------------------------------------

--
-- Table structure for table `app_cartproduct`
--

CREATE TABLE `app_cartproduct` (
  `id` int(11) NOT NULL,
  `rate` int(10) UNSIGNED NOT NULL CHECK (`rate` >= 0),
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `subtotal` int(10) UNSIGNED NOT NULL CHECK (`subtotal` >= 0),
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_cartproduct`
--

INSERT INTO `app_cartproduct` (`id`, `rate`, `quantity`, `subtotal`, `cart_id`, `product_id`) VALUES
(1, 1000, 1, 1000, 1, 23),
(2, 700, 1, 700, 1, 22),
(3, 1000, 1, 1000, 2, 23),
(4, 700, 1, 700, 2, 22),
(8, 1000, 1, 1000, 3, 23),
(9, 5000, 1, 5000, 3, 18),
(10, 16000, 1, 16000, 3, 6),
(11, 1000, 1, 1000, 4, 23),
(12, 700, 1, 700, 4, 22),
(13, 85000, 1, 85000, 4, 21),
(14, 1000, 1, 1000, 5, 23),
(15, 700, 1, 700, 5, 22),
(16, 85000, 1, 85000, 5, 21),
(18, 1000, 2, 2000, 6, 23),
(19, 700, 1, 700, 6, 22),
(20, 1000, 1, 1000, 7, 23),
(21, 700, 1, 700, 7, 22);

-- --------------------------------------------------------

--
-- Table structure for table `app_category`
--

CREATE TABLE `app_category` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_category`
--

INSERT INTO `app_category` (`id`, `title`, `slug`) VALUES
(1, 'Jackets & Vests', 'jackets-and-vests'),
(2, 'Boots', 'boots'),
(3, 'Pants', 'pants'),
(4, 'Gloves', 'gloves'),
(5, 'Helmets', 'helmets'),
(6, 'Riding Jeans', 'riding-jeans'),
(7, 'Protection', 'protection'),
(8, 'Race Suits', 'race-suits'),
(9, 'Rain Gear', 'rain-gear'),
(10, 'Women\'s', 'womens');

-- --------------------------------------------------------

--
-- Table structure for table `app_customer`
--

CREATE TABLE `app_customer` (
  `id` int(11) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `joined_on` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_customer`
--

INSERT INTO `app_customer` (`id`, `full_name`, `address`, `joined_on`, `user_id`) VALUES
(1, 'Test Customer', 'Kathmandu', '2021-04-19 05:47:52.483466', 3),
(2, 'Nirajan Basnet', 'Kathmandu', '2021-04-20 09:47:38.606278', 4),
(3, 'Test Customer1', 'Kathmandu', '2021-04-20 14:47:27.817028', 5),
(4, 'Nirajan Basnet', 'Kathmandu', '2021-04-20 15:00:11.918355', 7),
(5, 'Nirajan Basnet', 'Kathmandu', '2021-04-20 15:02:34.910985', 9);

-- --------------------------------------------------------

--
-- Table structure for table `app_order`
--

CREATE TABLE `app_order` (
  `id` int(11) NOT NULL,
  `ordered_by` varchar(200) NOT NULL,
  `shipping_address` varchar(200) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `subtotal` int(10) UNSIGNED NOT NULL CHECK (`subtotal` >= 0),
  `discount` int(10) UNSIGNED NOT NULL CHECK (`discount` >= 0),
  `total` int(10) UNSIGNED NOT NULL CHECK (`total` >= 0),
  `order_status` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `payment_completed` tinyint(1) DEFAULT NULL,
  `cart_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_order`
--

INSERT INTO `app_order` (`id`, `ordered_by`, `shipping_address`, `mobile`, `email`, `subtotal`, `discount`, `total`, `order_status`, `created_at`, `payment_method`, `payment_completed`, `cart_id`) VALUES
(1, 'Nirajan Basnet', 'Boudha, Kathmandu', '9828043279', 'nirajanbasnet2021@gmail.com', 1700, 0, 1700, 'Order Completed', '2021-04-20 09:49:26.841040', 'Cash On Delivery', 0, 2),
(2, 'Test Customer', 'Boudha, Kathmandu', '9828043279', 'nirajanbasnet814@gmail.com', 22000, 0, 22000, 'Order Received', '2021-04-20 14:48:58.192934', 'Khalti', 0, 3),
(3, 'Test Customer', 'Boudha, Kathmandu', '9828043279', 'nirajanbasnet814@gmail.com', 86700, 0, 86700, 'Order Received', '2021-04-20 14:49:53.897926', 'Cash On Delivery', 0, 4),
(4, 'Test Customer', 'Boudha, Kathmandu', '9828043279', 'nirajanbasnet814@gmail.com', 86700, 0, 86700, 'Order Processing', '2021-04-20 14:50:25.410648', 'Khalti', 0, 5),
(5, 'Nirajan Basnet', 'Boudha, Kathmandu', '9828043279', 'nirajanbasnet2021@gmail.com', 2700, 0, 2700, 'Order Received', '2021-04-20 15:03:29.194298', 'Khalti', 0, 6),
(6, 'Nirajan Basnet', 'Boudha, Kathmandu', '9828043279', 'nirajanbasnet2021@gmail.com', 1700, 0, 1700, 'On the way', '2021-04-20 15:04:33.975063', 'Cash On Delivery', 0, 7);

-- --------------------------------------------------------

--
-- Table structure for table `app_product`
--

CREATE TABLE `app_product` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `marked_price` int(10) UNSIGNED NOT NULL CHECK (`marked_price` >= 0),
  `selling_price` int(10) UNSIGNED NOT NULL CHECK (`selling_price` >= 0),
  `description` longtext NOT NULL,
  `warranty` varchar(300) DEFAULT NULL,
  `return_policy` varchar(300) DEFAULT NULL,
  `view_count` int(10) UNSIGNED NOT NULL CHECK (`view_count` >= 0),
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_product`
--

INSERT INTO `app_product` (`id`, `title`, `slug`, `image`, `marked_price`, `selling_price`, `description`, `warranty`, `return_policy`, `view_count`, `category_id`) VALUES
(1, 'REAX Alta Mesh Jacket', 'reax-alta-mesh-jacket', 'products/reax_alta_mesh_jacket1.jpg', 15000, 13650, 'Airflow and protection, the Reax Alta Jacket is a titan in its class. Where mesh jackets can be tempted to compromise on abrasion-resistance to retain affordability, the Alta refuses concession. Lightweight poly mesh combines with a 600D chassis and 980D ballistic reinforcements, and CE Level 2 limb armor comes standard. A removable 100% waterproof liner adds versatility to the unimpeachable style and simplicity of the Alta Mesh Jacket.', 'Two (2) year warranty on materials and workmanship', NULL, 3, 1),
(2, 'REV\'IT! Sand 4 H2O Jacket', 'revit-sand-4', 'products/revit_sand4_h2_o_jacket_1.jpg', 25000, 22650, 'The fourth time\'s a charm with the REV\'IT! Sand 4 H2O Jacket.\r\n\r\nThe Sand series has always been a line of gear capable of taking the rider around the world. This fourth iteration now does the job even better. Engineered with weight savings in mind and featuring a curated series of liners, the Sand 4 H2O Jacket wears easy without the fatigue of typically heavy ADV jackets. The foundation of the Sand 4 is its abrasion-resistant polyester ripstop shell. Close your eyes, and one would imagine this shell were designed solely for hot weather exploration. Three ventilation panels cover the front, twin zippered ports ventilate each arms, and the exhaust vent count at the rear is two. Matching the ventilated shell is ventilated Seeflex CE Level 2 impact armor at the shoulders and elbows. For a multi-season jacket, the hot weather tradeoffs are few. A back protector and split chest protector inserts are available upgrades (sold separately).\r\n\r\nTalking layers, both the Hydratex mid layer and inner thermal liner are fully removable. Add one or both liners to suit your conditions. Lose the shell and you have a waterproof, insulated jacket system for setting up basecamp; REV\'IT! finishes each liner as a freestanding, destination garment. Adjustment straps at the arms and torso of the shell ensure unencumbered range of motion and a secure fit regardless of your combination of liners. The jacket\'s rear stash pocket is large enough to store both liners if needed. Fourth generation improvements considered, the Sand 4 H2O is a tremendous three-jackets-in-one juggernaut. \r\n\r\nThere are very few instances where the sequel eclipses the original. (You can ask Bruce Willis.) The Sand 4 Jacket is one of these historic moments. Buy. Wear. Ride on.', '4 year warranty on materials and workmanship', '1 week return if not damaged', 1, 1),
(3, 'Klim Latitude Jacket', 'klim-latitude-jacket', 'products/klim_latitude_jacket_1.jpg', 62000, 55000, 'The Klim Latitude Jacket is ready to take on the world right out of the box. The versatile Gore-Tex 2-Layer Performance shell is waterproof and breathable. Run your own base layers and mid layers in the Klim Latitude Jacket\'s technical shell to meet the requirements dictated by the day\'s weather. Goat leather trim provides an aesthetic pop and functional abrasion resistance. Heavy duty 840D Cordura bolster high abrasion and wear zones to help the jacket last multiple seasons. The Klim Latitude Jacket comes equipped with CE level 1 D3O armor at the elbows, shoulders and back from the factory. Strategically placed vents flow air direct to the body to help keep cool as temperatures rise.', '6 year warranty on materials and workmanship', '1 week return if not damaged', 0, 1),
(4, 'REV\'IT! Eclipse Women\'s Jacket', 'revit-eclipse-women', 'products/revit_eclipse_womens_jacket_silver_2.jpg', 14000, 13500, 'In the heat of the summer, a mesh riding jacket is a must. Lightweight mesh construction doesn’t mean you should compromise on quality or protection. The REV’IT! Eclipse Jacket combines Knox Flexiform CE rated armor in the elbows and shoulders and formidable abrasion-resistant 600D polyester in the impact areas with large panels of mesh for maximum breathability. Achieving an understated Euro style without commanding the typical premium European price, the REV’IT! Eclipse Jacket is an incredible value for the female rider seeking fashionable warm weather protection.', NULL, NULL, 0, 1),
(5, 'Merlin Axe Shirt', 'merlin-axe-shirt', 'products/merlin_axe_zip_up_shirt100_kevlar_1.jpg', 3000, 2700, 'The Merlin Axe Kevlar Riding Shirt provides motorcycle specific protection under the guise of a flannel button up. DuPont™ Kevlar® lining throughout the shirt provides abrasion resistance with CE rated impact armor at the elbows and shoulders. Upgrade the impact protection by adding in an optional CE rated back protector.', NULL, NULL, 0, 1),
(6, 'Joe Rocket Atomic 5.0 Jacke', 'joe-rocket-atomic', 'products/joe_rocket_atomic50_jacket_black_red_2.jpg', 17000, 16000, 'Back for another round of multi-season slaying riding action, the Joe Rocket Atomic 5.0 is the latest iteration of an industry standard that knows no equal. Retaining the same basic functionality of the previous version, the redesigned Atomic 5.0 incorporates even more functionality for true year-round riding. External armor pockets now make it even easier to ditch those pads when you\'re not riding, while a Rock Tex and Hitena Waterproof shell with integrated dual closure main zipper and storm flap keep you dry no matter what. A reinvented ventilation scheme improves air flow on warm days and an included removable full-sleeve thermal liner is there to retain your body heat when riding in colder weather.', NULL, NULL, 0, 1),
(7, 'Scorpion EXO Covert Flannel Shirt', 'scorpion-exo-covert-flannel-shirt', 'products/scorpion_covert_flannel_shirt_black_green_2.jpg', 4300, 4000, 'Scorpion has taken your favorite flannel shirt and made it better. The Covert Flannel Shirt is reinforced with a protective lining and engineered to resist tear and abrasion. They\'ve lined the entire shirt with 165 gram aramid fiber, used EXO-Stitch safety seams at all critical seams and added mesh armor pockets so you can have extra protection right where you want it. Being protected has never looked this good.', NULL, NULL, 0, 1),
(8, 'Merlin Hamlin Hoody', 'merlin-hamlin-hoody', 'products/merlin_hamlin_zip_up_hoody100_kevlar_grey_2.jpg', 6500, 6300, 'The Merlin Hamlin Kevlar Hoody is anything but your typical hoody with its Dupont™ Kevlar® lining, CE approved armor and jean connection loops. Its drawstring hood with ribbed cuffs and hem conceal its technical construction.', NULL, NULL, 0, 1),
(9, 'Forma Adventure Boots', 'forma-adventure-boots', 'products/forma_adventure_boots_2.jpg', 27000, 25500, 'Designed specifically for ADV riders, the Forma Adventure Boots combine the comfort and flexibility of a road boot with the protective features and full height of off-road boots. Equipped with a vintage leather finish and drytex waterproof/breathable lining, the Adventure Boots keep your feet dry without limiting range of motion. The double density sole offers superb grip on the bike and gives riders a comfortable and grippy surface to walk on when off the bike. Integrated TPU inserts and reinforcements provide protection from impact injuries and unbreakable GH plastic buckles ensure you won\'t be sidelined if you have a tip over.', NULL, NULL, 0, 2),
(10, 'Alpinestars SMX 6 v2 Vented Boots', 'alpinestars-smx-6', 'products/alpinestars_boot_smx6_v2_vnt_1.jpg', 22000, 20000, 'A formidable force on street and track, the second generation Alpinestars SMX 6 Vented Boots have been carefully upgraded without compromising the versatile performance and protection that made the originals such a success. The ergonomics have been refined for increased anatomical fidelity. The perforated accordion stretch paneling has been augmented on the forefoot as well as the back of the ankle for added flexibility and comfort.\r\n\r\nThe characteristic race-bred protection of the SMX 6 lineage has been preserved via the high modulus TPU bio-mechanical ankle support, injected shin guard, calf protector, heel counter, shift pad and toe slider. Air vents have been integrated into the heel counter and shin plate to prolong rider comfort even under demanding conditions. The microfiber at the forefoot and upper shaft has been perforated as well for optimal breathability in hot weather.\r\n\r\nWhether your playground is the racetrack or the back roads, the Alpinestars SMX 6 V2 Vented Boots are designed to offer protection, dexterity and performance without compromise.', '3 years warranty', '1 week return if not damaged', 0, 2),
(11, 'REAX 215 Jeans', 'reax-215-jeans', 'products/reax_reax215_jeans2832_blk_1.jpg', 2200, 2000, 'The REAX 215\'s are cold-rolled, straight cut, 5 pocket perfection. Distressed or dark indigo 11.5oz denim backed with aramid reinforcements and pockets to add optional impact armor, the 215 Riding Jeans have the fit and look you want with the motorcycle protection you need.', NULL, NULL, 0, 3),
(12, 'Alpinestars Raider Drystar Pants', 'alpinestars-raider-drystar-pants', 'products/alpinestars_pant_raider_1.jpg', 3000, 2700, 'Commuters and diehard sport riders rejoice. The Alpinestars Raider Drystar Pants provide formidable inclement weather protection and a sport fit at an accessible price point. An abrasion resistant main construction, pockets for hip pads and included adjustable CE protectors in the knees endow substantial crash protection. The Drystar waterproof breathable membrane and reflective detailing maintain visibility and rider comfort in less-than ideal riding conditions. The Alpinestars Raider Pants feature a waist connection zipper for pairing to an Alpinestars jacket, making them an excellent counterpart to the Alpinestars Jaws Waterproof Jacket.', NULL, NULL, 0, 3),
(13, 'Alpinestars SMX-1 Air v2 Gloves', 'alpinestars-smx-airv2-gloves', 'products/alpinestars_smx_air_v2_gloves_2.jpg', 1500, 1200, 'The Alpinestars SMX-1 Air V2 Gloves continue in the tradition of protective short cuff gloves that flow tons of air for hot weather riding. The latest version uses a new chassis with a redesigned cuff closure, padded fingers and strategically placed stretch material. The V2 glove combines perforated leather and heavy duty mesh to create a glove that breathes well during hot weather while still providing basic motorcycle protection. Synthetic suede  at the palm and sides of the glove provide reinforcement against abrasion as well as regular wear and tear.', NULL, NULL, 0, 4),
(14, 'Leatt MTB 1.0 GripR Women\'s Gloves', 'leatt-mtb-grip-gloves', 'products/leatt_mtb10_grip_r_womens_gloves_1.jpg', 700, 650, 'Leatt\'s first non-impact protective glove is setting the new standard for gloves that are good for the value but sure to save your sin. The upper is made of a super-stretch material that offers good airflow and durability, while also providing a lens/sweat wiper and screen functionality for your convenience. Great for riders looking for more of a \"second skin\" type og glove for better feel and maneuverability compared to the bigger, bulkier options on the market.', NULL, NULL, 0, 4),
(15, 'AGV K1 Helmet', 'agv-k1-helmet', 'products/agvk1_helmet_1.jpg', 22000, 20000, 'The AGV K1 Helmet has an aerodynamic shape, ventilation scheme, and spoiler developed for the wind tunnel tested Corsa R and Pista GP R. The shell and spoiler provide aerodynamic stability at speed and the spoiler itself features a passive rear vent to extract warm air from the helmet as you ride. The K1 also incorporates the central air intake above the visor taken directly from MotoGP developed Pista GP R to provide best-in-class ventilation.', '2 years warranty', '1 week return if not damaged', 0, 5),
(16, 'Shoei Neotec 2 Splicer Helmet', 'shoei-neotec-2-splicer-helmet', 'products/shoei_neotec2_splicer_helmet_matte_black_white_red_1.jpg', 83000, 72000, 'The Shoei Neotec 2 helmet finds ways to improve upon an already exceptional modular touring helmet. Exhaust outlets complement the upper air intake vents for improved air flow. Wind tunnel testing optimized the Neotec 2\'s aerodynamics to perform in a variety of riding positions. The integrated shell spoiler is repositioned to better reduce lift and drag at speed, while the Aero Deflector along the chin bar adds stability. A micro ratchet chin strap makes securing the helmet and removing the helmet quick and easy. Noise Isolator cheek pads improve the seal along the neck opening of the helmet to keep turbulent air out. The 360 Pivot Locking System secures the chin bar in the down locked position and a multi-piece EPS liner made out of varying densities of foam absorbs impact energy. The Shoei Neotec 2 is designed to integrate with the Sena SRL Communication System for a clean and low profile installation. All of these features combine to produce one of the ultimate long distance touring helmets.', '5 year warranty on materials and workmanship', '1 week return if not damaged', 0, 5),
(17, 'Nexx X.WED2 X-Patrol Helmet (XS)', 'nexx-wed2-xpatrol-helmet', 'products/nexx_x_wild_enduro_x_patrol_helmet_1.jpg', 27000, 24969, 'The X.WED2 marries the comfort of a touring helmet with the ventilation of a dirt helmet to bring you the ultimate ADV lid. Big bikes like to go fast but sometimes the terrain requires calculated and strategic low speed prowess. In these conditions the X.WED2 truly shines. With double the air inlet ventilation in comparison to its predecessor, the X.WED2 is does everything it can to keep you cool when you need to keep your cool. At highway speeds, head checks are more of a breeze because the the peak has been engineered to catch less of the breeze. A drop down internal sun visor enables a smooth transition from sunny morning jaunts to dimly-lit evening excursions.', 'Two (2) year warranty on materials and workmanship', '1 week return if not damaged', 0, 5),
(18, 'Street & Steel Oakland Jeans', 'street-and-steel-oakland-jens', 'products/street_steel_oakland_jeans_black_1.jpg', 7000, 5000, 'The Street & Steel Oakland Jeans are a pair of classic five-pocket jeans designed for the moto enthusiast. The traditional design uses a denim blend with elastane for a touch of stretch and added range of motion. The tailoring straddles the line between boot cut and straight cut to reduce snags and buffeting when on the bike. On the inside of the Oakland Jeans, aramid reinforcement lines the seat, hips and knees. This heat- and tear-resistant fabric protects from abrasion as CE knee armor inserts protect from impact.', '3 months warranty', '1 week return if not damaged', 0, 6),
(19, 'Icon Stryker Vest', 'icon-stryker-vest', 'products/icon_stryker_vest_stealth_1.jpg', 7500, 5000, 'The Icon Stryker Vest brings tactical design to the streets. Loaded with CE rated protection in the form of a D3O back insert and articulated injection molded armor, the Stryker Vest is designed to absorb impacts without limiting your ability to move. The low profile design keeps things tidy and, along with the highly adjustable waist and shoulder straps, allows the Stryker Vest to be worn under or over most riding jackets.', '6 months warranty', '1 week return if not damaged', 0, 7),
(20, 'Leatt Dual Axis Knee / Shin Guards', 'leatt-dual-axis-knee-shin-guards', 'products/leatt_dual_axis_knee_guards_black_red_1.jpg', 1000, 1000, 'The Leatt Dual Axis knee and shin guards are comfortable, well-ventilated protectors with two pivot points that allow them to more accurately bend with the knee’s natural movement. They cover the knee, even when fully bent, as well as the lower thigh and most of the lower legs. Great levels of impact protection are proven by the CE impact safety standard they are certified to. They are also certified to CE’s abrasion resistance safety standard. The strap buckles are low profile with no edges to hang up on your riding pants. Straps are also backed by soft, comfortable, vented airprene material that resists slipping. Lighter weight, comfortable and offers more freedom of movement than almost any other CE certified protection system.', NULL, NULL, 0, 7),
(21, 'Alpinestars Missile Race Suit For Tech Air Race', 'alpinestars-missile-race-suit', 'products/alpinestars_missile_race_suit_for_tech_air_race_2.jpg', 90000, 85000, 'Somehow, “Missile” doesn’t quite do it justice.The way Tech Air technology has exploded onto the motorcycle protection market, the Alpinestars “Surface-to-Air Laser-Guided Warhead” Race Suit would have been much more appropriate.\r\n\r\nThe Missile is prepared to accept the Tech Air Race Vest airbag system (sold separately), which uses onboard sensors and a sophisticated algorithm to detect a crash situation and deploy airbag coverage in that critical fraction of a second, protecting the rider’s back, chest, shoulders and kidneys.\r\n\r\nThe suit itself is constructed of premium race-grade 1.3 mm genuine cow leather, punctuated with strategically-placed accordion stretch gussets and stretch fabric panels to allow for maximum mobility on the motorcycle. CE certified Alpinestars GP-R protectors and external sliders at the joints make the Missile ready for a high speed slide, while localized perforation and an airflow-optimized back hump ensure you stay cool during the ride.', 'Two (2) year warranty on materials and workmanship', '1 week return if not damaged', 0, 8),
(22, 'Olympia Horizon Rain Pants', 'olympia-horizon-rain-pants', 'products/olympia_horizon_rain_pant_neon_black_neon_orange_1.jpg', 700, 700, 'Designed to coordinate with the Olympia Horizon Rain Jacket, the Horizon pant offers a light weight waterproof / breathable rip stop nylon shell to ensure all day riding comfort. Generous leg openings with an adjustable VELCRO® brand closure system makes standing boot entry a breeze. Extra VELCRO® brand closures at the lower pant legs offer three inseam length options should an alteration be necessary. An elasticized waist plus side waist slide buckles help riders achieve a customized fit.\r\n\r\nThis pant also offers a built in self storage compartment for small convenient self packing. Authentic Nomex heat shields at the inside lower legs help prevent damage from hot exhaust pipes.', NULL, NULL, 0, 9),
(23, 'Olympia New Horizon Rain Jacket', 'olympia-horizon-rain-jacket', 'products/olympia_new_horizon_rain_jacket_black_pewter_2.jpg', 1000, 1000, 'Tested in the beautiful but wet Blue Ridge Mountains, the Olympia New Horizon Rain Jacket is designed to keep you dry through even the heaviest rain storms. Constructed of lightweight, waterproof and breathable rip stop nylon, the New Horizon Jacket offers an ergonomic fit along with waist and hip adjustments to prevent wind drag as speed. The included stow-away rain hood is designed to slip on under your helmet, sealing wet weather almost completely out of your jacket. \r\n\r\nWhen the weather breaks the New Horizon Jacket packs neatly into its own storage pouch and is easily stow-able for the next wet weather adventure.', NULL, NULL, 2, 9),
(24, 'AGV K1', 'agv-k1', 'products/agv-k1.jpg', 15000, 13000, 'It is very good helmet.', '6 months warranty', '1 week return if not damaged', 2, 5),
(25, '100% Full Gloves', '100-full-gloves', 'products/100_Full_Gloves.jpg', 700, 500, 'it is a good flovews', '6 months warranty', '1 week return if not damaged', 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `app_productimage`
--

CREATE TABLE `app_productimage` (
  `id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_productimage`
--

INSERT INTO `app_productimage` (`id`, `image`, `product_id`) VALUES
(1, 'products/images/reax_alta_mesh_jacket_3_GPmulFW.jpg', 1),
(2, 'products/images/revit_sand4_h2_o_jacket_2.jpg', 2),
(3, 'products/images/klim_latitude_jacket_2.jpg', 3),
(4, 'products/images/revit_eclipse_womens_jacket_black_1.jpg', 4),
(5, 'products/images/merlin_axe_kevlar_shirt_2.jpg', 5),
(6, 'products/images/joe_rocket_atomic50_jacket_black_black_1.jpg', 6),
(7, 'products/images/scorpion_covert_flannel_shirt_black_green_1.jpg', 7),
(8, 'products/images/merlin_hamlin_zip_up_hoody100_kevlar_black_1.jpg', 8),
(9, 'products/images/forma_adventure_boots_black_1.jpg', 9),
(10, 'products/images/alpinestars_smx6v2_vented_boots_black_gunmetal_metallic_blue_2.jpg', 10),
(11, 'products/images/reax_reax215_jeans2832_blk2.jpg', 11),
(12, 'products/images/alpinestars_pant_raider_2.jpg', 12),
(13, 'products/images/alpinestars_smx_air_v2_gloves_1.jpg', 13),
(14, 'products/images/leatt_mtb10_grip_r_womens_gloves_1.jpg', 14),
(15, 'products/images/agvk1_helmet_2.jpg', 15),
(16, 'products/images/nexx_x_wild_enduro_x_patrol_helmet_2.jpg', 17),
(17, 'products/images/street_steel_oakland_jeans_2.jpg', 18),
(18, 'products/images/stryker_field_armor_M_vest_front-SWOP_2.jpg', 19),
(19, 'products/images/alpinestars_missile_race_suit_for_tech_air_race_2.jpg', 21),
(20, 'products/images/olympia_horizon_rain_pant_neon_black_neon_orange_2.jpg', 24);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add cart', 7, 'add_cart'),
(26, 'Can change cart', 7, 'change_cart'),
(27, 'Can delete cart', 7, 'delete_cart'),
(28, 'Can view cart', 7, 'view_cart'),
(29, 'Can add category', 8, 'add_category'),
(30, 'Can change category', 8, 'change_category'),
(31, 'Can delete category', 8, 'delete_category'),
(32, 'Can view category', 8, 'view_category'),
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add product image', 10, 'add_productimage'),
(38, 'Can change product image', 10, 'change_productimage'),
(39, 'Can delete product image', 10, 'delete_productimage'),
(40, 'Can view product image', 10, 'view_productimage'),
(41, 'Can add order', 11, 'add_order'),
(42, 'Can change order', 11, 'change_order'),
(43, 'Can delete order', 11, 'delete_order'),
(44, 'Can view order', 11, 'view_order'),
(45, 'Can add customer', 12, 'add_customer'),
(46, 'Can change customer', 12, 'change_customer'),
(47, 'Can delete customer', 12, 'delete_customer'),
(48, 'Can view customer', 12, 'view_customer'),
(49, 'Can add cart product', 13, 'add_cartproduct'),
(50, 'Can change cart product', 13, 'change_cartproduct'),
(51, 'Can delete cart product', 13, 'delete_cartproduct'),
(52, 'Can view cart product', 13, 'view_cartproduct'),
(53, 'Can add admin', 14, 'add_admin'),
(54, 'Can change admin', 14, 'change_admin'),
(55, 'Can delete admin', 14, 'delete_admin'),
(56, 'Can view admin', 14, 'view_admin');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$0CcAku2VgwqP$q2CbH4i22KLv9gvMKlqhLBopq//yXJNxJSh1Cw+v5PA=', '2021-04-20 15:07:16.605503', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2021-04-19 05:34:22.036768'),
(2, 'pbkdf2_sha256$216000$3oOvyCREh5nH$rNLCgU0rpN8vzkWJdG/oZ+Z4p5zH5O0vYq1ULq1jlFw=', '2021-04-20 15:05:21.879899', 0, 'ridinggearsnepal', '', '', '', 0, 1, '2021-04-19 05:42:09.261844'),
(3, 'pbkdf2_sha256$216000$h3qp1Hny30zh$unB+22KRtK4/vi78vB3rxwfZRBYktx8sicFfZeSwkMg=', '2021-04-19 05:47:52.480472', 0, 'testcustomer', '', '', 'nirajanbasnet814@gmail.com', 0, 1, '2021-04-19 05:47:52.335811'),
(4, 'pbkdf2_sha256$216000$e7snrLfGIXbF$X7Ymb/L8SbtEHu61N/e+ohRxTnD53C0NAqh6r1C0YbY=', '2021-04-20 17:19:40.571031', 0, 'nirajan', '', '', 'nirajanbasnet2021@gmail.com', 0, 1, '2021-04-20 09:47:38.311729'),
(5, 'pbkdf2_sha256$216000$Oy2kaYct4Vna$P9Slst4Z11bX0w22hiuPRuV6+C7l8HgU8ZgXh3jLtBU=', '2021-04-20 14:47:27.811017', 0, 'testcustomer1', '', '', 'nirajanbasnet814@gmail.com', 0, 1, '2021-04-20 14:47:27.202336'),
(6, 'pbkdf2_sha256$216000$93PFNpLUUowK$9hnVAa4cdA+21SGASvLkhK0XerKgQwa0MxN8vUK2Gcc=', NULL, 0, 'ecomadmin', '', '', '', 0, 1, '2021-04-20 14:55:32.693778'),
(7, 'pbkdf2_sha256$216000$mribjCqPTz8u$uSklFWyim2ifyfvaIenBb8Dx/2XjJvJvN8g0LzUDZ9g=', '2021-04-20 15:00:11.913361', 0, 'testcustomer2', '', '', 'nirajanbasnet814@gmail.com', 0, 1, '2021-04-20 15:00:11.229252'),
(9, 'pbkdf2_sha256$216000$MAXZOIQdFyJH$rAMjeOUjhrtoa4s+dpEVJ5pPFyw2IW+4YseZhxekM98=', '2021-04-20 15:02:34.903894', 0, 'nirajanbasnet', '', '', 'nirajanbasnet2021@gmail.com', 0, 1, '2021-04-20 15:02:34.363778');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-04-19 05:38:32.369070', '1', 'Jackets & Vests', 1, '[{\"added\": {}}]', 8, 1),
(2, '2021-04-19 05:38:49.936750', '2', 'Boots', 1, '[{\"added\": {}}]', 8, 1),
(3, '2021-04-19 05:39:08.246026', '3', 'Pants', 1, '[{\"added\": {}}]', 8, 1),
(4, '2021-04-19 05:39:27.035955', '4', 'Gloves', 1, '[{\"added\": {}}]', 8, 1),
(5, '2021-04-19 05:39:39.196439', '5', 'Helmets', 1, '[{\"added\": {}}]', 8, 1),
(6, '2021-04-19 05:40:05.348692', '6', 'Riding Jeans', 1, '[{\"added\": {}}]', 8, 1),
(7, '2021-04-19 05:40:19.781562', '7', 'Protection', 1, '[{\"added\": {}}]', 8, 1),
(8, '2021-04-19 05:40:34.004726', '8', 'Race Suits', 1, '[{\"added\": {}}]', 8, 1),
(9, '2021-04-19 05:40:52.781752', '9', 'Rain Gear', 1, '[{\"added\": {}}]', 8, 1),
(10, '2021-04-19 05:41:10.864523', '10', 'Women\'s', 1, '[{\"added\": {}}]', 8, 1),
(11, '2021-04-19 05:42:09.388624', '2', 'ridinggearsnepal', 1, '[{\"added\": {}}]', 4, 1),
(12, '2021-04-19 05:42:29.661838', '1', 'ridinggearsnepal', 1, '[{\"added\": {}}]', 14, 1),
(13, '2021-04-19 05:44:32.529231', '1', 'REAX Alta Mesh Jacket', 1, '[{\"added\": {}}]', 9, 1),
(14, '2021-04-19 05:45:09.971361', '1', 'REAX Alta Mesh Jacket', 1, '[{\"added\": {}}]', 10, 1),
(15, '2021-04-19 05:46:36.176556', '1', 'REAX Alta Mesh Jacket', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(16, '2021-04-19 05:46:55.455894', '1', 'REAX Alta Mesh Jacket', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(17, '2021-04-20 14:55:33.157219', '6', 'ecomadmin', 1, '[{\"added\": {}}]', 4, 1),
(18, '2021-04-20 14:55:53.214268', '2', 'ecomadmin', 1, '[{\"added\": {}}]', 14, 1),
(19, '2021-04-20 14:57:17.408537', '20', 'AGV K1', 2, '[{\"changed\": {\"fields\": [\"Product\"]}}]', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(14, 'app', 'admin'),
(7, 'app', 'cart'),
(13, 'app', 'cartproduct'),
(8, 'app', 'category'),
(12, 'app', 'customer'),
(11, 'app', 'order'),
(9, 'app', 'product'),
(10, 'app', 'productimage'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-04-19 05:33:12.428337'),
(2, 'auth', '0001_initial', '2021-04-19 05:33:12.628933'),
(3, 'admin', '0001_initial', '2021-04-19 05:33:13.208883'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-04-19 05:33:13.331246'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-04-19 05:33:13.346904'),
(6, 'app', '0001_initial', '2021-04-19 05:33:13.631681'),
(7, 'contenttypes', '0002_remove_content_type_name', '2021-04-19 05:33:14.280541'),
(8, 'auth', '0002_alter_permission_name_max_length', '2021-04-19 05:33:14.349705'),
(9, 'auth', '0003_alter_user_email_max_length', '2021-04-19 05:33:14.365327'),
(10, 'auth', '0004_alter_user_username_opts', '2021-04-19 05:33:14.380948'),
(11, 'auth', '0005_alter_user_last_login_null', '2021-04-19 05:33:14.434384'),
(12, 'auth', '0006_require_contenttypes_0002', '2021-04-19 05:33:14.450010'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2021-04-19 05:33:14.450010'),
(14, 'auth', '0008_alter_user_username_max_length', '2021-04-19 05:33:14.465630'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2021-04-19 05:33:14.496873'),
(16, 'auth', '0010_alter_group_name_max_length', '2021-04-19 05:33:14.512528'),
(17, 'auth', '0011_update_proxy_permissions', '2021-04-19 05:33:14.528148'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2021-04-19 05:33:14.534685'),
(19, 'sessions', '0001_initial', '2021-04-19 05:33:14.581554');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('d0bk3bgkqxj9xls9r8a2lo782i6cu7cc', '.eJxVjEEOwiAQRe_C2hDaQhlcuvcMZDozSNXQpLQr492VpAvdvvf-f6mI-5bjXmWNM6uzsur0yyakh5Qm-I7ltmhayrbOk26JPmzV14XleTnav4OMNbe17xEs4UBi2PTGJQfIQTyMVgTJgx0pMHWQMGHoAIGGga35Yh_EqfcH_1U4dw:1lYu2G:x4qnXlV8lPbC4d5SCMcN2pnTLcZq94QNfnc-HAgQH_g', '2021-05-04 17:19:40.578200'),
('uqsn57kiu64zhwsr0dgbh3l4rpbzo1ms', '.eJxVjMEOwiAQRP-FsyFIoUs9evcbyMIuUjWQlPZk_Hdp0oMe582beQuP25r91njxM4mLAHH6ZQHjk8te0APLvcpYy7rMQe6KPNomb5X4dT3cv4OMLfe1pbNLKmgVFWhnIQFxDy4RRRw7NQEnmiAi8WCQktWcRmWNcjyACeLzBfquOI4:1lYrrH:pv2weSlnCX1dBeWtjXoQO9NPRkcoqjoNgm7qA9kw-jk', '2021-05-04 15:00:11.926329');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_admin`
--
ALTER TABLE `app_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `app_cart`
--
ALTER TABLE `app_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_cart_customer_id_88f45dc1_fk_app_customer_id` (`customer_id`);

--
-- Indexes for table `app_cartproduct`
--
ALTER TABLE `app_cartproduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_cartproduct_cart_id_d83fb808_fk_app_cart_id` (`cart_id`),
  ADD KEY `app_cartproduct_product_id_e106e737_fk_app_product_id` (`product_id`);

--
-- Indexes for table `app_category`
--
ALTER TABLE `app_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `app_customer`
--
ALTER TABLE `app_customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `app_order`
--
ALTER TABLE `app_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cart_id` (`cart_id`);

--
-- Indexes for table `app_product`
--
ALTER TABLE `app_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `app_product_category_id_023742a5_fk_app_category_id` (`category_id`);

--
-- Indexes for table `app_productimage`
--
ALTER TABLE `app_productimage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_productimage_product_id_53d99c25_fk_app_product_id` (`product_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_admin`
--
ALTER TABLE `app_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_cart`
--
ALTER TABLE `app_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `app_cartproduct`
--
ALTER TABLE `app_cartproduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `app_category`
--
ALTER TABLE `app_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `app_customer`
--
ALTER TABLE `app_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `app_order`
--
ALTER TABLE `app_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `app_product`
--
ALTER TABLE `app_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `app_productimage`
--
ALTER TABLE `app_productimage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_admin`
--
ALTER TABLE `app_admin`
  ADD CONSTRAINT `app_admin_user_id_7619d580_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `app_cart`
--
ALTER TABLE `app_cart`
  ADD CONSTRAINT `app_cart_customer_id_88f45dc1_fk_app_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `app_customer` (`id`);

--
-- Constraints for table `app_cartproduct`
--
ALTER TABLE `app_cartproduct`
  ADD CONSTRAINT `app_cartproduct_cart_id_d83fb808_fk_app_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `app_cart` (`id`),
  ADD CONSTRAINT `app_cartproduct_product_id_e106e737_fk_app_product_id` FOREIGN KEY (`product_id`) REFERENCES `app_product` (`id`);

--
-- Constraints for table `app_customer`
--
ALTER TABLE `app_customer`
  ADD CONSTRAINT `app_customer_user_id_e6e52921_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `app_order`
--
ALTER TABLE `app_order`
  ADD CONSTRAINT `app_order_cart_id_627d6d9c_fk_app_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `app_cart` (`id`);

--
-- Constraints for table `app_product`
--
ALTER TABLE `app_product`
  ADD CONSTRAINT `app_product_category_id_023742a5_fk_app_category_id` FOREIGN KEY (`category_id`) REFERENCES `app_category` (`id`);

--
-- Constraints for table `app_productimage`
--
ALTER TABLE `app_productimage`
  ADD CONSTRAINT `app_productimage_product_id_53d99c25_fk_app_product_id` FOREIGN KEY (`product_id`) REFERENCES `app_product` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
