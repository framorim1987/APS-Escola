CREATE DATABASE `inova`;

USE `inova`;

/*Table structure for table `tb_administrador` */

DROP TABLE IF EXISTS `tb_administrador`;

CREATE TABLE `tb_administrador` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `sobrenome` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `tb_administrador` */

insert  into `tb_administrador`(`id_admin`,`nome`,`sobrenome`,`login`,`senha`) values 
(1,'Ademir','Silva','ademirsilva@email.com','34@76#'),
(2,'Jonas','Silva','jonassilva@email.com','abc123'),
(3,'Felipe','Amorim','felipeamorim@email.com','abc400');

/*Table structure for table `tb_responsavel` */

DROP TABLE IF EXISTS `tb_responsavel`;

CREATE TABLE `tb_responsavel` (
  `id_Responsavel` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) DEFAULT NULL,
  `Sobrenome` varchar(45) DEFAULT NULL,
  KEY `id_Responsavel` (`id_Responsavel`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

/*Data for the table `tb_responsavel` */

insert  into `tb_responsavel`(`id_Responsavel`,`Nome`,`Sobrenome`) values 
(12,'Fabiano','Costa'),
(13,'Matheus','Ramos'),
(14,'Italo','Franco'),
(15,'Marcos','Fernandez'),
(16,'Felipe','Silva'),
(17,'Lucas','Lima'),
(18,'Arquerio','Silva'),
(20,'Cloves','Cardoso Silva'),
(23,'Tiago','Alencar Ramos'),
(24,'Carlos','da Silva Júnior'),
(25,'Pedro','Costa'),
(26,'Angelo','Martins'),
(27,'Ana','Rita'),
(28,'Carlos','Correia'),
(29,'Estephany','Luzia'),
(30,'Leticia','Oliveira'),
(31,'Amanda','Caroline'),
(32,'Gustavo','da Silva'),
(33,'Matheus','Amaral'),
(34,'Laiz','Almeida'),
(35,'Chavier','Barros'),
(36,'Claudia','Silva'),
(37,'Raimundo','Correia'),
(38,'Marcos','Pereira'),
(39,'Julia','Almeida'),
(40,'Juliano','Carrasco'),
(41,'Ester','Lima'),
(42,'Carlos','Teixeira'),
(43,'Luzia','Ramos'),
(44,'Paulo','Timoteo');

/*Table structure for table `tb_aluno` */

DROP TABLE IF EXISTS `tb_aluno`;

CREATE TABLE `tb_aluno` (
  `id_Aluno` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) DEFAULT NULL,
  `Sobrenome` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  `id_Responsavel` int(11) NOT NULL,
  `Turma` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_Aluno`),
  KEY `fk_aluno_responsavel_idx` (`id_Responsavel`),
  KEY `id_Aluno` (`id_Aluno`),
  CONSTRAINT `fk_aluno_responsavel` FOREIGN KEY (`id_Responsavel`) REFERENCES `tb_responsavel` (`id_Responsavel`)
) ENGINE=InnoDB AUTO_INCREMENT=12356 DEFAULT CHARSET=latin1;

/*Data for the table `tb_aluno` */

insert  into `tb_aluno`(`id_Aluno`,`Nome`,`Sobrenome`,`login`,`senha`,`id_Responsavel`,`Turma`) values 
(12,'Fabio','Cordeiro','fabio@email.com','1234',15,'1_A'),
(13,'Matheus','Ramos','matheus@email.com','543',13,'1_A'),
(34,'Matheus','Silva','matheussilva@email.com','5436',14,'1_A'),
(156,'Paulo','Lima','paulo@email.com','1235',15,'2_A'),
(12313,'Pedro','Silva','pedro@email.com','1234',16,'2_A'),
(12315,'Miguel','Souza','miguelsouza@email.com','12345',17,'2_A'),
(12318,'Matheus','Oliveira','matheusoliveira@email.com','321',18,'1_B'),
(12319,'Marcelo','Costa','marcelo@email.com','123',18,'1_B'),
(12320,'Anderson','Silva','anderson@email.com','543',20,'1_B'),
(12321,'Carlos','Almeida','carlosalmeida@email.com','654',17,'2_B'),
(12322,'Miguel','Anderson','miguel_anderson@email.com','765',12,'2_B'),
(12328,'Figuereido','Silva','figuereidosilva@email.com','3455',13,'2_B'),
(12330,'Miguel','Cardoso','miguelcardoso@email.com','5453',17,'3_A'),
(12331,'Marcos','Teixeira','marcosteixeira@email.com','3455',18,'3_A'),
(12332,'Anderson','Queiroz','andersonqueiroz@email.com','3454',14,'3_A'),
(12333,'Carlos','Silva Teixeira','carlosteixeira@email.com','34545',14,'3_B'),
(12334,'Miguel','Teodoro','miguelteodoro@email.com','344ffg',23,'3_B'),
(12335,'Gabriel','Barros','gabrielbarros@email.com','345gg',23,'3_B'),
(12336,'Oliver','Silva Martins','oliversilva@email.com','34544',24,'1_A'),
(12337,'Claudinei','Silva Morato','claudineisilva@email.com','23444',24,'1_A'),
(12338,'Gabriel','Lima','gabriellima@email.com','2343',25,'2_A'),
(12339,'Arthur','Silva','arthursilva@email.com','2344',25,'2_A'),
(12340,'Leonardo','Silva','leonardosilva@email.com','23234',26,'2_B'),
(12342,'Jonas','Silva Ribeiro','jonassilva@email.com','2343',26,'3_A'),
(12344,'Luiz','Pereira','luizpereira@email.com','23434',31,'2_B'),
(12345,'Julio','Correia','juliocorreia@email.com','3454',31,'2_B'),
(12346,'Arlindo','Silva','arlino@email.com','2343',18,'2_B'),
(12347,'Estevão','Silva','estavaosilva@email.com','23434',32,'3_B'),
(12350,'Camila','Barros','camilabarros@email.com','12344',33,'3_A'),
(12351,'Igor','da Silva Junior','igorsilva@email.com','33444',31,'2_B'),
(12353,'Tarso','Correia','tarso@email.com','234ddf',33,'2_B'),
(12354,'Silvano','Cabral','silvanocabral@email.com','234der',33,'2_B');

/*Table structure for table `tb_professor` */

DROP TABLE IF EXISTS `tb_professor`;

CREATE TABLE `tb_professor` (
  `id_Professor` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Sobrenome` varchar(45) NOT NULL,
  `login` varchar(45) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  KEY `id_Professor` (`id_Professor`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

/*Data for the table `tb_professor` */

insert  into `tb_professor`(`id_Professor`,`Nome`,`Sobrenome`,`login`,`senha`) values 
(1,'Kamilly','Barbosa','kamilly@email.com','12345'),
(2,'João','Felipe Vieira','joão@email.com','12345'),
(3,'Clara','Viana','clara@email.com','12345'),
(4,'Pietro','da Costa','pietro@email.com','12345'),
(5,'Carol','Lima da Silva','ana@email.com','12345'),
(6,'João','Gabriel Ramos','joão@email.com','12345'),
(7,'Levi','Moura','levi@email.com','12345'),
(8,'Ian','Pereira','ian@email.com','12345'),
(9,'Benjamin','Azevedo','benjamin@email.com','12345'),
(10,'Luiza','Mendes','luiza@email.com','12345'),
(11,'Kamilly','Barbosa','kamilly@email.com','12345'),
(12,'João','Felipe Vieira','joão@email.com','12345'),
(13,'Clara','Viana','clara@email.com','12345'),
(14,'Pietro','da Costa','pietro@email.com','12345'),
(15,'Carol','Lima da Silva','ana@email.com','12345'),
(16,'João','Gabriel Ramos','joão@email.com','12345'),
(17,'Levi','Moura','levi@email.com','12345'),
(18,'Ian','Pereira','ian@email.com','12345'),
(19,'Benjamin','Azevedo','benjamin@email.com','12345'),
(20,'Luiza','Mendes','luiza@email.com','12345'),
(55,'Luciano','Amorin','lucianoamorin@email','3453'),
(56,'Carlos','Ramos','carlosramos@email.com','23423'),
(58,'Ana','Cabral','anacabral@email.com','3456'),
(59,'Samara','Batista Costa','samaracosta@email.com','123abc'),
(60,'Heltai','Camargo','heltaicamargo@email.com','345dfr');

/*Table structure for table `tb_disciplina` */

DROP TABLE IF EXISTS `tb_disciplina`;

CREATE TABLE `tb_disciplina` (
  `id_Disciplina` int(11) NOT NULL,
  `Nome_Disciplina` varchar(45) DEFAULT NULL,
  `id_Professor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Disciplina`),
  KEY `fk_disciplina_professor_idx` (`id_Professor`),
  CONSTRAINT `fk_disciplina_professor` FOREIGN KEY (`id_Professor`) REFERENCES `tb_professor` (`id_Professor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_disciplina` */

insert  into `tb_disciplina`(`id_Disciplina`,`Nome_Disciplina`,`id_Professor`) values 
(1,'Língua Portuguesa',1),
(2,'Redação',2),
(3,'Matemática',3),
(4,'História',4),
(5,'Geografia',5),
(6,'Ciências',6),
(7,'Artes',7),
(8,'Educação Física',8),
(9,'Inglês',9),
(10,'Física',10);

/*Table structure for table `tb_faleconosco` */

DROP TABLE IF EXISTS `tb_faleconosco`;

CREATE TABLE `tb_faleconosco` (
  `id_Mensagem` int(10) NOT NULL AUTO_INCREMENT,
  `Assunto` varchar(40) DEFAULT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Telefone` varchar(13) DEFAULT NULL,
  `Mensagem` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_Mensagem`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `tb_faleconosco` */

insert  into `tb_faleconosco`(`id_Mensagem`,`Assunto`,`Nome`,`Email`,`Telefone`,`Mensagem`) values 
(1,'notas','Matheus Ramos Pinto','matheus_0612@hotmail.com','1151344576','Quando será o fechamento das notas?'),
(3,'financeiro','Miguel de Souza','miguel@email.com','1123454444','Como pagar o boleto?'),
(7,'financeiro','Angela Silva Barbosa','angela@email.com','11945643456','Desejo saber quando vem a proxima mensalidade'),
(8,'faltas','Priscila de Almeida','priscilaalmeida@email.com','11923444444','Gostaria de receber um relatório de faltas');

/*Table structure for table `tb_falta` */

DROP TABLE IF EXISTS `tb_falta`;

CREATE TABLE `tb_falta` (
  `id_Falta` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `id_Professor` int(11) DEFAULT NULL,
  `id_Disciplina` int(11) DEFAULT NULL,
  `id_Aluno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Falta`),
  KEY `fk_falta_professor_idx` (`id_Professor`),
  KEY `fk_falta_disciplina_idx` (`id_Disciplina`),
  KEY `fk_falta_aluno_idx` (`id_Aluno`),
  CONSTRAINT `fk_falta_aluno` FOREIGN KEY (`id_Aluno`) REFERENCES `tb_aluno` (`id_Aluno`),
  CONSTRAINT `fk_falta_disciplina` FOREIGN KEY (`id_Disciplina`) REFERENCES `tb_disciplina` (`id_Disciplina`),
  CONSTRAINT `fk_falta_professor` FOREIGN KEY (`id_Professor`) REFERENCES `tb_professor` (`id_Professor`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

/*Data for the table `tb_falta` */

insert  into `tb_falta`(`id_Falta`,`data`,`id_Professor`,`id_Disciplina`,`id_Aluno`) values 
(1,'2021-10-01',1,1,12321),
(2,'2021-10-02',2,2,12322),
(3,'2021-10-03',3,3,34),
(4,'2021-10-04',4,4,156),
(6,'2021-10-04',5,5,156),
(10,'2021-10-04',6,6,34),
(11,'2021-10-05',7,7,34),
(12,'2021-10-06',8,8,156),
(13,'2021-10-07',9,9,12313),
(14,'2021-10-08',10,10,12315),
(15,'2021-12-12',1,1,34),
(16,'2021-12-12',2,2,156),
(17,'2001-02-23',3,3,34),
(18,'2021-11-06',4,4,13),
(19,'2021-11-06',5,5,34),
(20,'2021-11-06',6,6,156),
(21,'2021-11-06',7,7,34),
(22,'2021-11-06',8,8,156),
(23,'2021-11-06',9,9,12313),
(24,'2021-11-07',10,10,12),
(25,'2021-11-08',1,1,34),
(26,'2021-11-08',2,2,156),
(27,'2021-11-08',10,10,34),
(28,'2021-11-08',1,1,156),
(29,'2021-11-09',2,2,34),
(30,'2021-11-09',3,3,156),
(31,'2021-11-09',4,4,34),
(32,'2021-11-08',5,5,156),
(33,'2021-11-09',1,1,12313),
(34,'2021-11-09',8,8,12315),
(35,'2021-11-09',1,1,34),
(36,'2021-11-09',7,7,156),
(37,'2021-11-09',1,1,34),
(38,'2021-11-09',1,1,156),
(39,'2021-11-09',4,4,34),
(40,'2021-11-09',1,1,156),
(41,'2021-11-09',1,1,34),
(42,'2021-11-09',5,5,156),
(43,'2021-11-09',4,4,34),
(44,'2021-11-09',1,1,156),
(45,'2021-11-09',6,6,12),
(46,'2021-11-09',1,1,13),
(47,'2021-11-09',6,6,34),
(48,'2021-11-09',1,1,34),
(49,'2021-11-10',6,6,34),
(50,'2021-11-10',1,1,12315),
(51,'2021-11-10',9,9,34),
(52,'2021-11-10',10,10,12315),
(53,'2021-11-10',6,6,13),
(54,'2021-11-10',8,8,34),
(55,'2021-11-11',9,9,12333),
(56,'2021-11-12',8,8,12319);

/*Table structure for table `tb_nota` */

DROP TABLE IF EXISTS `tb_nota`;

CREATE TABLE `tb_nota` (
  `id_Nota` int(11) NOT NULL AUTO_INCREMENT,
  `notaA1` float(4,2) DEFAULT NULL,
  `notaA2` float(4,2) DEFAULT NULL,
  `id_Professor` int(11) DEFAULT NULL,
  `id_Disciplina` int(11) DEFAULT NULL,
  `id_Aluno` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  PRIMARY KEY (`id_Nota`),
  KEY `fk_nota_professor_idx` (`id_Professor`),
  KEY `fk_nota_disciplina_idx` (`id_Disciplina`),
  KEY `fk_nota_aluno_idx` (`id_Aluno`),
  CONSTRAINT `fk_nota_aluno` FOREIGN KEY (`id_Aluno`) REFERENCES `tb_aluno` (`id_Aluno`),
  CONSTRAINT `fk_nota_disciplina` FOREIGN KEY (`id_Disciplina`) REFERENCES `tb_disciplina` (`id_Disciplina`),
  CONSTRAINT `fk_nota_professor` FOREIGN KEY (`id_Professor`) REFERENCES `tb_professor` (`id_Professor`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;

/*Data for the table `tb_nota` */

insert  into `tb_nota`(`id_Nota`,`notaA1`,`notaA2`,`id_Professor`,`id_Disciplina`,`id_Aluno`,`data`) values 
(1,3.90,4.50,1,1,12,NULL),
(2,4.00,4.00,2,2,12,NULL),
(3,4.40,5.00,3,3,12,NULL),
(4,4.00,4.80,4,4,12,NULL),
(5,5.00,3.00,5,5,12,NULL),
(6,4.00,3.90,6,6,12,NULL),
(7,4.00,4.00,1,1,34,NULL),
(8,4.00,4.00,1,1,156,NULL),
(9,4.00,4.00,2,2,34,NULL),
(10,5.00,5.00,2,2,156,NULL),
(11,2.00,5.00,3,3,34,NULL),
(12,4.00,4.00,3,3,156,NULL),
(13,4.70,4.00,4,4,34,NULL),
(14,4.40,4.00,4,4,156,NULL),
(15,4.90,4.60,5,5,34,NULL),
(16,4.90,4.60,5,5,156,NULL),
(17,4.50,5.00,6,6,34,NULL),
(18,4.00,5.00,6,6,156,NULL),
(19,5.00,5.00,7,7,34,NULL),
(20,5.00,5.00,7,7,156,NULL),
(21,4.00,4.50,1,1,12,'2021-11-08'),
(22,4.50,4.50,8,8,156,'2021-11-08'),
(23,4.00,4.00,8,8,34,'2021-11-08'),
(24,4.00,4.00,9,9,156,'2021-11-08'),
(25,4.00,4.00,9,9,34,'2021-11-08'),
(26,4.00,4.00,10,10,156,'2021-11-08'),
(27,5.00,5.00,10,10,34,'2021-11-08'),
(28,5.00,5.00,1,1,12336,'2021-11-08'),
(30,5.00,5.00,2,2,12336,'2021-11-08'),
(32,5.00,5.00,3,3,12336,'2021-11-08'),
(33,5.00,5.00,7,7,12,'2021-11-08'),
(34,5.00,5.00,4,4,12336,'2021-11-08'),
(36,5.00,5.00,5,5,12336,'2021-11-08'),
(38,5.00,5.00,6,6,12336,'2021-11-08'),
(40,5.00,5.00,7,7,12336,'2021-11-08'),
(43,5.00,5.00,8,8,12336,'2021-11-09'),
(54,4.00,4.00,1,1,12313,'2021-11-09'),
(55,2.00,4.00,1,1,12315,'2021-11-09'),
(56,3.00,5.00,2,2,12313,'2021-11-09'),
(57,5.00,5.00,2,2,12315,'2021-11-09'),
(58,3.00,5.00,3,3,12313,'2021-11-09'),
(59,5.00,5.00,3,3,12315,'2021-11-09'),
(60,3.00,5.00,4,4,12313,'2021-11-09'),
(61,5.00,5.00,4,4,12315,'2021-11-09'),
(62,3.00,5.00,5,5,12313,'2021-11-09'),
(63,5.00,5.00,5,5,12315,'2021-11-09'),
(66,5.00,5.00,1,1,12320,'2021-11-09'),
(67,5.00,5.00,1,1,12321,'2021-11-09'),
(68,5.00,5.00,2,2,12320,'2021-11-09'),
(69,5.00,5.00,1,6,12321,'2021-11-09'),
(70,4.00,5.00,8,8,12,'2021-11-10'),
(71,3.50,4.50,9,9,13,'2021-11-10'),
(74,4.70,4.30,6,6,12313,'2021-11-10'),
(75,4.00,4.00,6,6,12315,'2021-11-10'),
(76,4.00,5.00,1,7,12330,'2021-11-10'),
(77,4.80,4.20,1,1,12331,'2021-11-10'),
(78,5.00,5.00,1,3,12328,'2021-11-10'),
(79,5.00,5.00,1,3,12332,'2021-11-10'),
(80,5.00,5.00,10,10,12,'2021-11-10'),
(81,5.00,5.00,1,4,13,'2021-11-10'),
(84,5.00,5.00,7,7,12313,'2021-11-10'),
(85,5.00,5.00,7,7,12315,'2021-11-10'),
(86,5.00,5.00,1,4,12330,'2021-11-10'),
(87,5.00,5.00,2,2,12331,'2021-11-10'),
(88,5.00,5.00,8,8,12318,'2021-11-12'),
(89,4.00,4.00,8,8,12319,'2021-11-12'),
(90,3.00,3.00,8,8,12320,'2021-11-12'),
(94,1.00,1.00,1,1,12318,'2021-11-12');