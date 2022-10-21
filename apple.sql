/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_title` varchar(255) NOT NULL,
  `collection_description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_product` int(11) DEFAULT NULL,
  `order_user` int(11) DEFAULT NULL,
  `order_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_product` (`order_product`),
  KEY `order_user` (`order_user`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`order_product`) REFERENCES `product` (`id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`order_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_title` varchar(255) NOT NULL,
  `product_sku` varchar(255) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_price` float NOT NULL,
  `product_quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `product_collection` (
  `c_id` int(11) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  KEY `c_id` (`c_id`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `product_collection_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `collection` (`id`),
  CONSTRAINT `product_collection_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `product_tag` (
  `t_id` int(11) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  KEY `t_id` (`t_id`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `product_tag_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `tag` (`id`),
  CONSTRAINT `product_tag_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_firstname` varchar(255) NOT NULL,
  `user_lastname` varchar(255) NOT NULL,
  `user_address1` varchar(255) NOT NULL,
  `user_address2` varchar(255) DEFAULT NULL,
  `user_zip` varchar(255) NOT NULL,
  `user_city` varchar(255) NOT NULL,
  `user_country` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `collection` (`id`, `collection_title`, `collection_description`) VALUES
(1, 'Apple', 'Apple c\'est cool');
INSERT INTO `collection` (`id`, `collection_title`, `collection_description`) VALUES
(2, 'iPhone', 'L\'iPhone c\'est cool. Donc on devrait l\'appeler iCool');


INSERT INTO `order` (`id`, `order_product`, `order_user`, `order_date`) VALUES
(4, 2, 1, '2020-09-09 20:00:00');


INSERT INTO `product` (`id`, `product_title`, `product_sku`, `product_description`, `product_price`, `product_quantity`) VALUES
(1, 'iPhone 14', 'iphone-14', 'Un super iphone 14', 1000.99, 100);
INSERT INTO `product` (`id`, `product_title`, `product_sku`, `product_description`, `product_price`, `product_quantity`) VALUES
(2, 'iPhone 14 Pro', 'iphone-14', 'Un super iphone 14', 1349.99, 200);
INSERT INTO `product` (`id`, `product_title`, `product_sku`, `product_description`, `product_price`, `product_quantity`) VALUES
(3, 'iPhone 14 Pro Max', 'iphone-14', 'Un super iphone 14', 1600, 150);

INSERT INTO `product_collection` (`c_id`, `p_id`) VALUES
(2, 1);
INSERT INTO `product_collection` (`c_id`, `p_id`) VALUES
(1, 1);
INSERT INTO `product_collection` (`c_id`, `p_id`) VALUES
(1, 2);
INSERT INTO `product_collection` (`c_id`, `p_id`) VALUES
(2, 2),
(1, 3),
(2, 3);

INSERT INTO `product_tag` (`t_id`, `p_id`) VALUES
(1, 1);
INSERT INTO `product_tag` (`t_id`, `p_id`) VALUES
(1, 2);
INSERT INTO `product_tag` (`t_id`, `p_id`) VALUES
(2, 2);
INSERT INTO `product_tag` (`t_id`, `p_id`) VALUES
(1, 3),
(2, 3),
(3, 3);

INSERT INTO `tag` (`id`, `tag_title`) VALUES
(1, 'smartphone');
INSERT INTO `tag` (`id`, `tag_title`) VALUES
(2, 'pro');
INSERT INTO `tag` (`id`, `tag_title`) VALUES
(3, 'max');

INSERT INTO `user` (`id`, `user_firstname`, `user_lastname`, `user_address1`, `user_address2`, `user_zip`, `user_city`, `user_country`) VALUES
(1, 'Pierre', 'Grimaud', '1 rue du Paradis', 'Boite 30', '75001', 'PARIS', 'FRANCE');
INSERT INTO `user` (`id`, `user_firstname`, `user_lastname`, `user_address1`, `user_address2`, `user_zip`, `user_city`, `user_country`) VALUES
(2, 'John', 'Doe', '1 place de la République', NULL, '75010', 'PARIS', 'FRANCE');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;