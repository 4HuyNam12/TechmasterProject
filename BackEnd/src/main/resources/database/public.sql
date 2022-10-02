/*
 Navicat Premium Data Transfer

 Source Server         : finalprojet
 Source Server Type    : PostgreSQL
 Source Server Version : 140005
 Source Host           : localhost:5432
 Source Catalog        : quan_ly_dich_vu
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140005
 File Encoding         : 65001

 Date: 02/10/2022 10:38:44
*/


-- ----------------------------
-- Sequence structure for activities_game_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."activities_game_id_seq";
CREATE SEQUENCE "public"."activities_game_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for amenities_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."amenities_id_seq";
CREATE SEQUENCE "public"."amenities_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for feature_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."feature_id_seq";
CREATE SEQUENCE "public"."feature_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for hibernate_sequence
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."hibernate_sequence";
CREATE SEQUENCE "public"."hibernate_sequence" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."role_id_seq";
CREATE SEQUENCE "public"."role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS "public"."account";
CREATE TABLE "public"."account" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6),
  "updated_at" timestamp(6),
  "version" int4 NOT NULL,
  "dob" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "enable" bool,
  "gender" bool,
  "image_link" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "password" varchar(255) COLLATE "pg_catalog"."default",
  "phone" varchar(255) COLLATE "pg_catalog"."default",
  "reset_password_token" varchar(255) COLLATE "pg_catalog"."default",
  "role_id" int8,
  "enabled" bool
)
;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO "public"."account" VALUES ('1f322d1a-f886-4276-8622-a20fa46a7ed0', '2021-08-14 20:16:08', '2021-08-14 20:48:46', 0, '20211215', 'yen@123', NULL, 't', '2.jpg', 'Yen', '$2a$12$0uPxpep6c1RhZWA/1N3M8ObWTB3yj3sOZPquQdh2mZAJEzVwSZjbO', '0348970888', NULL, 2, 't');
INSERT INTO "public"."account" VALUES ('7fd25c55-d762-490f-9d98-8883b9f3f476', '2021-08-14 20:10:46', '2021-08-14 20:48:46', 0, '20211215', 'han@123', NULL, 't', '3.jpg', 'Han', '$2a$12$0uPxpep6c1RhZWA/1N3M8ObWTB3yj3sOZPquQdh2mZAJEzVwSZjbO', '0348970887', NULL, 3, 't');
INSERT INTO "public"."account" VALUES ('44854ec8-d083-402e-b534-afec7687dfe7', '2021-08-14 10:49:35', '2022-08-25 22:00:34.531', 1, '20211215', 'nampartner@123', NULL, 't', '-user1661439634526.jpg', 'Nam', '$2a$12$0uPxpep6c1RhZWA/1N3M8ObWTB3yj3sOZPquQdh2mZAJEzVwSZjbO', '0348970886', NULL, 4, 't');
INSERT INTO "public"."account" VALUES ('7648ea13-fcdf-40d2-aa70-dc2527a7632a', '2021-08-14 20:20:41', '2022-09-21 23:16:24.478', 3, '19921204', 'nam@123', NULL, 't', '-user1663776984325.jpg', 'Nam', '$2a$12$0uPxpep6c1RhZWA/1N3M8ObWTB3yj3sOZPquQdh2mZAJEzVwSZjbO', '0348970889', NULL, 1, 't');
INSERT INTO "public"."account" VALUES ('c131bf66-317b-4594-bdf5-39efa627a194', '2022-09-21 23:44:52.626', '2022-09-21 23:52:50.421', 1, '20220915', 'formysadsong4112@gmail.com', NULL, 't', '-user1663779170411.jpg', 'Nguyễn Huy Nam', '$2a$12$d9FBcWj/otijw0Hi77vnnepjG56H5PkTu/2tbROHIPoRs/OvmpMBG', '0348970889', NULL, 5, 't');
INSERT INTO "public"."account" VALUES ('092ba472-575a-46ab-876f-f02e2eee282f', '2022-09-21 23:53:29.583', '2022-09-21 23:54:19.5', 1, '20220917', 'nam@1234', NULL, 'f', '-user1663779259470.jpg', 'Nam', '$2a$12$w/sMcQWs6y8df9H525b5ye8clFzi3SDXSPtjuB5HHlbz8sP2imXQi', '0123456789', NULL, 5, 't');
INSERT INTO "public"."account" VALUES ('4a7638d6-9beb-4a91-b4f3-f9aa80a3fe59', '2022-09-22 00:04:53.653', '2022-09-22 00:04:53.653', 0, '20220906', 'nam@12345', NULL, 't', 'avatar-KNckwVDCht.png', 'abc', '$2a$12$Kl/Mq9C1fXDRYI1kMPj4ReePglK3Qtmqi86cXjtzsCn.e/Vo6gYU2', '0348970889', NULL, 5, 't');
INSERT INTO "public"."account" VALUES ('81e13f19-29ac-411f-9c34-16ae8315ff84', '2022-09-21 23:55:00.967', '2022-09-22 22:59:17.483', 2, '20220915', 'nam@11', NULL, 'f', '-user1663779857018.jpg', 'Nam1', '$2a$12$YWkGAvvsevKv6N2Etd6HY.uastMrKOBVpeZPQWweifP5kWKDV0tWq', '0348970889', NULL, 4, 't');
INSERT INTO "public"."account" VALUES ('e67e5e7d-70c8-41b8-8c78-3009afd17356', '2021-08-11 09:47:27', '2022-09-23 00:28:30.396', 18, '20211215', 'formysadsong412@gmail.com', NULL, 't', '-user1663867710204.jpg', 'Nam', '$2a$10$3u17FOeF4edE8xSR8pwBoea6HlD1zDVCcN09otsUCbPaT.hVDtzeG', '0348970885', NULL, 5, 't');

-- ----------------------------
-- Table structure for activities
-- ----------------------------
DROP TABLE IF EXISTS "public"."activities";
CREATE TABLE "public"."activities" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6),
  "updated_at" timestamp(6),
  "version" int4 NOT NULL,
  "type" varchar(255) COLLATE "pg_catalog"."default",
  "address" varchar(255) COLLATE "pg_catalog"."default",
  "adult_ticket_price" float8,
  "approve_status" varchar(255) COLLATE "pg_catalog"."default",
  "child_ticket_price" float8,
  "code" varchar(255) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "duration" int4,
  "slug" varchar(1000) COLLATE "pg_catalog"."default",
  "star" int4,
  "title" varchar(1000) COLLATE "pg_catalog"."default",
  "user_id" varchar(255) COLLATE "pg_catalog"."default",
  "ts_search" tsvector
)
;

-- ----------------------------
-- Records of activities
-- ----------------------------
INSERT INTO "public"."activities" VALUES ('4e0ebfa9-7824-479e-ad20-76f436597532', '2022-09-17 11:56:11.678309', '2022-09-17 15:08:25.100735', 2, 'IN_DOOR', 'Ecopark- Gia Lâm, Hà Nội', 19999, 'APPROVED', 200000, 'AC-UORR5MCSVH', 'Kolorado là một tổ hợp khu vui chơi trong nhà và ngoài trời dành cho trẻ từ 3-14 tuổi với tổng diện tích lên tới 2.800m2, trong đó diện tích trong nhà là 1.000m2 và diện tích ngoài trời là 1.800m2. Kolorado tọa lạc tại vị trí trung tâm công viên Mùa Hạ – một khuôn viên xanh mướt với hồ nước, bãi cỏ rộng mênh mang và sắc hoa ngập tràn cùng không gian thoáng đãng, trong lành.', 5, '-kolorado--khu-vui-choi-trong-nha-cho-tre-o-ha-noiac-uorr5mcsvh', NULL, ' Kolorado – Khu vui chơi trong nhà cho trẻ ở Hà Nội', '44854ec8-d083-402e-b534-afec7687dfe7', '''-14'':30 ''1.000'':47 ''1.800'':55 ''2.800'':38 ''3'':29 ''bai'':77 ''cho'':7,26 ''choi'':4,19 ''co'':78 ''cong'':65 ''cung'':87 ''dang'':91 ''danh'':25 ''dien'':34,42,50 ''ecopark'':94 ''gia'':95 ''gian'':89 ''ha'':10,68,97 ''ho'':75 ''hoa'':84 ''hop'':16 ''khong'':88 ''khu'':2,17 ''khuon'':70 ''kolorado'':1,12,57 ''la'':13,46,54 ''lac'':59 ''lam'':96 ''lanh'':93 ''len'':36 ''m2'':39,48,56 ''mang'':81 ''menh'':80 ''mot'':14,69 ''mua'':67 ''muot'':73 ''ngap'':85 ''ngoai'':23,52 ''nha'':6,21,45 ''noi'':11,98 ''nuoc'':76 ''o'':9 ''rong'':79 ''sac'':83 ''tai'':60 ''tam'':64 ''thoang'':90 ''tich'':35,43,51 ''toa'':58 ''toi'':37 ''tong'':33 ''tran'':86 ''tri'':62 ''troi'':24,53 ''trong'':5,20,40,44,92 ''trung'':63 ''trẻ'':8,27 ''tu'':28 ''tuoi'':31 ''va'':22,49,82 ''vi'':61 ''vien'':66,71 ''voi'':32,74 ''vui'':3,18 ''xanh'':72');
INSERT INTO "public"."activities" VALUES ('29edd71a-a6ac-4946-a5dc-0429c8993b07', '2022-09-17 11:50:56.877828', '2022-09-17 15:08:39.091747', 2, 'IN_DOOR', 'Địa chỉ: 458 Minh Khai, Thanh Lương, Hai Bà Trưng, Hà Nội', 200000, 'APPROVED', 0, 'AC-HVK8WM73XY', 'Times City có gì chơi thì chắc chắn phải nhắc đến Thủy cung Times City thuộc VinKE & Vinpearl Aquarium Times City – Hệ thống khu vui chơi trong nhà ở Hà Nội bậc nhất. Đây là ngôi nhà chung của hơn 30.000 cá thể sinh vật biển từ khắp nơi trên thế giới. Thủy cung Times City có quy mô đồ sộ với diện tích gần 4.000m2 và là công trình đạt nhiều kỷ lục như: Thủy cung có “đường hầm biển” đầu tiên tại Hà Nội; Thủy cung có nhiều loài sinh vật biển lần đầu xuất hiện tại Việt Nam; Nơi khai sinh ra chú chim cánh cụt đầu tiên tại Việt Nam…', 5, 'vinke--vinpearl-aquarium-times-cityac-hvk8wm73xy', NULL, 'VinKE & Vinpearl Aquarium Times City', '44854ec8-d083-402e-b534-afec7687dfe7', '''30.000'':46 ''4.000'':71 ''458'':123 ''aquarium'':3,24 ''ba'':129 ''bac'':37 ''biển'':51,87,100 ''ca'':47 ''canh'':114 ''chac'':12 ''chan'':13 ''chi'':122 ''chim'':113 ''choi'':10,31 ''chu'':112 ''chung'':43 ''citi'':5,7,20,26,61 ''co'':8,62,84,95 ''cong'':75 ''cua'':44 ''cung'':18,59,83,94 ''cut'':115 ''dat'':77 ''dau'':88,102,116 ''day'':39 ''den'':16 ''dia'':121 ''dien'':68 ''duong'':85 ''gan'':70 ''gi'':9 ''gioi'':57 ''ha'':35,91,131 ''hai'':128 ''ham'':86 ''hien'':104 ''hon'':45 ''khai'':109,125 ''khap'':53 ''khu'':29 ''kỷ'':79 ''la'':40,74 ''lan'':101 ''loai'':97 ''luc'':80 ''luong'':127 ''m2'':72 ''minh'':124 ''mo'':64 ''nam'':107,120 ''ngoi'':41 ''nha'':33,42 ''nhac'':15 ''nhat'':38 ''nhieu'':78,96 ''nhu'':81 ''noi'':36,54,92,108,132 ''o'':34 ''phai'':14 ''quy'':63 ''ra'':111 ''sinh'':49,98,110 ''tai'':90,105,118 ''thanh'':126 ''thi'':11 ''thong'':28 ''thuoc'':21 ''thuy'':17,58,82,93 ''thể'':48 ''tich'':69 ''tien'':89,117 ''time'':4,6,19,25,60 ''tren'':55 ''trinh'':76 ''trong'':32 ''trung'':130 ''tu'':52 ''va'':73 ''vat'':50,99 ''viet'':106,119 ''vink'':1,22 ''vinpearl'':2,23 ''voi'':67 ''vui'':30 ''xuat'':103');
INSERT INTO "public"."activities" VALUES ('e29619e4-2181-452d-a248-20f055a0afac', '2022-09-17 11:54:59.62604', '2022-09-17 15:08:31.771193', 2, 'IN_DOOR', ' Vincom Metropolis 29 Liễu Giai, Ngọc Khánh, Ba Đình, Hà Nội', 20000, 'APPROVED', 200000, 'AC-VSZB81U1OG', 'Với mục tiêu: Chơi mà học – học mà chơi, Play ‘N’ Learn đã trở thành một trong những khu vui chơi trong nhà ở Hà Nội hấp dẫn các bạn nhỏ. Tại đây, các bé có thể tham gia những trò chơi trí tuệ, sáng tạo, kích thích học tập, khám phá và tìm tòi.

Ngoài ra, Play ‘N’ Learn còn là điểm đến để bé tìm hiểu về các nghề nghiệp trong cuộc sống và có cơ hội hóa trang, tự mình trải nghiệm ngành nghề mình yêu thích. Tuy diện tích khu vui chơi không lớn nhưng lại được sắp xếp thông minh, tạo cảm giác không gian rộng, thoáng đãng, đủ để các bé chạy nhảy và vui chơi thoải mái.', 5, 'tttm-vincom-metropolis--khu-vui-choi-play-n-learnac-vszb81u1og', NULL, 'TTTM Vincom Metropolis – Khu vui chơi Play ‘N’ Learn', '44854ec8-d083-402e-b534-afec7687dfe7', '''29'':136 ''ba'':141 ''ban'':39 ''cac'':38,43,79,125 ''cam'':116 ''chay'':127 ''choi'':6,13,18,30,51,105,131 ''co'':45,86,87 ''con'':70 ''cuoc'':83 ''da'':22 ''dan'':37 ''dang'':122 ''day'':42 ''den'':73 ''dien'':101 ''dinh'':142 ''diểm'':72 ''du'':123 ''duoc'':110 ''dể'':74,124 ''gia'':48 ''giac'':117 ''giai'':138 ''gian'':119 ''ha'':34,143 ''hap'':36 ''hiểu'':77 ''hoa'':89 ''hoc'':15,16,58 ''hoi'':88 ''kham'':60 ''khanh'':140 ''khong'':106,118 ''khu'':4,28,103 ''kich'':56 ''la'':71 ''lai'':109 ''learn'':9,21,69 ''lieu'':137 ''lon'':107 ''ma'':14,17 ''mai'':133 ''metropoli'':3,135 ''minh'':92,97,114 ''mot'':25 ''muc'':11 ''n'':8,20,68 ''nganh'':95 ''nghe'':80,96 ''nghiem'':94 ''nghiep'':81 ''ngoai'':65 ''ngoc'':139 ''nha'':32 ''nhay'':128 ''nho'':40 ''nhung'':27,49,108 ''noi'':35,144 ''o'':33 ''pha'':61 ''play'':7,19,67 ''ra'':66 ''rong'':120 ''sang'':54 ''sap'':111 ''song'':84 ''tai'':41 ''tao'':55,115 ''tap'':59 ''tham'':47 ''thanh'':24 ''thich'':57,99 ''thoai'':132 ''thoang'':121 ''thong'':113 ''thể'':46 ''tich'':102 ''tieu'':12 ''tim'':63,76 ''toi'':64 ''trai'':93 ''trang'':90 ''tri'':52 ''tro'':23,50 ''trong'':26,31,82 ''tttm'':1 ''tu'':91 ''tue'':53 ''tuy'':100 ''va'':62,85,129 ''ve'':78 ''vincom'':2,134 ''voi'':10 ''vui'':5,29,104,130 ''xep'':112 ''yeu'':98');
INSERT INTO "public"."activities" VALUES ('2da86bb6-75df-461e-9048-c8338f9f2823', '2022-09-17 11:53:42.137099', '2022-09-17 11:57:29.689294', 1, 'OUT_DOOR', 'Số 2 Phạm Ngọc Thạch, Kim Liên, Đống Đa, Hà Nội', 20000, 'APPROVED', 200000, 'AC-8TQG1WQTOD', 'Playtime được thiết kế theo mô hình 3 in 1 và là khu vui chơi trong nhà ở Hà Nội cực hot. Khi đến đây, các bé vừa có thể vui chơi giải trí, kết hợp giáo dục giúp phát triển tâm hồn trẻ một cách toàn diện nhất. ', 8, 'vincom-pham-ngoc-thach-playtimeac-8tqg1wqtod', NULL, 'Vincom Phạm Ngọc Thạch Playtime', '44854ec8-d083-402e-b534-afec7687dfe7', '''1'':15 ''2'':56 ''3'':13 ''cac'':31 ''cach'':51 ''choi'':20,37 ''co'':34 ''cuc'':26 ''da'':63 ''day'':30 ''den'':29 ''dien'':53 ''dong'':62 ''duc'':43 ''duoc'':7 ''giai'':38 ''giao'':42 ''giup'':44 ''ha'':24,64 ''hinh'':12 ''hon'':48 ''hop'':41 ''hot'':27 ''ke'':9 ''ket'':40 ''khi'':28 ''khu'':18 ''kim'':60 ''la'':17 ''lien'':61 ''mo'':11 ''mot'':50 ''ngoc'':3,58 ''nha'':22 ''nhat'':54 ''noi'':25,65 ''o'':23 ''pham'':2,57 ''phat'':45 ''playtim'':5,6 ''tam'':47 ''thach'':4,59 ''theo'':10 ''thiet'':8 ''thể'':35 ''toan'':52 ''tri'':39 ''triển'':46 ''trong'':21 ''trẻ'':49 ''va'':16 ''vincom'':1 ''vua'':33 ''vui'':19,36');

-- ----------------------------
-- Table structure for activities_game
-- ----------------------------
DROP TABLE IF EXISTS "public"."activities_game";
CREATE TABLE "public"."activities_game" (
  "id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "activities_code" varchar(255) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "image" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of activities_game
-- ----------------------------
INSERT INTO "public"."activities_game" VALUES (1, 'AC-HVK8WM73XY', 'Vinpearl Aquarium Times City – Khám phá đại dương giữa lòng thủ đô', 'activities-game1663390292462.jpg', 'Thủy Cung');
INSERT INTO "public"."activities_game" VALUES (2, 'AC-HVK8WM73XY', ' Khu vui chơi, giáo dục cho trẻ em', 'activities-game1663390318125.jpg', ' Khu vui chơi, giáo dục cho trẻ em');
INSERT INTO "public"."activities_game" VALUES (3, 'AC-HVK8WM73XY', 'Khu hướng nghiệp', 'activities-game1663390333926.jpg', 'Khu hướng nghiệp');
INSERT INTO "public"."activities_game" VALUES (4, 'AC-8TQG1WQTOD', 'Khu trò chơi vận động sáng tạo Baby Angels', 'activities-game1663390452025.jpg', 'Khu trò chơi vận động sáng tạo Baby Angels');
INSERT INTO "public"."activities_game" VALUES (5, 'AC-VSZB81U1OG', 'Lính cứu hỏa', 'activities-game1663390517073.jpg', 'Lính cứu hỏa');
INSERT INTO "public"."activities_game" VALUES (6, 'AC-UORR5MCSVH', 'Khu vận động', 'activities-game1663390616778.jpg', 'Khu vận động');

-- ----------------------------
-- Table structure for activities_image
-- ----------------------------
DROP TABLE IF EXISTS "public"."activities_image";
CREATE TABLE "public"."activities_image" (
  "id" int8 NOT NULL,
  "created_at" timestamp(6),
  "updated_at" timestamp(6),
  "version" int4 NOT NULL,
  "activities_code" varchar(255) COLLATE "pg_catalog"."default",
  "caption" text COLLATE "pg_catalog"."default",
  "url" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of activities_image
-- ----------------------------
INSERT INTO "public"."activities_image" VALUES (113, '2022-09-17 11:50:56.875831', '2022-09-17 11:50:56.875831', 0, 'AC-HVK8WM73XY', 'image for activities', 'activities1663390256847-0.png');
INSERT INTO "public"."activities_image" VALUES (114, '2022-09-17 11:50:56.876832', '2022-09-17 11:50:56.876832', 0, 'AC-HVK8WM73XY', 'image for activities', 'activities1663390256853-1.jpg');
INSERT INTO "public"."activities_image" VALUES (115, '2022-09-17 11:50:56.876832', '2022-09-17 11:50:56.876832', 0, 'AC-HVK8WM73XY', 'image for activities', 'activities1663390256861-2.jpg');
INSERT INTO "public"."activities_image" VALUES (116, '2022-09-17 11:50:56.876832', '2022-09-17 11:50:56.876832', 0, 'AC-HVK8WM73XY', 'image for activities', 'activities1663390256867-3.jpg');
INSERT INTO "public"."activities_image" VALUES (117, '2022-09-17 11:53:42.137099', '2022-09-17 11:53:42.137099', 0, 'AC-8TQG1WQTOD', 'image for activities', 'activities1663390422130-0.jpg');
INSERT INTO "public"."activities_image" VALUES (118, '2022-09-17 11:54:59.62604', '2022-09-17 11:54:59.62604', 0, 'AC-VSZB81U1OG', 'image for activities', 'activities1663390499615-0.jpg');
INSERT INTO "public"."activities_image" VALUES (119, '2022-09-17 11:56:11.675214', '2022-09-17 11:56:11.675214', 0, 'AC-UORR5MCSVH', 'image for activities', 'activities1663390571662-0.jpg');

-- ----------------------------
-- Table structure for activities_receipt
-- ----------------------------
DROP TABLE IF EXISTS "public"."activities_receipt";
CREATE TABLE "public"."activities_receipt" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6),
  "updated_at" timestamp(6),
  "version" int4 NOT NULL,
  "activities_info" jsonb,
  "booking_id" varchar(255) COLLATE "pg_catalog"."default",
  "number_ticket_adult" int4,
  "number_ticket_child" int4,
  "partner_id" varchar(255) COLLATE "pg_catalog"."default",
  "phone_partner" varchar(255) COLLATE "pg_catalog"."default",
  "price" float8,
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "travel_date" int4,
  "user_id" varchar(255) COLLATE "pg_catalog"."default",
  "contact_id" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of activities_receipt
-- ----------------------------

-- ----------------------------
-- Table structure for amenities
-- ----------------------------
DROP TABLE IF EXISTS "public"."amenities";
CREATE TABLE "public"."amenities" (
  "id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "icon" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of amenities
-- ----------------------------
INSERT INTO "public"."amenities" VALUES (1, 'https://statics.travala.com/facilities-icon/check_travo.svg', 'Dịch vụ trông giữ vật nuôi');
INSERT INTO "public"."amenities" VALUES (2, 'https://statics.travala.com/facilities-icon/Bar_travo.svg', 'Bar/lounge');
INSERT INTO "public"."amenities" VALUES (3, 'https://statics.travala.com/facilities-icon/Laundry_travo.svg', 'Dịch vụ giặt khô/giặt ủi');
INSERT INTO "public"."amenities" VALUES (4, 'https://statics.travala.com/facilities-icon/Fitness-Center_travo.svg', 'Khu thể thao');
INSERT INTO "public"."amenities" VALUES (5, 'https://statics.travala.com/facilities-icon/Luggage-storage_travo.svg', 'Trông giữ/bảo quản hành lý');
INSERT INTO "public"."amenities" VALUES (6, 'https://statics.travala.com/facilities-icon/Spa_travo.svg', 'Bồn tắm spa (phụ phí)');
INSERT INTO "public"."amenities" VALUES (7, 'https://statics.travala.com/facilities-icon/check_travo.svg', 'Dịch vụ cắt tỉa lông cho vật nuôi');
INSERT INTO "public"."amenities" VALUES (8, 'https://statics.travala.com/facilities-icon/Swimming_travo.svg', 'Hồ bơi');
INSERT INTO "public"."amenities" VALUES (9, 'https://statics.travala.com/facilities-icon/Tour-Desk_travo.svg', 'Dịch vụ hỗ trợ tour/vé du lịch');
INSERT INTO "public"."amenities" VALUES (10, 'https://statics.travala.com/facilities-icon/smoking_travo.svg', 'Khách sạn không khói thuốc');
INSERT INTO "public"."amenities" VALUES (11, 'https://statics.travala.com/facilities-icon/Spa_travo.svg', 'Bồn tắm spa');
INSERT INTO "public"."amenities" VALUES (12, 'https://statics.travala.com/facilities-icon/wifi.svg', 'Wifi miễn phí');

-- ----------------------------
-- Table structure for booking_contact
-- ----------------------------
DROP TABLE IF EXISTS "public"."booking_contact";
CREATE TABLE "public"."booking_contact" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6),
  "updated_at" timestamp(6),
  "version" int4 NOT NULL,
  "customer_id" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "first_name" varchar(255) COLLATE "pg_catalog"."default",
  "last_name" varchar(255) COLLATE "pg_catalog"."default",
  "phone" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of booking_contact
-- ----------------------------
INSERT INTO "public"."booking_contact" VALUES ('86e7c2d1-61f1-4b94-8b1e-cb2bc68ced30', '2021-07-29 00:23:19.979', '2021-07-29 00:23:19.979', 0, '1', 'justin@gmail.com', 'justin', 'ta', '0336647091');
INSERT INTO "public"."booking_contact" VALUES ('75f33ab7-fef0-46a3-870f-b678043fd6a4', '2022-08-17 10:41:07.12', '2022-08-17 10:41:07.12', 0, 'e67e5e7d-70c8-41b8-8c78-3009afd17356', 'nhnam4@cmcglobal.vn', 'nam', 'nam', '0348970889');
INSERT INTO "public"."booking_contact" VALUES ('7496c710-51d6-4491-9540-8b1e45036362', '2022-08-22 08:44:49.026', '2022-08-22 08:44:49.026', 0, 'e67e5e7d-70c8-41b8-8c78-3009afd17356', 'formysadsong412@gmail.com', 'nam', 'Nam', '0348970889');
INSERT INTO "public"."booking_contact" VALUES ('d3f83954-c98e-4388-9ebf-5959eb7fa2ed', '2022-08-22 12:41:10.892', '2022-08-22 12:41:10.892', 0, 'e67e5e7d-70c8-41b8-8c78-3009afd17356', 'a', 'a', 'a', '0348970889');
INSERT INTO "public"."booking_contact" VALUES ('b56eb2a6-b353-44f2-a8e7-dbe0d6d39a9d', '2022-09-17 10:51:55.4553', '2022-09-17 10:51:55.4553', 0, 'e67e5e7d-70c8-41b8-8c78-3009afd17356', 'formysadsong412@gmail.com', 'Nguyen', 'Nam', '0348970889');
INSERT INTO "public"."booking_contact" VALUES ('b43a52cc-bfc9-435d-88f5-30542f31c8e6', '2022-09-18 11:58:42.714756', '2022-09-18 11:58:42.714756', 0, 'e67e5e7d-70c8-41b8-8c78-3009afd17356', 'formysadsong412@gmail.com', 'Nguyen', 'Nam', '0348970889');
INSERT INTO "public"."booking_contact" VALUES ('7f3a3b1d-5fe3-4b7c-a90d-190027914ed3', '2022-09-23 00:29:08.384', '2022-09-23 00:29:08.384', 0, 'e67e5e7d-70c8-41b8-8c78-3009afd17356', 'nammember@123', 'Nguyen', 'Nam', '0348970889');
INSERT INTO "public"."booking_contact" VALUES ('5166f337-576f-4750-a639-94361d556715', '2022-09-23 00:33:46.68', '2022-09-23 00:33:46.68', 0, 'e67e5e7d-70c8-41b8-8c78-3009afd17356', 'formysadsong412@gmail.com', 'Nguyen', 'Nam', '0348970889');
INSERT INTO "public"."booking_contact" VALUES ('3f3458fe-5fb7-4626-8f6a-24ab8040f171', '2022-09-24 23:02:57.111', '2022-09-24 23:02:57.111', 0, 'e67e5e7d-70c8-41b8-8c78-3009afd17356', 'formysadsong412@gmail.com', 'Nguyen', 'Nam', '0348970889');

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS "public"."favorite";
CREATE TABLE "public"."favorite" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6),
  "updated_at" timestamp(6),
  "version" int4 NOT NULL,
  "image_url" varchar(255) COLLATE "pg_catalog"."default",
  "slug" varchar(255) COLLATE "pg_catalog"."default",
  "title" varchar(255) COLLATE "pg_catalog"."default",
  "type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "user_id" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of favorite
-- ----------------------------
INSERT INTO "public"."favorite" VALUES ('cab7c4e4-71ff-42c8-b8a9-377cf7c534b4', '2022-09-17 12:03:13.292449', '2022-09-17 12:03:13.292449', 0, 'restaurant1663388001826-6.jpg', 'chai-talay---xa-anre-apltxff3md', 'Chai Talay - Xã Đàn', 'RESTAURANT', '7648ea13-fcdf-40d2-aa70-dc2527a7632a');
INSERT INTO "public"."favorite" VALUES ('2e5c7557-60af-49bd-a58b-8177822a1dab', '2022-09-17 12:03:16.315997', '2022-09-17 12:03:16.315997', 0, 'restaurant1663387817002-0.jpg', 'tao-li-canting---ly-thuong-kietre-34gfxmpfo4', 'Tao Li Canting - Lý Thường Kiệt', 'RESTAURANT', '7648ea13-fcdf-40d2-aa70-dc2527a7632a');
INSERT INTO "public"."favorite" VALUES ('74e612cc-cf72-4004-b384-bf62f8dc5b16', '2022-09-17 12:03:17.739236', '2022-09-17 12:03:17.739236', 0, 'activities1663390571662-0.jpg', '-kolorado--khu-vui-choi-trong-nha-cho-tre-o-ha-noiac-uorr5mcsvh', ' Kolorado – Khu vui chơi trong nhà cho trẻ ở Hà Nội', 'ACTIVITIES', '7648ea13-fcdf-40d2-aa70-dc2527a7632a');
INSERT INTO "public"."favorite" VALUES ('57db0dbf-a5e9-4c9a-9901-e4bf7e32d6eb', '2022-09-17 12:03:24.556135', '2022-09-17 12:03:24.556135', 0, 'hotel1661439975258-8.jpg', '-salem-riversideho-b5knz2sm9q', ' Salem Riverside', 'HOTEL', '7648ea13-fcdf-40d2-aa70-dc2527a7632a');
INSERT INTO "public"."favorite" VALUES ('26e1919f-93a9-4294-bcfc-b37dd27ac4be', '2022-09-17 12:03:25.388385', '2022-09-17 12:03:25.388385', 0, 'hotel1661439462808-7.jpg', 'melia-vinpearl-condotel-riverfront-da-nangho-8x27ckxsg7', 'Melia Vinpearl Condotel Riverfront Da Nang', 'HOTEL', '7648ea13-fcdf-40d2-aa70-dc2527a7632a');
INSERT INTO "public"."favorite" VALUES ('2f7bff50-9467-4fb6-8645-69d9273d463d', '2022-09-17 12:03:27.755885', '2022-09-17 12:03:27.755885', 0, 'restaurant1663387564118-1.jpg', 'kien-o-akaari-premium---ngoai-giao-oanre-20u5wfzhzl', 'Kiến Đỏ Akaari Premium - Ngọai Giao Đoàn', 'RESTAURANT', '7648ea13-fcdf-40d2-aa70-dc2527a7632a');
INSERT INTO "public"."favorite" VALUES ('c61aa8e2-7d22-4035-8c56-d07319aa76e9', '2022-09-17 12:03:29.65259', '2022-09-17 12:03:29.65259', 0, 'activities1663390499615-0.jpg', 'tttm-vincom-metropolis--khu-vui-choi-play-n-learnac-vszb81u1og', 'TTTM Vincom Metropolis – Khu vui chơi Play ‘N’ Learn', 'ACTIVITIES', '7648ea13-fcdf-40d2-aa70-dc2527a7632a');
INSERT INTO "public"."favorite" VALUES ('355413d8-ea69-4484-9092-102aa045a74e', '2022-09-17 14:17:23.664371', '2022-09-17 14:17:23.664371', 0, 'hotel1661439975258-8.jpg', '-salem-riversideho-b5knz2sm9q', ' Salem Riverside', 'HOTEL', 'e67e5e7d-70c8-41b8-8c78-3009afd17356');
INSERT INTO "public"."favorite" VALUES ('6df481aa-6eda-4712-8954-0a5047d6f1e8', '2022-09-17 14:17:26.433383', '2022-09-17 14:17:26.433383', 0, 'hotel1661439462808-7.jpg', 'melia-vinpearl-condotel-riverfront-da-nangho-8x27ckxsg7', 'Melia Vinpearl Condotel Riverfront Da Nang', 'HOTEL', 'e67e5e7d-70c8-41b8-8c78-3009afd17356');
INSERT INTO "public"."favorite" VALUES ('291983a5-d2a7-42da-94fd-6faab788a5f4', '2022-09-19 01:57:26.37', '2022-09-19 01:57:26.37', 0, 'restaurant1663388001826-6.jpg', 'chai-talay---xa-anre-apltxff3md', 'Chai Talay - Xã Đàn', 'RESTAURANT', '44854ec8-d083-402e-b534-afec7687dfe7');
INSERT INTO "public"."favorite" VALUES ('5200762b-ddd4-424f-8346-10563b2b8cb4', '2022-09-19 01:57:27.688', '2022-09-19 01:57:27.688', 0, 'restaurant1663387817002-0.jpg', 'tao-li-canting---ly-thuong-kietre-34gfxmpfo4', 'Tao Li Canting - Lý Thường Kiệt', 'RESTAURANT', '44854ec8-d083-402e-b534-afec7687dfe7');
INSERT INTO "public"."favorite" VALUES ('e7c466ac-6136-41e5-989e-2f69dcb3f93c', '2022-09-19 01:57:28.433', '2022-09-19 01:57:28.433', 0, 'restaurant1663387564118-1.jpg', 'kien-o-akaari-premium---ngoai-giao-oanre-20u5wfzhzl', 'Kiến Đỏ Akaari Premium - Ngọai Giao Đoàn', 'RESTAURANT', '44854ec8-d083-402e-b534-afec7687dfe7');
INSERT INTO "public"."favorite" VALUES ('f3f5ab4f-e1e2-4cd0-8aed-c07b96b4a905', '2022-09-19 01:57:31.871', '2022-09-19 01:57:31.871', 0, 'restaurant1663387356835-5.jpg', 'gimbab-han-quoc---ngoc-lamre-st7jhrjtct', 'Gimbab Hàn Quốc - Ngọc Lâm', 'RESTAURANT', '44854ec8-d083-402e-b534-afec7687dfe7');
INSERT INTO "public"."favorite" VALUES ('b0896145-cfe9-4dc0-850b-32411ac37c6b', '2022-09-19 01:57:33.286', '2022-09-19 01:57:33.286', 0, 'restaurant1663387196650-0.jpg', 'buffet-chay-love-vegan---ao-tanre-xbrrftmjjg', 'Buffet chay Love Vegan - Đào Tấn', 'RESTAURANT', '44854ec8-d083-402e-b534-afec7687dfe7');
INSERT INTO "public"."favorite" VALUES ('697d61e8-5cce-41d8-93a0-5cd7b230fd4d', '2022-09-19 02:24:46.653', '2022-09-19 02:24:46.653', 0, 'hotel1661439975258-8.jpg', '-salem-riversideho-b5knz2sm9q', ' Salem Riverside', 'HOTEL', '44854ec8-d083-402e-b534-afec7687dfe7');
INSERT INTO "public"."favorite" VALUES ('464c5a9b-ca39-4230-9dd2-e87ca2259e1f', '2022-09-19 02:24:47.465', '2022-09-19 02:24:47.465', 0, 'hotel1661439462808-7.jpg', 'melia-vinpearl-condotel-riverfront-da-nangho-8x27ckxsg7', 'Melia Vinpearl Condotel Riverfront Da Nang', 'HOTEL', '44854ec8-d083-402e-b534-afec7687dfe7');
INSERT INTO "public"."favorite" VALUES ('8b48e43d-b0e6-4f70-b2eb-5f167d986550', '2022-09-19 02:24:49.019', '2022-09-19 02:24:49.019', 0, 'hotel1660728895475-10.jpg', 'sofitel-legend-metropole-ha-noiho-novq5d8r5c', 'Sofitel Legend Metropole Hà Nội', 'HOTEL', '44854ec8-d083-402e-b534-afec7687dfe7');
INSERT INTO "public"."favorite" VALUES ('b25c82c5-c839-4087-b59e-8081a7ba13a8', '2022-09-19 02:27:01.868', '2022-09-19 02:27:01.868', 0, 'hotel1660728630010-18.jpg', 'jw-marriott-hotel-hanoiho-v4qn23gqw5', 'JW Marriott Hotel Hanoi', 'HOTEL', '44854ec8-d083-402e-b534-afec7687dfe7');
INSERT INTO "public"."favorite" VALUES ('ed88bb91-c0ff-408c-8e36-eaf16ef74996', '2022-09-19 02:27:02.537', '2022-09-19 02:27:02.537', 0, 'hotel1660728437027-2.jpg', 'intercontinental-hanoi-westlakeho-izeiavcjhb', 'InterContinental Hanoi Westlake', 'HOTEL', '44854ec8-d083-402e-b534-afec7687dfe7');
INSERT INTO "public"."favorite" VALUES ('cc25161e-0c9a-4685-a823-97a54c17d1f3', '2022-09-19 02:27:03.653', '2022-09-19 02:27:03.653', 0, 'hotel1660728175230-11.jpg', 'grand-plaza-ha-noi-hotelho-uzrwi13seg', 'Grand plaza ha noi hotel', 'HOTEL', '44854ec8-d083-402e-b534-afec7687dfe7');
INSERT INTO "public"."favorite" VALUES ('7779fda3-ace7-47cf-ade1-ac32739fa746', '2022-09-19 02:27:39.409', '2022-09-19 02:27:39.409', 0, 'activities1663390571662-0.jpg', '-kolorado--khu-vui-choi-trong-nha-cho-tre-o-ha-noiac-uorr5mcsvh', ' Kolorado – Khu vui chơi trong nhà cho trẻ ở Hà Nội', 'ACTIVITIES', '44854ec8-d083-402e-b534-afec7687dfe7');
INSERT INTO "public"."favorite" VALUES ('ab29bbf2-1021-4b43-8726-e5b1494e3456', '2022-09-19 02:27:40.086', '2022-09-19 02:27:40.086', 0, 'activities1663390499615-0.jpg', 'tttm-vincom-metropolis--khu-vui-choi-play-n-learnac-vszb81u1og', 'TTTM Vincom Metropolis – Khu vui chơi Play ‘N’ Learn', 'ACTIVITIES', '44854ec8-d083-402e-b534-afec7687dfe7');
INSERT INTO "public"."favorite" VALUES ('e580aa26-4041-40c1-91cc-c8d21abd3db2', '2022-09-19 02:27:41.27', '2022-09-19 02:27:41.27', 0, 'activities1663390422130-0.jpg', 'vincom-pham-ngoc-thach-playtimeac-8tqg1wqtod', 'Vincom Phạm Ngọc Thạch Playtime', 'ACTIVITIES', '44854ec8-d083-402e-b534-afec7687dfe7');
INSERT INTO "public"."favorite" VALUES ('f86dba16-2d20-4e56-877d-02169fee9f14', '2022-09-19 02:27:44.979', '2022-09-19 02:27:44.979', 0, 'activities1663390256853-1.jpg', 'vinke--vinpearl-aquarium-times-cityac-hvk8wm73xy', 'VinKE & Vinpearl Aquarium Times City', 'ACTIVITIES', '44854ec8-d083-402e-b534-afec7687dfe7');
INSERT INTO "public"."favorite" VALUES ('c83d95e2-e6b8-46d0-be67-6c51b7920dfa', '2022-09-20 22:12:36.526', '2022-09-20 22:12:36.526', 0, 'restaurant1663386907730-4.jpg', '-de-re-song-duong---han-thuyenre-fgsd7daeii', ' Dê Ré Song Dương - Hàn Thuyên', 'RESTAURANT', '7648ea13-fcdf-40d2-aa70-dc2527a7632a');
INSERT INTO "public"."favorite" VALUES ('d2891253-66dd-4854-b7b7-d8febcf57f44', '2022-09-22 00:06:57.607', '2022-09-22 00:06:57.607', 0, 'hotel1661439975258-8.jpg', '-salem-riversideho-b5knz2sm9q', ' Salem Riverside', 'HOTEL', '4a7638d6-9beb-4a91-b4f3-f9aa80a3fe59');
INSERT INTO "public"."favorite" VALUES ('7d339fa0-e736-4fd4-8ff3-c23b6ee92602', '2022-09-22 00:07:00.757', '2022-09-22 00:07:00.757', 0, 'hotel1661439462808-7.jpg', 'melia-vinpearl-condotel-riverfront-da-nangho-8x27ckxsg7', 'Melia Vinpearl Condotel Riverfront Da Nang', 'HOTEL', '4a7638d6-9beb-4a91-b4f3-f9aa80a3fe59');
INSERT INTO "public"."favorite" VALUES ('9e75656d-02b7-479c-a582-6059d3b1dfee', '2022-09-22 00:07:03.575', '2022-09-22 00:07:03.575', 0, 'hotel1660728895475-10.jpg', 'sofitel-legend-metropole-ha-noiho-novq5d8r5c', 'Sofitel Legend Metropole Hà Nội', 'HOTEL', '4a7638d6-9beb-4a91-b4f3-f9aa80a3fe59');
INSERT INTO "public"."favorite" VALUES ('8365a550-b3f3-409e-91fd-abd979870239', '2022-09-22 00:07:06.8', '2022-09-22 00:07:06.8', 0, 'hotel1660728630010-18.jpg', 'jw-marriott-hotel-hanoiho-v4qn23gqw5', 'JW Marriott Hotel Hanoi', 'HOTEL', '4a7638d6-9beb-4a91-b4f3-f9aa80a3fe59');
INSERT INTO "public"."favorite" VALUES ('16917190-1c2a-45b3-914d-cb4958f1651a', '2022-09-22 00:07:07.684', '2022-09-22 00:07:07.684', 0, 'hotel1660728437027-2.jpg', 'intercontinental-hanoi-westlakeho-izeiavcjhb', 'InterContinental Hanoi Westlake', 'HOTEL', '4a7638d6-9beb-4a91-b4f3-f9aa80a3fe59');
INSERT INTO "public"."favorite" VALUES ('a8f2409a-a428-4ee9-9c33-575172cbfc86', '2022-09-22 00:07:11.294', '2022-09-22 00:07:11.294', 0, 'restaurant1663388001826-6.jpg', 'chai-talay---xa-anre-apltxff3md', 'Chai Talay - Xã Đàn', 'RESTAURANT', '4a7638d6-9beb-4a91-b4f3-f9aa80a3fe59');
INSERT INTO "public"."favorite" VALUES ('7a276770-7da1-49a4-8bde-40585c4d6137', '2022-09-22 00:07:12.484', '2022-09-22 00:07:12.484', 0, 'restaurant1663387817002-0.jpg', 'tao-li-canting---ly-thuong-kietre-34gfxmpfo4', 'Tao Li Canting - Lý Thường Kiệt', 'RESTAURANT', '4a7638d6-9beb-4a91-b4f3-f9aa80a3fe59');
INSERT INTO "public"."favorite" VALUES ('7a11fda4-852d-42c1-8903-6577ff140c09', '2022-09-22 00:07:13.46', '2022-09-22 00:07:13.46', 0, 'restaurant1663387564118-1.jpg', 'kien-o-akaari-premium---ngoai-giao-oanre-20u5wfzhzl', 'Kiến Đỏ Akaari Premium - Ngọai Giao Đoàn', 'RESTAURANT', '4a7638d6-9beb-4a91-b4f3-f9aa80a3fe59');
INSERT INTO "public"."favorite" VALUES ('ca573233-fba8-49a2-9738-87b296e39281', '2022-09-22 00:07:28.955', '2022-09-22 00:07:28.955', 0, 'activities1663390422130-0.jpg', 'vincom-pham-ngoc-thach-playtimeac-8tqg1wqtod', 'Vincom Phạm Ngọc Thạch Playtime', 'ACTIVITIES', '4a7638d6-9beb-4a91-b4f3-f9aa80a3fe59');
INSERT INTO "public"."favorite" VALUES ('b694eca1-b639-4912-859b-f74e6c7af86c', '2022-09-22 00:07:21.213', '2022-09-22 00:07:21.213', 0, 'restaurant1663386907730-4.jpg', '-de-re-song-duong---han-thuyenre-fgsd7daeii', ' Dê Ré Song Dương - Hàn Thuyên', 'RESTAURANT', '4a7638d6-9beb-4a91-b4f3-f9aa80a3fe59');
INSERT INTO "public"."favorite" VALUES ('fa5a761c-ed1a-4265-b044-6271b90af65d', '2022-09-22 00:07:28.299', '2022-09-22 00:07:28.299', 0, 'activities1663390499615-0.jpg', 'tttm-vincom-metropolis--khu-vui-choi-play-n-learnac-vszb81u1og', 'TTTM Vincom Metropolis – Khu vui chơi Play ‘N’ Learn', 'ACTIVITIES', '4a7638d6-9beb-4a91-b4f3-f9aa80a3fe59');
INSERT INTO "public"."favorite" VALUES ('5a38358e-1c1c-48f3-a1f0-c98d54c7638c', '2022-09-22 00:07:26.347', '2022-09-22 00:07:26.347', 0, 'activities1663390571662-0.jpg', '-kolorado--khu-vui-choi-trong-nha-cho-tre-o-ha-noiac-uorr5mcsvh', ' Kolorado – Khu vui chơi trong nhà cho trẻ ở Hà Nội', 'ACTIVITIES', '4a7638d6-9beb-4a91-b4f3-f9aa80a3fe59');
INSERT INTO "public"."favorite" VALUES ('2dc651a1-3474-4cc3-8d4b-3f62776e4fc3', '2022-09-22 00:07:32.629', '2022-09-22 00:07:32.629', 0, 'activities1663390256853-1.jpg', 'vinke--vinpearl-aquarium-times-cityac-hvk8wm73xy', 'VinKE & Vinpearl Aquarium Times City', 'ACTIVITIES', '4a7638d6-9beb-4a91-b4f3-f9aa80a3fe59');

-- ----------------------------
-- Table structure for favorite_hotel
-- ----------------------------
DROP TABLE IF EXISTS "public"."favorite_hotel";
CREATE TABLE "public"."favorite_hotel" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6),
  "updated_at" timestamp(6),
  "version" int4 NOT NULL,
  "hotel_data" jsonb,
  "product_code" varchar(255) COLLATE "pg_catalog"."default",
  "slug" varchar(255) COLLATE "pg_catalog"."default",
  "user_id" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of favorite_hotel
-- ----------------------------

-- ----------------------------
-- Table structure for feature
-- ----------------------------
DROP TABLE IF EXISTS "public"."feature";
CREATE TABLE "public"."feature" (
  "id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "name" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of feature
-- ----------------------------
INSERT INTO "public"."feature" VALUES (1, 'Giao Hàng');
INSERT INTO "public"."feature" VALUES (2, 'Cửa hàng bán thức ăn mang về');
INSERT INTO "public"."feature" VALUES (3, 'Đặt chỗ');
INSERT INTO "public"."feature" VALUES (4, 'Phục vụ tại phòng');
INSERT INTO "public"."feature" VALUES (5, 'Giao H?ng');
INSERT INTO "public"."feature" VALUES (6, 'C?a H?ng B?n Th?c ?n Mang V?');
INSERT INTO "public"."feature" VALUES (7, '??t Ch?');
INSERT INTO "public"."feature" VALUES (8, 'D?ch V? B?n');

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS "public"."hotel";
CREATE TABLE "public"."hotel" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6),
  "updated_at" timestamp(6),
  "version" int4 NOT NULL,
  "address" varchar(255) COLLATE "pg_catalog"."default",
  "amenities" int4[],
  "approve_status" varchar(255) COLLATE "pg_catalog"."default",
  "code" varchar(255) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "hotel_type" varchar(255) COLLATE "pg_catalog"."default",
  "min_price" float8,
  "rank" int4,
  "slug" varchar(1000) COLLATE "pg_catalog"."default",
  "star" float8,
  "title" varchar(1000) COLLATE "pg_catalog"."default",
  "user_id" varchar(255) COLLATE "pg_catalog"."default",
  "ts_search" tsvector
)
;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO "public"."hotel" VALUES ('c6501760-8b58-4e6a-9c7e-0eabe56df3f6', '2022-08-17 16:22:55.264', '2022-08-17 16:37:09.156', 2, '117 Trần Duy Hưng, Cầu Giấy, Hanoi, Vietnam.', '{1,2,4,3,5,6}', 'APPROVED', 'HO-UZRWI13SEG', 'Khách sạn Grand Plaza Hà Nội ở trung tâm Hà Nội, cách Nhà hát Lớn Hà Nội và Bộ Khoa học và Công nghệ 10 phút lái xe. Khách sạn 5 sao này cách Bảo tàng Hồ Chí Minh 3,5 mi (5,7 km) và Văn Miếu 3,7 mi (6 km). Hãy nghỉ ngơi thoải mái như đang ở nhà mình tại một trong 618 phòng được trang bị máy điều hòa cùng minibar và TV LCD. Truy cập Internet không dây miễn phí giúp quý vị luôn giữ liên lạc; trong khi các chương trình truyền hình vệ tinh sẽ mang đến những phút giây giải trí thoải mái. Phòng tắm riêng với vòi sen/bồn tắm kết hợp có máy sấy tóc và áo choàng tắm. Tiện nghi phòng bao gồm điện thoại, cùng két bảo mật và bàn. Có nhiều dịch vụ, tiện ích dành cho khách, bao gồm trung tâm dịch vụ văn phòng, báo miễn phí ở sảnh và dịch vụ giặt ủi/giặt khô. Xe đưa đón sân bay phục vụ miễn phí vào thời gian đã lên lịch.', 'POPULAR', 2000000, 4, 'grand-plaza-ha-noi-hotelho-uzrwi13seg', 5, 'Grand plaza ha noi hotel', '44854ec8-d083-402e-b534-afec7687dfe7', '''10'':30 ''117'':191 ''3'':45,54 ''5'':36,46,48 ''6'':57 ''618'':72 ''7'':49,55 ''áo'':132 ''ban'':147 ''bao'':40,138,144,157 ''bay'':180 ''báo'':165 ''bi'':76 ''bo'':24 ''cac'':101 ''cach'':17,39 ''cap'':86 ''cau'':195 ''chi'':43 ''cho'':155 ''choàng'':133 ''chuong'':102 ''co'':127,148 ''cong'':28 ''cung'':80,142 ''da'':188 ''dang'':65 ''danh'':154 ''day'':89 ''den'':110 ''dich'':150,161,171 ''dien'':140 ''dieu'':78 ''dua'':177 ''duoc'':74 ''duy'':193 ''giai'':114 ''gian'':187 ''giat'':173 ''giay'':113,196 ''giu'':96 ''giup'':92 ''gom'':139,158 ''grand'':1,8 ''ha'':3,10,15,21 ''hanoi'':197 ''hat'':19 ''hay'':59 ''hinh'':105 ''ho'':42 ''hoa'':79 ''hoc'':26 ''hop'':126 ''hotel'':5 ''hung'':194 ''ich'':153 ''internet'':87 ''ket'':125,143 ''khach'':6,156 ''khách'':34 ''khi'':100 ''kho'':175 ''khoa'':25 ''khong'':88 ''km'':50,58 ''lac'':98 ''lai'':32 ''lcd'':84 ''len'':189 ''lich'':190 ''lien'':97 ''lon'':20 ''luon'':95 ''mai'':63,117 ''mang'':109 ''mat'':145 ''may'':77,128 ''mi'':47,56 ''mien'':90,183 ''mieu'':53 ''miẽn'':166 ''minh'':44,68 ''minibar'':81 ''mot'':70 ''nay'':38 ''nghe'':29 ''nghi'':60,136 ''ngoi'':61 ''nha'':18,67 ''nhieu'':149 ''nhu'':64 ''nhung'':111 ''noi'':4,11,16,22 ''o'':12,66 ''ỏ'':168 ''phi'':91,184 ''phí'':167 ''phong'':73,118,137,164 ''phuc'':181 ''phut'':31,112 ''plaza'':2,9 ''quy'':93 ''rieng'':120 ''san'':7,179 ''sao'':37 ''say'':129 ''sảnh'':169 ''sạn'':35 ''sen/bon'':123 ''sẽ'':108 ''tai'':69 ''tam'':14,119,124,160 ''tang'':41 ''tám'':134 ''thoai'':62,116,141 ''thoi'':186 ''tien'':135,152 ''tinh'':107 ''toc'':130 ''tran'':192 ''trang'':75 ''tri'':115 ''trinh'':103 ''trong'':71,99 ''trung'':13,159 ''truy'':85 ''truyen'':104 ''tv'':83 ''ui/giat'':174 ''va'':23,27,51,82,131,146,170 ''van'':52,163 ''vao'':185 ''ve'':106 ''vi'':94 ''vietnam'':198 ''voi'':121,122 ''vu'':151,162,172,182 ''xe'':33,176');
INSERT INTO "public"."hotel" VALUES ('f7ab0ab0-9883-4f64-8e29-0e4f69263457', '2022-08-17 16:30:30.019', '2022-08-17 16:37:05.893', 2, '8 Do Duc Duc , Ha Noi', '{2,3,4,6}', 'APPROVED', 'HO-V4QN23GQW5', 'JW Marriott Hotel Hanoi ở trung tâm Hà Nội, cách Bảo tàng Hà Nội và Trung tâm Hội nghị Quốc gia Việt Nam 10 phút đi bộ. Khách sạn 5 sao này cách Văn Miếu 4,9 mi (7,8 km) và Hoàng thành Thăng Long 5,1 mi (8,3 km). Hãy nghỉ ngơi thoải mái như đang ở nhà mình tại một trong 450 phòng được trang bị máy điều hòa cùng tủ lạnh và TV LCD. Phòng của quý vị được trang bị giường nệm có lớp đệm bông. Các chương trình truyền hình cáp và iPod dock sẽ giúp quý vị có những giây phút giải trí thoải mái; song song đó, truy cập Internet tốc độ cao (có dây) miễn phí giúp quý vị luôn kết nối. Phòng tắm riêng với bồn tắm và buồng tắm vòi sen riêng được trang bị bồn tắm và vòi sen phun mưa. Có nhiều dịch vụ, tiện ích dành cho khách, bao gồm truy cập Internet tốc độ cao (có dây) miễn phí, trung tâm dịch vụ văn phòng và dịch vụ xe limo/xe đưa đón hạng sang. Khách sạn này có 17 phòng họp để phục vụ các chương trình hội thảo, sự kiện. Xe đưa đón sân bay phục vụ 24 giờ với phụ phí, bên cạnh đó cũng có bãi đậu xe tự phục vụ miễn phí trong khuôn viên.', 'POPULAR', 4000000, 4, 'jw-marriott-hotel-hanoiho-v4qn23gqw5', 5, 'JW Marriott Hotel Hanoi', '44854ec8-d083-402e-b534-afec7687dfe7', '''1'':52 ''10'':28 ''17'':199 ''24'':219 ''3'':55 ''4'':40 ''450'':70 ''5'':34,51 ''7'':43 ''8'':44,54,240 ''9'':41 ''bai'':229 ''bao'':15,168 ''bay'':216 ''ben'':224 ''bi'':74,90,151 ''bo'':31 ''bon'':141,152 ''bong'':96 ''buong'':144 ''cac'':97,205 ''cach'':14,37 ''canh'':225 ''cao'':126,175 ''cap'':102,122,171 ''cho'':166 ''chuong'':98,206 ''co'':93,110,127,159,176,198,228 ''cua'':85 ''cung'':78,227 ''dang'':63 ''danh'':165 ''dau'':230 ''day'':128,177 ''dem'':95 ''di'':30 ''dich'':161,182,187 ''dieu'':76 ''dock'':105 ''dua'':191,213 ''duc'':242,243 ''duoc'':72,88,149 ''dể'':202 ''gia'':25 ''giai'':114 ''giay'':112 ''gio'':220 ''giuong'':91 ''giup'':107,131 ''gom'':169 ''ha'':12,17,244 ''hang'':193 ''hanoi'':4,8 ''hay'':57 ''hinh'':101 ''hoa'':77 ''hoang'':47 ''hoi'':22,208 ''hop'':201 ''hotel'':3,7 ''ich'':164 ''internet'':123,172 ''ipod'':104 ''jw'':1,5 ''ket'':135 ''khach'':167 ''khách'':32,195 ''khuon'':238 ''kien'':211 ''km'':45,56 ''lanh'':80 ''lcd'':83 ''limo/xe'':190 ''long'':50 ''lop'':94 ''luon'':134 ''mai'':61,117 ''marriott'':2,6 ''may'':75 ''mi'':42,53 ''mien'':129,178,235 ''mieu'':39 ''minh'':66 ''mot'':68 ''mua'':158 ''nam'':27 ''nay'':36,197 ''nem'':92 ''nghi'':23,58 ''ngoi'':59 ''nha'':65 ''nhieu'':160 ''nhu'':62 ''nhung'':111 ''noi'':13,18,136,245 ''o'':9,64 ''phi'':130,179,223,236 ''phong'':71,84,137,185,200 ''phu'':222 ''phuc'':203,217,233 ''phun'':157 ''phut'':29,113 ''quoc'':24 ''quy'':86,108,132 ''rieng'':139,148 ''san'':215 ''sang'':194 ''sao'':35 ''sạn'':33,196 ''sen'':147,156 ''song'':118,119 ''su'':210 ''sẽ'':106 ''tai'':67 ''tam'':11,21,138,142,145,153,181 ''tang'':16 ''thang'':49 ''thanh'':48 ''thao'':209 ''thoai'':60,116 ''tien'':163 ''toc'':124,173 ''trang'':73,89,150 ''tri'':115 ''trinh'':99,207 ''trong'':69,237 ''trung'':10,20,180 ''truy'':121,170 ''truyen'':100 ''tu'':79,232 ''tv'':82 ''va'':19,46,81,103,143,154,186 ''van'':38,184 ''vi'':87,109,133 ''vien'':239 ''viet'':26 ''voi'':140,146,155,221 ''vu'':162,183,188,204,218,234 ''xe'':189,212,231');
INSERT INTO "public"."hotel" VALUES ('f1916030-2a30-4115-9726-10605fb48abe', '2022-08-17 16:27:17.085', '2022-08-17 16:37:07.503', 2, '5 Tu Hoa, Hanoi, Vietnam', '{1,5}', 'APPROVED', 'HO-IZEIAVCJHB', 'InterContinental Hanoi Westlake ở trung tâm Hà Nội, chỉ cách Trung tâm Mua sắm Syrena và Đền Quán Thánh 5 phút lái xe. Khách sạn 5 sao này cách Hoàng thành Thăng Long 2,6 mi (4,2 km) và Bảo tàng Hồ Chí Minh 2,7 mi (4,4 km). Hãy nghỉ ngơi thoải mái như đang ở nhà mình tại một trong 318 phòng được trang bị máy điều hòa cùng minibar và TV LCD. Phòng của quý vị được trang bị giường nệm Select Comfort. Các phòng có ban công riêng. Truy cập internet có dây và không dây miễn phí giúp quý vị luôn kết nối; và kênh truyền hình cao cấp sẽ mang đến những giây phút giải trí thoải mái. Phòng tắm riêng có bồn tắm và vòi sen phun mưa. Có nhiều dịch vụ, tiện ích dành cho khách, bao gồm trung tâm dịch vụ văn phòng, dịch vụ xe limo/xe đưa đón hạng sang và nhận phòng nhanh. Xe đưa đón sân bay phục vụ 24 giờ với phụ phí, bên cạnh đó cũng có bãi đậu xe tự phục vụ miễn phí trong khuôn viên.', 'POPULAR', 2300000, 4, 'intercontinental-hanoi-westlakeho-izeiavcjhb', 4, 'InterContinental Hanoi Westlake', '44854ec8-d083-402e-b534-afec7687dfe7', '''2'':37,41,49 ''24'':177 ''318'':68 ''4'':40,52,53 ''5'':23,29,198 ''6'':38 ''7'':50 ''bai'':187 ''ban'':95 ''bao'':44,150 ''bay'':174 ''ben'':182 ''bi'':72,87 ''bon'':134 ''cac'':92 ''cach'':13,32 ''canh'':183 ''cao'':118 ''cap'':99,119 ''chi'':12,47 ''cho'':148 ''co'':94,101,133,141,186 ''comfort'':91 ''cong'':96 ''cua'':82 ''cung'':76,185 ''dang'':61 ''danh'':147 ''dau'':188 ''day'':102,105 ''den'':20,122 ''dich'':143,154,158 ''dieu'':74 ''dua'':162,171 ''duoc'':70,85 ''giai'':126 ''giay'':124 ''gio'':178 ''giuong'':88 ''giup'':108 ''gom'':151 ''ha'':10 ''hang'':164 ''hanoi'':2,5,201 ''hay'':55 ''hinh'':117 ''ho'':46 ''hoa'':75,200 ''hoang'':33 ''ich'':146 ''intercontinent'':1,4 ''internet'':100 ''kenh'':115 ''ket'':112 ''khach'':149 ''khách'':27 ''khong'':104 ''khuon'':196 ''km'':42,54 ''lai'':25 ''lcd'':80 ''limo/xe'':161 ''long'':36 ''luon'':111 ''mai'':59,129 ''mang'':121 ''may'':73 ''mi'':39,51 ''mien'':106,193 ''minh'':48,64 ''minibar'':77 ''mot'':66 ''mua'':16,140 ''nay'':31 ''nem'':89 ''nghi'':56 ''ngoi'':57 ''nha'':63 ''nhan'':167 ''nhanh'':169 ''nhieu'':142 ''nhu'':60 ''nhung'':123 ''noi'':11,113 ''o'':7,62 ''phi'':107,181,194 ''phong'':69,81,93,130,157,168 ''phu'':180 ''phuc'':175,191 ''phun'':139 ''phut'':24,125 ''quan'':21 ''quy'':83,109 ''rieng'':97,132 ''sam'':17 ''san'':173 ''sang'':165 ''sao'':30 ''sạn'':28 ''select'':90 ''sen'':138 ''syrena'':18 ''sẽ'':120 ''tai'':65 ''tam'':9,15,131,135,153 ''tang'':45 ''thang'':35 ''thanh'':22,34 ''thoai'':58,128 ''tien'':145 ''trang'':71,86 ''tri'':127 ''trong'':67,195 ''trung'':8,14,152 ''truy'':98 ''truyen'':116 ''tu'':190,199 ''tv'':79 ''va'':19,43,78,103,114,136,166 ''van'':156 ''vi'':84,110 ''vien'':197 ''vietnam'':202 ''voi'':137,179 ''vu'':144,155,159,176,192 ''westlak'':3,6 ''xe'':26,160,170,189');
INSERT INTO "public"."hotel" VALUES ('31d13987-89a4-4a7f-9a01-237f879a0140', '2022-08-17 16:34:55.505', '2022-08-17 16:37:03.793', 3, '15 Ngo Quyen Street, Hoan Kiem District, Hanoi, Vietnam', '{1,5}', 'APPROVED', 'HO-NOVQ5D8R5C', 'Tọa lạc tại trung tâm Hà Nội, Sofitel Legend Metropole Hà Nội cách Hồ Hoàn Kiếm và Nhà hát Lớn Hà Nội 5 phút đi bộ. Khách sạn 5 sao này cách Đền Ngọc Sơn 0,6 mi (0,9 km) và cách Nhà hát Múa rối Nước Thăng Long 0,6 mi (1 km). Hãy tự thưởng cho mình những ngày nghỉ tại một trong 364 phòng được trang bị lò sưởi và TV LCD. Giường nệm có lớp đệm bông đi cùng chăn bông và bộ đồ giường cao cấp. Khách có thể truy cập internet có dây hoặc không dây miễn phí hay giải trí cùng đầu đĩa DVD và các chương trình truyền hình vệ tinh. Tiện nghi phòng bao gồm điện thoại, cùng két bảo mật đặt được máy tính xách tay và bàn. Có nhiều dịch vụ, tiện ích dành cho khách, bao gồm truy cập Internet tốc độ cao (có dây) miễn phí, trung tâm dịch vụ văn phòng và dịch vụ xe limo/xe đưa đón hạng sang. Xe đưa đón sân bay phục vụ 24 giờ với phụ phí.', 'POPULAR', 5000000, 4, 'sofitel-legend-metropole-ha-noiho-novq5d8r5c', 4, 'Sofitel Legend Metropole Hà Nội', '44854ec8-d083-402e-b534-afec7687dfe7', '''0'':41,44,56 ''1'':59 ''15'':193 ''24'':188 ''364'':72 ''5'':28,34 ''6'':42,57 ''9'':45 ''ban'':144 ''bao'':129,135,154 ''bay'':185 ''bi'':76 ''bo'':31,93 ''bong'':87,91 ''cac'':119 ''cach'':18,37,48 ''cao'':96,161 ''cap'':102,157 ''cáp'':97 ''chan'':90 ''cho'':64,152 ''chuong'':120 ''co'':84,99,104,145,162 ''cung'':89,114,133 ''danh'':151 ''dat'':137 ''dau'':115 ''day'':105,108,163 ''dem'':86 ''den'':38 ''di'':30,88 ''dia'':116 ''dich'':147,168,173 ''dien'':131 ''district'':199 ''dò'':94 ''dua'':177,182 ''duoc'':74,138 ''dvd'':117 ''giai'':112 ''gio'':189 ''giuong'':82 ''giuòng'':95 ''gom'':130,155 ''ha'':4,11,16,26 ''hang'':179 ''hanoi'':200 ''hat'':24,50 ''hay'':61,111 ''hinh'':123 ''ho'':19 ''hoac'':106 ''hoan'':20,197 ''ich'':150 ''internet'':103,158 ''ket'':134 ''khach'':98,153 ''khách'':32 ''khong'':107 ''kiem'':21,198 ''km'':46,60 ''lac'':7 ''lcd'':81 ''legend'':2,14 ''limo/xe'':176 ''lo'':77 ''lon'':25 ''long'':55 ''lop'':85 ''mat'':136 ''may'':139 ''metropol'':3,15 ''mi'':43,58 ''mien'':109,164 ''minh'':65 ''mot'':70 ''mua'':51 ''nay'':36 ''nem'':83 ''ngay'':67 ''nghi'':68,127 ''ngo'':194 ''ngoc'':39 ''nha'':23,49 ''nhieu'':146 ''nhung'':66 ''noi'':5,12,17,27 ''nuoc'':53 ''phi'':110,165,192 ''phong'':73,128,171 ''phu'':191 ''phuc'':186 ''phut'':29 ''quyen'':195 ''roi'':52 ''san'':184 ''sang'':180 ''sao'':35 ''sạn'':33 ''sofitel'':1,13 ''son'':40 ''street'':196 ''suoi'':78 ''tai'':8,69 ''tam'':10,167 ''tay'':142 ''thang'':54 ''thoai'':132 ''thuong'':63 ''thể'':100 ''tien'':126,149 ''tinh'':125,140 ''toa'':6 ''toc'':159 ''trang'':75 ''tri'':113 ''trinh'':121 ''trong'':71 ''trung'':9,166 ''truy'':101,156 ''truyen'':122 ''tu'':62 ''tv'':80 ''va'':22,47,79,92,118,143,172 ''van'':170 ''ve'':124 ''vietnam'':201 ''voi'':190 ''vu'':148,169,174,187 ''xach'':141 ''xe'':175,181');
INSERT INTO "public"."hotel" VALUES ('15969be0-1c8c-4aa9-8cd9-a4bf02204a59', '2022-08-25 22:06:15.269', '2022-08-25 23:54:20.881', 2, '323 Trần Hưng Đạo, Da Nang, Vietnam', '{3,5,6}', 'APPROVED', 'HO-B5KNZ2SM9Q', 'Khách sạn Salem Riverside ở Sơn Trà, Đà Nẵng, cách Bãi biển Mỹ Khê và Sông Hàn 5 phút lái xe. Khách sạn spa này cách Cầu sông Hàn 0,4 mi (0,7 km) và cách Ngũ Hành Sơn 5,8 mi (9,4 km). Hãy nghỉ ngơi thoải mái như đang ở nhà mình tại một trong 60 phòng được trang bị máy điều hòa cùng minibar và TV màn hình phẳng. Truy cập Internet không dây miễn phí giúp quý vị luôn giữ liên lạc; trong khi các chương trình truyền hình cáp sẽ mang đến những phút giây giải trí thoải mái. Phòng tắm riêng với bồn tắm hoặc buồng tắm vòi sen có đồ dùng nhà tắm miễn phí và máy sấy tóc. Tiện nghi phòng bao gồm bàn và nước đóng chai miễn phí; bên cạnh đó dịch vụ dọn phòng cũng phục vụ hàng ngày. Có nhiều dịch vụ, tiện ích dành cho khách, bao gồm trung tâm dịch vụ văn phòng, báo miễn phí ở sảnh và dịch vụ giặt ủi/giặt khô. Xe đưa đón sân bay phục vụ theo yêu cầu với phụ phí, bên cạnh đó cũng có bãi đậu xe tự phục vụ miễn phí trong khuôn viên.', 'POPULAR', 700000, 4, '-salem-riversideho-b5knz2sm9q', 3, ' Salem Riverside', '44854ec8-d083-402e-b534-afec7687dfe7', '''0'':32,35 ''323'':212 ''4'':33,47 ''5'':20,43 ''60'':62 ''7'':36 ''8'':44 ''9'':46 ''bai'':13,201 ''ban'':136 ''bao'':134,164 ''bay'':187 ''báo'':172 ''ben'':143,196 ''bi'':66 ''biển'':14 ''bon'':113 ''buong'':116 ''cac'':93 ''cach'':12,28,39 ''canh'':144,197 ''cap'':78,98 ''cau'':29,192 ''chai'':140 ''cho'':162 ''chuong'':94 ''co'':120,155,200 ''cung'':70,150,199 ''da'':10,216 ''dang'':55 ''danh'':161 ''dao'':215 ''dau'':202 ''day'':81 ''den'':101 ''dich'':146,157,168,178 ''dieu'':68 ''dong'':139 ''dò'':121 ''dua'':184 ''dung'':122 ''duoc'':64 ''giai'':105 ''giat'':180 ''giay'':104 ''giu'':88 ''giup'':84 ''gom'':135,165 ''han'':19,31 ''hang'':153 ''hanh'':41 ''hay'':49 ''hinh'':75,97 ''hoa'':69 ''hoac'':115 ''hung'':214 ''ich'':160 ''internet'':79 ''khach'':3,163 ''khách'':24 ''khe'':16 ''khi'':92 ''kho'':182 ''khong'':80 ''khuon'':210 ''km'':37,48 ''lac'':90 ''lai'':22 ''lien'':89 ''luon'':87 ''mai'':53,108 ''man'':74 ''mang'':100 ''may'':67,128 ''mi'':34,45 ''mien'':82,141,207 ''miẽn'':125,173 ''minh'':58 ''minibar'':71 ''mot'':60 ''mỹ'':15 ''nang'':11,217 ''nay'':27 ''ngay'':154 ''nghi'':50,132 ''ngoi'':51 ''ngu'':40 ''nha'':57 ''nhà'':123 ''nhieu'':156 ''nhu'':54 ''nhung'':102 ''nuoc'':138 ''o'':7,56 ''ỏ'':175 ''phang'':76 ''phi'':83,142,195,208 ''phí'':126,174 ''phong'':63,109,133,149,171 ''phu'':194 ''phuc'':151,188,205 ''phut'':21,103 ''quy'':85 ''rieng'':111 ''riversid'':2,6 ''salem'':1,5 ''san'':4,186 ''say'':129 ''sảnh'':176 ''sạn'':25 ''sen'':119 ''son'':8,42 ''song'':18,30 ''spa'':26 ''sẽ'':99 ''tai'':59 ''tam'':110,114,117,167 ''tám'':124 ''theo'':190 ''thoai'':52,107 ''tien'':131,159 ''toc'':130 ''tra'':9 ''tran'':213 ''trang'':65 ''tri'':106 ''trinh'':95 ''trong'':61,91,209 ''trung'':166 ''truy'':77 ''truyen'':96 ''tu'':204 ''tv'':73 ''ui/giat'':181 ''va'':17,38,72,127,137,177 ''van'':170 ''vi'':86 ''vien'':211 ''vietnam'':218 ''voi'':112,118,193 ''vu'':147,152,158,169,179,189,206 ''xe'':23,183,203 ''yeu'':191');
INSERT INTO "public"."hotel" VALUES ('09a34ab8-4399-4ef9-afdf-e810bb3d134f', '2022-08-25 21:57:42.835', '2022-08-25 23:54:24.027', 2, '341 Trần Hưng Đạo, Sơn Trà, An Hải Bắc, Sơn Trà, Đà Nẵng, Việt Nam', '{}', 'APPROVED', 'HO-8X27CKXSG7', 'Tọa lạc tại trung tâm Đà Nẵng, Vinpearl Condotel Riverfront Danang cách Sông Hàn 5 phút đi bộ và cách Cầu sông Hàn 6 minutes phút đi bộ. Khách sạn 5 sao này cách Cầu Rồng 1,2 mi (1,9 km) và cách Chợ Hàn 1,5 mi (2,5 km). Hãy nghỉ ngơi thoải mái như đang ở nhà mình tại một trong 864 phòng được trang bị máy điều hòa cùng minibar và TV LCD. Các phòng có ban công riêng. Truy cập Internet không dây miễn phí giúp quý vị luôn giữ liên lạc; trong khi các chương trình truyền hình cáp sẽ mang đến những phút giây giải trí thoải mái. Phòng tắm riêng có đồ dùng nhà tắm được thiết kế riêng và chậu vệ sinh. Có nhiều dịch vụ, tiện ích dành cho khách, bao gồm trung tâm dịch vụ văn phòng phục vụ 24 giờ, dịch vụ giặt ủi/giặt khô và quầy tiếp tân phục vụ 24 giờ/ngày. Khách sạn này có 2 phòng họp để phục vụ các chương trình hội thảo, sự kiện. Xe đưa đón sân bay phục vụ 24 giờ với phụ phí, bên cạnh đó cũng có bãi đậu xe tự phục vụ miễn phí trong khuôn viên.', 'POPULAR', 1000000, 4, 'melia-vinpearl-condotel-riverfront-da-nangho-8x27ckxsg7', 4, 'Melia Vinpearl Condotel Riverfront Da Nang', '44854ec8-d083-402e-b534-afec7687dfe7', '''1'':43,46,53 ''2'':44,56,177 ''24'':158,171,197 ''341'':218 ''5'':21,37,54,57 ''6'':30 ''864'':72 ''9'':47 ''bac'':226 ''bai'':207 ''ban'':88 ''bao'':148 ''bay'':194 ''ben'':202 ''bi'':76 ''bo'':24,34 ''cac'':85,107,183 ''cach'':18,26,40,50 ''canh'':203 ''cap'':92,112 ''cau'':27,41 ''chau'':136 ''cho'':51,146 ''chuong'':108,184 ''co'':87,126,139,176,206 ''condotel'':3,15 ''cong'':89 ''cung'':80,205 ''da'':5,12,229 ''danang'':17 ''dang'':65 ''danh'':145 ''dao'':221 ''dau'':208 ''day'':95 ''den'':115 ''di'':23,33 ''dich'':141,152,160 ''dieu'':78 ''dua'':191 ''dung'':128 ''duoc'':74,131 ''dể'':180 ''giai'':119 ''giat'':162 ''giay'':118 ''gio'':159,198 ''gio/ngay'':172 ''giu'':102 ''giup'':98 ''gom'':149 ''hai'':225 ''han'':20,29,52 ''hay'':59 ''hinh'':111 ''hoa'':79 ''hoi'':186 ''hop'':179 ''hung'':220 ''ich'':144 ''internet'':93 ''ke'':133 ''khach'':147 ''khách'':35,173 ''khi'':106 ''kho'':164 ''khong'':94 ''khuon'':216 ''kien'':189 ''km'':48,58 ''lac'':8,104 ''lcd'':84 ''lien'':103 ''luon'':101 ''mai'':63,122 ''mang'':114 ''may'':77 ''melia'':1 ''mi'':45,55 ''mien'':96,213 ''minh'':68 ''minibar'':81 ''minut'':31 ''mot'':70 ''nam'':232 ''nang'':6,13,230 ''nay'':39,175 ''nghi'':60 ''ngoi'':61 ''nha'':67,129 ''nhieu'':140 ''nhu'':64 ''nhung'':116 ''o'':66 ''phi'':97,201,214 ''phong'':73,86,123,155,178 ''phu'':200 ''phuc'':156,169,181,195,211 ''phut'':22,32,117 ''quay'':166 ''quy'':99 ''rieng'':90,125,134 ''riverfront'':4,16 ''rong'':42 ''san'':193 ''sao'':38 ''sạn'':36,174 ''sinh'':138 ''son'':222,227 ''song'':19,28 ''su'':188 ''sẽ'':113 ''tai'':9,69 ''tam'':11,124,130,151 ''tan'':168 ''thao'':187 ''thiet'':132 ''thoai'':62,121 ''tien'':143 ''tiep'':167 ''toa'':7 ''tra'':223,228 ''tran'':219 ''trang'':75 ''tri'':120 ''trinh'':109,185 ''trong'':71,105,215 ''trung'':10,150 ''truy'':91 ''truyen'':110 ''tu'':210 ''tv'':83 ''ui/giat'':163 ''va'':25,49,82,135,165 ''van'':154 ''ve'':137 ''vi'':100 ''vien'':217 ''viet'':231 ''vinpearl'':2,14 ''voi'':199 ''vu'':142,153,157,161,170,182,196,212 ''xe'':190,209');
INSERT INTO "public"."hotel" VALUES ('7a944a79-08ae-460d-bfa5-44b78f3c83cf', '2022-09-22 23:14:28.124', '2022-09-23 00:13:02.168', 2, 'Bãi Dài, Phú Quốc, Việt Nam', '{1,2,3,4,5,6}', 'APPROVED', 'HO-LF4YHY9LSJ', 'VinOasis Phú Quốc ở Phú Quốc, cách Dai Beach 5 phút đi bộ và cách Sân golf Vinpearl Phú Quốc5 phút đi bộ. Khách sạn 5 sao này cách VinWonders Phú Quốc 1,5 mi (2,4 km) và Bãi biển Vũng Bầu 2,7 mi (4,3 km). Hãy nghỉ ngơi thoải mái như đang ở nhà mình tại một trong 1378 phòng được trang bị máy điều hòa cùng minibar và TV LCD. Truy cập Internet không dây miễn phí giúp quý vị luôn giữ liên lạc; trong khi các chương trình truyền hình cáp sẽ mang đến những phút giây giải trí thoải mái. Phòng tắm riêng với bồn tắm và buồng tắm vòi sen riêng có đồ dùng nhà tắm miễn phí và máy sấy tóc. Tiện nghi phòng bao gồm điện thoại, cùng két bảo mật và bàn. Có nhiều dịch vụ, tiện ích dành cho khách, bao gồm trung tâm dịch vụ văn phòng, báo miễn phí ở sảnh và dịch vụ giặt ủi/giặt khô.', 'POPULAR', 1000000, 4, 'vinoasis-phu-quocho-lf4yhy9lsj', 5, 'VinOasis Phú Quốc', '81e13f19-29ac-411f-9c34-16ae8315ff84', '''1'':36 ''1378'':66 ''2'':39,47 ''3'':51 ''4'':40,50 ''5'':13,29,37 ''7'':48 ''bai'':43,175 ''ban'':146 ''bao'':137,143,156 ''bau'':46 ''báo'':164 ''beach'':12 ''bi'':70 ''biển'':44 ''bo'':16,26 ''bon'':115 ''buong'':118 ''cac'':95 ''cach'':10,18,32 ''cap'':80,100 ''cho'':154 ''chuong'':96 ''co'':123,147 ''cung'':74,141 ''dai'':11,176 ''dang'':59 ''danh'':153 ''day'':83 ''den'':103 ''di'':15,25 ''dich'':149,160,170 ''dien'':139 ''dieu'':72 ''dò'':124 ''dung'':125 ''duoc'':68 ''giai'':107 ''giat'':172 ''giay'':106 ''giu'':90 ''giup'':86 ''golf'':20 ''gom'':138,157 ''hay'':53 ''hinh'':99 ''hoa'':73 ''ich'':152 ''internet'':81 ''ket'':142 ''khach'':155 ''khách'':27 ''khi'':94 ''kho'':174 ''khong'':82 ''km'':41,52 ''lac'':92 ''lcd'':78 ''lien'':91 ''luon'':89 ''mai'':57,110 ''mang'':102 ''mat'':144 ''may'':71,131 ''mi'':38,49 ''mien'':84 ''miẽn'':128,165 ''minh'':62 ''minibar'':75 ''mot'':64 ''nam'':180 ''nay'':31 ''nghi'':54,135 ''ngoi'':55 ''nha'':61 ''nhà'':126 ''nhieu'':148 ''nhu'':58 ''nhung'':104 ''o'':7,60 ''ỏ'':167 ''phi'':85 ''phí'':129,166 ''phong'':67,111,136,163 ''phu'':2,5,8,22,34,177 ''phut'':14,24,105 ''quoc'':3,6,9,35,178 ''quoc5'':23 ''quy'':87 ''rieng'':113,122 ''san'':19 ''sao'':30 ''say'':132 ''sảnh'':168 ''sạn'':28 ''sen'':121 ''sẽ'':101 ''tai'':63 ''tam'':112,116,119,159 ''tám'':127 ''thoai'':56,109,140 ''tien'':134,151 ''toc'':133 ''trang'':69 ''tri'':108 ''trinh'':97 ''trong'':65,93 ''trung'':158 ''truy'':79 ''truyen'':98 ''tv'':77 ''ui/giat'':173 ''va'':17,42,76,117,130,145,169 ''van'':162 ''vi'':88 ''viet'':179 ''vinoasi'':1,4 ''vinpearl'':21 ''vinwond'':33 ''voi'':114,120 ''vu'':150,161,171 ''vung'':45');
INSERT INTO "public"."hotel" VALUES ('7e2d3f03-465a-400b-940c-dc63d4c46b0a', '2022-09-22 23:33:35.57', '2022-09-23 00:12:58.884', 3, 'Khu 1, KDL Đức Việt, Phu Quoc, Vietnam.', '{5,3,2,4}', 'APPROVED', 'HO-KDVTWE5HSY', 'SOL by Meliá Phú Quốc ở Phú Quốc, sát hồ, cách Walking Street Phu Quoc và Bãi biển Phú Quốc 5 phút lái xe. Khách sạn 5 sao này cách Bãi Sao 10,7 mi (17,2 km) và Suối Tranh 2,1 mi (3,4 km). Hãy nghỉ ngơi thoải mái như đang ở nhà mình tại một trong 284 phòng được trang bị máy điều hòa cùng tủ lạnh và TV LCD. Truy cập Internet không dây miễn phí giúp quý vị luôn giữ liên lạc; trong khi các chương trình truyền hình cáp sẽ mang đến những phút giây giải trí thoải mái. Phòng tắm riêng với buồng tắm vòi sen có đồ dùng nhà tắm miễn phí và máy sấy tóc. Tiện nghi phòng bao gồm điện thoại, cùng két bảo mật đặt được máy tính xách tay và minibar. Có nhiều dịch vụ, tiện ích dành cho khách, bao gồm trung tâm dịch vụ văn phòng, dịch vụ giặt ủi/giặt khô và quầy tiếp tân phục vụ 24 giờ/ngày. Xe đưa đón sân bay phục vụ miễn phí vào thời gian đã lên lịch.', 'POPULAR', 1000000, 4, 'sol-by-melia-phu-quocho-kdvtwe5hsy', 4, 'SOL by Meliá Phú Quốc', '81e13f19-29ac-411f-9c34-16ae8315ff84', '''1'':48,196 ''10'':38 ''17'':41 ''2'':42,47 ''24'':178 ''284'':66 ''3'':50 ''4'':51 ''5'':26,32 ''7'':39 ''bai'':22,36 ''bao'':134,140,159 ''bay'':184 ''bi'':70 ''biển'':23 ''buong'':116 ''cac'':96 ''cach'':16,35 ''cap'':81,101 ''cho'':157 ''chuong'':97 ''co'':120,150 ''cung'':74,138 ''da'':192 ''dang'':59 ''danh'':156 ''dat'':142 ''day'':84 ''den'':104 ''dich'':152,163,167 ''dien'':136 ''dieu'':72 ''dò'':121 ''dua'':181 ''duc'':198 ''dung'':122 ''duoc'':68,143 ''giai'':108 ''gian'':191 ''giat'':169 ''giay'':107 ''gio/ngay'':179 ''giu'':91 ''giup'':87 ''gom'':135,160 ''hay'':53 ''hinh'':100 ''ho'':15 ''hoa'':73 ''ich'':155 ''internet'':82 ''kdl'':197 ''ket'':139 ''khach'':158 ''khách'':30 ''khi'':95 ''kho'':171 ''khong'':83 ''khu'':195 ''km'':43,52 ''lac'':93 ''lai'':28 ''lanh'':76 ''lcd'':79 ''len'':193 ''lich'':194 ''lien'':92 ''luon'':90 ''mai'':57,111 ''mang'':103 ''mat'':141 ''may'':71,128,144 ''melia'':3,8 ''mi'':40,49 ''mien'':85,187 ''miẽn'':125 ''minh'':62 ''minibar'':149 ''mot'':64 ''nay'':34 ''nghi'':54,132 ''ngoi'':55 ''nha'':61 ''nhà'':123 ''nhieu'':151 ''nhu'':58 ''nhung'':105 ''o'':11,60 ''phi'':86,188 ''phí'':126 ''phong'':67,112,133,166 ''phu'':4,9,12,19,24,200 ''phuc'':176,185 ''phut'':27,106 ''quay'':173 ''quoc'':5,10,13,20,25,201 ''quy'':88 ''rieng'':114 ''san'':183 ''sao'':33,37 ''sat'':14 ''say'':129 ''sạn'':31 ''sen'':119 ''sol'':1,6 ''street'':18 ''suoi'':45 ''sẽ'':102 ''tai'':63 ''tam'':113,117,162 ''tan'':175 ''tay'':147 ''tám'':124 ''thoai'':56,110,137 ''thoi'':190 ''tien'':131,154 ''tiep'':174 ''tinh'':145 ''toc'':130 ''trang'':69 ''tranh'':46 ''tri'':109 ''trinh'':98 ''trong'':65,94 ''trung'':161 ''truy'':80 ''truyen'':99 ''tu'':75 ''tv'':78 ''ui/giat'':170 ''va'':21,44,77,127,148,172 ''van'':165 ''vao'':189 ''vi'':89 ''viet'':199 ''vietnam'':202 ''voi'':115,118 ''vu'':153,164,168,177,186 ''walk'':17 ''xach'':146 ''xe'':29,180');
INSERT INTO "public"."hotel" VALUES ('bb1d9c80-d31e-4ee3-add0-c0afcee03133', '2022-09-22 23:25:06.276', '2022-09-23 00:13:00.681', 3, 'Bãi Xếp, Thôn Ông Lang, Cửa Dương, xã Cửa Dương, Phú Quốc, Tỉnh Kiên Giang, Việt Nam', '{1,3,4,6}', 'APPROVED', 'HO-9YURVTKKMM', 'Chen Sea Resort & Spa là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.

Một trong những đặc điểm chính của khách sạn này là các liệu pháp spa đa dạng. Hãy nâng niu bản thân bằng các liệu pháp thư giãn, phục hồi giúp quý khách tươi trẻ thân, tâm.

Khi lưu trú tại nơi nghỉ thì nội thất và kiến trúc hẳn là hai yếu tố quan trọng khiến quý khách mãn nhãn. Với thiết kế độc đáo, Chen Sea Resort & Spa mang đến không gian lưu trú làm hài lòng quý khách.

Hãy tận hưởng thời gian vui vẻ cùng cả gia đình với hàng loạt tiện nghi giải trí tại Chen Sea Resort & Spa , một nơi nghỉ tuyệt vời phù hợp cho mọi kỳ nghỉ bên người thân.

Nếu dự định có một kỳ nghỉ dài, thì Chen Sea Resort & Spa chính là lựa chọn dành cho quý khách. Với đầy đủ tiện nghi với chất lượng dịch vụ tuyệt vời, Chen Sea Resort & Spa sẽ khiến quý khách cảm thấy thoải mái như đang ở nhà vậy.', 'POPULAR', 500000, 4, 'chen-sea-resort--spaho-9yurvtkkmm', 3, 'Chen Sea Resort & Spa', '81e13f19-29ac-411f-9c34-16ae8315ff84', '''ai'':17 ''bai'':234 ''ban'':46,86 ''bang'':88 ''ben'':181 ''ca'':155 ''cac'':77,89 ''cach'':40 ''cam'':225 ''chat'':211 ''chen'':1,5,132,166,193,217 ''chieu'':44 ''chinh'':71,197 ''cho'':15,177,202 ''chon'':11,200 ''chuong'':45 ''co'':187 ''cua'':32,59,72,239,242 ''cung'':38,154 ''da'':81 ''dac'':69 ''dai'':191 ''dang'':18,64,82,230 ''danh'':14,201 ''dao'':131 ''day'':26,37,206 ''den'':137 ''dich'':50,213 ''dinh'':157,186 ''diểm'':70 ''doc'':130 ''du'':185,207 ''duong'':240,243 ''dể'':41 ''gia'':13,156 ''giai'':163 ''gian'':93,139,151 ''giang'':248 ''giup'':96 ''hai'':117,143 ''han'':115 ''hang'':159 ''hay'':83,147 ''hoa'':25 ''hoi'':95 ''hop'':176 ''huong'':149 ''ke'':129 ''khach'':43,73,98,124,146,204,224 ''khi'':103 ''khien'':56,122,222 ''khong'':138 ''kiem'':20 ''kien'':113,247 ''kỳ'':30,57,179,189 ''la'':9,39,76,116,198 ''lam'':142 ''lang'':238 ''lieu'':78,90 ''loat'':160 ''long'':144 ''lua'':10,199 ''luong'':212 ''luu'':34,104,140 ''mai'':228 ''man'':125 ''mang'':136 ''minh'':33,60 ''moi'':178 ''mot'':21,66,170,188 ''nam'':250 ''nang'':84 ''nay'':75 ''nen'':62 ''neu'':184 ''nghi'':31,58,108,162,172,180,190,209 ''nghiem'':23 ''nguoi'':182 ''nha'':232 ''nhan'':126 ''nhat'':54 ''nho'':65 ''nhu'':229 ''nhung'':16,49,68 ''niu'':85 ''noi'':107,110,171 ''o'':231 ''ong'':237 ''phap'':79,91 ''phu'':175,244 ''phuc'':94 ''quan'':120 ''quoc'':245 ''quy'':42,97,123,145,203,223 ''resort'':3,7,134,168,195,219 ''sac'':53 ''san'':74 ''sang'':12 ''sea'':2,6,133,167,194,218 ''spa'':4,8,80,135,169,196,220 ''sẽ'':221 ''tai'':36,106,165 ''tam'':102 ''tan'':148 ''thay'':226 ''thi'':109,192 ''thiet'':128 ''thoai'':227 ''thoi'':150 ''thon'':236 ''thu'':27,92 ''tien'':161,208 ''tim'':19 ''tinh'':246 ''trai'':22 ''tri'':164 ''tro'':61 ''trong'':29,67,121 ''tru'':35,105,141 ''truc'':114 ''trẻ'':100 ''tuoi'':99 ''tuyet'':173,215 ''va'':55,112 ''vay'':233 ''vi'':28 ''viet'':249 ''voi'':48,127,158,174,205,210,216 ''vu'':51,214 ''vui'':152 ''vẻ'':153 ''xa'':24,241 ''xep'':235 ''xuat'':52 ''yeu'':118');
INSERT INTO "public"."hotel" VALUES ('49a9002e-8126-41fb-8891-d56ab8456fa0', '2022-09-22 23:44:58.943', '2022-09-23 00:12:55.137', 2, '8 Đồng Khởi, Q.1, Ho Chi Minh City, Vietnam', '{5,4}', 'APPROVED', 'HO-GWJZTZF5WS', 'Grand Hotel Saigon ở trung tâm Thành phố Hồ Chí Minh, cách Chợ Bến Thành và Đường Đồng Khởi 5 phút lái xe. Khách sạn 5 sao này cách Bảo tàng Chứng tích Chiến tranh 1,7 mi (2,7 km) và Ủy ban Nhân dân TP.HCM 0,6 mi (1 km). Hãy nghỉ ngơi thoải mái như đang ở nhà mình tại một trong 251 phòng được trang bị máy điều hòa cùng minibar và TV plasma. Truy cập Internet không dây miễn phí giúp quý vị luôn giữ liên lạc; trong khi các chương trình truyền hình vệ tinh sẽ mang đến những phút giây giải trí thoải mái. Phòng tắm riêng với bồn tắm hoặc buồng tắm vòi sen có đồ dùng nhà tắm miễn phí và máy sấy tóc. Các tiện nghi phòng bao gồm két bảo mật và bàn, cùng điện thoại với điện thoại nội vùng miễn phí. Có nhiều dịch vụ, tiện ích dành cho khách, bao gồm trung tâm dịch vụ văn phòng phục vụ 24 giờ, báo miễn phí ở sảnh và dịch vụ giặt ủi/giặt khô. Có kế hoạch tổ chức sự kiện tại Thành phố Hồ Chí Minh? khách sạn này có khu vực tổ chức rộng 500 mét vuông, bao gồm khu hội nghị và phòng họp. Với phụ phí, khách có thể sử dụng xe đưa đón sân bay 24 giờ và dịch vụ đón khách tại nhà ga.', 'POPULAR', 1000000, 4, 'grand-hotel-saigonho-gwjztzf5ws', 2, 'Grand Hotel Saigon', '81e13f19-29ac-411f-9c34-16ae8315ff84', '''0'':51 ''1'':39,54 ''2'':42 ''24'':177,236 ''251'':69 ''5'':23,29 ''500'':212 ''6'':52 ''7'':40,43 ''8'':246 ''ban'':47,147 ''bao'':141,144,167,215 ''bay'':235 ''báo'':179 ''bảo'':33 ''ben'':17 ''bi'':73 ''bon'':119 ''buong'':122 ''cac'':98,137 ''cach'':15,32 ''cap'':83 ''chi'':13,201,251 ''chien'':37 ''cho'':16,165 ''chuc'':194,210 ''chung'':35 ''chuong'':99 ''citi'':253 ''co'':126,158,190,206,227 ''cung'':77,148 ''dan'':49 ''dang'':62 ''danh'':164 ''day'':86 ''den'':107 ''dich'':160,171,185,239 ''dien'':149,152 ''dieu'':75 ''dong'':21,247 ''dò'':127 ''dua'':232 ''dung'':128,230 ''duoc'':71 ''duong'':20 ''ga'':245 ''giai'':111 ''giat'':187 ''giay'':110 ''gio'':178,237 ''giu'':93 ''giup'':89 ''gom'':142,168,216 ''grand'':1,4 ''hay'':56 ''hinh'':102 ''ho'':12,200,250 ''hoa'':76 ''hoac'':121 ''hoach'':192 ''hoi'':218 ''hop'':222 ''hotel'':2,5 ''ich'':163 ''internet'':84 ''ke'':191 ''ket'':143 ''khach'':166,226,242 ''khách'':27,203 ''khi'':97 ''kho'':189 ''khoi'':22,248 ''khong'':85 ''khu'':207,217 ''kien'':196 ''km'':44,55 ''lac'':95 ''lai'':25 ''lien'':94 ''luon'':92 ''mai'':60,114 ''mang'':106 ''mat'':145 ''may'':74,134 ''met'':213 ''mi'':41,53 ''mien'':87,156 ''miẽn'':131,180 ''minh'':14,65,202,252 ''minibar'':78 ''mot'':67 ''nay'':31,205 ''nghi'':57,139,219 ''ngoi'':58 ''nha'':64,244 ''nhan'':48 ''nhà'':129 ''nhieu'':159 ''nhu'':61 ''nhung'':108 ''noi'':154 ''o'':7,63 ''ỏ'':182 ''phi'':88,157,225 ''phí'':132,181 ''pho'':11,199 ''phong'':70,115,140,174,221 ''phu'':224 ''phuc'':175 ''phut'':24,109 ''plasma'':81 ''q.1'':249 ''quy'':90 ''rieng'':117 ''rong'':211 ''saigon'':3,6 ''san'':234 ''sao'':30 ''say'':135 ''sảnh'':183 ''sạn'':28,204 ''sen'':125 ''su'':195,229 ''sẽ'':105 ''tai'':66,197,243 ''tam'':9,116,120,123,170 ''tàng'':34 ''tám'':130 ''thanh'':10,18,198 ''thoai'':59,113,150,153 ''thể'':228 ''tich'':36 ''tien'':138,162 ''tinh'':104 ''toc'':136 ''tp.hcm'':50 ''trang'':72 ''tranh'':38 ''tri'':112 ''trinh'':100 ''trong'':68,96 ''trung'':8,169 ''truy'':82 ''truyen'':101 ''tv'':80 ''ui/giat'':188 ''uy'':46 ''va'':19,45,79,133,146,184,220,238 ''van'':173 ''ve'':103 ''vi'':91 ''vietnam'':254 ''voi'':118,124,151,223 ''vu'':161,172,176,186,240 ''vuc'':208 ''vung'':155 ''vuong'':214 ''xe'':26,231');
INSERT INTO "public"."hotel" VALUES ('e527c105-3672-44cd-86a8-4eca2b118277', '2022-09-22 23:39:43.359', '2022-09-23 00:12:57.491', 3, '17 Lê Duẩn, Ho Chi Minh City, Vietnam', '{5,3,2,4}', 'APPROVED', 'HO-IP1YBYHZ34', 'Tọa lạc tại trung tâm Thành phố Hồ Chí Minh, Sofitel Plaza Saigon, cách Đường Đồng Khởi và Thảo cầm viên Sài Gòn 10 phút đi bộ. Khách sạn 5 sao này cách Ủy ban Nhân dân TP.HCM 0,9 mi (1,4 km) và cách Nhà hát Lớn 1 mi (1,6 km). Hãy nghỉ ngơi thoải mái như đang ở nhà mình tại một trong 286 phòng được trang bị tủ lạnh và TV LCD. Khách có thể truy cập internet có dây hoặc không dây miễn phí hay giải trí cùng iPod dock và các chương trình truyền hình vệ tinh. Phòng tắm riêng với buồng tắm vòi sen có đồ dùng nhà tắm được thiết kế riêng và máy sấy tóc. Tiện nghi phòng bao gồm điện thoại, cùng két bảo mật và bàn. Có nhiều dịch vụ, tiện ích dành cho khách, bao gồm truy cập Internet tốc độ cao (có dây) miễn phí, trung tâm dịch vụ văn phòng và nhận phòng nhanh. Có bãi đậu xe tự phục vụ miễn phí trong khuôn viên.', 'POPULAR', 1500000, 4, 'sofitel-plaza-saigonho-ip1ybyhz34', 4, 'Sofitel Plaza Saigon', '81e13f19-29ac-411f-9c34-16ae8315ff84', '''0'':42 ''1'':45,53,55 ''10'':27 ''17'':185 ''286'':71 ''4'':46 ''5'':33 ''6'':56 ''9'':43 ''bai'':174 ''ban'':38,141 ''bao'':132,138,151 ''bi'':75 ''bo'':30 ''buong'':112 ''cac'':101 ''cach'':17,36,49 ''cam'':23 ''cao'':158 ''cap'':85,154 ''chi'':12,189 ''cho'':149 ''chuong'':102 ''citi'':191 ''co'':82,87,116,142,159,173 ''cung'':97,136 ''dan'':40 ''dang'':64 ''danh'':148 ''dau'':175 ''day'':88,91,160 ''di'':29 ''dich'':144,165 ''dien'':134 ''dock'':99 ''dong'':19 ''duan'':187 ''dung'':118 ''duoc'':73,121 ''duong'':18 ''giai'':95 ''gom'':133,152 ''gon'':26 ''hat'':51 ''hay'':58,94 ''hinh'':105 ''ho'':11,188 ''hoac'':89 ''ich'':147 ''internet'':86,155 ''ipod'':98 ''ke'':123 ''ket'':137 ''khach'':81,150 ''khách'':31 ''khoi'':20 ''khong'':90 ''khuon'':183 ''km'':47,57 ''lac'':5 ''lanh'':77 ''lcd'':80 ''le'':186 ''lon'':52 ''mai'':62 ''mat'':139 ''may'':126 ''mi'':44,54 ''mien'':92,161,180 ''minh'':13,67,190 ''mot'':69 ''nay'':35 ''nghi'':59,130 ''ngoi'':60 ''nha'':50,66,119 ''nhan'':39,170 ''nhanh'':172 ''nhieu'':143 ''nhu'':63 ''o'':65 ''phi'':93,162,181 ''pho'':10 ''phong'':72,108,131,168,171 ''phuc'':178 ''phut'':28 ''plaza'':2,15 ''rieng'':110,124 ''sai'':25 ''saigon'':3,16 ''sao'':34 ''say'':127 ''sạn'':32 ''sen'':115 ''sofitel'':1,14 ''tai'':6,68 ''tam'':8,109,113,120,164 ''thanh'':9 ''thao'':22 ''thiet'':122 ''thoai'':61,135 ''thể'':83 ''tien'':129,146 ''tinh'':107 ''toa'':4 ''toc'':128,156 ''tp.hcm'':41 ''trang'':74 ''tri'':96 ''trinh'':103 ''trong'':70,182 ''trung'':7,163 ''truy'':84,153 ''truyen'':104 ''tu'':76,177 ''tv'':79 ''uy'':37 ''va'':21,48,78,100,125,140,169 ''van'':167 ''ve'':106 ''vien'':24,184 ''vietnam'':192 ''voi'':111,114 ''vu'':145,166,179 ''xe'':176');
INSERT INTO "public"."hotel" VALUES ('e7ad99a2-37fd-4275-91c1-c290c5c6c68d', '2022-09-23 00:01:37.605', '2022-09-23 00:12:49.229', 3, 'Vịnh Ninh Vân, Ninh Hoa, Vietnam', '{5,4,3}', 'APPROVED', 'HO-B2J7FZ6UGW', 'Six Senses Ninh Van Bay ở Ninh Hòa, gần vịnh và chỉ cách Vịnh Ninh Vân vài bước. Resort 5 sao này nằm cùng khu vực với Cảng cá Vĩnh Lương và Bãi Dương. Hãy nghỉ ngơi thoải mái như đang ở nhà mình tại một trong 62 phòng được trang bị máy điều hòa cùng hồ bơi riêng và TV màn hình phẳng. Các phòng có sân riêng. Các chương trình truyền hình vệ tinh và đầu đĩa DVD sẽ giúp quý vị có những giây phút giải trí thoải mái; song song đó, truy cập Internet không dây miễn phí giúp quý vị luôn kết nối. Tiện nghi phòng bao gồm điện thoại, cùng két bảo mật đặt được máy tính xách tay và bàn. Có nhiều dịch vụ, tiện ích dành cho khách, bao gồm dịch vụ xe limo/xe đưa đón hạng sang, máy vi tính và báo miễn phí ở sảnh. Khu vực phục vụ hội thảo, sự kiện tại resort này bao gồm trung tâm hội nghị và phòng họp. Xe đưa đón sân bay phục vụ 24 giờ với phụ phí.', 'POPULAR', 3000000, 4, 'six-senses-ninh-van-bayho-b2j7fz6ugw', 2, 'Six Senses Ninh Van Bay', '81e13f19-29ac-411f-9c34-16ae8315ff84', '''24'':188 ''5'':25 ''62'':53 ''bai'':38 ''ban'':132 ''bao'':117,123,142,172 ''bay'':5,10,185 ''báo'':156 ''bi'':57 ''boi'':63 ''buoc'':23 ''ca'':34 ''cac'':70,75 ''cach'':18 ''cang'':33 ''cap'':102 ''chi'':17 ''cho'':140 ''chuong'':76 ''co'':72,90,133 ''cung'':29,61,121 ''dang'':46 ''danh'':139 ''dat'':125 ''dau'':83 ''day'':105 ''dia'':84 ''dich'':135,144 ''dien'':119 ''dieu'':59 ''dua'':148,182 ''duoc'':55,126 ''duong'':39 ''dvd'':85 ''gan'':14 ''giai'':94 ''giay'':92 ''gio'':189 ''giup'':87,108 ''gom'':118,143,173 ''hang'':150 ''hay'':40 ''hinh'':68,79 ''ho'':62 ''hoa'':13,60,197 ''hoi'':165,176 ''hop'':180 ''ich'':138 ''internet'':103 ''ket'':112,122 ''khach'':141 ''khong'':104 ''khu'':30,161 ''kien'':168 ''limo/xe'':147 ''luon'':111 ''luong'':36 ''mai'':44,97 ''man'':67 ''mat'':124 ''may'':58,127,152 ''mien'':106 ''miẽn'':157 ''minh'':49 ''mot'':51 ''nam'':28 ''nay'':27,171 ''nghi'':41,115,177 ''ngoi'':42 ''nha'':48 ''nhieu'':134 ''nhu'':45 ''nhung'':91 ''ninh'':3,8,12,20,194,196 ''noi'':113 ''o'':11,47 ''ỏ'':159 ''phang'':69 ''phi'':107,192 ''phí'':158 ''phong'':54,71,116,179 ''phu'':191 ''phuc'':163,186 ''phut'':93 ''quy'':88,109 ''resort'':24,170 ''rieng'':64,74 ''san'':73,184 ''sang'':151 ''sao'':26 ''sảnh'':160 ''sens'':2,7 ''six'':1,6 ''song'':98,99 ''su'':167 ''sẽ'':86 ''tai'':50,169 ''tam'':175 ''tay'':130 ''thao'':166 ''thoai'':43,96,120 ''tien'':114,137 ''tinh'':81,128,154 ''trang'':56 ''tri'':95 ''trinh'':77 ''trong'':52 ''trung'':174 ''truy'':101 ''truyen'':78 ''tv'':66 ''va'':16,37,65,82,131,155,178 ''vai'':22 ''van'':4,9,21,195 ''ve'':80 ''vi'':89,110,153 ''vietnam'':198 ''vinh'':15,35,193 ''vịnh'':19 ''voi'':32,190 ''vu'':136,145,164,187 ''vuc'':31,162 ''xach'':129 ''xe'':146,181');
INSERT INTO "public"."hotel" VALUES ('a6ee80e3-301e-4b6e-8ccd-8dbeb6bd323a', '2022-09-22 23:57:39.321', '2022-09-23 00:12:50.961', 2, '32-34 Trần Phú, Nha Trang, Vietnam', '{5,4,3}', 'APPROVED', 'HO-JGH7MZA8BX', 'InterContinental Nha Trang ở Bãi biển Đường Trần Phú, Nha Trang, cách Bảo tàng Khánh Hòa và Chợ đêm Nha Trang 10 phút đi bộ. Khách sạn 5 sao này cách Quảng trường 2/4 0,5 mi (0,7 km) và Trung tâm Thương mại Vincom Plaza Lê Thánh Tôn 0,6 mi (0,9 km). Hãy nghỉ ngơi thoải mái như đang ở nhà mình tại một trong 279 phòng được trang bị tủ lạnh và TV LCD. Giường của quý vị được trang bị chăn bông và bộ đồ giường cao cấp. Các phòng có ban công riêng. Các chương trình truyền hình vệ tinh và đầu đĩa DVD sẽ giúp quý vị có những giây phút giải trí thoải mái; song song đó, truy cập Internet không dây miễn phí giúp quý vị luôn kết nối. Phòng tắm riêng với bồn tắm và buồng tắm vòi sen riêng có vòi sen phun mưa và bồn tắm nước khoáng. Có nhiều dịch vụ, tiện ích dành cho khách, bao gồm trung tâm dịch vụ văn phòng, dịch vụ xe limo/xe đưa đón hạng sang và nhận phòng nhanh. Có kế hoạch tổ chức sự kiện tại Nha Trang? khách sạn này có khu vực tổ chức rộng 11891 mét vuông, bao gồm khu hội nghị. Xe đưa đón sân bay phục vụ 24 giờ với phụ phí.', 'POPULAR', 3190000, 4, 'intercontinental-nha-trangho-jgh7mza8bx', 2, 'InterContinental Nha Trang', '81e13f19-29ac-411f-9c34-16ae8315ff84', '''-34'':234 ''0'':38,41,54,57 ''10'':25 ''11891'':213 ''2/4'':37 ''24'':228 ''279'':73 ''32'':233 ''5'':31,39 ''6'':55 ''7'':42 ''9'':58 ''bai'':8 ''ban'':101 ''bao'':16,174,216 ''bay'':225 ''bi'':77,89 ''biển'':9 ''bo'':28,93 ''bon'':147,161 ''bong'':91 ''buong'':150 ''cac'':98,104 ''cach'':15,34 ''cao'':96 ''cap'':131 ''cáp'':97 ''chan'':90 ''cho'':21,172 ''chuc'':198,211 ''chuong'':105 ''co'':100,119,155,165,194,207 ''cong'':102 ''cua'':84 ''dang'':66 ''danh'':171 ''dau'':112 ''day'':134 ''dem'':22 ''di'':27 ''dia'':113 ''dich'':167,178,182 ''dò'':94 ''dua'':186,222 ''duoc'':75,87 ''duong'':10 ''dvd'':114 ''giai'':123 ''giay'':121 ''gio'':229 ''giuong'':83 ''giuòng'':95 ''giup'':116,137 ''gom'':175,217 ''hang'':188 ''hay'':60 ''hinh'':108 ''hoa'':19 ''hoach'':196 ''hoi'':219 ''ich'':170 ''intercontinent'':1,4 ''internet'':132 ''ke'':195 ''ket'':141 ''khach'':173 ''khanh'':18 ''khách'':29,204 ''khoang'':164 ''khong'':133 ''khu'':208,218 ''kien'':200 ''km'':43,59 ''lanh'':79 ''lcd'':82 ''le'':51 ''limo/xe'':185 ''luon'':140 ''mai'':48,64,126 ''met'':214 ''mi'':40,56 ''mien'':135 ''minh'':69 ''mot'':71 ''mua'':159 ''nay'':33,206 ''nghi'':61,220 ''ngoi'':62 ''nha'':2,5,13,23,68,202,237 ''nhan'':191 ''nhanh'':193 ''nhieu'':166 ''nhu'':65 ''nhung'':120 ''noi'':142 ''nuoc'':163 ''o'':7,67 ''phi'':136,232 ''phong'':74,99,143,181,192 ''phu'':12,231,236 ''phuc'':226 ''phun'':158 ''phut'':26,122 ''plaza'':50 ''quang'':35 ''quy'':85,117,138 ''rieng'':103,145,154 ''rong'':212 ''san'':224 ''sang'':189 ''sao'':32 ''sạn'':30,205 ''sen'':153,157 ''song'':127,128 ''su'':199 ''sẽ'':115 ''tai'':70,201 ''tam'':46,144,148,151,162,177 ''tang'':17 ''thanh'':52 ''thoai'':63,125 ''thuong'':47 ''tien'':169 ''tinh'':110 ''ton'':53 ''tran'':11,235 ''trang'':3,6,14,24,76,88,203,238 ''tri'':124 ''trinh'':106 ''trong'':72 ''trung'':45,176 ''truong'':36 ''truy'':130 ''truyen'':107 ''tu'':78 ''tv'':81 ''va'':20,44,80,92,111,149,160,190 ''van'':180 ''ve'':109 ''vi'':86,118,139 ''vietnam'':239 ''vincom'':49 ''voi'':146,152,156,230 ''vu'':168,179,183,227 ''vuc'':209 ''vuong'':215 ''xe'':184,221');
INSERT INTO "public"."hotel" VALUES ('9541ccdc-9011-4821-93ea-fa50c1e77abc', '2022-09-23 00:11:01.846', '2022-09-23 00:12:47.095', 2, 'Lô D10, Bán đảo Bắc Cam Ranh,, Cam Lam, Vietnam', '{}', 'APPROVED', 'HO-WNPHPT97U6', 'Fusion Resort Cam Ranh ở Cam Lâm, gần biển, cách Bãi biển Nha Trang và Bãi biển Bãi Dài 15 phút lái xe. Resort 5 sao này cách Vịnh Cam Ranh 8,7 mi (14 km) và Bãi biển Mỹ Ca 8,8 mi (14,1 km). Hãy nghỉ ngơi thoải mái như đang ở nhà mình tại một trong 122 phòng trang trí khác biệt với minibar và TV LCD. Các phòng có sân riêng. Truy cập Internet không dây miễn phí giúp quý vị luôn giữ liên lạc; trong khi các chương trình truyền hình cáp sẽ mang đến những phút giây giải trí thoải mái. Phòng tắm với bồn tắm và buồng tắm vòi sen riêng được trang bị bồn tắm và vòi sen phun mưa. Có nhiều dịch vụ, tiện ích dành cho khách, bao gồm quầy tiếp tân phục vụ 24 giờ/ngày, nhân viên thông thạo nhiều ngôn ngữ và dịch vụ trông giữ/bảo quản hành lý. Xe đưa đón sân bay phục vụ 24 giờ với phụ phí, bên cạnh đó cũng có bãi đậu xe có người phục vụ miễn phí trong khuôn viên.', 'POPULAR', 5000000, 4, 'fusion-resort-cam-ranhho-wnphpt97u6', 3, 'Fusion Resort Cam Ranh', '81e13f19-29ac-411f-9c34-16ae8315ff84', '''1'':50 ''122'':65 ''14'':39,49 ''15'':24 ''24'':150,174 ''5'':29 ''7'':37 ''8'':36,46,47 ''bac'':200 ''bai'':15,20,42,184 ''ban'':198 ''bao'':143 ''bay'':171 ''bãi'':22 ''ben'':179 ''bi'':126 ''biet'':70 ''biển'':13,16,21,43 ''bon'':116,127 ''buong'':119 ''ca'':45 ''cac'':76,97 ''cach'':14,32 ''cam'':3,7,10,34,201,203 ''canh'':180 ''cap'':82,102 ''cho'':141 ''chuong'':98 ''co'':78,134,183,187 ''cung'':182 ''d10'':197 ''dang'':58 ''danh'':140 ''dao'':199 ''dau'':185 ''day'':85 ''dài'':23 ''den'':105 ''dich'':136,160 ''dua'':168 ''duoc'':124 ''fusion'':1,5 ''gan'':12 ''giai'':109 ''giay'':108 ''gio'':175 ''gio/ngay'':151 ''giu'':92 ''giu/bao'':163 ''giup'':88 ''gom'':144 ''hanh'':165 ''hay'':52 ''hinh'':101 ''ich'':139 ''internet'':83 ''khac'':69 ''khach'':142 ''khi'':96 ''khong'':84 ''khuon'':194 ''km'':40,51 ''lac'':94 ''lai'':26 ''lam'':11,204 ''lcd'':75 ''lien'':93 ''lo'':196 ''luon'':91 ''ly'':166 ''mai'':56,112 ''mang'':104 ''mi'':38,48 ''mien'':86,191 ''minh'':61 ''minibar'':72 ''mot'':63 ''mua'':133 ''mỹ'':44 ''nay'':31 ''nghi'':53 ''ngoi'':54 ''ngon'':157 ''ngu'':158 ''nguoi'':188 ''nha'':17,60 ''nhan'':152 ''nhieu'':135,156 ''nhu'':57 ''nhung'':106 ''o'':9,59 ''phi'':87,178,192 ''phong'':66,77,113 ''phu'':177 ''phuc'':148,172,189 ''phun'':132 ''phut'':25,107 ''quan'':164 ''quay'':145 ''quy'':89 ''ranh'':4,8,35,202 ''resort'':2,6,28 ''rieng'':80,123 ''san'':79,170 ''sao'':30 ''sen'':122,131 ''sẽ'':103 ''tai'':62 ''tam'':114,117,120,128 ''tan'':147 ''thao'':155 ''thoai'':55,111 ''thong'':154 ''tien'':138 ''tiep'':146 ''trang'':18,67,125 ''tri'':68,110 ''trinh'':99 ''trong'':64,95,162,193 ''truy'':81 ''truyen'':100 ''tv'':74 ''va'':19,41,73,118,129,159 ''vi'':90 ''vien'':153,195 ''vietnam'':205 ''vinh'':33 ''voi'':71,115,121,130,176 ''vu'':137,149,161,173,190 ''xe'':27,167,186');
INSERT INTO "public"."hotel" VALUES ('8453425c-1ca8-4010-ab31-bad345c8d169', '2022-09-22 23:50:44.532', '2022-09-23 00:12:53.517', 2, '6-8 Hồ Huấn Nghiệp, Ho Chi Minh City, Vietnam', '{5,4,3}', 'APPROVED', 'HO-JNME4BD5SM', 'The Myst Đồng Khởi ở trung tâm Thành phố Hồ Chí Minh, cách Chợ Bến Thành và Đường Đồng Khởi 5 phút lái xe. Khách sạn 5 sao này cách Bảo tàng Chứng tích Chiến tranh 1,6 mi (2,6 km) và Sông Sài Gòn 0,1 mi (0,2 km). Hãy nghỉ ngơi thoải mái như đang ở nhà mình tại một trong 108 phòng được trang bị máy điều hòa cùng tủ lạnh và minibar (với một số thức uống miễn phí). Các phòng có ban công riêng. Các phòng được trang bị TV LED 40-inch với các chương trình truyền hình cáp để khách giải trí; trong khi đó, truy cập Internet không dây miễn phí sẽ giúp quý vị luôn kết nối. Phòng tắm riêng với bồn tắm và buồng tắm vòi sen riêng được trang bị bồn tắm thủy lực và đồ dùng nhà tắm được thiết kế riêng. Có nhiều dịch vụ, tiện ích dành cho khách, bao gồm dịch vụ giặt ủi/giặt khô, quầy tiếp tân phục vụ 24 giờ/ngày và nhân viên thông thạo nhiều ngôn ngữ. Xe đưa đón sân bay phục vụ 24 giờ với phụ phí.', 'POPULAR', 1000000, 4, 'the-myst-ong-khoiho-jnme4bd5sm', 2, 'The Myst Đồng Khởi', '81e13f19-29ac-411f-9c34-16ae8315ff84', '''-8'':205 ''0'':51,54 ''1'':41,52 ''108'':70 ''2'':44,55 ''24'':182,199 ''40'':103 ''5'':25,31 ''6'':42,45,204 ''ban'':93 ''bao'':170 ''bay'':196 ''bảo'':35 ''ben'':19 ''bi'':74,100,147 ''bon'':137,148 ''buong'':140 ''cac'':90,96,106 ''cach'':17,34 ''cap'':111,120 ''chi'':15,210 ''chien'':39 ''cho'':18,168 ''chung'':37 ''chuong'':107 ''citi'':212 ''co'':92,161 ''cong'':94 ''cung'':78 ''dang'':63 ''danh'':167 ''day'':123 ''dich'':163,172 ''dieu'':76 ''dong'':3,7,23 ''dua'':193 ''dung'':154 ''duoc'':72,98,145,157 ''duong'':22 ''dể'':112 ''giai'':114 ''giat'':174 ''gio'':200 ''gio/ngay'':183 ''giup'':127 ''gom'':171 ''gon'':50 ''hay'':57 ''hinh'':110 ''ho'':14,206,209 ''hoa'':77 ''huan'':207 ''ich'':166 ''inch'':104 ''internet'':121 ''ke'':159 ''ket'':131 ''khach'':113,169 ''khách'':29 ''khi'':117 ''kho'':176 ''khoi'':4,8,24 ''khong'':122 ''km'':46,56 ''lai'':27 ''lanh'':80 ''led'':102 ''luc'':151 ''luon'':130 ''mai'':61 ''may'':75 ''mi'':43,53 ''mien'':88,124 ''minh'':16,66,211 ''minibar'':82 ''mot'':68,84 ''myst'':2,6 ''nay'':33 ''nghi'':58 ''nghiep'':208 ''ngoi'':59 ''ngon'':190 ''ngu'':191 ''nha'':65,155 ''nhan'':185 ''nhieu'':162,189 ''nhu'':62 ''noi'':132 ''o'':9,64 ''phi'':89,125,203 ''pho'':13 ''phong'':71,91,97,133 ''phu'':202 ''phuc'':180,197 ''phut'':26 ''quay'':177 ''quy'':128 ''rieng'':95,135,144,160 ''sai'':49 ''san'':195 ''sao'':32 ''sạn'':30 ''sen'':143 ''song'':48 ''sẽ'':126 ''tai'':67 ''tam'':11,134,138,141,149,156 ''tan'':179 ''tàng'':36 ''thanh'':12,20 ''thao'':188 ''thiet'':158 ''thoai'':60 ''thong'':187 ''thuc'':86 ''thuy'':150 ''tich'':38 ''tien'':165 ''tiep'':178 ''trang'':73,99,146 ''tranh'':40 ''tri'':115 ''trinh'':108 ''trong'':69,116 ''trung'':10 ''truy'':119 ''truyen'':109 ''tu'':79 ''tv'':101 ''ui/giat'':175 ''uong'':87 ''va'':21,47,81,139,152,184 ''vi'':129 ''vien'':186 ''vietnam'':213 ''voi'':83,105,136,142,201 ''vu'':164,173,181,198 ''xe'':28,192');

-- ----------------------------
-- Table structure for hotel_bookable_item
-- ----------------------------
DROP TABLE IF EXISTS "public"."hotel_bookable_item";
CREATE TABLE "public"."hotel_bookable_item" (
  "id" int8 NOT NULL,
  "created_at" timestamp(6),
  "updated_at" timestamp(6),
  "version" int4 NOT NULL,
  "amenities" int4[],
  "available" bool,
  "currency" varchar(255) COLLATE "pg_catalog"."default",
  "hotel_code" varchar(255) COLLATE "pg_catalog"."default",
  "hotel_option_code" varchar(255) COLLATE "pg_catalog"."default",
  "image" varchar(255) COLLATE "pg_catalog"."default",
  "price" float8,
  "room_type" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of hotel_bookable_item
-- ----------------------------
INSERT INTO "public"."hotel_bookable_item" VALUES (55, '2021-07-29 00:17:17.251', '2021-07-29 00:17:17.251', 0, NULL, 't', 'VNĐ', 'HO-WC0GRVXFET', 'ROOM1', NULL, 10000, 'SINGLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (15, '2022-08-17 16:24:42.149', '2022-08-17 16:24:42.149', 0, '{6,5,4,3,1,2}', 't', 'VNĐ', 'HO-UZRWI13SEG', 'Deluxe Room', 'hotel-room-1660728282137.jpg', 2000000, 'SINGLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (16, '2022-08-17 16:25:32.457', '2022-08-17 16:25:32.457', 0, '{}', 't', 'VNĐ', 'HO-UZRWI13SEG', 'Suite, 1 King Bed (Parlor)', 'hotel-room-1660728332451.jpg', 4000000, 'SINGLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (34, '2022-08-17 16:28:24.932', '2022-08-17 16:28:24.932', 0, '{1,2,3,4,6}', 't', 'VNĐ', 'HO-IZEIAVCJHB', 'Classic Room', 'hotel-room-1660728504927.jpg', 2300000, 'SINGLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (35, '2022-08-17 16:29:16.452', '2022-08-17 16:29:16.452', 0, '{5}', 't', 'VNĐ', 'HO-IZEIAVCJHB', 'Classic Room, 2 Twin Beds, Lake View', 'hotel-room-1660728556447.jpg', 4000000, 'SINGLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (56, '2022-08-17 16:31:20.261', '2022-08-17 16:31:20.261', 0, '{1,3,2,4,6}', 't', 'VNĐ', 'HO-V4QN23GQW5', 'Room, 1 King Bed, Non Smoking, City View', 'hotel-room-1660728680255.jpg', 4000000, 'SINGLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (57, '2022-08-17 16:32:43.177', '2022-08-17 16:32:43.177', 0, '{1,5}', 't', 'VNĐ', 'HO-V4QN23GQW5', 'Room, 2 Double Beds, Non Smoking, Lake View', 'hotel-room-1660728763172.jpg', 6000000, 'SINGLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (74, '2022-08-17 16:35:43.867', '2022-08-17 16:35:43.867', 0, '{3,2,4,6}', 't', 'VNĐ', 'HO-NOVQ5D8R5C', 'Grand Room, 1 King Bed, Business Lounge Access (Opera Wing, Club Metropole)', 'hotel-room-1660728943861.jpg', 10000000, 'SUITE');
INSERT INTO "public"."hotel_bookable_item" VALUES (75, '2022-08-17 16:36:26.973', '2022-08-17 16:36:26.973', 0, '{3,2,1,5}', 't', 'VNĐ', 'HO-NOVQ5D8R5C', 'Grand Twin Room, 2 Twin Beds, Business Lounge Access (Opera Wing, Club Metropole)', 'hotel-room-1660728986966.jpg', 5000000, 'DOUBLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (100, '2022-08-25 21:58:45.809', '2022-08-25 21:58:45.809', 0, '{6,5,4,3,2,1}', 't', 'VNĐ', 'HO-8X27CKXSG7', 'Deluxe Room', 'hotel-room-1661439525780.jpg', 1000000, 'SINGLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (101, '2022-08-25 21:59:49.329', '2022-08-25 21:59:49.329', 0, '{}', 't', 'VNĐ', 'HO-8X27CKXSG7', 'Suite', 'hotel-room-1661439589325.jpg', 2000000, 'DOUBLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (102, '2022-08-25 22:00:17.614', '2022-08-25 22:00:17.614', 0, '{1,2,3,4,5,6}', 't', 'VNĐ', 'HO-8X27CKXSG7', 'Suite (Family )', 'hotel-room-1661439617610.jpg', 5000000, 'SUITE');
INSERT INTO "public"."hotel_bookable_item" VALUES (112, '2022-08-25 22:06:55.337', '2022-08-25 22:06:55.337', 0, '{3}', 't', 'VNĐ', 'HO-B5KNZ2SM9Q', 'Deluxe Double Room, 1 Bedroom, Balcony, City View', 'hotel-room-1661440015329.jpg', 700000, 'SINGLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (113, '2022-08-25 22:07:50.664', '2022-08-25 22:07:50.664', 0, '{2}', 't', 'VNĐ', 'HO-B5KNZ2SM9Q', 'Deluxe Triple Room, 1 Bedroom, City View', 'hotel-room-1661440070659.jpg', 1500000, 'DOUBLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (137, '2022-09-22 23:15:44.498', '2022-09-22 23:15:44.498', 0, '{5,3,1,2}', 't', 'VNĐ', 'HO-LF4YHY9LSJ', 'Standard Room, 1 King Bed', 'hotel-room-1663863344474.jpg', 1000000, 'SINGLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (138, '2022-09-22 23:16:35.647', '2022-09-22 23:16:35.647', 0, '{4}', 't', 'VNĐ', 'HO-LF4YHY9LSJ', 'Standard Room, 2 Twin Beds', 'hotel-room-1663863395643.jpg', 2490000, 'DOUBLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (139, '2022-09-22 23:17:31.926', '2022-09-22 23:17:31.926', 0, '{2,3,5,6}', 't', 'VNĐ', 'HO-LF4YHY9LSJ', 'Junior Suite', 'hotel-room-1663863451922.jpg', 4000000, 'SUITE');
INSERT INTO "public"."hotel_bookable_item" VALUES (140, '2022-09-22 23:18:42.159', '2022-09-22 23:18:42.159', 0, '{1,4}', 't', 'VNĐ', 'HO-LF4YHY9LSJ', 'Standard Twin Room with VinWonders and Safari', 'hotel-room-1663863522151.jpg', 5000000, 'SUITE');
INSERT INTO "public"."hotel_bookable_item" VALUES (151, '2022-09-22 23:26:18.794', '2022-09-22 23:26:18.794', 0, '{1,4,2,3,6}', 't', 'VNĐ', 'HO-9YURVTKKMM', 'Villa Sea View', 'hotel-room-1663863978790.jpg', 2923200, 'DOUBLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (152, '2022-09-22 23:26:48.767', '2022-09-22 23:26:48.767', 0, '{1,6}', 't', 'VNĐ', 'HO-9YURVTKKMM', 'Villa Beach Front', 'hotel-room-1663864008763.jpg', 4183200, 'SUITE');
INSERT INTO "public"."hotel_bookable_item" VALUES (153, '2022-09-22 23:27:23.144', '2022-09-22 23:27:23.144', 0, '{2,3,4}', 't', 'VNĐ', 'HO-9YURVTKKMM', 'Jacuzzi Villa', 'hotel-room-1663864043140.jpg', 500000, 'SUITE');
INSERT INTO "public"."hotel_bookable_item" VALUES (165, '2022-09-22 23:34:18.485', '2022-09-22 23:34:18.485', 0, '{2,3,4}', 't', 'VNĐ', 'HO-KDVTWE5HSY', 'Standard Room, Ocean View', 'hotel-room-1663864458481.jpg', 2190000, 'DOUBLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (166, '2022-09-22 23:34:56.202', '2022-09-22 23:34:56.202', 0, '{4}', 't', 'VNĐ', 'HO-KDVTWE5HSY', 'Superior Room, Ocean View', 'hotel-room-1663864496198.jpg', 1000000, 'SINGLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (167, '2022-09-22 23:35:29.864', '2022-09-22 23:35:29.864', 0, '{2,3,5,6}', 't', 'VNĐ', 'HO-KDVTWE5HSY', 'Superior Room with Pool Access', 'hotel-room-1663864529860.jpg', 5000000, 'SUITE');
INSERT INTO "public"."hotel_bookable_item" VALUES (181, '2022-09-22 23:40:39.603', '2022-09-22 23:40:39.603', 0, '{3,6,4}', 't', 'VNĐ', 'HO-IP1YBYHZ34', 'Superior Room, 2 Twin Beds, City View', 'hotel-room-1663864839599.jpg', 3190000, 'DOUBLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (182, '2022-09-22 23:41:07.453', '2022-09-22 23:41:07.453', 0, '{6,4}', 't', 'VNĐ', 'HO-IP1YBYHZ34', 'Standard Room, 1 King Bed', 'hotel-room-1663864867445.jpg', 1500000, 'SINGLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (196, '2022-09-22 23:45:47.457', '2022-09-22 23:45:47.457', 0, '{6,4}', 't', 'VNĐ', 'HO-GWJZTZF5WS', 'Deluxe King', 'hotel-room-1663865147453.jpg', 1000000, 'SINGLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (197, '2022-09-22 23:46:03.672', '2022-09-22 23:46:03.672', 0, '{6,4,2,3}', 't', 'VNĐ', 'HO-GWJZTZF5WS', 'Suite (Family )', 'hotel-room-1663865163667.jpg', 3190000, 'DOUBLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (198, '2022-09-22 23:46:23.282', '2022-09-22 23:46:23.282', 0, '{6,4}', 't', 'VNĐ', 'HO-GWJZTZF5WS', 'Suite', 'hotel-room-1663865183274.jpg', 5000000, 'SUITE');
INSERT INTO "public"."hotel_bookable_item" VALUES (210, '2022-09-22 23:51:29.56', '2022-09-22 23:51:29.56', 0, '{6,4,2,3}', 't', 'VNĐ', 'HO-JNME4BD5SM', 'Saigon double room without view', 'hotel-room-1663865489556.jpg', 1000000, 'DOUBLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (211, '2022-09-22 23:52:16.402', '2022-09-22 23:52:16.402', 0, '{6}', 't', 'VNĐ', 'HO-JNME4BD5SM', 'Serene Corner double room', 'hotel-room-1663865536394.jpg', 3190000, 'SINGLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (212, '2022-09-22 23:52:50.332', '2022-09-22 23:52:50.332', 0, '{6,3}', 't', 'VNĐ', 'HO-JNME4BD5SM', 'Saigon Signature Room', 'hotel-room-1663865570324.jpg', 3190000, 'SINGLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (226, '2022-09-22 23:58:21.832', '2022-09-22 23:58:21.832', 0, '{6,3}', 't', 'VNĐ', 'HO-JGH7MZA8BX', 'Classic Room, 2 Twin Beds, City View', 'hotel-room-1663865901824.jpg', 3190000, 'SINGLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (227, '2022-09-22 23:58:49.527', '2022-09-22 23:58:49.527', 0, '{6}', 't', 'VNĐ', 'HO-JGH7MZA8BX', 'Premium Room, 1 King Bed, City View', 'hotel-room-1663865929523.jpg', 5000000, 'DOUBLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (239, '2022-09-23 00:01:55.361', '2022-09-23 00:01:55.361', 0, '{6,3,2}', 't', 'VNĐ', 'HO-B2J7FZ6UGW', 'The Rock Retreat', 'hotel-room-1663866115353.jpg', 5000000, 'DOUBLE');
INSERT INTO "public"."hotel_bookable_item" VALUES (240, '2022-09-23 00:02:39.529', '2022-09-23 00:02:39.529', 0, '{6}', 't', 'VNĐ', 'HO-B2J7FZ6UGW', 'Two Bedroom Hill Top Pool Villa', 'hotel-room-1663866159521.jpg', 3000000, 'SUITE');
INSERT INTO "public"."hotel_bookable_item" VALUES (251, '2022-09-23 00:11:50.17', '2022-09-23 00:11:50.17', 0, '{2,3}', 't', 'VNĐ', 'HO-WNPHPT97U6', 'Hideaway Pool Villa - All Spa Inclusive', 'hotel-room-1663866710154.jpg', 5000000, 'SUITE');
INSERT INTO "public"."hotel_bookable_item" VALUES (252, '2022-09-23 00:12:17.918', '2022-09-23 00:12:17.918', 0, '{1,4,5,6}', 't', 'VNĐ', 'HO-WNPHPT97U6', 'Ocean View Pool Villa - All Spa Inclusive', 'hotel-room-1663866737910.jpg', 10000000, 'SUITE');

-- ----------------------------
-- Table structure for hotel_image
-- ----------------------------
DROP TABLE IF EXISTS "public"."hotel_image";
CREATE TABLE "public"."hotel_image" (
  "id" int8 NOT NULL,
  "created_at" timestamp(6),
  "updated_at" timestamp(6),
  "version" int4 NOT NULL,
  "caption" text COLLATE "pg_catalog"."default",
  "hotel_code" varchar(255) COLLATE "pg_catalog"."default",
  "image_type" varchar(255) COLLATE "pg_catalog"."default",
  "url" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of hotel_image
-- ----------------------------
INSERT INTO "public"."hotel_image" VALUES (3, '2022-08-17 16:22:55.245', '2022-08-17 16:22:55.245', 0, 'image for hotel', 'HO-UZRWI13SEG', 'MAIN', 'hotel1660728175182-0.jpg');
INSERT INTO "public"."hotel_image" VALUES (4, '2022-08-17 16:22:55.254', '2022-08-17 16:22:55.254', 0, 'image for hotel', 'HO-UZRWI13SEG', 'MAIN', 'hotel1660728175189-1.jpg');
INSERT INTO "public"."hotel_image" VALUES (5, '2022-08-17 16:22:55.254', '2022-08-17 16:22:55.254', 0, 'image for hotel', 'HO-UZRWI13SEG', 'MAIN', 'hotel1660728175193-2.jpg');
INSERT INTO "public"."hotel_image" VALUES (6, '2022-08-17 16:22:55.255', '2022-08-17 16:22:55.255', 0, 'image for hotel', 'HO-UZRWI13SEG', 'MAIN', 'hotel1660728175198-3.jpg');
INSERT INTO "public"."hotel_image" VALUES (7, '2022-08-17 16:22:55.255', '2022-08-17 16:22:55.255', 0, 'image for hotel', 'HO-UZRWI13SEG', 'MAIN', 'hotel1660728175202-4.jpg');
INSERT INTO "public"."hotel_image" VALUES (8, '2022-08-17 16:22:55.255', '2022-08-17 16:22:55.255', 0, 'image for hotel', 'HO-UZRWI13SEG', 'MAIN', 'hotel1660728175205-5.jpg');
INSERT INTO "public"."hotel_image" VALUES (9, '2022-08-17 16:22:55.255', '2022-08-17 16:22:55.255', 0, 'image for hotel', 'HO-UZRWI13SEG', 'MAIN', 'hotel1660728175209-6.jpg');
INSERT INTO "public"."hotel_image" VALUES (10, '2022-08-17 16:22:55.256', '2022-08-17 16:22:55.256', 0, 'image for hotel', 'HO-UZRWI13SEG', 'MAIN', 'hotel1660728175214-7.jpg');
INSERT INTO "public"."hotel_image" VALUES (11, '2022-08-17 16:22:55.256', '2022-08-17 16:22:55.256', 0, 'image for hotel', 'HO-UZRWI13SEG', 'MAIN', 'hotel1660728175219-8.jpg');
INSERT INTO "public"."hotel_image" VALUES (12, '2022-08-17 16:22:55.257', '2022-08-17 16:22:55.257', 0, 'image for hotel', 'HO-UZRWI13SEG', 'MAIN', 'hotel1660728175223-9.jpg');
INSERT INTO "public"."hotel_image" VALUES (13, '2022-08-17 16:22:55.257', '2022-08-17 16:22:55.257', 0, 'image for hotel', 'HO-UZRWI13SEG', 'MAIN', 'hotel1660728175226-10.jpg');
INSERT INTO "public"."hotel_image" VALUES (14, '2022-08-17 16:22:55.257', '2022-08-17 16:22:55.257', 0, 'image for hotel', 'HO-UZRWI13SEG', 'MAIN', 'hotel1660728175230-11.jpg');
INSERT INTO "public"."hotel_image" VALUES (17, '2022-08-17 16:27:17.08', '2022-08-17 16:27:17.08', 0, 'image for hotel', 'HO-IZEIAVCJHB', 'MAIN', 'hotel1660728437017-0.jpg');
INSERT INTO "public"."hotel_image" VALUES (18, '2022-08-17 16:27:17.08', '2022-08-17 16:27:17.08', 0, 'image for hotel', 'HO-IZEIAVCJHB', 'MAIN', 'hotel1660728437022-1.jpg');
INSERT INTO "public"."hotel_image" VALUES (19, '2022-08-17 16:27:17.08', '2022-08-17 16:27:17.08', 0, 'image for hotel', 'HO-IZEIAVCJHB', 'MAIN', 'hotel1660728437027-2.jpg');
INSERT INTO "public"."hotel_image" VALUES (20, '2022-08-17 16:27:17.081', '2022-08-17 16:27:17.081', 0, 'image for hotel', 'HO-IZEIAVCJHB', 'MAIN', 'hotel1660728437032-3.jpg');
INSERT INTO "public"."hotel_image" VALUES (21, '2022-08-17 16:27:17.081', '2022-08-17 16:27:17.081', 0, 'image for hotel', 'HO-IZEIAVCJHB', 'MAIN', 'hotel1660728437035-4.jpg');
INSERT INTO "public"."hotel_image" VALUES (22, '2022-08-17 16:27:17.081', '2022-08-17 16:27:17.081', 0, 'image for hotel', 'HO-IZEIAVCJHB', 'MAIN', 'hotel1660728437039-5.jpg');
INSERT INTO "public"."hotel_image" VALUES (23, '2022-08-17 16:27:17.082', '2022-08-17 16:27:17.082', 0, 'image for hotel', 'HO-IZEIAVCJHB', 'MAIN', 'hotel1660728437043-6.jpg');
INSERT INTO "public"."hotel_image" VALUES (24, '2022-08-17 16:27:17.082', '2022-08-17 16:27:17.082', 0, 'image for hotel', 'HO-IZEIAVCJHB', 'MAIN', 'hotel1660728437047-7.jpg');
INSERT INTO "public"."hotel_image" VALUES (25, '2022-08-17 16:27:17.082', '2022-08-17 16:27:17.082', 0, 'image for hotel', 'HO-IZEIAVCJHB', 'MAIN', 'hotel1660728437050-8.jpg');
INSERT INTO "public"."hotel_image" VALUES (26, '2022-08-17 16:27:17.083', '2022-08-17 16:27:17.083', 0, 'image for hotel', 'HO-IZEIAVCJHB', 'MAIN', 'hotel1660728437053-9.jpg');
INSERT INTO "public"."hotel_image" VALUES (27, '2022-08-17 16:27:17.083', '2022-08-17 16:27:17.083', 0, 'image for hotel', 'HO-IZEIAVCJHB', 'MAIN', 'hotel1660728437056-10.jpg');
INSERT INTO "public"."hotel_image" VALUES (28, '2022-08-17 16:27:17.083', '2022-08-17 16:27:17.083', 0, 'image for hotel', 'HO-IZEIAVCJHB', 'MAIN', 'hotel1660728437059-11.jpg');
INSERT INTO "public"."hotel_image" VALUES (29, '2022-08-17 16:27:17.083', '2022-08-17 16:27:17.083', 0, 'image for hotel', 'HO-IZEIAVCJHB', 'MAIN', 'hotel1660728437063-12.jpg');
INSERT INTO "public"."hotel_image" VALUES (30, '2022-08-17 16:27:17.084', '2022-08-17 16:27:17.084', 0, 'image for hotel', 'HO-IZEIAVCJHB', 'MAIN', 'hotel1660728437066-13.jpg');
INSERT INTO "public"."hotel_image" VALUES (31, '2022-08-17 16:27:17.084', '2022-08-17 16:27:17.084', 0, 'image for hotel', 'HO-IZEIAVCJHB', 'MAIN', 'hotel1660728437069-14.jpg');
INSERT INTO "public"."hotel_image" VALUES (32, '2022-08-17 16:27:17.084', '2022-08-17 16:27:17.084', 0, 'image for hotel', 'HO-IZEIAVCJHB', 'MAIN', 'hotel1660728437072-15.jpg');
INSERT INTO "public"."hotel_image" VALUES (33, '2022-08-17 16:27:17.085', '2022-08-17 16:27:17.085', 0, 'image for hotel', 'HO-IZEIAVCJHB', 'MAIN', 'hotel1660728437076-16.jpg');
INSERT INTO "public"."hotel_image" VALUES (36, '2022-08-17 16:30:30.014', '2022-08-17 16:30:30.014', 0, 'image for hotel', 'HO-V4QN23GQW5', 'MAIN', 'hotel1660728629886-0.jpg');
INSERT INTO "public"."hotel_image" VALUES (37, '2022-08-17 16:30:30.015', '2022-08-17 16:30:30.015', 0, 'image for hotel', 'HO-V4QN23GQW5', 'MAIN', 'hotel1660728629890-1.jpg');
INSERT INTO "public"."hotel_image" VALUES (38, '2022-08-17 16:30:30.015', '2022-08-17 16:30:30.015', 0, 'image for hotel', 'HO-V4QN23GQW5', 'MAIN', 'hotel1660728629894-2.jpg');
INSERT INTO "public"."hotel_image" VALUES (39, '2022-08-17 16:30:30.015', '2022-08-17 16:30:30.015', 0, 'image for hotel', 'HO-V4QN23GQW5', 'MAIN', 'hotel1660728629898-3.jpg');
INSERT INTO "public"."hotel_image" VALUES (40, '2022-08-17 16:30:30.016', '2022-08-17 16:30:30.016', 0, 'image for hotel', 'HO-V4QN23GQW5', 'MAIN', 'hotel1660728629901-4.jpg');
INSERT INTO "public"."hotel_image" VALUES (41, '2022-08-17 16:30:30.016', '2022-08-17 16:30:30.016', 0, 'image for hotel', 'HO-V4QN23GQW5', 'MAIN', 'hotel1660728629905-5.jpg');
INSERT INTO "public"."hotel_image" VALUES (42, '2022-08-17 16:30:30.016', '2022-08-17 16:30:30.016', 0, 'image for hotel', 'HO-V4QN23GQW5', 'MAIN', 'hotel1660728629908-6.jpg');
INSERT INTO "public"."hotel_image" VALUES (43, '2022-08-17 16:30:30.016', '2022-08-17 16:30:30.016', 0, 'image for hotel', 'HO-V4QN23GQW5', 'MAIN', 'hotel1660728629913-7.jpg');
INSERT INTO "public"."hotel_image" VALUES (44, '2022-08-17 16:30:30.017', '2022-08-17 16:30:30.017', 0, 'image for hotel', 'HO-V4QN23GQW5', 'MAIN', 'hotel1660728629916-8.jpg');
INSERT INTO "public"."hotel_image" VALUES (45, '2022-08-17 16:30:30.017', '2022-08-17 16:30:30.017', 0, 'image for hotel', 'HO-V4QN23GQW5', 'MAIN', 'hotel1660728629973-9.jpg');
INSERT INTO "public"."hotel_image" VALUES (46, '2022-08-17 16:30:30.017', '2022-08-17 16:30:30.017', 0, 'image for hotel', 'HO-V4QN23GQW5', 'MAIN', 'hotel1660728629978-10.jpg');
INSERT INTO "public"."hotel_image" VALUES (47, '2022-08-17 16:30:30.017', '2022-08-17 16:30:30.017', 0, 'image for hotel', 'HO-V4QN23GQW5', 'MAIN', 'hotel1660728629981-11.jpg');
INSERT INTO "public"."hotel_image" VALUES (48, '2022-08-17 16:30:30.018', '2022-08-17 16:30:30.018', 0, 'image for hotel', 'HO-V4QN23GQW5', 'MAIN', 'hotel1660728629984-12.jpg');
INSERT INTO "public"."hotel_image" VALUES (49, '2022-08-17 16:30:30.018', '2022-08-17 16:30:30.018', 0, 'image for hotel', 'HO-V4QN23GQW5', 'MAIN', 'hotel1660728629987-13.jpg');
INSERT INTO "public"."hotel_image" VALUES (50, '2022-08-17 16:30:30.018', '2022-08-17 16:30:30.018', 0, 'image for hotel', 'HO-V4QN23GQW5', 'MAIN', 'hotel1660728629990-14.jpg');
INSERT INTO "public"."hotel_image" VALUES (51, '2022-08-17 16:30:30.018', '2022-08-17 16:30:30.018', 0, 'image for hotel', 'HO-V4QN23GQW5', 'MAIN', 'hotel1660728629994-15.jpg');
INSERT INTO "public"."hotel_image" VALUES (52, '2022-08-17 16:30:30.019', '2022-08-17 16:30:30.019', 0, 'image for hotel', 'HO-V4QN23GQW5', 'MAIN', 'hotel1660728630000-16.jpg');
INSERT INTO "public"."hotel_image" VALUES (53, '2022-08-17 16:30:30.019', '2022-08-17 16:30:30.019', 0, 'image for hotel', 'HO-V4QN23GQW5', 'MAIN', 'hotel1660728630004-17.jpg');
INSERT INTO "public"."hotel_image" VALUES (54, '2022-08-17 16:30:30.019', '2022-08-17 16:30:30.019', 0, 'image for hotel', 'HO-V4QN23GQW5', 'MAIN', 'hotel1660728630010-18.jpg');
INSERT INTO "public"."hotel_image" VALUES (58, '2022-08-17 16:34:55.499', '2022-08-17 16:34:55.499', 0, 'image for hotel', 'HO-NOVQ5D8R5C', 'MAIN', 'hotel1660728895434-0.jpg');
INSERT INTO "public"."hotel_image" VALUES (59, '2022-08-17 16:34:55.5', '2022-08-17 16:34:55.5', 0, 'image for hotel', 'HO-NOVQ5D8R5C', 'MAIN', 'hotel1660728895439-1.jpg');
INSERT INTO "public"."hotel_image" VALUES (60, '2022-08-17 16:34:55.5', '2022-08-17 16:34:55.5', 0, 'image for hotel', 'HO-NOVQ5D8R5C', 'MAIN', 'hotel1660728895443-2.jpg');
INSERT INTO "public"."hotel_image" VALUES (61, '2022-08-17 16:34:55.501', '2022-08-17 16:34:55.501', 0, 'image for hotel', 'HO-NOVQ5D8R5C', 'MAIN', 'hotel1660728895448-3.jpg');
INSERT INTO "public"."hotel_image" VALUES (62, '2022-08-17 16:34:55.501', '2022-08-17 16:34:55.501', 0, 'image for hotel', 'HO-NOVQ5D8R5C', 'MAIN', 'hotel1660728895451-4.jpg');
INSERT INTO "public"."hotel_image" VALUES (63, '2022-08-17 16:34:55.501', '2022-08-17 16:34:55.501', 0, 'image for hotel', 'HO-NOVQ5D8R5C', 'MAIN', 'hotel1660728895455-5.jpg');
INSERT INTO "public"."hotel_image" VALUES (64, '2022-08-17 16:34:55.502', '2022-08-17 16:34:55.502', 0, 'image for hotel', 'HO-NOVQ5D8R5C', 'MAIN', 'hotel1660728895459-6.jpg');
INSERT INTO "public"."hotel_image" VALUES (65, '2022-08-17 16:34:55.502', '2022-08-17 16:34:55.502', 0, 'image for hotel', 'HO-NOVQ5D8R5C', 'MAIN', 'hotel1660728895464-7.jpg');
INSERT INTO "public"."hotel_image" VALUES (66, '2022-08-17 16:34:55.502', '2022-08-17 16:34:55.502', 0, 'image for hotel', 'HO-NOVQ5D8R5C', 'MAIN', 'hotel1660728895467-8.jpg');
INSERT INTO "public"."hotel_image" VALUES (67, '2022-08-17 16:34:55.502', '2022-08-17 16:34:55.502', 0, 'image for hotel', 'HO-NOVQ5D8R5C', 'MAIN', 'hotel1660728895471-9.jpg');
INSERT INTO "public"."hotel_image" VALUES (68, '2022-08-17 16:34:55.503', '2022-08-17 16:34:55.503', 0, 'image for hotel', 'HO-NOVQ5D8R5C', 'MAIN', 'hotel1660728895475-10.jpg');
INSERT INTO "public"."hotel_image" VALUES (69, '2022-08-17 16:34:55.503', '2022-08-17 16:34:55.503', 0, 'image for hotel', 'HO-NOVQ5D8R5C', 'MAIN', 'hotel1660728895479-11.jpg');
INSERT INTO "public"."hotel_image" VALUES (70, '2022-08-17 16:34:55.503', '2022-08-17 16:34:55.503', 0, 'image for hotel', 'HO-NOVQ5D8R5C', 'MAIN', 'hotel1660728895483-12.jpg');
INSERT INTO "public"."hotel_image" VALUES (71, '2022-08-17 16:34:55.504', '2022-08-17 16:34:55.504', 0, 'image for hotel', 'HO-NOVQ5D8R5C', 'MAIN', 'hotel1660728895487-13.jpg');
INSERT INTO "public"."hotel_image" VALUES (72, '2022-08-17 16:34:55.504', '2022-08-17 16:34:55.504', 0, 'image for hotel', 'HO-NOVQ5D8R5C', 'MAIN', 'hotel1660728895491-14.jpg');
INSERT INTO "public"."hotel_image" VALUES (73, '2022-08-17 16:34:55.505', '2022-08-17 16:34:55.505', 0, 'image for hotel', 'HO-NOVQ5D8R5C', 'MAIN', 'hotel1660728895495-15.jpg');
INSERT INTO "public"."hotel_image" VALUES (84, '2022-08-25 21:57:42.831', '2022-08-25 21:57:42.831', 0, 'image for hotel', 'HO-8X27CKXSG7', 'MAIN', 'hotel1661439462787-0.jpg');
INSERT INTO "public"."hotel_image" VALUES (85, '2022-08-25 21:57:42.832', '2022-08-25 21:57:42.832', 0, 'image for hotel', 'HO-8X27CKXSG7', 'MAIN', 'hotel1661439462790-1.jpg');
INSERT INTO "public"."hotel_image" VALUES (86, '2022-08-25 21:57:42.832', '2022-08-25 21:57:42.832', 0, 'image for hotel', 'HO-8X27CKXSG7', 'MAIN', 'hotel1661439462793-2.jpg');
INSERT INTO "public"."hotel_image" VALUES (87, '2022-08-25 21:57:42.832', '2022-08-25 21:57:42.832', 0, 'image for hotel', 'HO-8X27CKXSG7', 'MAIN', 'hotel1661439462797-3.jpg');
INSERT INTO "public"."hotel_image" VALUES (88, '2022-08-25 21:57:42.833', '2022-08-25 21:57:42.833', 0, 'image for hotel', 'HO-8X27CKXSG7', 'MAIN', 'hotel1661439462800-4.jpg');
INSERT INTO "public"."hotel_image" VALUES (89, '2022-08-25 21:57:42.833', '2022-08-25 21:57:42.833', 0, 'image for hotel', 'HO-8X27CKXSG7', 'MAIN', 'hotel1661439462802-5.jpg');
INSERT INTO "public"."hotel_image" VALUES (90, '2022-08-25 21:57:42.833', '2022-08-25 21:57:42.833', 0, 'image for hotel', 'HO-8X27CKXSG7', 'MAIN', 'hotel1661439462806-6.jpg');
INSERT INTO "public"."hotel_image" VALUES (91, '2022-08-25 21:57:42.833', '2022-08-25 21:57:42.833', 0, 'image for hotel', 'HO-8X27CKXSG7', 'MAIN', 'hotel1661439462808-7.jpg');
INSERT INTO "public"."hotel_image" VALUES (92, '2022-08-25 21:57:42.834', '2022-08-25 21:57:42.834', 0, 'image for hotel', 'HO-8X27CKXSG7', 'MAIN', 'hotel1661439462812-8.jpg');
INSERT INTO "public"."hotel_image" VALUES (93, '2022-08-25 21:57:42.834', '2022-08-25 21:57:42.834', 0, 'image for hotel', 'HO-8X27CKXSG7', 'MAIN', 'hotel1661439462814-9.jpg');
INSERT INTO "public"."hotel_image" VALUES (94, '2022-08-25 21:57:42.834', '2022-08-25 21:57:42.834', 0, 'image for hotel', 'HO-8X27CKXSG7', 'MAIN', 'hotel1661439462818-10.jpg');
INSERT INTO "public"."hotel_image" VALUES (95, '2022-08-25 21:57:42.834', '2022-08-25 21:57:42.834', 0, 'image for hotel', 'HO-8X27CKXSG7', 'MAIN', 'hotel1661439462820-11.jpg');
INSERT INTO "public"."hotel_image" VALUES (96, '2022-08-25 21:57:42.834', '2022-08-25 21:57:42.834', 0, 'image for hotel', 'HO-8X27CKXSG7', 'MAIN', 'hotel1661439462822-12.jpg');
INSERT INTO "public"."hotel_image" VALUES (97, '2022-08-25 21:57:42.835', '2022-08-25 21:57:42.835', 0, 'image for hotel', 'HO-8X27CKXSG7', 'MAIN', 'hotel1661439462823-13.jpg');
INSERT INTO "public"."hotel_image" VALUES (98, '2022-08-25 21:57:42.835', '2022-08-25 21:57:42.835', 0, 'image for hotel', 'HO-8X27CKXSG7', 'MAIN', 'hotel1661439462826-14.jpg');
INSERT INTO "public"."hotel_image" VALUES (99, '2022-08-25 21:57:42.835', '2022-08-25 21:57:42.835', 0, 'image for hotel', 'HO-8X27CKXSG7', 'MAIN', 'hotel1661439462829-15.jpg');
INSERT INTO "public"."hotel_image" VALUES (103, '2022-08-25 22:06:15.263', '2022-08-25 22:06:15.263', 0, 'image for hotel', 'HO-B5KNZ2SM9Q', 'MAIN', 'hotel1661439975234-0.jpg');
INSERT INTO "public"."hotel_image" VALUES (104, '2022-08-25 22:06:15.265', '2022-08-25 22:06:15.265', 0, 'image for hotel', 'HO-B5KNZ2SM9Q', 'MAIN', 'hotel1661439975239-1.jpg');
INSERT INTO "public"."hotel_image" VALUES (105, '2022-08-25 22:06:15.266', '2022-08-25 22:06:15.266', 0, 'image for hotel', 'HO-B5KNZ2SM9Q', 'MAIN', 'hotel1661439975243-2.jpg');
INSERT INTO "public"."hotel_image" VALUES (106, '2022-08-25 22:06:15.266', '2022-08-25 22:06:15.266', 0, 'image for hotel', 'HO-B5KNZ2SM9Q', 'MAIN', 'hotel1661439975245-3.jpg');
INSERT INTO "public"."hotel_image" VALUES (107, '2022-08-25 22:06:15.267', '2022-08-25 22:06:15.267', 0, 'image for hotel', 'HO-B5KNZ2SM9Q', 'MAIN', 'hotel1661439975247-4.jpg');
INSERT INTO "public"."hotel_image" VALUES (108, '2022-08-25 22:06:15.267', '2022-08-25 22:06:15.267', 0, 'image for hotel', 'HO-B5KNZ2SM9Q', 'MAIN', 'hotel1661439975250-5.jpg');
INSERT INTO "public"."hotel_image" VALUES (109, '2022-08-25 22:06:15.268', '2022-08-25 22:06:15.268', 0, 'image for hotel', 'HO-B5KNZ2SM9Q', 'MAIN', 'hotel1661439975254-6.jpg');
INSERT INTO "public"."hotel_image" VALUES (110, '2022-08-25 22:06:15.268', '2022-08-25 22:06:15.268', 0, 'image for hotel', 'HO-B5KNZ2SM9Q', 'MAIN', 'hotel1661439975256-7.jpg');
INSERT INTO "public"."hotel_image" VALUES (111, '2022-08-25 22:06:15.268', '2022-08-25 22:06:15.268', 0, 'image for hotel', 'HO-B5KNZ2SM9Q', 'MAIN', 'hotel1661439975258-8.jpg');
INSERT INTO "public"."hotel_image" VALUES (120, '2022-09-22 23:14:28.06', '2022-09-22 23:14:28.06', 0, 'image for hotel', 'HO-LF4YHY9LSJ', 'MAIN', 'hotel1663863267976-0.jpg');
INSERT INTO "public"."hotel_image" VALUES (121, '2022-09-22 23:14:28.104', '2022-09-22 23:14:28.104', 0, 'image for hotel', 'HO-LF4YHY9LSJ', 'MAIN', 'hotel1663863267984-1.jpg');
INSERT INTO "public"."hotel_image" VALUES (122, '2022-09-22 23:14:28.104', '2022-09-22 23:14:28.104', 0, 'image for hotel', 'HO-LF4YHY9LSJ', 'MAIN', 'hotel1663863267988-2.jpg');
INSERT INTO "public"."hotel_image" VALUES (123, '2022-09-22 23:14:28.104', '2022-09-22 23:14:28.104', 0, 'image for hotel', 'HO-LF4YHY9LSJ', 'MAIN', 'hotel1663863267988-3.jpg');
INSERT INTO "public"."hotel_image" VALUES (124, '2022-09-22 23:14:28.104', '2022-09-22 23:14:28.104', 0, 'image for hotel', 'HO-LF4YHY9LSJ', 'MAIN', 'hotel1663863267992-4.jpg');
INSERT INTO "public"."hotel_image" VALUES (125, '2022-09-22 23:14:28.108', '2022-09-22 23:14:28.108', 0, 'image for hotel', 'HO-LF4YHY9LSJ', 'MAIN', 'hotel1663863267996-5.jpg');
INSERT INTO "public"."hotel_image" VALUES (126, '2022-09-22 23:14:28.108', '2022-09-22 23:14:28.108', 0, 'image for hotel', 'HO-LF4YHY9LSJ', 'MAIN', 'hotel1663863268000-6.jpg');
INSERT INTO "public"."hotel_image" VALUES (127, '2022-09-22 23:14:28.108', '2022-09-22 23:14:28.108', 0, 'image for hotel', 'HO-LF4YHY9LSJ', 'MAIN', 'hotel1663863268004-7.jpg');
INSERT INTO "public"."hotel_image" VALUES (128, '2022-09-22 23:14:28.108', '2022-09-22 23:14:28.108', 0, 'image for hotel', 'HO-LF4YHY9LSJ', 'MAIN', 'hotel1663863268004-8.jpg');
INSERT INTO "public"."hotel_image" VALUES (129, '2022-09-22 23:14:28.108', '2022-09-22 23:14:28.108', 0, 'image for hotel', 'HO-LF4YHY9LSJ', 'MAIN', 'hotel1663863268008-9.jpg');
INSERT INTO "public"."hotel_image" VALUES (130, '2022-09-22 23:14:28.108', '2022-09-22 23:14:28.108', 0, 'image for hotel', 'HO-LF4YHY9LSJ', 'MAIN', 'hotel1663863268008-10.jpg');
INSERT INTO "public"."hotel_image" VALUES (131, '2022-09-22 23:14:28.108', '2022-09-22 23:14:28.108', 0, 'image for hotel', 'HO-LF4YHY9LSJ', 'MAIN', 'hotel1663863268012-11.jpg');
INSERT INTO "public"."hotel_image" VALUES (132, '2022-09-22 23:14:28.112', '2022-09-22 23:14:28.112', 0, 'image for hotel', 'HO-LF4YHY9LSJ', 'MAIN', 'hotel1663863268012-12.png');
INSERT INTO "public"."hotel_image" VALUES (133, '2022-09-22 23:14:28.112', '2022-09-22 23:14:28.112', 0, 'image for hotel', 'HO-LF4YHY9LSJ', 'MAIN', 'hotel1663863268020-13.png');
INSERT INTO "public"."hotel_image" VALUES (134, '2022-09-22 23:14:28.112', '2022-09-22 23:14:28.112', 0, 'image for hotel', 'HO-LF4YHY9LSJ', 'MAIN', 'hotel1663863268024-14.png');
INSERT INTO "public"."hotel_image" VALUES (135, '2022-09-22 23:14:28.112', '2022-09-22 23:14:28.112', 0, 'image for hotel', 'HO-LF4YHY9LSJ', 'MAIN', 'hotel1663863268024-15.png');
INSERT INTO "public"."hotel_image" VALUES (136, '2022-09-22 23:14:28.116', '2022-09-22 23:14:28.116', 0, 'image for hotel', 'HO-LF4YHY9LSJ', 'MAIN', 'hotel1663863268024-16.jpg');
INSERT INTO "public"."hotel_image" VALUES (141, '2022-09-22 23:25:06.268', '2022-09-22 23:25:06.268', 0, 'image for hotel', 'HO-9YURVTKKMM', 'MAIN', 'hotel1663863906248-0.jpg');
INSERT INTO "public"."hotel_image" VALUES (142, '2022-09-22 23:25:06.272', '2022-09-22 23:25:06.272', 0, 'image for hotel', 'HO-9YURVTKKMM', 'MAIN', 'hotel1663863906248-1.jpg');
INSERT INTO "public"."hotel_image" VALUES (143, '2022-09-22 23:25:06.272', '2022-09-22 23:25:06.272', 0, 'image for hotel', 'HO-9YURVTKKMM', 'MAIN', 'hotel1663863906252-2.jpg');
INSERT INTO "public"."hotel_image" VALUES (144, '2022-09-22 23:25:06.272', '2022-09-22 23:25:06.272', 0, 'image for hotel', 'HO-9YURVTKKMM', 'MAIN', 'hotel1663863906252-3.jpg');
INSERT INTO "public"."hotel_image" VALUES (145, '2022-09-22 23:25:06.272', '2022-09-22 23:25:06.272', 0, 'image for hotel', 'HO-9YURVTKKMM', 'MAIN', 'hotel1663863906256-4.jpg');
INSERT INTO "public"."hotel_image" VALUES (146, '2022-09-22 23:25:06.272', '2022-09-22 23:25:06.272', 0, 'image for hotel', 'HO-9YURVTKKMM', 'MAIN', 'hotel1663863906256-5.jpg');
INSERT INTO "public"."hotel_image" VALUES (147, '2022-09-22 23:25:06.276', '2022-09-22 23:25:06.276', 0, 'image for hotel', 'HO-9YURVTKKMM', 'MAIN', 'hotel1663863906260-6.jpg');
INSERT INTO "public"."hotel_image" VALUES (148, '2022-09-22 23:25:06.276', '2022-09-22 23:25:06.276', 0, 'image for hotel', 'HO-9YURVTKKMM', 'MAIN', 'hotel1663863906260-7.jpg');
INSERT INTO "public"."hotel_image" VALUES (149, '2022-09-22 23:25:06.276', '2022-09-22 23:25:06.276', 0, 'image for hotel', 'HO-9YURVTKKMM', 'MAIN', 'hotel1663863906264-8.jpg');
INSERT INTO "public"."hotel_image" VALUES (150, '2022-09-22 23:25:06.276', '2022-09-22 23:25:06.276', 0, 'image for hotel', 'HO-9YURVTKKMM', 'MAIN', 'hotel1663863906264-9.jpg');
INSERT INTO "public"."hotel_image" VALUES (154, '2022-09-22 23:33:35.562', '2022-09-22 23:33:35.562', 0, 'image for hotel', 'HO-KDVTWE5HSY', 'MAIN', 'hotel1663864415506-0.jpg');
INSERT INTO "public"."hotel_image" VALUES (155, '2022-09-22 23:33:35.566', '2022-09-22 23:33:35.566', 0, 'image for hotel', 'HO-KDVTWE5HSY', 'MAIN', 'hotel1663864415510-1.jpg');
INSERT INTO "public"."hotel_image" VALUES (156, '2022-09-22 23:33:35.566', '2022-09-22 23:33:35.566', 0, 'image for hotel', 'HO-KDVTWE5HSY', 'MAIN', 'hotel1663864415518-2.jpg');
INSERT INTO "public"."hotel_image" VALUES (157, '2022-09-22 23:33:35.566', '2022-09-22 23:33:35.566', 0, 'image for hotel', 'HO-KDVTWE5HSY', 'MAIN', 'hotel1663864415526-3.jpg');
INSERT INTO "public"."hotel_image" VALUES (158, '2022-09-22 23:33:35.566', '2022-09-22 23:33:35.566', 0, 'image for hotel', 'HO-KDVTWE5HSY', 'MAIN', 'hotel1663864415534-4.jpg');
INSERT INTO "public"."hotel_image" VALUES (159, '2022-09-22 23:33:35.566', '2022-09-22 23:33:35.566', 0, 'image for hotel', 'HO-KDVTWE5HSY', 'MAIN', 'hotel1663864415538-5.jpg');
INSERT INTO "public"."hotel_image" VALUES (160, '2022-09-22 23:33:35.566', '2022-09-22 23:33:35.566', 0, 'image for hotel', 'HO-KDVTWE5HSY', 'MAIN', 'hotel1663864415542-6.jpg');
INSERT INTO "public"."hotel_image" VALUES (161, '2022-09-22 23:33:35.566', '2022-09-22 23:33:35.566', 0, 'image for hotel', 'HO-KDVTWE5HSY', 'MAIN', 'hotel1663864415546-7.jpg');
INSERT INTO "public"."hotel_image" VALUES (162, '2022-09-22 23:33:35.57', '2022-09-22 23:33:35.57', 0, 'image for hotel', 'HO-KDVTWE5HSY', 'MAIN', 'hotel1663864415550-8.jpg');
INSERT INTO "public"."hotel_image" VALUES (163, '2022-09-22 23:33:35.57', '2022-09-22 23:33:35.57', 0, 'image for hotel', 'HO-KDVTWE5HSY', 'MAIN', 'hotel1663864415554-9.jpg');
INSERT INTO "public"."hotel_image" VALUES (164, '2022-09-22 23:33:35.57', '2022-09-22 23:33:35.57', 0, 'image for hotel', 'HO-KDVTWE5HSY', 'MAIN', 'hotel1663864415558-10.jpg');
INSERT INTO "public"."hotel_image" VALUES (168, '2022-09-22 23:39:43.352', '2022-09-22 23:39:43.352', 0, 'image for hotel', 'HO-IP1YBYHZ34', 'MAIN', 'hotel1663864783281-0.jpg');
INSERT INTO "public"."hotel_image" VALUES (169, '2022-09-22 23:39:43.352', '2022-09-22 23:39:43.352', 0, 'image for hotel', 'HO-IP1YBYHZ34', 'MAIN', 'hotel1663864783293-1.jpg');
INSERT INTO "public"."hotel_image" VALUES (170, '2022-09-22 23:39:43.352', '2022-09-22 23:39:43.352', 0, 'image for hotel', 'HO-IP1YBYHZ34', 'MAIN', 'hotel1663864783297-2.jpg');
INSERT INTO "public"."hotel_image" VALUES (171, '2022-09-22 23:39:43.352', '2022-09-22 23:39:43.352', 0, 'image for hotel', 'HO-IP1YBYHZ34', 'MAIN', 'hotel1663864783305-3.jpg');
INSERT INTO "public"."hotel_image" VALUES (172, '2022-09-22 23:39:43.352', '2022-09-22 23:39:43.352', 0, 'image for hotel', 'HO-IP1YBYHZ34', 'MAIN', 'hotel1663864783309-4.jpg');
INSERT INTO "public"."hotel_image" VALUES (173, '2022-09-22 23:39:43.352', '2022-09-22 23:39:43.352', 0, 'image for hotel', 'HO-IP1YBYHZ34', 'MAIN', 'hotel1663864783317-5.jpg');
INSERT INTO "public"."hotel_image" VALUES (174, '2022-09-22 23:39:43.356', '2022-09-22 23:39:43.356', 0, 'image for hotel', 'HO-IP1YBYHZ34', 'MAIN', 'hotel1663864783321-6.jpg');
INSERT INTO "public"."hotel_image" VALUES (175, '2022-09-22 23:39:43.356', '2022-09-22 23:39:43.356', 0, 'image for hotel', 'HO-IP1YBYHZ34', 'MAIN', 'hotel1663864783325-7.jpg');
INSERT INTO "public"."hotel_image" VALUES (176, '2022-09-22 23:39:43.356', '2022-09-22 23:39:43.356', 0, 'image for hotel', 'HO-IP1YBYHZ34', 'MAIN', 'hotel1663864783328-8.jpg');
INSERT INTO "public"."hotel_image" VALUES (177, '2022-09-22 23:39:43.356', '2022-09-22 23:39:43.356', 0, 'image for hotel', 'HO-IP1YBYHZ34', 'MAIN', 'hotel1663864783332-9.jpg');
INSERT INTO "public"."hotel_image" VALUES (178, '2022-09-22 23:39:43.356', '2022-09-22 23:39:43.356', 0, 'image for hotel', 'HO-IP1YBYHZ34', 'MAIN', 'hotel1663864783340-10.jpg');
INSERT INTO "public"."hotel_image" VALUES (179, '2022-09-22 23:39:43.356', '2022-09-22 23:39:43.356', 0, 'image for hotel', 'HO-IP1YBYHZ34', 'MAIN', 'hotel1663864783344-11.jpg');
INSERT INTO "public"."hotel_image" VALUES (180, '2022-09-22 23:39:43.356', '2022-09-22 23:39:43.356', 0, 'image for hotel', 'HO-IP1YBYHZ34', 'MAIN', 'hotel1663864783349-12.jpg');
INSERT INTO "public"."hotel_image" VALUES (183, '2022-09-22 23:44:58.935', '2022-09-22 23:44:58.935', 0, 'image for hotel', 'HO-GWJZTZF5WS', 'MAIN', 'hotel1663865098863-0.jpg');
INSERT INTO "public"."hotel_image" VALUES (184, '2022-09-22 23:44:58.939', '2022-09-22 23:44:58.939', 0, 'image for hotel', 'HO-GWJZTZF5WS', 'MAIN', 'hotel1663865098871-1.jpg');
INSERT INTO "public"."hotel_image" VALUES (185, '2022-09-22 23:44:58.939', '2022-09-22 23:44:58.939', 0, 'image for hotel', 'HO-GWJZTZF5WS', 'MAIN', 'hotel1663865098875-2.jpg');
INSERT INTO "public"."hotel_image" VALUES (186, '2022-09-22 23:44:58.939', '2022-09-22 23:44:58.939', 0, 'image for hotel', 'HO-GWJZTZF5WS', 'MAIN', 'hotel1663865098883-3.jpg');
INSERT INTO "public"."hotel_image" VALUES (187, '2022-09-22 23:44:58.939', '2022-09-22 23:44:58.939', 0, 'image for hotel', 'HO-GWJZTZF5WS', 'MAIN', 'hotel1663865098887-4.jpg');
INSERT INTO "public"."hotel_image" VALUES (188, '2022-09-22 23:44:58.939', '2022-09-22 23:44:58.939', 0, 'image for hotel', 'HO-GWJZTZF5WS', 'MAIN', 'hotel1663865098895-5.jpg');
INSERT INTO "public"."hotel_image" VALUES (189, '2022-09-22 23:44:58.939', '2022-09-22 23:44:58.939', 0, 'image for hotel', 'HO-GWJZTZF5WS', 'MAIN', 'hotel1663865098903-6.jpg');
INSERT INTO "public"."hotel_image" VALUES (190, '2022-09-22 23:44:58.939', '2022-09-22 23:44:58.939', 0, 'image for hotel', 'HO-GWJZTZF5WS', 'MAIN', 'hotel1663865098903-7.jpg');
INSERT INTO "public"."hotel_image" VALUES (191, '2022-09-22 23:44:58.939', '2022-09-22 23:44:58.939', 0, 'image for hotel', 'HO-GWJZTZF5WS', 'MAIN', 'hotel1663865098911-8.jpg');
INSERT INTO "public"."hotel_image" VALUES (192, '2022-09-22 23:44:58.939', '2022-09-22 23:44:58.939', 0, 'image for hotel', 'HO-GWJZTZF5WS', 'MAIN', 'hotel1663865098915-9.jpg');
INSERT INTO "public"."hotel_image" VALUES (193, '2022-09-22 23:44:58.939', '2022-09-22 23:44:58.939', 0, 'image for hotel', 'HO-GWJZTZF5WS', 'MAIN', 'hotel1663865098919-10.jpg');
INSERT INTO "public"."hotel_image" VALUES (194, '2022-09-22 23:44:58.943', '2022-09-22 23:44:58.943', 0, 'image for hotel', 'HO-GWJZTZF5WS', 'MAIN', 'hotel1663865098927-11.jpg');
INSERT INTO "public"."hotel_image" VALUES (195, '2022-09-22 23:44:58.943', '2022-09-22 23:44:58.943', 0, 'image for hotel', 'HO-GWJZTZF5WS', 'MAIN', 'hotel1663865098931-12.jpg');
INSERT INTO "public"."hotel_image" VALUES (199, '2022-09-22 23:50:44.524', '2022-09-22 23:50:44.524', 0, 'image for hotel', 'HO-JNME4BD5SM', 'MAIN', 'hotel1663865444448-0.jpg');
INSERT INTO "public"."hotel_image" VALUES (200, '2022-09-22 23:50:44.528', '2022-09-22 23:50:44.528', 0, 'image for hotel', 'HO-JNME4BD5SM', 'MAIN', 'hotel1663865444456-1.jpg');
INSERT INTO "public"."hotel_image" VALUES (201, '2022-09-22 23:50:44.528', '2022-09-22 23:50:44.528', 0, 'image for hotel', 'HO-JNME4BD5SM', 'MAIN', 'hotel1663865444464-2.jpg');
INSERT INTO "public"."hotel_image" VALUES (202, '2022-09-22 23:50:44.528', '2022-09-22 23:50:44.528', 0, 'image for hotel', 'HO-JNME4BD5SM', 'MAIN', 'hotel1663865444468-3.jpg');
INSERT INTO "public"."hotel_image" VALUES (203, '2022-09-22 23:50:44.528', '2022-09-22 23:50:44.528', 0, 'image for hotel', 'HO-JNME4BD5SM', 'MAIN', 'hotel1663865444480-4.jpg');
INSERT INTO "public"."hotel_image" VALUES (204, '2022-09-22 23:50:44.528', '2022-09-22 23:50:44.528', 0, 'image for hotel', 'HO-JNME4BD5SM', 'MAIN', 'hotel1663865444484-5.jpg');
INSERT INTO "public"."hotel_image" VALUES (205, '2022-09-22 23:50:44.528', '2022-09-22 23:50:44.528', 0, 'image for hotel', 'HO-JNME4BD5SM', 'MAIN', 'hotel1663865444492-6.jpg');
INSERT INTO "public"."hotel_image" VALUES (206, '2022-09-22 23:50:44.528', '2022-09-22 23:50:44.528', 0, 'image for hotel', 'HO-JNME4BD5SM', 'MAIN', 'hotel1663865444500-7.jpg');
INSERT INTO "public"."hotel_image" VALUES (207, '2022-09-22 23:50:44.528', '2022-09-22 23:50:44.528', 0, 'image for hotel', 'HO-JNME4BD5SM', 'MAIN', 'hotel1663865444508-8.jpg');
INSERT INTO "public"."hotel_image" VALUES (208, '2022-09-22 23:50:44.528', '2022-09-22 23:50:44.528', 0, 'image for hotel', 'HO-JNME4BD5SM', 'MAIN', 'hotel1663865444512-9.jpg');
INSERT INTO "public"."hotel_image" VALUES (209, '2022-09-22 23:50:44.528', '2022-09-22 23:50:44.528', 0, 'image for hotel', 'HO-JNME4BD5SM', 'MAIN', 'hotel1663865444520-10.jpg');
INSERT INTO "public"."hotel_image" VALUES (213, '2022-09-22 23:57:39.313', '2022-09-22 23:57:39.313', 0, 'image for hotel', 'HO-JGH7MZA8BX', 'MAIN', 'hotel1663865859253-0.jpg');
INSERT INTO "public"."hotel_image" VALUES (214, '2022-09-22 23:57:39.313', '2022-09-22 23:57:39.313', 0, 'image for hotel', 'HO-JGH7MZA8BX', 'MAIN', 'hotel1663865859261-1.jpg');
INSERT INTO "public"."hotel_image" VALUES (215, '2022-09-22 23:57:39.317', '2022-09-22 23:57:39.317', 0, 'image for hotel', 'HO-JGH7MZA8BX', 'MAIN', 'hotel1663865859265-2.jpg');
INSERT INTO "public"."hotel_image" VALUES (216, '2022-09-22 23:57:39.317', '2022-09-22 23:57:39.317', 0, 'image for hotel', 'HO-JGH7MZA8BX', 'MAIN', 'hotel1663865859269-3.jpg');
INSERT INTO "public"."hotel_image" VALUES (217, '2022-09-22 23:57:39.317', '2022-09-22 23:57:39.317', 0, 'image for hotel', 'HO-JGH7MZA8BX', 'MAIN', 'hotel1663865859273-4.jpg');
INSERT INTO "public"."hotel_image" VALUES (218, '2022-09-22 23:57:39.317', '2022-09-22 23:57:39.317', 0, 'image for hotel', 'HO-JGH7MZA8BX', 'MAIN', 'hotel1663865859277-5.jpg');
INSERT INTO "public"."hotel_image" VALUES (219, '2022-09-22 23:57:39.317', '2022-09-22 23:57:39.317', 0, 'image for hotel', 'HO-JGH7MZA8BX', 'MAIN', 'hotel1663865859281-6.jpg');
INSERT INTO "public"."hotel_image" VALUES (220, '2022-09-22 23:57:39.317', '2022-09-22 23:57:39.317', 0, 'image for hotel', 'HO-JGH7MZA8BX', 'MAIN', 'hotel1663865859285-7.jpg');
INSERT INTO "public"."hotel_image" VALUES (221, '2022-09-22 23:57:39.317', '2022-09-22 23:57:39.317', 0, 'image for hotel', 'HO-JGH7MZA8BX', 'MAIN', 'hotel1663865859293-8.jpg');
INSERT INTO "public"."hotel_image" VALUES (222, '2022-09-22 23:57:39.317', '2022-09-22 23:57:39.317', 0, 'image for hotel', 'HO-JGH7MZA8BX', 'MAIN', 'hotel1663865859297-9.jpg');
INSERT INTO "public"."hotel_image" VALUES (223, '2022-09-22 23:57:39.317', '2022-09-22 23:57:39.317', 0, 'image for hotel', 'HO-JGH7MZA8BX', 'MAIN', 'hotel1663865859301-10.jpg');
INSERT INTO "public"."hotel_image" VALUES (224, '2022-09-22 23:57:39.317', '2022-09-22 23:57:39.317', 0, 'image for hotel', 'HO-JGH7MZA8BX', 'MAIN', 'hotel1663865859305-11.jpg');
INSERT INTO "public"."hotel_image" VALUES (225, '2022-09-22 23:57:39.317', '2022-09-22 23:57:39.317', 0, 'image for hotel', 'HO-JGH7MZA8BX', 'MAIN', 'hotel1663865859305-12.jpg');
INSERT INTO "public"."hotel_image" VALUES (228, '2022-09-23 00:01:37.601', '2022-09-23 00:01:37.601', 0, 'image for hotel', 'HO-B2J7FZ6UGW', 'MAIN', 'hotel1663866097544-0.jpg');
INSERT INTO "public"."hotel_image" VALUES (229, '2022-09-23 00:01:37.601', '2022-09-23 00:01:37.601', 0, 'image for hotel', 'HO-B2J7FZ6UGW', 'MAIN', 'hotel1663866097544-1.jpg');
INSERT INTO "public"."hotel_image" VALUES (230, '2022-09-23 00:01:37.601', '2022-09-23 00:01:37.601', 0, 'image for hotel', 'HO-B2J7FZ6UGW', 'MAIN', 'hotel1663866097552-2.jpg');
INSERT INTO "public"."hotel_image" VALUES (231, '2022-09-23 00:01:37.605', '2022-09-23 00:01:37.605', 0, 'image for hotel', 'HO-B2J7FZ6UGW', 'MAIN', 'hotel1663866097556-3.jpg');
INSERT INTO "public"."hotel_image" VALUES (232, '2022-09-23 00:01:37.605', '2022-09-23 00:01:37.605', 0, 'image for hotel', 'HO-B2J7FZ6UGW', 'MAIN', 'hotel1663866097564-4.jpg');
INSERT INTO "public"."hotel_image" VALUES (233, '2022-09-23 00:01:37.605', '2022-09-23 00:01:37.605', 0, 'image for hotel', 'HO-B2J7FZ6UGW', 'MAIN', 'hotel1663866097568-5.jpg');
INSERT INTO "public"."hotel_image" VALUES (234, '2022-09-23 00:01:37.605', '2022-09-23 00:01:37.605', 0, 'image for hotel', 'HO-B2J7FZ6UGW', 'MAIN', 'hotel1663866097572-6.jpg');
INSERT INTO "public"."hotel_image" VALUES (235, '2022-09-23 00:01:37.605', '2022-09-23 00:01:37.605', 0, 'image for hotel', 'HO-B2J7FZ6UGW', 'MAIN', 'hotel1663866097580-7.jpg');
INSERT INTO "public"."hotel_image" VALUES (236, '2022-09-23 00:01:37.605', '2022-09-23 00:01:37.605', 0, 'image for hotel', 'HO-B2J7FZ6UGW', 'MAIN', 'hotel1663866097584-8.jpg');
INSERT INTO "public"."hotel_image" VALUES (237, '2022-09-23 00:01:37.605', '2022-09-23 00:01:37.605', 0, 'image for hotel', 'HO-B2J7FZ6UGW', 'MAIN', 'hotel1663866097589-9.jpg');
INSERT INTO "public"."hotel_image" VALUES (238, '2022-09-23 00:01:37.605', '2022-09-23 00:01:37.605', 0, 'image for hotel', 'HO-B2J7FZ6UGW', 'MAIN', 'hotel1663866097593-10.jpg');
INSERT INTO "public"."hotel_image" VALUES (241, '2022-09-23 00:11:01.838', '2022-09-23 00:11:01.838', 0, 'image for hotel', 'HO-WNPHPT97U6', 'MAIN', 'hotel1663866661787-0.jpg');
INSERT INTO "public"."hotel_image" VALUES (242, '2022-09-23 00:11:01.838', '2022-09-23 00:11:01.838', 0, 'image for hotel', 'HO-WNPHPT97U6', 'MAIN', 'hotel1663866661787-1.jpg');
INSERT INTO "public"."hotel_image" VALUES (243, '2022-09-23 00:11:01.838', '2022-09-23 00:11:01.838', 0, 'image for hotel', 'HO-WNPHPT97U6', 'MAIN', 'hotel1663866661794-2.jpg');
INSERT INTO "public"."hotel_image" VALUES (244, '2022-09-23 00:11:01.842', '2022-09-23 00:11:01.842', 0, 'image for hotel', 'HO-WNPHPT97U6', 'MAIN', 'hotel1663866661802-3.jpg');
INSERT INTO "public"."hotel_image" VALUES (245, '2022-09-23 00:11:01.842', '2022-09-23 00:11:01.842', 0, 'image for hotel', 'HO-WNPHPT97U6', 'MAIN', 'hotel1663866661806-4.jpg');
INSERT INTO "public"."hotel_image" VALUES (246, '2022-09-23 00:11:01.842', '2022-09-23 00:11:01.842', 0, 'image for hotel', 'HO-WNPHPT97U6', 'MAIN', 'hotel1663866661810-5.jpg');
INSERT INTO "public"."hotel_image" VALUES (247, '2022-09-23 00:11:01.842', '2022-09-23 00:11:01.842', 0, 'image for hotel', 'HO-WNPHPT97U6', 'MAIN', 'hotel1663866661814-6.jpg');
INSERT INTO "public"."hotel_image" VALUES (248, '2022-09-23 00:11:01.842', '2022-09-23 00:11:01.842', 0, 'image for hotel', 'HO-WNPHPT97U6', 'MAIN', 'hotel1663866661822-7.jpg');
INSERT INTO "public"."hotel_image" VALUES (249, '2022-09-23 00:11:01.842', '2022-09-23 00:11:01.842', 0, 'image for hotel', 'HO-WNPHPT97U6', 'MAIN', 'hotel1663866661826-8.jpg');
INSERT INTO "public"."hotel_image" VALUES (250, '2022-09-23 00:11:01.842', '2022-09-23 00:11:01.842', 0, 'image for hotel', 'HO-WNPHPT97U6', 'MAIN', 'hotel1663866661834-9.jpg');

-- ----------------------------
-- Table structure for hotel_receipt
-- ----------------------------
DROP TABLE IF EXISTS "public"."hotel_receipt";
CREATE TABLE "public"."hotel_receipt" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6),
  "updated_at" timestamp(6),
  "version" int4 NOT NULL,
  "booking_id" varchar(255) COLLATE "pg_catalog"."default",
  "from_date" int4,
  "to_date" int4,
  "hotel_info" jsonb,
  "package_info" jsonb,
  "partner_id" varchar(255) COLLATE "pg_catalog"."default",
  "phone_partner" varchar(255) COLLATE "pg_catalog"."default",
  "price" float8,
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "total_nights" int4,
  "user_id" varchar(255) COLLATE "pg_catalog"."default",
  "contact_id" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of hotel_receipt
-- ----------------------------
INSERT INTO "public"."hotel_receipt" VALUES ('cc7873f1-167f-478a-9fe9-7bacb2c33b12', '2022-09-23 00:29:08.373', '2022-09-23 00:31:10.12', 3, 'L8DBWB8J', 20220923, 20221007, '{"id": "9541ccdc-9011-4821-93ea-fa50c1e77abc", "code": "HO-WNPHPT97U6", "rank": 4, "slug": "fusion-resort-cam-ranhho-wnphpt97u6", "star": 3.0, "title": "Fusion Resort Cam Ranh", "userId": "81e13f19-29ac-411f-9c34-16ae8315ff84", "address": "Lô D10, Bán đảo Bắc Cam Ranh,, Cam Lam, Vietnam", "minPrice": 5000000.0, "amenities": [], "hotelType": "POPULAR", "imagesList": ["hotel1663866661787-0.jpg", "hotel1663866661787-1.jpg", "hotel1663866661794-2.jpg", "hotel1663866661802-3.jpg", "hotel1663866661806-4.jpg", "hotel1663866661810-5.jpg", "hotel1663866661814-6.jpg", "hotel1663866661822-7.jpg", "hotel1663866661826-8.jpg", "hotel1663866661834-9.jpg"], "description": "Fusion Resort Cam Ranh ở Cam Lâm, gần biển, cách Bãi biển Nha Trang và Bãi biển Bãi Dài 15 phút lái xe. Resort 5 sao này cách Vịnh Cam Ranh 8,7 mi (14 km) và Bãi biển Mỹ Ca 8,8 mi (14,1 km). Hãy nghỉ ngơi thoải mái như đang ở nhà mình tại một trong 122 phòng trang trí khác biệt với minibar và TV LCD. Các phòng có sân riêng. Truy cập Internet không dây miễn phí giúp quý vị luôn giữ liên lạc; trong khi các chương trình truyền hình cáp sẽ mang đến những phút giây giải trí thoải mái. Phòng tắm với bồn tắm và buồng tắm vòi sen riêng được trang bị bồn tắm và vòi sen phun mưa. Có nhiều dịch vụ, tiện ích dành cho khách, bao gồm quầy tiếp tân phục vụ 24 giờ/ngày, nhân viên thông thạo nhiều ngôn ngữ và dịch vụ trông giữ/bảo quản hành lý. Xe đưa đón sân bay phục vụ 24 giờ với phụ phí, bên cạnh đó cũng có bãi đậu xe có người phục vụ miễn phí trong khuôn viên.", "phonePartner": null, "approveStatus": "APPROVED"}', '{"id": 251, "image": "hotel-room-1663866710154.jpg", "price": 5000000.0, "endDate": null, "currency": "VNĐ", "roomType": "SUITE", "available": true, "hotelCode": "HO-WNPHPT97U6", "startDate": null, "hotelOptionCode": "Hideaway Pool Villa - All Spa Inclusive"}', '81e13f19-29ac-411f-9c34-16ae8315ff84', '0348970889', 70000000, 'BOOKING_APPROVED', 14, 'e67e5e7d-70c8-41b8-8c78-3009afd17356', '7f3a3b1d-5fe3-4b7c-a90d-190027914ed3');
INSERT INTO "public"."hotel_receipt" VALUES ('c9b45e7c-d226-47a5-91fb-04c1fa6a8de1', '2022-09-23 00:33:46.679', '2022-09-23 00:34:52.648', 1, 'L8DC2A0L', 20220923, 20220924, '{"id": "e7ad99a2-37fd-4275-91c1-c290c5c6c68d", "code": "HO-B2J7FZ6UGW", "rank": 4, "slug": "six-senses-ninh-van-bayho-b2j7fz6ugw", "star": 2.0, "title": "Six Senses Ninh Van Bay", "userId": "81e13f19-29ac-411f-9c34-16ae8315ff84", "address": "Vịnh Ninh Vân, Ninh Hoa, Vietnam", "minPrice": 3000000.0, "amenities": [5, 4, 3], "hotelType": "POPULAR", "imagesList": ["hotel1663866097544-0.jpg", "hotel1663866097544-1.jpg", "hotel1663866097552-2.jpg", "hotel1663866097556-3.jpg", "hotel1663866097564-4.jpg", "hotel1663866097568-5.jpg", "hotel1663866097572-6.jpg", "hotel1663866097580-7.jpg", "hotel1663866097584-8.jpg", "hotel1663866097589-9.jpg", "hotel1663866097593-10.jpg"], "description": "Six Senses Ninh Van Bay ở Ninh Hòa, gần vịnh và chỉ cách Vịnh Ninh Vân vài bước. Resort 5 sao này nằm cùng khu vực với Cảng cá Vĩnh Lương và Bãi Dương. Hãy nghỉ ngơi thoải mái như đang ở nhà mình tại một trong 62 phòng được trang bị máy điều hòa cùng hồ bơi riêng và TV màn hình phẳng. Các phòng có sân riêng. Các chương trình truyền hình vệ tinh và đầu đĩa DVD sẽ giúp quý vị có những giây phút giải trí thoải mái; song song đó, truy cập Internet không dây miễn phí giúp quý vị luôn kết nối. Tiện nghi phòng bao gồm điện thoại, cùng két bảo mật đặt được máy tính xách tay và bàn. Có nhiều dịch vụ, tiện ích dành cho khách, bao gồm dịch vụ xe limo/xe đưa đón hạng sang, máy vi tính và báo miễn phí ở sảnh. Khu vực phục vụ hội thảo, sự kiện tại resort này bao gồm trung tâm hội nghị và phòng họp. Xe đưa đón sân bay phục vụ 24 giờ với phụ phí.", "phonePartner": null, "approveStatus": "APPROVED"}', '{"id": 239, "image": "hotel-room-1663866115353.jpg", "price": 5000000.0, "endDate": null, "currency": "VNĐ", "roomType": "DOUBLE", "available": true, "hotelCode": "HO-B2J7FZ6UGW", "startDate": null, "hotelOptionCode": "The Rock Retreat"}', '81e13f19-29ac-411f-9c34-16ae8315ff84', '0348970889', 5000000, 'BOOKING_APPROVED', 1, 'e67e5e7d-70c8-41b8-8c78-3009afd17356', '5166f337-576f-4750-a639-94361d556715');
INSERT INTO "public"."hotel_receipt" VALUES ('a3dfa207-35ac-4898-a74f-a2ab0507357a', '2022-09-24 23:02:57.1', '2022-09-24 23:04:27.428', 1, 'L8G3P6E5', 20220924, 20220926, '{"id": "9541ccdc-9011-4821-93ea-fa50c1e77abc", "code": "HO-WNPHPT97U6", "rank": 4, "slug": "fusion-resort-cam-ranhho-wnphpt97u6", "star": 3.0, "title": "Fusion Resort Cam Ranh", "userId": "81e13f19-29ac-411f-9c34-16ae8315ff84", "address": "Lô D10, Bán đảo Bắc Cam Ranh,, Cam Lam, Vietnam", "minPrice": 5000000.0, "amenities": [], "hotelType": "POPULAR", "imagesList": ["hotel1663866661787-0.jpg", "hotel1663866661787-1.jpg", "hotel1663866661794-2.jpg", "hotel1663866661802-3.jpg", "hotel1663866661806-4.jpg", "hotel1663866661810-5.jpg", "hotel1663866661814-6.jpg", "hotel1663866661822-7.jpg", "hotel1663866661826-8.jpg", "hotel1663866661834-9.jpg"], "description": "Fusion Resort Cam Ranh ở Cam Lâm, gần biển, cách Bãi biển Nha Trang và Bãi biển Bãi Dài 15 phút lái xe. Resort 5 sao này cách Vịnh Cam Ranh 8,7 mi (14 km) và Bãi biển Mỹ Ca 8,8 mi (14,1 km). Hãy nghỉ ngơi thoải mái như đang ở nhà mình tại một trong 122 phòng trang trí khác biệt với minibar và TV LCD. Các phòng có sân riêng. Truy cập Internet không dây miễn phí giúp quý vị luôn giữ liên lạc; trong khi các chương trình truyền hình cáp sẽ mang đến những phút giây giải trí thoải mái. Phòng tắm với bồn tắm và buồng tắm vòi sen riêng được trang bị bồn tắm và vòi sen phun mưa. Có nhiều dịch vụ, tiện ích dành cho khách, bao gồm quầy tiếp tân phục vụ 24 giờ/ngày, nhân viên thông thạo nhiều ngôn ngữ và dịch vụ trông giữ/bảo quản hành lý. Xe đưa đón sân bay phục vụ 24 giờ với phụ phí, bên cạnh đó cũng có bãi đậu xe có người phục vụ miễn phí trong khuôn viên.", "phonePartner": null, "approveStatus": "APPROVED"}', '{"id": 251, "image": "hotel-room-1663866710154.jpg", "price": 5000000.0, "endDate": null, "currency": "VNĐ", "roomType": "SUITE", "available": true, "hotelCode": "HO-WNPHPT97U6", "startDate": null, "hotelOptionCode": "Hideaway Pool Villa - All Spa Inclusive"}', '81e13f19-29ac-411f-9c34-16ae8315ff84', '0348970889', 10000000, 'BOOKING_APPROVED', 2, 'e67e5e7d-70c8-41b8-8c78-3009afd17356', '3f3458fe-5fb7-4626-8f6a-24ab8040f171');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS "public"."post";
CREATE TABLE "public"."post" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6),
  "updated_at" timestamp(6),
  "version" int4 NOT NULL,
  "content" text COLLATE "pg_catalog"."default",
  "image" varchar(255) COLLATE "pg_catalog"."default",
  "title" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO "public"."post" VALUES ('aafcc8a2-c319-4add-8170-0f5367a05481', '2022-09-13 23:36:54.822978', '2022-09-13 23:36:54.822978', 0, 'Không phải ngẫu nhiên mà hòn ngọc Phú Quốc được mệnh danh là thiên đường du lịch. Du lịch Phú Quốc nổi tiếng với những bãi biển đẹp, hoang sơ như Bãi Sao, Bãi Dài, Gành Dầu,... cùng nhiều điểm vui chơi hấp dẫn như VinWonders Phú Quốc, Vinpearl Safari, cùng các địa điểm du lịch Phú Quốc nổi tiếng như vườn tiêu, chợ đêm, Dinh Cậu, suối Tranh,... Đến đây, du khách còn được thưởng thức nhiều món ngon đậm đà hương vị biển như hải sâm, tiết canh cua, gỏi cá trích,....Đặc biệt, nghỉ dưỡng tại Vinpearl Phú Quốc sẽ giúp chuyến đi của bạn trọn vẹn hơn bao giờ hết. Với không gian tinh tế, các dịch vụ, tiện ích đạt chuẩn 5 sao quốc tế, Vinpearl Phú Quốc chắc chắn sẽ đem đến cho bạn những khoảnh khắc thư giãn tuyệt vời.
', '-post1663087014752.jpg', 'Điểm du lịch Phú Quốc');
INSERT INTO "public"."post" VALUES ('2d562875-d093-4cee-84ac-61952f70b677', '2022-09-13 23:37:26.43427', '2022-09-13 23:37:26.43427', 0, 'Vẻ đẹp tựa như tranh của địa điểm du lịch Nha Trang để lại ấn tượng khó phai trong lòng du khách. Đến với thành phố biển xinh đẹp này, bạn sẽ được chiêm ngưỡng cảnh quan thiên nhiên tuyệt đẹp của vịnh Vân Phong, vịnh Ninh Vân, đảo Điệp Sơn,... Check in nhiều địa điểm thú vị của thành phố như Hòn Chồng, Tháp bà Ponagar, Viện Hải Dương học,... Đừng quên thưởng thức nhiều món đặc sản thơm ngon như cá nướng ớt xiêm xanh, bún sứa, bánh xèo mực,...', '-post1663087046423.jpg', 'Địa điểm du lịch Nha Trang');
INSERT INTO "public"."post" VALUES ('2c586321-8874-4b39-9aeb-c40aec5da24a', '2022-09-13 23:38:05.370733', '2022-09-13 23:38:05.370733', 0, 'Hội An là một trong những điểm đến hàng đầu của miền Trung với nhiều thắng cảnh đẹp cùng nền ẩm thực độc đáo. Du lịch Hội An, du khách có dịp chiêm ngưỡng những di sản kiến trúc độc đáo có từ hàng trăm năm trước như các ngôi nhà cổ, bảo tàng, chùa chiền,...

Hội An còn là nơi hội tụ của nhiều điểm tham quan, vui chơi hấp dẫn như Cù Lao Chàm, biển Cửa Đại, thánh địa Mỹ Sơn, làng rau Trà Quế,... Ngoài cảnh đẹp, ẩm thực nơi đây cũng khiến nhiều du khách mê mẩn với những món ngon như cao lầu, mì Quảng, hoành thánh,...', '-post1663087085360.jpg', 'Hội An - Địa điểm du lịch hút khách bậc nhất Việt Nam');
INSERT INTO "public"."post" VALUES ('3283872d-87fe-4e4f-a635-fec8a914905e', '2022-09-13 23:38:38.757164', '2022-09-13 23:38:38.757164', 0, 'Trong hành trình khám phá miền Trung Việt Nam, bạn không thể nào bỏ qua địa điểm du lịch Đà Nẵng. Đây là thành phố của nhiều cây cầu đẹp như cầu sông Hàn, cầu Rồng, cầu Thuận Phước, cầu tình yêu; những bãi biển hoang sơ, thơ mộng như biển Mỹ Khê, biển Non Nước, biển Xuân Thiều,... cùng nhiều thắng cảnh đẹp khác như núi Ngũ Hành Sơn, bán đảo Sơn Trà, Ghềnh Bàng,... Không chỉ có cảnh đẹp, nơi đây còn níu chân du khách bởi nhiều món ngon Đà Nẵng hấp dẫn như bún mắm nêm, bê thui, mì Quảng, cơm gà,...', '-post1663087118740.jpg', 'Địa điểm du lịch Đà Nẵng');
INSERT INTO "public"."post" VALUES ('3f0df9f2-0e24-41f9-ba63-4f6a62200af7', '2022-09-13 23:39:08.687287', '2022-09-13 23:39:08.687287', 0, 'Địa điểm du lịch Hạ Long Quảng Ninh là một trong những điểm đến hấp dẫn bậc nhất nước ta. Với diện tích lên đến 1.553km2 bao gồm 1.900 hòn đảo đá vôi mang nhiều hình thù đẹp mắt, sinh động. 

Du lịch Hạ Long - 1 trong 7 kỳ quan thiên nhiên thế giới, du khách sẽ được khám phá nhiều hang động độc đáo, các hòn đảo tuyệt đẹp như đảo Mắt Rồng, Ngọc Vừng, hòn Con Cóc,... Cùng với cảnh đẹp, nơi đây còn có nhiều món đặc sản thơm ngon như chả mực, sá sùng, hàu nướng, chả rươi, sam biển,...', '-post1663087148677.jpg', 'Điểm du lịch nổi tiếng Hạ Long Quảng Ninh');
INSERT INTO "public"."post" VALUES ('c6ea29bd-f768-4bab-9e99-029e2802c366', '2022-09-13 23:39:53.496807', '2022-09-13 23:39:53.496807', 0, 'Sài Gòn là thành phố năng động, sầm uất bậc nhất nước ta. Đến với địa điểm du lịch Sài Gòn, du khách không chỉ được ngắm cảnh phố xá nhộn nhịp, đông vui mà còn được check in nhiều điểm vui chơi, tham quan nổi bật của thành phố như phố đi bộ Nguyễn Huệ, bến Nhà Rồng, Dinh Độc Lập,... Ngoài ra, du khách còn có cơ hội ghé thăm  các địa điểm du lịch gần Sài Gòn nổi tiếng như địa đạo Củ Chi, đảo Thạnh An, biển Long Hải,...
Ngoài các điểm tham quan, ẩm thực độc đáo của Sài Gòn cũng là điểm thu hút du khách. Nếu hỏi ăn gì ở Sài Gòn, thổ địa nơi đây sẽ giới thiệu bạn vô vàn món từ bình dân đến cao cấp như cơm tấm, ốc, lẩu hải sản, lẩu dê,...
Sài Gòn - thành phố năng động bậc nhất nước ta, nơi hội tụ, giao lưu văn hóa, ẩm thực của các vùng miền trên khắp cả nước là điểm đến hấp dẫn mà bạn nên đặt chân đến một lần trong đời. Nơi đây với nhiều địa điểm tham quan, khu du lịch, điểm vui chơi hấp dẫn đang chờ đón bạn. ', '-post1663087193474.jpg', 'Địa điểm du lịch Sài Gòn');
INSERT INTO "public"."post" VALUES ('d6482885-cb58-473a-9dca-ab58f4c4719c', '2022-09-13 23:40:22.003323', '2022-09-13 23:40:22.003323', 0, 'Nằm ở vùng duyên hải miền Trung, Quảng Bình là địa đến thú vị với bãi biển hoang sơ, hang động độc đáo, núi sông hùng vĩ cùng nhiều món đặc sản thơm ngon. Du lịch Quảng Bình, du khách sẽ được khám phá quần thể hang động Phong Nha - Kẻ Bàng, một trong những di sản thiên nhiên thế giới.

Ngoài ra, nơi đây còn có nhiều điểm tham quan khác như cồn cát Quang Phú, hồ Bàu Tró, núi Thần Đinh,... Quảng Bình cũng là quê hương của nhiều món đặc sản dân dã hấp dẫn như cháo canh, bánh bèo, cá trắm sông Son,...', '-post1663087221986.jpg', 'Điểm du lịch Quảng Bình');
INSERT INTO "public"."post" VALUES ('588209e1-4bf0-42b1-bc15-8c1931889779', '2022-09-13 23:41:14.959907', '2022-09-13 23:41:14.959907', 0, 'Địa điểm du lịch Huế mang vẻ đẹp trầm mặc, mộng mơ cùng nhiều giá trị văn hóa, lịch sử lâu đời. Đến đây, bạn sẽ được chiêm ngưỡng những công trình kiến trúc độc đáo của lăng tẩm, Đại Nội Huế; tham quan các địa điểm du lịch nổi tiếng như cầu Tràng Tiền, núi Ngự Bình, đồi Vọng Cảnh,...

Đặc biệt, đừng bỏ lỡ cơ hội ngồi thuyền đi dạo sông Hương, thưởng trà, nghe nhã nhạc cung đình Huế. Và thưởng thức nhiều món ngon đặc sắc đến từ ẩm thực cung đình và ẩm thực dân gian xứ Huế như chè, bánh bột lọc, bún bò, cơm hến,...', '-post1663087274949.jpg', 'Địa điểm du lịch Huế');
INSERT INTO "public"."post" VALUES ('516c613b-1f85-4bc7-afff-86816fed31ca', '2022-09-13 23:41:33.696358', '2022-09-13 23:41:33.696358', 0, 'Thủ đô Hà Nội ngàn năm văn hiến là một trong những nơi mà bất kỳ người Việt Nam nào cũng muốn được đặt chân đến một lần trong đời. Du lịch Thủ đô, du khách sẽ được ghé thăm những điểm tham quan nổi tiếng như Quảng trường Ba Đình, Văn Miếu Quốc Tử Giám, chùa Trấn Quốc,... hay chiêm ngưỡng cảnh đẹp Hồ Tây, Hồ Gươm, Hoàng thành Thăng Long,... Bên cạnh đó, du khách còn được nếm thử nhiều món ngon đặc sắc như cốm làng Vòng, bún chả, phở, nem chua rán,...', '-post1663087293658.jpg', 'Địa điểm du lịch Hà Nội');
INSERT INTO "public"."post" VALUES ('e75a5dd7-cf7d-42a3-ac9f-9804e4d0e788', '2022-09-13 23:42:03.34834', '2022-09-13 23:42:03.34834', 0, 'Địa điểm du lịch miền Nam Vũng Tàu có bờ biển trải dài, cảnh quan đẹp, cùng nhiều địa danh chứa đựng giá trị văn hóa, lịch sử to lớn, trở thành điểm đến yêu thích của khách du lịch tứ phương. Đến với thành phố biển này, bạn không chỉ được tắm mát, tham gia nhiều hoạt động thể thao trên biển thú vị, mà còn được chiêm ngưỡng cảnh quan đẹp của bãi Trước, bãi Sau, Côn Đảo,... tham quan Bạch Dinh, Bảo tàng vũ khí cổ, đền Lớn,... Bên cạnh đó là thưởng thức nhiều món ngon hấp dẫn như bánh khọt, lẩu cá đuối, bánh canh,...', '-post1663087323327.jpg', 'Địa điểm du lịch Vũng Tàu');
INSERT INTO "public"."post" VALUES ('de24478a-9c93-4244-abfc-0480ea05b29b', '2022-09-13 23:42:28.97309', '2022-09-13 23:42:28.97309', 0, 'Với cảnh đẹp thơ mộng, khí hậu mát mẻ cùng nhiều món ăn ngon, Đà Lạt là điểm đến hút du khách đầu nước ta. Vẻ đẹp lãng mạn của Đà Lạt khiến bao người mê đắm. Đến đây, đừng quên check in các điểm tham quan nổi bật như núi Langbiang Đà Lạt, hồ Xuân Hương, hồ Tuyền Lâm, đồn điền cà phê Mê Linh,... Trong cái se lạnh của tiết trời Đà Lạt, những món ngon nơi đây như nem nướng, lẩu mực, bánh ướt lòng gà,... nóng hổi, thơm lừng càng thêm hấp dẫn. ', '-post1663087348959.jpeg', 'Điểm du lịch Đà Lạt');
INSERT INTO "public"."post" VALUES ('dedaf987-ff0b-40f9-9291-0013de7ae146', '2022-09-13 23:43:12.426912', '2022-09-13 23:43:12.426912', 0, 'Hà Giang thu hút du khách bởi vẻ đẹp thiên nhiên hoang sơ, bình dị, yên bình. Các điểm du lịch nổi tiếng mà bạn nhất định phải ghé khi đến Hà Giang là Hoàng Su Phì, đèo Mã Pí Lèng, cao nguyên đá Đồng Văn, Phó Bảng, cột cờ Lũng Cú, động Lùng Khúy, cửa khẩu Săm Pun, hồ Noong, thung lũng Sủng Là, phố cổ Đồng Văn,... Cùng với cảnh đẹp là nhiều món ăn mang hương vị núi rừng hấp dẫn như cháo ấu tẩu, thắng cố, rêu nướng, bánh cuốn trứng,...', '-post1663087392416.jpg', 'Điểm du lịch nổi tiếng tại Hà Giang');
INSERT INTO "public"."post" VALUES ('33d68edd-d3d5-426e-860d-e4e4d274a53d', '2022-09-13 23:40:54.091009', '2022-09-13 23:40:54.091009', 0, 'Điểm du lịch tại Cần Thơ đẹp bậc nhất', '-post1663087254081.jpg', 'Điểm du lịch tại Cần Thơ đẹp bậc nhất');
INSERT INTO "public"."post" VALUES ('923cd14d-7ab7-41a6-bb9c-b326729357ab', '2022-09-13 23:42:49.505502', '2022-09-13 23:42:49.505502', 0, 'Vùng núi Tây Bắc Việt Nam nổi tiếng với núi non hùng vĩ, cảnh đẹp nên thơ. Sapa - một trong những điểm du lịch hấp dẫn của Tây Bắc, níu chân du khách bởi vẻ đẹp lãng mạn của bản Cầu Mây, Cát Cát; những thửa ruộng bậc thang uốn lượn; những ngọn núi chạm mây như đỉnh Fansipan, núi Hàm Rồng; nét văn hóa độc đáo của người Tây Bắc; cùng nhiều món đặc sản thơm ngon của đồng bào nơi đây như lợn cắp nách, cá hồi, cá tầm tươi, su su,...', '-post1663087369497.jpg', 'Điểm du lịch Sapa');
INSERT INTO "public"."post" VALUES ('c340c1e7-c0cd-480d-a5b1-17d693f33316', '2022-09-20 22:00:23.071', '2022-09-20 22:00:23.071', 0, 'Nằm ở độ cao trên 1.000m so với mực nước biển, thôn Xà Phìn, xã Phương Tiến, huyện Vị Xuyên, tỉnh Hà Giang ẩn mình trên dãy núi Tây Côn Lĩnh. Nơi đây có khí hậu mát mẻ quanh năm, sương mù kết hợp độ ẩm cao đặc trưng tạo nên những lớp rêu xanh phủ trên mái lá tầng tầng lớp lớp như đồng bào Dao đã sinh sống và gắn bó với mảnh đất này bao đời, bao thế hệ. Tất cả tạo nên vẻ cổ kính, thanh bình làm nên nét đẹp rất riêng của đồng bào nơi vùng cao Đông Bắc khiến du khách tới đây cứ ngỡ như lạc vào vùng quê cổ tích.', '-post1663686022972.jpg', 'Độc đáo những mái nhà rêu phong nép mình trên dãy Tây Côn Lĩnh (Hà Giang)');

-- ----------------------------
-- Table structure for restaurant
-- ----------------------------
DROP TABLE IF EXISTS "public"."restaurant";
CREATE TABLE "public"."restaurant" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6),
  "updated_at" timestamp(6),
  "version" int4 NOT NULL,
  "address" varchar(255) COLLATE "pg_catalog"."default",
  "approve_status" varchar(255) COLLATE "pg_catalog"."default",
  "code" varchar(255) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "feature" int4[],
  "restaurant_type" varchar(255) COLLATE "pg_catalog"."default",
  "slug" varchar(1000) COLLATE "pg_catalog"."default",
  "title" varchar(1000) COLLATE "pg_catalog"."default",
  "user_id" varchar(255) COLLATE "pg_catalog"."default",
  "ts_search" tsvector
)
;

-- ----------------------------
-- Records of restaurant
-- ----------------------------
INSERT INTO "public"."restaurant" VALUES ('f7cbe241-c9d9-483b-8819-f1711394afe2', '2022-09-14 00:45:01.202555', '2022-09-14 00:47:53.592802', 1, 'Số 685 Lạc Long Quân, P. Phú Thượng Q. Tây Hồ', 'APPROVED', 'RE-COMUFJGS8Y', 'Nếu cuộc sống chốn thị thành với nhịp điệu hối hả, áp lực công việc khiến bạn đôi lúc cảm thấy mệt mỏi, chỉ muốn tìm về một chốn bình yên, thưởng thức những món ăn ngon với hương vị quen thuộc để lấy lại cân bằng cho cuộc sống, vậy thì nhà hàng Phúc Thành chính là món quà quý giá dành tặng cho bạn. Với bàn tay khéo léo và kỳ công từ các đầu bếp dày dặn kinh nghiệm, bạn sẽ không chỉ được thưởng thức các món ăn ngon, bạn còn được thưởng thức cả một nghệ thuật ẩm thực', '{1,2,3,4}', 'NHA_HANG', 'phuc-thanh---lac-long-quanre-comufjgs8y', 'Phúc Thành - Lạc Long Quân', '44854ec8-d083-402e-b534-afec7687dfe7', '''685'':111 ''ap'':17 ''ban'':22,71,73,88,99 ''bang'':52 ''bep'':83 ''binh'':35 ''ca'':104 ''cac'':81,95 ''cam'':25 ''chi'':29,91 ''chinh'':62 ''cho'':53,70 ''chon'':9,34 ''con'':100 ''cong'':19,79 ''cuoc'':7,54 ''dan'':85 ''danh'':68 ''dau'':82 ''day'':84 ''dieu'':14 ''doi'':23 ''duoc'':92,101 ''dể'':48 ''gia'':67 ''ha'':16 ''hang'':59 ''ho'':120 ''hoi'':15 ''huong'':44 ''kheo'':75 ''khien'':21 ''khong'':90 ''kinh'':86 ''kỳ'':78 ''la'':63 ''lac'':3,112 ''lai'':50 ''lay'':49 ''leo'':76 ''long'':4,113 ''luc'':18,24 ''met'':27 ''moi'':28 ''mon'':40,64,96 ''mot'':33,105 ''muon'':30 ''neu'':6 ''nghe'':106 ''nghiem'':87 ''ngon'':42,98 ''nha'':58 ''nhip'':13 ''nhung'':39 ''p'':115 ''phu'':116 ''phuc'':1,60 ''q'':118 ''qua'':65 ''quan'':5,114 ''quen'':46 ''quy'':66 ''song'':8,55 ''sẽ'':89 ''tang'':69 ''tay'':74,119 ''thanh'':2,11,61 ''thay'':26 ''thi'':10,57 ''thuat'':107 ''thuc'':38,94,103,109 ''thuoc'':47 ''thuong'':37,93,102,117 ''tim'':31 ''tu'':80 ''va'':77 ''vay'':56 ''ve'':32 ''vi'':45 ''viec'':20 ''voi'':12,43,72 ''yen'':36');
INSERT INTO "public"."restaurant" VALUES ('fce77b67-5afb-4a19-8374-847ae8d026f1', '2022-09-14 01:04:02.826225', '2022-09-14 01:06:12.26763', 1, 'Tòa nhà 24T2, Hoàng Đạo Thúy, Q. Cầu Giấy', 'APPROVED', 'RE-1HQH9ZJ7BE', '- King BBQ thuộc sở hữu của Tập đoàn RedSun ITI – Một trong những tập đoàn ẩm thực lớn mạnh bậc nhất Việt Nam, sở hữu nhiều thương hiệu ẩm thực nổi tiếng khác như: ThaiExpress, Hotpot Story, Seoul Garden, Sushi Kei, Buk Buk, Capricciosa, Khao Lao, Tasaki BBQ, Dolpan Sam

- Công thức độc quyền của “nước sốt King” – được chính Bếp trưởng Park Sung Min, một trong những đầu bếp nổi tiếng nhất Hàn Quốc, với kinh nghiệm hơn 40 năm trong ngành ẩm thực, trực tiếp nghiên cứu và chế biến.', '{1}', 'NHA_HANG', 'king-bbq--hoang-ao-thuyre-1hqh9zj7be', 'King BBQ – Hoàng Đạo Thúy', '44854ec8-d083-402e-b534-afec7687dfe7', '''24t2'':100 ''40'':85 ''bac'':25 ''bbq'':2,7,53 ''bep'':66,75 ''bien'':97 ''buk'':47,48 ''capricciosa'':49 ''cau'':105 ''che'':96 ''chinh'':65 ''cong'':56 ''cua'':11,60 ''cuu'':94 ''dao'':4,102 ''dau'':74 ''doan'':13,20 ''doc'':58 ''dolpan'':54 ''duoc'':64 ''garden'':44 ''giay'':106 ''han'':79 ''hieu'':33 ''hoang'':3,101 ''hon'':84 ''hotpot'':41 ''huu'':10,30 ''iti'':15 ''kei'':46 ''khac'':38 ''khao'':50 ''king'':1,6,63 ''kinh'':82 ''lao'':51 ''lon'':23 ''manh'':24 ''min'':70 ''mot'':16,71 ''nam'':28,86 ''nganh'':88 ''nghiem'':83 ''nghien'':93 ''nha'':99 ''nhat'':26,78 ''nhieu'':31 ''nhu'':39 ''nhung'':18,73 ''noi'':36,76 ''nuoc'':61 ''park'':68 ''q'':104 ''quoc'':80 ''quyen'':59 ''redsun'':14 ''sam'':55 ''seoul'':43 ''sot'':62 ''stori'':42 ''sung'':69 ''sushi'':45 ''tap'':12,19 ''tasaki'':52 ''thaiexpress'':40 ''thuc'':22,35,57,90 ''thuoc'':8 ''thuong'':32 ''thuy'':5,103 ''tieng'':37,77 ''tiep'':92 ''toa'':98 ''trong'':17,72,87 ''truc'':91 ''truong'':67 ''va'':95 ''viet'':27 ''voi'':81');
INSERT INTO "public"."restaurant" VALUES ('0a8ec670-674a-4b05-b1fe-680571bcc619', '2022-09-17 10:55:07.78963', '2022-09-17 11:18:02.676563', 1, 'Số 9 Hàn Thuyên, Q. Hai Bà Trưng', 'APPROVED', 'RE-FGSD7DAEII', 'Nhắc đến đặc sản dê ré, có lẽ không có nhà hàng ngon nào tại Thủ đô vượt qua được cái tên Dê Ré Song Dương. Sau 3 năm hoạt động, Song Dương đã khẳng định chất lượng của “Dê ré bé mới ngon” với 2 cơ sở tại Hà Nội tọa lạc tại 39 Trần Kim Xuyến và 13 Liễu Giai. Và nay cơ sở 3 tại số 9 Hàn Thuyên chính thức khai trương, đánh dấu mốc son cho hành trình hình thành hệ thống chuỗi của nhà hàng đặc sản dê ré Song Dương - hệ thống nhà hàng đầu tiên và duy nhất tại Hà Nội chuyên về đặc sản dê ré.', '{1,2,3,4}', 'QUAN_BAR_QUAN_RUOR', '-de-re-song-duong---han-thuyenre-fgsd7daeii', ' Dê Ré Song Dương - Hàn Thuyên', '44854ec8-d083-402e-b534-afec7687dfe7', '''13'':66 ''2'':52 ''3'':34,73 ''39'':61 ''9'':76,123 ''ba'':128 ''cai'':27 ''chat'':43 ''chinh'':79 ''cho'':87 ''chuoi'':94 ''chuyen'':116 ''co'':13,16,53,71 ''cua'':45,95 ''da'':40 ''dac'':9,98,118 ''danh'':83 ''dau'':84,108 ''de'':1,11,29,46,100,120 ''den'':8 ''dinh'':42 ''dong'':37 ''duoc'':26 ''duong'':4,32,39,103 ''duy'':111 ''giai'':68 ''ha'':56,114 ''hai'':127 ''han'':5,77,124 ''hang'':18,97,107 ''hanh'':88 ''hinh'':90 ''hoat'':36 ''khai'':81 ''khang'':41 ''khong'':15 ''kim'':63 ''lac'':59 ''lieu'':67 ''luong'':44 ''lẽ'':14 ''moc'':85 ''moi'':49 ''nam'':35 ''nao'':20 ''nay'':70 ''ngon'':19,50 ''nha'':17,96,106 ''nhac'':7 ''nhat'':112 ''noi'':57,115 ''q'':126 ''qua'':25 ''re'':2,12,30,47,101,121 ''san'':10,99,119 ''sau'':33 ''son'':86 ''song'':3,31,38,102 ''tai'':21,55,60,74,113 ''ten'':28 ''thanh'':91 ''thong'':93,105 ''thu'':22 ''thuc'':80 ''thuyen'':6,78,125 ''tien'':109 ''toa'':58 ''tran'':62 ''trinh'':89 ''trung'':129 ''truong'':82 ''va'':65,69,110 ''ve'':117 ''voi'':51 ''vuot'':24 ''xuyen'':64');
INSERT INTO "public"."restaurant" VALUES ('5142a9b2-7374-4f96-b631-504f31f65737', '2022-09-17 11:02:36.846743', '2022-09-17 11:17:59.599609', 1, '400 Ngọc Lâm, Q.Long Biên', 'APPROVED', 'RE-ST7JHRJTCT', '- Nhà hàng được gây dựng bởi một người yêu văn hóa và ẩm thực xứ kim chi, từng du học tại Hàn Quốc.
- Nguyên liệu được lựa chọn cẩn thận, đảm bảo độ tươi sạch, các món ăn đều chú trọng việc giữ nguyên hương vị truyền thống.
Những bạn trẻ yêu thích phim Hàn Quốc hẳn không còn xa lạ gì với những món ăn đặc trưng của xứ sở này như: Kim chi, Tokbokki, Gimbab hay canh rong biển,… Bây giờ, bạn không cần phải sang tận xứ Hàn mới có thể thưởng thức những món ngon hấp dẫn đó mà chỉ cần tới Gimbab Hàn Quốc là đã có thể trải nghiệm ngay nền ẩm thực đặc sắc của xứ sở Kim chi.', '{1,2,3,4}', 'QUAN_BAR_QUAN_RUOR', 'gimbab-han-quoc---ngoc-lamre-st7jhrjtct', 'Gimbab Hàn Quốc - Ngọc Lâm', '44854ec8-d083-402e-b534-afec7687dfe7', '''400'':132 ''ban'':55,89 ''bao'':37 ''bay'':87 ''bien'':136 ''biển'':86 ''boi'':11 ''cac'':41 ''canh'':84 ''chi'':22,80,109,131 ''chon'':33 ''chu'':45 ''co'':98,117 ''con'':64 ''cua'':74,127 ''da'':116 ''dac'':72,125 ''dam'':36 ''dan'':106 ''deu'':44 ''du'':24 ''dung'':10 ''duoc'':8,31 ''gay'':9 ''gi'':67 ''gimbab'':1,82,112 ''gio'':88 ''giu'':48 ''han'':2,27,60,62,96,113 ''hang'':7 ''hap'':105 ''hay'':83 ''hoa'':16 ''hoc'':25 ''huong'':50 ''khong'':63,90 ''kim'':21,79,130 ''la'':66,115 ''lam'':5,134 ''lieu'':30 ''lua'':32 ''ma'':108 ''moi'':97 ''mon'':42,70,103 ''mot'':12 ''nay'':77 ''nen'':122 ''ngay'':121 ''nghiem'':120 ''ngoc'':4,133 ''ngon'':104 ''nguoi'':13 ''nguyen'':29,49 ''nha'':6 ''nhu'':78 ''nhung'':54,69,102 ''phai'':92 ''phim'':59 ''q.long'':135 ''quoc'':3,28,61,114 ''rong'':85 ''sac'':126 ''sach'':40 ''sang'':93 ''tai'':26 ''tan'':94 ''thich'':58 ''thong'':53 ''thuc'':19,101,124 ''thuong'':100 ''thể'':99,118 ''toi'':111 ''tokbokki'':81 ''trai'':119 ''trong'':46 ''trung'':73 ''truyen'':52 ''trẻ'':56 ''tung'':23 ''tuoi'':39 ''va'':17 ''van'':15 ''vi'':51 ''viec'':47 ''voi'':68 ''xa'':65 ''xu'':20,75,95,128 ''yeu'':14,57');
INSERT INTO "public"."restaurant" VALUES ('af7f5343-59a2-438d-957f-73b4cdf64366', '2022-09-17 11:06:04.200702', '2022-09-17 11:17:58.008612', 1, 'Shophouse No 04&05 Tòa nhà NO3-T3 khu ngoại giao đoàn, Nguyễn Văn Huyên kéo dài, Q. Bắc Từ Liêm', 'APPROVED', 'RE-20U5WFZHZL', 'Văn hóa ẩm thực Nhật Bản là một nền văn hóa với những món ăn tinh tế được ví như những kiệt tác nghệ thuật kỳ công mang đầy đủ sắc - hương - vị. Chính vì vậy, mỗi món ăn Nhật đều ẩn chứa linh hồn và mang tính triết lý cao của xứ sở hoa anh đào. Thuộc hệ thống Kiến Đỏ Akaari - một trong những hệ thống nhà hàng Nhật Bản quen thuộc của dân Hà thành, Kiến Đỏ Akaari Premium nay đã có mặt tại Shophouse No 04&05 Tòa nhà NO3-T3 khu Ngoại Giao Đoàn mang đến nhiều lựa chọn về địa điểm tổ chức các buổi tụ họp, liên hoan, sinh nhật, ăn gia đình, bạn bè.
Đến với Kiến Đỏ Akaari Premium bạn sẽ có những trải nghiệm với các loại sashimi tươi ngon, những cuộn sushi mang hương vị sốt đặc trưng không thể tìm thấy ở nơi khác và những món nướng đa dạng tại Kiến Đỏ Akaari Premium sẽ làm nức lòng thực khách sành ăn. Có thể kể đến các món ăn góp phần làm nên thương hiệu của Kiến Đỏ Akaari Premium Ngọai Giao Đoàn như: Shashimi, Sushi, Maki, Nabe, Yakimono, Yakiniku, Agemono, Kobachi, Ramen, Udon, Gohanmon, Chinmi', '{4}', 'QUAN_BAR_QUAN_RUOR', 'kien-o-akaari-premium---ngoai-giao-oanre-20u5wfzhzl', 'Kiến Đỏ Akaari Premium - Ngọai Giao Đoàn', '44854ec8-d083-402e-b534-afec7687dfe7', '''04'':97,220 ''05'':98,221 ''agemono'':212 ''akaari'':3,70,88,135,174,200 ''anh'':63 ''bac'':237 ''ban'':13,79,129,137 ''buoi'':119 ''cac'':118,144,188 ''cao'':58 ''chinh'':41 ''chinmi'':217 ''chon'':112 ''chua'':50 ''chuc'':117 ''co'':92,139,184 ''cong'':34 ''cua'':59,82,197 ''cuon'':150 ''da'':91,169 ''dac'':156 ''dai'':235 ''dan'':83 ''dang'':170 ''dao'':64 ''day'':36 ''den'':109,131,187 ''deu'':48 ''dia'':114 ''dinh'':128 ''diểm'':115 ''doan'':7,107,204,230 ''du'':37 ''duoc'':25 ''gia'':127 ''giao'':6,106,203,229 ''gohanmon'':216 ''gop'':191 ''ha'':84 ''hang'':77 ''hieu'':196 ''hoa'':9,18,62 ''hoan'':123 ''hon'':52 ''hop'':121 ''huong'':39,153 ''huyen'':233 ''keo'':234 ''khac'':164 ''khach'':181 ''khong'':158 ''khu'':104,227 ''kien'':1,68,86,133,172,198 ''kiet'':29 ''kobachi'':213 ''kể'':186 ''kỳ'':33 ''la'':14 ''lam'':177,193 ''liem'':239 ''lien'':122 ''linh'':51 ''loai'':145 ''long'':179 ''lua'':111 ''ly'':57 ''maki'':208 ''mang'':35,54,108,152 ''mat'':93 ''moi'':44 ''mon'':21,45,167,189 ''mot'':15,71 ''nabe'':209 ''nay'':90 ''nen'':16,194 ''nghe'':31 ''nghiem'':142 ''ngoai'':5,105,202,228 ''ngon'':148 ''nguyen'':231 ''nha'':76,100,223 ''nhat'':12,47,78,125 ''nhieu'':110 ''nhu'':27,205 ''nhung'':20,28,73,140,149,166 ''no3'':102,225 ''no3-t3'':101,224 ''noi'':163 ''nuc'':178 ''nuong'':168 ''o'':162 ''phan'':192 ''premium'':4,89,136,175,201 ''q'':236 ''quen'':80 ''ramen'':214 ''sac'':38 ''sanh'':182 ''sashimi'':146 ''shashimi'':206 ''shophous'':95,218 ''sinh'':124 ''sot'':155 ''sushi'':151,207 ''sẽ'':138,176 ''t3'':103,226 ''tac'':30 ''tai'':94,171 ''te'':24 ''thanh'':85 ''thay'':161 ''thong'':67,75 ''thuat'':32 ''thuc'':11,180 ''thuoc'':65,81 ''thuong'':195 ''thể'':159,185 ''tim'':160 ''tinh'':23,55 ''toa'':99,222 ''trai'':141 ''triet'':56 ''trong'':72 ''trung'':157 ''tu'':120,238 ''tuoi'':147 ''udon'':215 ''va'':53,165 ''van'':8,17,232 ''vay'':43 ''ve'':113 ''vi'':26,40,42,154 ''voi'':19,132,143 ''xu'':60 ''yakimono'':210 ''yakiniku'':211');
INSERT INTO "public"."restaurant" VALUES ('97ea0deb-3feb-4e28-88c8-a7c277919514', '2022-09-17 11:10:17.083889', '2022-09-17 11:17:56.037475', 1, 'Số 2 Lý Thường Kiệt, P. Phan Chu Trinh, Q. Hoàn Kiếm', 'APPROVED', 'RE-34GFXMPFO4', 'Toạ lạc ở vị trí trung tâm thủ đô, chỉ cách Nhà Hát Lớn chưa tới 2 phút đi bộ, Tao Li Canting mở ra một Hồng Kông thu nhỏ với không gian sang trọng, quy mô và tinh tế bậc nhất.

Một không gian rộng lớn với sức chứa 500 khách, là sự kết hợp độc đáo giữa không gian sân vườn xanh mát, với lối thiết kế bên trong sang trọng mang âm hưởng cổ điển, trữ tình. Trong không gian ấy, thực khách sẽ bắt gặp những nét chấm phá từ họa tiết gạch bông hay cả những chụp đèn đầy hoài cổ... Cứ thế, Tao Li Canting từ từ đưa bạn vào một không gian sang trọng, thoáng đãng, vừa tự nhiên nhưng cũng vừa đậm vị nghệ thuật.

Đến Tao Li Canting số 2 Lý Thường Kiệt không đơn thuần chỉ để tận hưởng cảm giác thư giãn từ không gian, mà tại đây, vị giác của bạn sẽ được “nuông chiều” bởi hơn 100 món ăn Hồng Kông và Trung Hoa mang hương vị đậm đà, đầy cuốn hút như: Bào ngư lát sốt rau xanh dầu hào, Cua bể rang cay phòng phong, Ếch nấu cay Tứ Xuyên, Gà quý phi gừng hành, Vịt quay Quảng Đông, các loại Dimsum, Lẩu Xí Quách Taoli…', '{1,3,4}', 'QUAN_BAR_QUAN_RUOR', 'tao-li-canting---ly-thuong-kietre-34gfxmpfo4', 'Tao Li Canting - Lý Thường Kiệt', '44854ec8-d083-402e-b534-afec7687dfe7', '''100'':176 ''2'':23,145,229 ''500'':57 ''ay'':90 ''bac'':47 ''ban'':121,169 ''bao'':193 ''bat'':94 ''ben'':76 ''bo'':26 ''boi'':174 ''bong'':104 ''bể'':202 ''ca'':106 ''cac'':221 ''cach'':17 ''cam'':156 ''cant'':3,29,117,143 ''cay'':204,209 ''cham'':98 ''chi'':16,152 ''chieu'':173 ''chu'':235 ''chua'':21,56 ''chup'':108 ''co'':83,112 ''cu'':113 ''cua'':168,201 ''cung'':134 ''cuon'':190 ''da'':188 ''dam'':136,187 ''dang'':129 ''dao'':64 ''dau'':199 ''day'':110,165,189 ''den'':109,140 ''di'':25 ''dimsum'':223 ''diển'':84 ''doc'':63 ''dong'':220 ''dua'':120 ''duoc'':171 ''dể'':153 ''ech'':207 ''ga'':212 ''gach'':103 ''gap'':95 ''giac'':157,167 ''gian'':39,51,67,89,125,159,162 ''giua'':65 ''gung'':215 ''hanh'':216 ''hao'':200 ''hat'':19 ''hay'':105 ''hoa'':101,183 ''hoai'':111 ''hoan'':238 ''hon'':175 ''hong'':33,179 ''hop'':62 ''huong'':82,155,185 ''hut'':191 ''ke'':75 ''ket'':61 ''khach'':58,92 ''khong'':38,50,66,88,124,149,161 ''kiem'':239 ''kiet'':6,148,232 ''kong'':34,180 ''la'':59 ''lac'':8 ''lat'':195 ''lau'':224 ''li'':2,28,116,142 ''loai'':222 ''loi'':73 ''lon'':20,53 ''ly'':4,146,230 ''ma'':163 ''mang'':80,184 ''mat'':71 ''mo'':30,43 ''mon'':177 ''mot'':32,49,123 ''nau'':208 ''net'':97 ''nghe'':138 ''ngu'':194 ''nha'':18 ''nhat'':48 ''nhien'':132 ''nho'':36 ''nhu'':192 ''nhung'':96,107,133 ''nuong'':172 ''o'':9 ''p'':233 ''pha'':99 ''phan'':234 ''phi'':214 ''phong'':205,206 ''phut'':24 ''q'':237 ''quach'':226 ''quang'':219 ''quay'':218 ''quy'':42,213 ''ra'':31 ''rang'':203 ''rau'':197 ''rong'':52 ''san'':68 ''sang'':40,78,126 ''sot'':196 ''su'':60 ''suc'':55 ''sẽ'':93,170 ''tai'':164 ''tam'':13 ''tan'':154 ''tao'':1,27,115,141 ''taoli'':227 ''te'':46 ''thiet'':74 ''thoang'':128 ''thu'':14,35,158 ''thuan'':151 ''thuat'':139 ''thuc'':91 ''thuong'':5,147,231 ''tiet'':102 ''tinh'':45,86 ''toa'':7 ''toi'':22 ''tri'':11 ''trinh'':236 ''trong'':41,77,79,87,127 ''tru'':85 ''trung'':12,182 ''tu'':100,118,119,131,160,210 ''va'':44,181 ''vao'':122 ''vi'':10,137,166,186 ''vit'':217 ''voi'':37,54,72 ''vua'':130,135 ''vuon'':69 ''xanh'':70,198 ''xi'':225 ''xuyen'':211');
INSERT INTO "public"."restaurant" VALUES ('528559c9-3268-475f-8c0e-de255c1f6831', '2022-09-17 11:13:21.846446', '2022-09-17 11:17:52.566688', 1, ' 474 Xã Đàn, Q. Đống Đa', 'APPROVED', 'RE-APLTXFF3MD', 'Nhà hàng Chai Talay - Số 474 Xã Đàn, Quận Đống Đa – Điểm dừng chân của những bạn trẻ yêu thích ẩm thực xứ Chùa Vàng
Tiếp nối sự thành công của chuỗi nhà hàng Aroi Dessert & Café, chủ nhà hàng đã quyết định cho ra đời thương hiệu mới chuyên về đồ ăn Thái Lan kết hợp với buffet lẩu mang tên Chai Talay tọa lạc tại số 474 Xã Đàn, phường Nam Đồng, quận Đống Đa. Dưới bàn tay của bếp trưởng người Thái Lan và nguyên liệu được nhập khẩu trực tiếp, những món ăn mang đậm chất ẩm thực đường phố Thái đặc biệt là hải sản, được phân chia món ăn dễ dàng cho thực khách lựa chọn như: món khai vị, món thịt, cá, tôm, cua, món tráng miệng.... Có thể kể đến như: Chân gà rang mắm; Gà nướng lá nếp; Cá giòn xóc tỏi; Tôm sốt me kiểu Thái; Tôm chiên kiểu Thái; Mực xào trứng muối, mực hấp chanh muối; Cua rang me; Lẩu Thái bò Mỹ; Lẩu Thái hải sản...

Sẽ không quá khó khăn để tìm đến Chai Talay trên khu phố Xã Đàn đông đúc. Mặt tiền rộng rãi, chiếm trọn 3 tầng và cửa sổ hoàn toàn ốp kính, Chai Talay sở hữu sức chứa 96 khách đại diện cho phong cách nhà hàng Thái hiện đại song vẫn giữ được vẻ mộc mạc. Nếu vào ban ngày không gian nhà hàng ngập tràn ánh sáng tự nhiên, cho đến khi chiều tối có thể nhìn ngắm ánh đèn đường, đèn xe của dòng người qua lại cũng là một điều thú vị.

Với mức giá 120.000 đến 150.000 vnđ/người, nhà hàng phù hợp cho nhiều mục đích đi ăn của thực khách từ ăn gia đình, bạn bè đến những buổi liên hoan, họp nhóm, sinh nhật,...', '{1}', 'QUAN_BAR_QUAN_RUOR', 'chai-talay---xa-anre-apltxff3md', 'Chai Talay - Xã Đàn', '44854ec8-d083-402e-b534-afec7687dfe7', '''120.000'':283 ''150.000'':285 ''3'':207 ''474'':10,73,315 ''96'':222 ''anh'':251,264 ''aroi'':39 ''ban'':21,83,243,304 ''bep'':86 ''biet'':111 ''bo'':178 ''buffet'':63 ''buoi'':308 ''ca'':133,152 ''cach'':228 ''cafe'':41 ''chai'':1,7,67,192,216 ''chan'':18,144 ''chanh'':171 ''chat'':104 ''chia'':117 ''chiem'':205 ''chien'':162 ''chieu'':258 ''cho'':48,122,226,255,291 ''chon'':126 ''chu'':42 ''chua'':28,221 ''chuoi'':36 ''chuyen'':54 ''co'':139,260 ''cong'':34 ''cua'':19,35,85,135,173,210,269,297 ''cung'':274 ''da'':15,45,81,320 ''dac'':110 ''dai'':224,233 ''dam'':103 ''dan'':4,12,75,198,317 ''dang'':121 ''de'':120 ''den'':142,191,256,265,267,284,306 ''dessert'':40 ''di'':295 ''dich'':294 ''dien'':225 ''dieu'':277 ''dinh'':47,303 ''diểm'':16 ''doi'':50 ''dong'':14,78,80,199,270,319 ''duc'':200 ''dung'':17 ''duoc'':94,115,237 ''duoi'':82 ''duong'':107,266 ''dể'':189 ''ga'':145,148 ''gia'':282,302 ''gian'':246 ''gion'':153 ''giu'':236 ''hai'':113,182 ''hang'':6,38,44,230,248,288 ''hap'':170 ''hien'':232 ''hieu'':52 ''hoan'':212,310 ''hop'':61,290,311 ''huu'':219 ''ket'':60 ''khach'':124,223,299 ''khai'':129 ''khan'':188 ''khau'':96 ''khi'':257 ''kho'':187 ''khong'':185,245 ''khu'':195 ''kinh'':215 ''kiểu'':159,163 ''kể'':141 ''la'':112,150,275 ''lac'':70 ''lai'':273 ''lan'':59,90 ''lau'':64,176,180 ''lien'':309 ''lieu'':93 ''lua'':125 ''mac'':240 ''mam'':147 ''mang'':65,102 ''mat'':201 ''mieng'':138 ''moc'':239 ''moi'':53 ''mon'':100,118,128,131,136 ''mot'':276 ''muc'':165,169,281,293 ''muoi'':168,172 ''mỹ'':179 ''nam'':77 ''nep'':151 ''neu'':241 ''ngam'':263 ''ngap'':249 ''ngay'':244 ''nguoi'':88,271 ''nguyen'':92 ''nha'':5,37,43,229,247,287 ''nhap'':95 ''nhat'':314 ''nhien'':254 ''nhieu'':292 ''nhin'':262 ''nhom'':312 ''nhu'':127,143 ''nhung'':20,99,307 ''noi'':31 ''nuong'':149 ''op'':214 ''phan'':116 ''pho'':108,196 ''phong'':227 ''phu'':289 ''phuong'':76 ''q'':318 ''qua'':186,272 ''quan'':13,79 ''quyet'':46 ''ra'':49 ''rai'':204 ''rang'':146,174 ''rong'':203 ''san'':114,183 ''sang'':252 ''sinh'':313 ''song'':234 ''sot'':157 ''su'':32 ''suc'':220 ''sẽ'':184 ''tai'':71 ''talay'':2,8,68,193,217 ''tang'':208 ''tay'':84 ''ten'':66 ''thai'':58,89,109,160,164,177,181,231 ''thanh'':33 ''thich'':24 ''thit'':132 ''thu'':278 ''thuc'':26,106,123,298 ''thuong'':51 ''thể'':140,261 ''tien'':202 ''tiep'':30,98 ''tim'':190 ''toa'':69 ''toan'':213 ''toi'':155,259 ''tom'':134,156,161 ''tran'':250 ''trang'':137 ''tren'':194 ''tron'':206 ''truc'':97 ''trung'':167 ''truong'':87 ''trẻ'':22 ''tu'':253,300 ''va'':91,209 ''van'':235 ''vang'':29 ''vao'':242 ''ve'':55 ''vi'':130,279 ''vnd/nguoi'':286 ''voi'':62,280 ''vẻ'':238 ''xa'':3,11,74,197,316 ''xao'':166 ''xe'':268 ''xoc'':154 ''xu'':27 ''yeu'':23');
INSERT INTO "public"."restaurant" VALUES ('35a01c38-19f7-4a75-95be-da95f5652f06', '2022-09-17 10:59:56.712145', '2022-09-17 11:18:01.126907', 1, ' Tầng 3, Số 109 Đào Tấn', 'APPROVED', 'RE-XBRRFTMJJG', 'Đúng như tên gọi của nhà hàng: Love Vegan – Ăn chay sống khoẻ, các món ăn trong menu được Bếp trưởng nghiên cứu sáng tạo, hướng đến sự hài hoà cân bằng về dinh dưỡng và vị giác, để mang lại sức khoẻ tốt nhất cho thực khách ăn chay.

Các nguyên liệu tạo nên món chay tại Love Vegan rất đa dạng, từ rau, củ, quả tươi đến các loại nấm, hoa, cây gia vị tươi … tất cả đều được tuyển lựa kỹ càng theo tiêu chuẩn sạch, xanh, ngon, mùa nào thức nấy. Chính vì vậy, menu món ăn tại Love Vegan luôn được thay đổi theo ngày, theo tuần, theo mùa, mang lại sự mới lạ cho khách hàng.

Mỗi ngày, menu nhà hàng có khoảng hơn 30 món gồm đủ loại từ Salad, món gỏi, món cuốn, món xào, om, đến các món kho, hấp, chiên… và cả các loại chè, hoa quả tráng miệng, nước uống được bày sẵn trên quầy buffet. Tại Love Vegan có một số món ăn đặc biệt phải kể đến như: Nem hoa quả, Chả giò Love Vegan, Nấm ốc ôm lá chanh, Khoai tây phô mai đút lò, Cari rau củ, Gimbap gạo lứt rong biển, Salad trái bơ… cùng nhiều món ăn vừa hấp dẫn về hình thức, vừa mang lại nhiều giá trị dinh dưỡng, giúp thanh lọc cơ thể và duy trì sức khoẻ tốt cho thực khách ăn chay.

Toạ lạc tại con đường Đào Tấn rộng rãi, thoáng mát và náo nhiệt, Love Vegan vẫn mang trong mình sự lãng mạn, an yên vừa đủ, để khách hàng có những phút giây thật thư thái và thưởng thức món ăn chay. View kính tầng 3 siêu đẹp và thoáng, phóng tầm mắt ra phía trước là hàng cây xanh mướt, nhìn lại phía sau là quầy buffet lung linh ánh đèn vàng với thật nhiều món ăn ngon hấp dẫn đang chờ bạn thưởng thức. Dù nhà hàng ở trên tầng 3 của số 109 Đào Tấn, lối đi chung với nhà hàng phía dưới, nhưng chỉ một chút thôi, khi bước lên tới không gian tầng 3 của Love Vegan, tất cả mọi ưu phiền sẽ ở phía ngoài sau cánh cửa. Những gì còn lại là sự thư thái, an lạc và các món ăn ngon đang chờ đón bạn.', '{}', 'QUAN_BAR_QUAN_RUOR', 'buffet-chay-love-vegan---ao-tanre-xbrrftmjjg', 'Buffet chay Love Vegan - Đào Tấn', '44854ec8-d083-402e-b534-afec7687dfe7', '''109'':347,408 ''3'':297,344,370,406 ''30'':137 ''anh'':322 ''ban'':335,404 ''bang'':38 ''bay'':169 ''bep'':26 ''biet'':183 ''biển'':213 ''bo'':216 ''buffet'':1,173,319 ''buoc'':364 ''ca'':85,158,375 ''cac'':20,57,76,152,159,397 ''cang'':91 ''canh'':384 ''cari'':206 ''cay'':80,310 ''cha'':191 ''chanh'':199 ''chay'':2,17,56,63,250,293 ''che'':161 ''chi'':359 ''chien'':156 ''chinh'':102 ''cho'':52,126,246,334,402 ''chuan'':94 ''chung'':352 ''chut'':361 ''co'':134,177,238,281 ''con'':254,388 ''cu'':72,208 ''cua'':11,345,371,385 ''cung'':217 ''cuon'':147 ''cuu'':29 ''da'':68 ''dac'':182 ''dan'':223,332 ''dang'':69,333,401 ''dao'':5,256,348,409 ''den'':33,75,151,186,323 ''dep'':299 ''deu'':86 ''di'':351 ''dinh'':40,233 ''doi'':114 ''du'':140,277,338 ''dung'':7 ''duoc'':25,87,112,168 ''duoi'':357 ''duong'':41,234,255 ''dut'':204 ''duy'':241 ''dể'':45,278 ''gao'':210 ''gi'':387 ''gia'':81,231 ''giac'':44 ''gian'':368 ''giay'':284 ''gimbap'':209 ''gio'':192 ''giup'':235 ''goi'':10,145 ''gom'':139 ''hai'':35 ''hang'':13,128,133,280,309,340,355 ''hap'':155,222,331 ''hinh'':225 ''hoa'':36,79,162,189 ''hon'':136 ''huong'':32 ''khach'':54,127,248,279 ''khi'':363 ''kho'':154 ''khoai'':200 ''khoang'':135 ''khong'':367 ''khoẻ'':19,49,244 ''kinh'':295 ''kể'':185 ''kỹ'':90 ''la'':125,198,308,317,390 ''lac'':252,395 ''lai'':47,122,229,314,389 ''lang'':272 ''len'':365 ''lieu'':59 ''linh'':321 ''lo'':205 ''loai'':77,141,160 ''loc'':237 ''loi'':350 ''love'':3,14,65,109,175,193,265,372 ''lua'':89 ''lung'':320 ''luon'':111 ''lut'':211 ''mai'':203 ''man'':273 ''mang'':46,121,228,268 ''mat'':261,304 ''menu'':24,105,131 ''mieng'':165 ''minh'':270 ''moi'':124,129,376 ''mon'':21,62,106,138,144,146,148,153,180,219,291,328,398 ''mot'':178,360 ''mua'':98,120 ''muot'':312 ''nam'':78,195 ''nao'':99,263 ''nay'':101 ''nem'':188 ''nen'':61 ''ngay'':116,130 ''nghien'':28 ''ngoai'':382 ''ngon'':97,330,400 ''nguyen'':58 ''nha'':12,132,339,354 ''nhat'':51 ''nhiet'':264 ''nhieu'':218,230,327 ''nhin'':313 ''nhu'':8,187 ''nhung'':282,358,386 ''nuoc'':166 ''o'':341,380 ''oc'':196 ''om'':150,197 ''phai'':184 ''phia'':306,315,356,381 ''phien'':378 ''pho'':202 ''phong'':302 ''phut'':283 ''qua'':73,163,190 ''quay'':172,318 ''ra'':305 ''rai'':259 ''rat'':67 ''rau'':71,207 ''rong'':212,258 ''sach'':95 ''salad'':143,214 ''san'':170 ''sang'':30 ''sau'':316,383 ''sieu'':298 ''song'':18 ''su'':34,123,271,391 ''suc'':48,243 ''sẽ'':379 ''tai'':64,108,174,253 ''tam'':303 ''tan'':6,257,349,410 ''tang'':296,343,369,405 ''tao'':31,60 ''tat'':84,374 ''tay'':201 ''ten'':9 ''thai'':287,393 ''thanh'':236 ''thay'':113 ''theo'':92,115,117,119 ''thoang'':260,301 ''thoi'':362 ''thu'':286,392 ''thuc'':53,100,226,247,290,337 ''thuong'':289,336 ''thể'':239 ''tieu'':93 ''toa'':251 ''toi'':366 ''tot'':50,245 ''trai'':215 ''trang'':164 ''tren'':171,342 ''tri'':232,242 ''trong'':23,269 ''truoc'':307 ''truong'':27 ''tu'':70,142 ''tuan'':118 ''tuoi'':74,83 ''tuyển'':88 ''uong'':167 ''uu'':377 ''va'':42,157,240,262,288,300,396 ''van'':267 ''vang'':324 ''vay'':104 ''ve'':39,224 ''vegan'':4,15,66,110,176,194,266,373 ''vi'':43,82,103 ''view'':294 ''voi'':325,353 ''vua'':221,227,276 ''xanh'':96,311 ''xao'':149 ''yen'':275');

-- ----------------------------
-- Table structure for restaurant_image
-- ----------------------------
DROP TABLE IF EXISTS "public"."restaurant_image";
CREATE TABLE "public"."restaurant_image" (
  "id" int8 NOT NULL,
  "created_at" timestamp(6),
  "updated_at" timestamp(6),
  "version" int4 NOT NULL,
  "caption" text COLLATE "pg_catalog"."default",
  "image_type" varchar(255) COLLATE "pg_catalog"."default",
  "restaurant_code" varchar(255) COLLATE "pg_catalog"."default",
  "url" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of restaurant_image
-- ----------------------------
INSERT INTO "public"."restaurant_image" VALUES (1, '2022-09-14 00:45:01.088544', '2022-09-14 00:45:01.088544', 0, 'image for restaurant', 'MAIN', 'RE-COMUFJGS8Y', 'restaurant1663091101002-0.jpg');
INSERT INTO "public"."restaurant_image" VALUES (2, '2022-09-14 00:45:01.193552', '2022-09-14 00:45:01.193552', 0, 'image for restaurant', 'MAIN', 'RE-COMUFJGS8Y', 'restaurant1663091101014-1.jpg');
INSERT INTO "public"."restaurant_image" VALUES (3, '2022-09-14 00:45:01.194552', '2022-09-14 00:45:01.194552', 0, 'image for restaurant', 'MAIN', 'RE-COMUFJGS8Y', 'restaurant1663091101023-2.jpg');
INSERT INTO "public"."restaurant_image" VALUES (4, '2022-09-14 00:45:01.194552', '2022-09-14 00:45:01.194552', 0, 'image for restaurant', 'MAIN', 'RE-COMUFJGS8Y', 'restaurant1663091101032-3.jpg');
INSERT INTO "public"."restaurant_image" VALUES (5, '2022-09-14 00:45:01.195553', '2022-09-14 00:45:01.195553', 0, 'image for restaurant', 'MAIN', 'RE-COMUFJGS8Y', 'restaurant1663091101042-4.jpg');
INSERT INTO "public"."restaurant_image" VALUES (6, '2022-09-14 00:45:01.195553', '2022-09-14 00:45:01.195553', 0, 'image for restaurant', 'MAIN', 'RE-COMUFJGS8Y', 'restaurant1663091101050-5.jpg');
INSERT INTO "public"."restaurant_image" VALUES (7, '2022-09-14 00:45:01.195553', '2022-09-14 00:45:01.195553', 0, 'image for restaurant', 'MAIN', 'RE-COMUFJGS8Y', 'restaurant1663091101057-6.jpg');
INSERT INTO "public"."restaurant_image" VALUES (8, '2022-09-14 00:45:01.195553', '2022-09-14 00:45:01.195553', 0, 'image for restaurant', 'MAIN', 'RE-COMUFJGS8Y', 'restaurant1663091101061-7.jpg');
INSERT INTO "public"."restaurant_image" VALUES (9, '2022-09-14 00:45:01.196554', '2022-09-14 00:45:01.196554', 0, 'image for restaurant', 'MAIN', 'RE-COMUFJGS8Y', 'restaurant1663091101068-8.jpg');
INSERT INTO "public"."restaurant_image" VALUES (10, '2022-09-14 00:45:01.197557', '2022-09-14 00:45:01.197557', 0, 'image for restaurant', 'MAIN', 'RE-COMUFJGS8Y', 'restaurant1663091101073-9.jpg');
INSERT INTO "public"."restaurant_image" VALUES (20, '2022-09-14 01:04:02.821259', '2022-09-14 01:04:02.821259', 0, 'image for restaurant', 'MAIN', 'RE-1HQH9ZJ7BE', 'restaurant1663092242763-0.jpg');
INSERT INTO "public"."restaurant_image" VALUES (21, '2022-09-14 01:04:02.824226', '2022-09-14 01:04:02.824226', 0, 'image for restaurant', 'MAIN', 'RE-1HQH9ZJ7BE', 'restaurant1663092242775-1.jpg');
INSERT INTO "public"."restaurant_image" VALUES (22, '2022-09-14 01:04:02.824226', '2022-09-14 01:04:02.824226', 0, 'image for restaurant', 'MAIN', 'RE-1HQH9ZJ7BE', 'restaurant1663092242781-2.jpg');
INSERT INTO "public"."restaurant_image" VALUES (23, '2022-09-14 01:04:02.824226', '2022-09-14 01:04:02.824226', 0, 'image for restaurant', 'MAIN', 'RE-1HQH9ZJ7BE', 'restaurant1663092242786-3.jpg');
INSERT INTO "public"."restaurant_image" VALUES (24, '2022-09-14 01:04:02.825226', '2022-09-14 01:04:02.825226', 0, 'image for restaurant', 'MAIN', 'RE-1HQH9ZJ7BE', 'restaurant1663092242792-4.jpg');
INSERT INTO "public"."restaurant_image" VALUES (25, '2022-09-14 01:04:02.825226', '2022-09-14 01:04:02.825226', 0, 'image for restaurant', 'MAIN', 'RE-1HQH9ZJ7BE', 'restaurant1663092242797-5.jpg');
INSERT INTO "public"."restaurant_image" VALUES (26, '2022-09-14 01:04:02.825226', '2022-09-14 01:04:02.825226', 0, 'image for restaurant', 'MAIN', 'RE-1HQH9ZJ7BE', 'restaurant1663092242803-6.jpg');
INSERT INTO "public"."restaurant_image" VALUES (27, '2022-09-14 01:04:02.825226', '2022-09-14 01:04:02.825226', 0, 'image for restaurant', 'MAIN', 'RE-1HQH9ZJ7BE', 'restaurant1663092242808-7.jpg');
INSERT INTO "public"."restaurant_image" VALUES (28, '2022-09-14 01:04:02.826225', '2022-09-14 01:04:02.826225', 0, 'image for restaurant', 'MAIN', 'RE-1HQH9ZJ7BE', 'restaurant1663092242815-8.jpg');
INSERT INTO "public"."restaurant_image" VALUES (40, '2022-09-17 10:55:07.769939', '2022-09-17 10:55:07.769939', 0, 'image for restaurant', 'MAIN', 'RE-FGSD7DAEII', 'restaurant1663386907711-0.jpg');
INSERT INTO "public"."restaurant_image" VALUES (41, '2022-09-17 10:55:07.774625', '2022-09-17 10:55:07.774625', 0, 'image for restaurant', 'MAIN', 'RE-FGSD7DAEII', 'restaurant1663386907715-1.jpg');
INSERT INTO "public"."restaurant_image" VALUES (42, '2022-09-17 10:55:07.774625', '2022-09-17 10:55:07.774625', 0, 'image for restaurant', 'MAIN', 'RE-FGSD7DAEII', 'restaurant1663386907720-2.jpg');
INSERT INTO "public"."restaurant_image" VALUES (43, '2022-09-17 10:55:07.77563', '2022-09-17 10:55:07.77563', 0, 'image for restaurant', 'MAIN', 'RE-FGSD7DAEII', 'restaurant1663386907726-3.jpg');
INSERT INTO "public"."restaurant_image" VALUES (44, '2022-09-17 10:55:07.77563', '2022-09-17 10:55:07.77563', 0, 'image for restaurant', 'MAIN', 'RE-FGSD7DAEII', 'restaurant1663386907730-4.jpg');
INSERT INTO "public"."restaurant_image" VALUES (45, '2022-09-17 10:55:07.77563', '2022-09-17 10:55:07.77563', 0, 'image for restaurant', 'MAIN', 'RE-FGSD7DAEII', 'restaurant1663386907737-5.jpg');
INSERT INTO "public"."restaurant_image" VALUES (46, '2022-09-17 10:55:07.77663', '2022-09-17 10:55:07.77663', 0, 'image for restaurant', 'MAIN', 'RE-FGSD7DAEII', 'restaurant1663386907741-6.jpg');
INSERT INTO "public"."restaurant_image" VALUES (47, '2022-09-17 10:55:07.77663', '2022-09-17 10:55:07.77663', 0, 'image for restaurant', 'MAIN', 'RE-FGSD7DAEII', 'restaurant1663386907746-7.jpg');
INSERT INTO "public"."restaurant_image" VALUES (48, '2022-09-17 10:55:07.77763', '2022-09-17 10:55:07.77763', 0, 'image for restaurant', 'MAIN', 'RE-FGSD7DAEII', 'restaurant1663386907750-8.jpg');
INSERT INTO "public"."restaurant_image" VALUES (49, '2022-09-17 10:55:07.77763', '2022-09-17 10:55:07.77763', 0, 'image for restaurant', 'MAIN', 'RE-FGSD7DAEII', 'restaurant1663386907755-9.jpg');
INSERT INTO "public"."restaurant_image" VALUES (55, '2022-09-17 10:59:56.705144', '2022-09-17 10:59:56.705144', 0, 'image for restaurant', 'MAIN', 'RE-XBRRFTMJJG', 'restaurant1663387196650-0.jpg');
INSERT INTO "public"."restaurant_image" VALUES (56, '2022-09-17 10:59:56.706146', '2022-09-17 10:59:56.706146', 0, 'image for restaurant', 'MAIN', 'RE-XBRRFTMJJG', 'restaurant1663387196654-1.jpg');
INSERT INTO "public"."restaurant_image" VALUES (57, '2022-09-17 10:59:56.70715', '2022-09-17 10:59:56.70715', 0, 'image for restaurant', 'MAIN', 'RE-XBRRFTMJJG', 'restaurant1663387196665-2.jpg');
INSERT INTO "public"."restaurant_image" VALUES (58, '2022-09-17 10:59:56.708148', '2022-09-17 10:59:56.708148', 0, 'image for restaurant', 'MAIN', 'RE-XBRRFTMJJG', 'restaurant1663387196670-3.jpg');
INSERT INTO "public"."restaurant_image" VALUES (59, '2022-09-17 10:59:56.708148', '2022-09-17 10:59:56.708148', 0, 'image for restaurant', 'MAIN', 'RE-XBRRFTMJJG', 'restaurant1663387196675-4.jpg');
INSERT INTO "public"."restaurant_image" VALUES (60, '2022-09-17 10:59:56.709146', '2022-09-17 10:59:56.709146', 0, 'image for restaurant', 'MAIN', 'RE-XBRRFTMJJG', 'restaurant1663387196680-5.jpg');
INSERT INTO "public"."restaurant_image" VALUES (61, '2022-09-17 10:59:56.710147', '2022-09-17 10:59:56.710147', 0, 'image for restaurant', 'MAIN', 'RE-XBRRFTMJJG', 'restaurant1663387196685-6.jpg');
INSERT INTO "public"."restaurant_image" VALUES (62, '2022-09-17 10:59:56.710147', '2022-09-17 10:59:56.710147', 0, 'image for restaurant', 'MAIN', 'RE-XBRRFTMJJG', 'restaurant1663387196689-7.jpg');
INSERT INTO "public"."restaurant_image" VALUES (63, '2022-09-17 10:59:56.711145', '2022-09-17 10:59:56.711145', 0, 'image for restaurant', 'MAIN', 'RE-XBRRFTMJJG', 'restaurant1663387196699-8.jpg');
INSERT INTO "public"."restaurant_image" VALUES (65, '2022-09-17 11:02:36.844738', '2022-09-17 11:02:36.844738', 0, 'image for restaurant', 'MAIN', 'RE-ST7JHRJTCT', 'restaurant1663387356795-0.jpg');
INSERT INTO "public"."restaurant_image" VALUES (66, '2022-09-17 11:02:36.845745', '2022-09-17 11:02:36.845745', 0, 'image for restaurant', 'MAIN', 'RE-ST7JHRJTCT', 'restaurant1663387356806-1.jpg');
INSERT INTO "public"."restaurant_image" VALUES (67, '2022-09-17 11:02:36.845745', '2022-09-17 11:02:36.845745', 0, 'image for restaurant', 'MAIN', 'RE-ST7JHRJTCT', 'restaurant1663387356813-2.jpg');
INSERT INTO "public"."restaurant_image" VALUES (68, '2022-09-17 11:02:36.845745', '2022-09-17 11:02:36.845745', 0, 'image for restaurant', 'MAIN', 'RE-ST7JHRJTCT', 'restaurant1663387356818-3.jpg');
INSERT INTO "public"."restaurant_image" VALUES (69, '2022-09-17 11:02:36.846743', '2022-09-17 11:02:36.846743', 0, 'image for restaurant', 'MAIN', 'RE-ST7JHRJTCT', 'restaurant1663387356829-4.jpg');
INSERT INTO "public"."restaurant_image" VALUES (70, '2022-09-17 11:02:36.846743', '2022-09-17 11:02:36.846743', 0, 'image for restaurant', 'MAIN', 'RE-ST7JHRJTCT', 'restaurant1663387356835-5.jpg');
INSERT INTO "public"."restaurant_image" VALUES (75, '2022-09-17 11:06:04.193706', '2022-09-17 11:06:04.193706', 0, 'image for restaurant', 'MAIN', 'RE-20U5WFZHZL', 'restaurant1663387564107-0.jpg');
INSERT INTO "public"."restaurant_image" VALUES (76, '2022-09-17 11:06:04.195708', '2022-09-17 11:06:04.195708', 0, 'image for restaurant', 'MAIN', 'RE-20U5WFZHZL', 'restaurant1663387564118-1.jpg');
INSERT INTO "public"."restaurant_image" VALUES (77, '2022-09-17 11:06:04.197709', '2022-09-17 11:06:04.197709', 0, 'image for restaurant', 'MAIN', 'RE-20U5WFZHZL', 'restaurant1663387564124-2.jpg');
INSERT INTO "public"."restaurant_image" VALUES (78, '2022-09-17 11:06:04.197709', '2022-09-17 11:06:04.197709', 0, 'image for restaurant', 'MAIN', 'RE-20U5WFZHZL', 'restaurant1663387564134-3.jpg');
INSERT INTO "public"."restaurant_image" VALUES (79, '2022-09-17 11:06:04.198704', '2022-09-17 11:06:04.198704', 0, 'image for restaurant', 'MAIN', 'RE-20U5WFZHZL', 'restaurant1663387564140-4.jpg');
INSERT INTO "public"."restaurant_image" VALUES (80, '2022-09-17 11:06:04.198704', '2022-09-17 11:06:04.198704', 0, 'image for restaurant', 'MAIN', 'RE-20U5WFZHZL', 'restaurant1663387564151-5.jpg');
INSERT INTO "public"."restaurant_image" VALUES (81, '2022-09-17 11:06:04.199704', '2022-09-17 11:06:04.199704', 0, 'image for restaurant', 'MAIN', 'RE-20U5WFZHZL', 'restaurant1663387564156-6.jpg');
INSERT INTO "public"."restaurant_image" VALUES (82, '2022-09-17 11:06:04.199704', '2022-09-17 11:06:04.199704', 0, 'image for restaurant', 'MAIN', 'RE-20U5WFZHZL', 'restaurant1663387564167-7.jpg');
INSERT INTO "public"."restaurant_image" VALUES (83, '2022-09-17 11:06:04.199704', '2022-09-17 11:06:04.199704', 0, 'image for restaurant', 'MAIN', 'RE-20U5WFZHZL', 'restaurant1663387564172-8.jpg');
INSERT INTO "public"."restaurant_image" VALUES (84, '2022-09-17 11:06:04.199704', '2022-09-17 11:06:04.199704', 0, 'image for restaurant', 'MAIN', 'RE-20U5WFZHZL', 'restaurant1663387564186-9.jpg');
INSERT INTO "public"."restaurant_image" VALUES (89, '2022-09-17 11:10:17.08189', '2022-09-17 11:10:17.08189', 0, 'image for restaurant', 'MAIN', 'RE-34GFXMPFO4', 'restaurant1663387817002-0.jpg');
INSERT INTO "public"."restaurant_image" VALUES (90, '2022-09-17 11:10:17.082889', '2022-09-17 11:10:17.082889', 0, 'image for restaurant', 'MAIN', 'RE-34GFXMPFO4', 'restaurant1663387817013-1.jpg');
INSERT INTO "public"."restaurant_image" VALUES (91, '2022-09-17 11:10:17.082889', '2022-09-17 11:10:17.082889', 0, 'image for restaurant', 'MAIN', 'RE-34GFXMPFO4', 'restaurant1663387817021-2.jpg');
INSERT INTO "public"."restaurant_image" VALUES (92, '2022-09-17 11:10:17.082889', '2022-09-17 11:10:17.082889', 0, 'image for restaurant', 'MAIN', 'RE-34GFXMPFO4', 'restaurant1663387817032-3.jpg');
INSERT INTO "public"."restaurant_image" VALUES (93, '2022-09-17 11:10:17.082889', '2022-09-17 11:10:17.082889', 0, 'image for restaurant', 'MAIN', 'RE-34GFXMPFO4', 'restaurant1663387817039-4.jpg');
INSERT INTO "public"."restaurant_image" VALUES (94, '2022-09-17 11:10:17.082889', '2022-09-17 11:10:17.082889', 0, 'image for restaurant', 'MAIN', 'RE-34GFXMPFO4', 'restaurant1663387817050-5.jpg');
INSERT INTO "public"."restaurant_image" VALUES (95, '2022-09-17 11:10:17.083889', '2022-09-17 11:10:17.083889', 0, 'image for restaurant', 'MAIN', 'RE-34GFXMPFO4', 'restaurant1663387817056-6.jpg');
INSERT INTO "public"."restaurant_image" VALUES (96, '2022-09-17 11:10:17.083889', '2022-09-17 11:10:17.083889', 0, 'image for restaurant', 'MAIN', 'RE-34GFXMPFO4', 'restaurant1663387817066-7.jpg');
INSERT INTO "public"."restaurant_image" VALUES (97, '2022-09-17 11:10:17.083889', '2022-09-17 11:10:17.083889', 0, 'image for restaurant', 'MAIN', 'RE-34GFXMPFO4', 'restaurant1663387817072-8.jpg');
INSERT INTO "public"."restaurant_image" VALUES (101, '2022-09-17 11:13:21.843444', '2022-09-17 11:13:21.843444', 0, 'image for restaurant', 'MAIN', 'RE-APLTXFF3MD', 'restaurant1663388001768-0.jpg');
INSERT INTO "public"."restaurant_image" VALUES (102, '2022-09-17 11:13:21.844443', '2022-09-17 11:13:21.844443', 0, 'image for restaurant', 'MAIN', 'RE-APLTXFF3MD', 'restaurant1663388001776-1.jpg');
INSERT INTO "public"."restaurant_image" VALUES (103, '2022-09-17 11:13:21.844443', '2022-09-17 11:13:21.844443', 0, 'image for restaurant', 'MAIN', 'RE-APLTXFF3MD', 'restaurant1663388001782-2.jpg');
INSERT INTO "public"."restaurant_image" VALUES (104, '2022-09-17 11:13:21.845444', '2022-09-17 11:13:21.845444', 0, 'image for restaurant', 'MAIN', 'RE-APLTXFF3MD', 'restaurant1663388001797-3.jpg');
INSERT INTO "public"."restaurant_image" VALUES (105, '2022-09-17 11:13:21.845444', '2022-09-17 11:13:21.845444', 0, 'image for restaurant', 'MAIN', 'RE-APLTXFF3MD', 'restaurant1663388001808-4.jpg');
INSERT INTO "public"."restaurant_image" VALUES (106, '2022-09-17 11:13:21.845444', '2022-09-17 11:13:21.845444', 0, 'image for restaurant', 'MAIN', 'RE-APLTXFF3MD', 'restaurant1663388001814-5.jpg');
INSERT INTO "public"."restaurant_image" VALUES (107, '2022-09-17 11:13:21.846446', '2022-09-17 11:13:21.846446', 0, 'image for restaurant', 'MAIN', 'RE-APLTXFF3MD', 'restaurant1663388001826-6.jpg');
INSERT INTO "public"."restaurant_image" VALUES (108, '2022-09-17 11:13:21.846446', '2022-09-17 11:13:21.846446', 0, 'image for restaurant', 'MAIN', 'RE-APLTXFF3MD', 'restaurant1663388001834-7.jpg');

-- ----------------------------
-- Table structure for restaurant_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."restaurant_menu";
CREATE TABLE "public"."restaurant_menu" (
  "id" int8 NOT NULL,
  "available" bool,
  "currency" varchar(255) COLLATE "pg_catalog"."default",
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "image" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "price" float8,
  "restaurant_code" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of restaurant_menu
-- ----------------------------
INSERT INTO "public"."restaurant_menu" VALUES (34, 't', 'VNĐ', 'Buffet Nướng', 'restaurant-menu1663386301303.jpg', 'Buffet Nướng', 249000, 'RE-1HQH9ZJ7BE');
INSERT INTO "public"."restaurant_menu" VALUES (35, 't', 'VNĐ', 'Buffet Nướng Lẩu', 'restaurant-menu1663386343793.jpg', 'Buffet Nướng Lẩu', 319000, 'RE-1HQH9ZJ7BE');
INSERT INTO "public"."restaurant_menu" VALUES (36, 't', 'VNĐ', 'Tôm Hùm bỏ lò', 'restaurant-menu1663386509992.jpg', 'Tôm Hùm bỏ lò', 1200000, 'RE-COMUFJGS8Y');
INSERT INTO "public"."restaurant_menu" VALUES (37, 't', 'VNĐ', 'Cua huỳnh đế', 'restaurant-menu1663386534155.jpg', 'Cua huỳnh đế', 5000000, 'RE-COMUFJGS8Y');
INSERT INTO "public"."restaurant_menu" VALUES (38, 't', 'VNĐ', 'Sashimi cá hồi', 'restaurant-menu1663386576099.jpg', 'Sashimi cá hồi', 1000000, 'RE-COMUFJGS8Y');
INSERT INTO "public"."restaurant_menu" VALUES (39, 't', 'VNĐ', 'Beef Steak', 'restaurant-menu1663386638337.jpg', 'Beef Steak', 500000, 'RE-COMUFJGS8Y');
INSERT INTO "public"."restaurant_menu" VALUES (50, 't', 'VNĐ', 'Dê ré ủ trấu', 'restaurant-menu1663386945685.jpg', 'Dê ré ủ trấu', 500000, 'RE-FGSD7DAEII');
INSERT INTO "public"."restaurant_menu" VALUES (51, 't', 'VNĐ', ' Dê ré dược thiện ', 'restaurant-menu1663386978614.jpg', ' Dê ré dược thiện', 319000, 'RE-FGSD7DAEII');
INSERT INTO "public"."restaurant_menu" VALUES (52, 't', 'VNĐ', 'Lẩu cháo dê ré', 'restaurant-menu1663387009534.jpg', 'Lẩu cháo dê ré', 500000, 'RE-FGSD7DAEII');
INSERT INTO "public"."restaurant_menu" VALUES (53, 't', 'VNĐ', 'Lẩu cháo Sơn Vương', 'restaurant-menu1663387033009.jpg', 'Lẩu cháo Sơn Vương', 680, 'RE-FGSD7DAEII');
INSERT INTO "public"."restaurant_menu" VALUES (54, 't', 'VNĐ', ' Dê ré nướng tảng', 'restaurant-menu1663387061405.jpg', ' Dê ré nướng tảng', 319000, 'RE-FGSD7DAEII');
INSERT INTO "public"."restaurant_menu" VALUES (64, 't', 'VNĐ', 'Buffet chay', 'restaurant-menu1663387216999.jpg', 'Buffet chay', 119000, 'RE-XBRRFTMJJG');
INSERT INTO "public"."restaurant_menu" VALUES (71, 't', 'VNĐ', 'Gimbab', 'restaurant-menu1663387389130.jpg', 'Gimbab', 50000, 'RE-ST7JHRJTCT');
INSERT INTO "public"."restaurant_menu" VALUES (72, 't', 'VNĐ', 'Tokbokki', 'restaurant-menu1663387399582.jpg', 'Tokbokki', 500000, 'RE-ST7JHRJTCT');
INSERT INTO "public"."restaurant_menu" VALUES (73, 't', 'VNĐ', 'Mỳ đen trộn nóng', 'restaurant-menu1663387412978.jpg', 'Mỳ đen trộn nóng', 500000, 'RE-ST7JHRJTCT');
INSERT INTO "public"."restaurant_menu" VALUES (74, 't', 'VNĐ', 'Cơm trộn', 'restaurant-menu1663387432682.jpg', 'Cơm trộn', 500000, 'RE-ST7JHRJTCT');
INSERT INTO "public"."restaurant_menu" VALUES (85, 't', 'VNĐ', 'Sashimi', 'restaurant-menu1663387619586.jpg', 'Sashimi', 1000000, 'RE-20U5WFZHZL');
INSERT INTO "public"."restaurant_menu" VALUES (86, 't', 'VNĐ', 'Sushi', 'restaurant-menu1663387640165.jpg', 'Sushi', 1000000, 'RE-20U5WFZHZL');
INSERT INTO "public"."restaurant_menu" VALUES (87, 't', 'VNĐ', 'Ramen', 'restaurant-menu1663387668731.jpg', 'Ramen', 249000, 'RE-20U5WFZHZL');
INSERT INTO "public"."restaurant_menu" VALUES (88, 't', 'VNĐ', 'Maki', 'restaurant-menu1663387688044.jpg', 'Maki', 500000, 'RE-20U5WFZHZL');
INSERT INTO "public"."restaurant_menu" VALUES (98, 't', 'VNĐ', 'Buffet Hồng Kông', 'restaurant-menu1663387835094.jpg', 'Buffet Hồng Kông', 259000, 'RE-34GFXMPFO4');
INSERT INTO "public"."restaurant_menu" VALUES (99, 't', 'VNĐ', 'Buffet Dimsum', 'restaurant-menu1663387860620.jpg', 'Buffet Dimsum', 219000, 'RE-34GFXMPFO4');
INSERT INTO "public"."restaurant_menu" VALUES (100, 't', 'VNĐ', 'Bào ngư lát sốt rau xanh dầu hào', 'restaurant-menu1663387879813.jpg', 'Bào ngư lát sốt rau xanh dầu hào', 500000, 'RE-34GFXMPFO4');
INSERT INTO "public"."restaurant_menu" VALUES (109, 't', 'VNĐ', 'Buffet Lẩu', 'restaurant-menu1663388043070.jpg', 'Buffet Lẩu', 149000, 'RE-APLTXFF3MD');
INSERT INTO "public"."restaurant_menu" VALUES (110, 't', 'VNĐ', 'Cua rang me', 'restaurant-menu1663388063450.jpg', 'Cua rang me', 500000, 'RE-APLTXFF3MD');
INSERT INTO "public"."restaurant_menu" VALUES (111, 't', 'VNĐ', 'Tôm chiên kiểu Thái', 'restaurant-menu1663388098647.jpg', 'Tôm chiên kiểu Thái', 319000, 'RE-APLTXFF3MD');

-- ----------------------------
-- Table structure for restaurant_receipt
-- ----------------------------
DROP TABLE IF EXISTS "public"."restaurant_receipt";
CREATE TABLE "public"."restaurant_receipt" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6),
  "updated_at" timestamp(6),
  "version" int4 NOT NULL,
  "booking_id" varchar(255) COLLATE "pg_catalog"."default",
  "checkin_day" int4,
  "checkin_time" varchar(255) COLLATE "pg_catalog"."default",
  "number_adult" int4,
  "number_child" int4,
  "partner_id" varchar(255) COLLATE "pg_catalog"."default",
  "phone_partner" varchar(255) COLLATE "pg_catalog"."default",
  "restaurant_info" jsonb,
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "user_id" varchar(255) COLLATE "pg_catalog"."default",
  "contact_id" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of restaurant_receipt
-- ----------------------------
INSERT INTO "public"."restaurant_receipt" VALUES ('bc430286-0788-4f08-9568-76e623632b34', '2022-09-17 10:51:55.444414', '2022-09-17 15:08:49.300551', 1, 'L85DI3V9', 20220917, '10:51', 2, 0, '44854ec8-d083-402e-b534-afec7687dfe7', '0348970886', '{"id": "fce77b67-5afb-4a19-8374-847ae8d026f1", "code": "RE-1HQH9ZJ7BE", "slug": "king-bbq--hoang-ao-thuyre-1hqh9zj7be", "title": "King BBQ – Hoàng Đạo Thúy", "userId": "44854ec8-d083-402e-b534-afec7687dfe7", "address": "Tòa nhà 24T2, Hoàng Đạo Thúy, Q. Cầu Giấy", "feature": [1], "imagesList": ["restaurant1663092242763-0.jpg", "restaurant1663092242775-1.jpg", "restaurant1663092242781-2.jpg", "restaurant1663092242786-3.jpg", "restaurant1663092242792-4.jpg", "restaurant1663092242797-5.jpg", "restaurant1663092242803-6.jpg", "restaurant1663092242808-7.jpg", "restaurant1663092242815-8.jpg"], "description": "- King BBQ thuộc sở hữu của Tập đoàn RedSun ITI – Một trong những tập đoàn ẩm thực lớn mạnh bậc nhất Việt Nam, sở hữu nhiều thương hiệu ẩm thực nổi tiếng khác như: ThaiExpress, Hotpot Story, Seoul Garden, Sushi Kei, Buk Buk, Capricciosa, Khao Lao, Tasaki BBQ, Dolpan Sam\r\n\r\n- Công thức độc quyền của “nước sốt King” – được chính Bếp trưởng Park Sung Min, một trong những đầu bếp nổi tiếng nhất Hàn Quốc, với kinh nghiệm hơn 40 năm trong ngành ẩm thực, trực tiếp nghiên cứu và chế biến.", "menuDTOList": [{"id": 34, "name": "Buffet Nướng", "image": "restaurant-menu1663386301303.jpg", "price": 249000.0, "currency": "VNĐ", "description": "Buffet Nướng"}, {"id": 35, "name": "Buffet Nướng Lẩu", "image": "restaurant-menu1663386343793.jpg", "price": 319000.0, "currency": "VNĐ", "description": "Buffet Nướng Lẩu"}], "phonePartner": null, "approveStatus": "APPROVED", "restaurantType": "NHA_HANG"}', 'BOOKING_APPROVED', 'e67e5e7d-70c8-41b8-8c78-3009afd17356', 'b56eb2a6-b353-44f2-a8e7-dbe0d6d39a9d');
INSERT INTO "public"."restaurant_receipt" VALUES ('d1528d99-ba1b-4a82-8d47-becf091747b6', '2022-09-18 11:58:42.695254', '2022-09-18 11:59:04.507412', 1, 'L86VBUIG', 20220921, '12:00', 5, 0, '44854ec8-d083-402e-b534-afec7687dfe7', '0348970886', '{"id": "528559c9-3268-475f-8c0e-de255c1f6831", "code": "RE-APLTXFF3MD", "slug": "chai-talay---xa-anre-apltxff3md", "title": "Chai Talay - Xã Đàn", "userId": "44854ec8-d083-402e-b534-afec7687dfe7", "address": " 474 Xã Đàn, Q. Đống Đa", "feature": [1], "imagesList": ["restaurant1663388001768-0.jpg", "restaurant1663388001776-1.jpg", "restaurant1663388001782-2.jpg", "restaurant1663388001797-3.jpg", "restaurant1663388001808-4.jpg", "restaurant1663388001814-5.jpg", "restaurant1663388001826-6.jpg", "restaurant1663388001834-7.jpg"], "description": "Nhà hàng Chai Talay - Số 474 Xã Đàn, Quận Đống Đa – Điểm dừng chân của những bạn trẻ yêu thích ẩm thực xứ Chùa Vàng\r\nTiếp nối sự thành công của chuỗi nhà hàng Aroi Dessert & Café, chủ nhà hàng đã quyết định cho ra đời thương hiệu mới chuyên về đồ ăn Thái Lan kết hợp với buffet lẩu mang tên Chai Talay tọa lạc tại số 474 Xã Đàn, phường Nam Đồng, quận Đống Đa. Dưới bàn tay của bếp trưởng người Thái Lan và nguyên liệu được nhập khẩu trực tiếp, những món ăn mang đậm chất ẩm thực đường phố Thái đặc biệt là hải sản, được phân chia món ăn dễ dàng cho thực khách lựa chọn như: món khai vị, món thịt, cá, tôm, cua, món tráng miệng.... Có thể kể đến như: Chân gà rang mắm; Gà nướng lá nếp; Cá giòn xóc tỏi; Tôm sốt me kiểu Thái; Tôm chiên kiểu Thái; Mực xào trứng muối, mực hấp chanh muối; Cua rang me; Lẩu Thái bò Mỹ; Lẩu Thái hải sản...\r\n\r\nSẽ không quá khó khăn để tìm đến Chai Talay trên khu phố Xã Đàn đông đúc. Mặt tiền rộng rãi, chiếm trọn 3 tầng và cửa sổ hoàn toàn ốp kính, Chai Talay sở hữu sức chứa 96 khách đại diện cho phong cách nhà hàng Thái hiện đại song vẫn giữ được vẻ mộc mạc. Nếu vào ban ngày không gian nhà hàng ngập tràn ánh sáng tự nhiên, cho đến khi chiều tối có thể nhìn ngắm ánh đèn đường, đèn xe của dòng người qua lại cũng là một điều thú vị.\r\n\r\nVới mức giá 120.000 đến 150.000 vnđ/người, nhà hàng phù hợp cho nhiều mục đích đi ăn của thực khách từ ăn gia đình, bạn bè đến những buổi liên hoan, họp nhóm, sinh nhật,...", "menuDTOList": [{"id": 109, "name": "Buffet Lẩu", "image": "restaurant-menu1663388043070.jpg", "price": 149000.0, "currency": "VNĐ", "description": "Buffet Lẩu"}, {"id": 110, "name": "Cua rang me", "image": "restaurant-menu1663388063450.jpg", "price": 500000.0, "currency": "VNĐ", "description": "Cua rang me"}, {"id": 111, "name": "Tôm chiên kiểu Thái", "image": "restaurant-menu1663388098647.jpg", "price": 319000.0, "currency": "VNĐ", "description": "Tôm chiên kiểu Thái"}], "phonePartner": null, "approveStatus": "APPROVED", "restaurantType": "QUAN_BAR_QUAN_RUOR"}', 'BOOKING_APPROVED', 'e67e5e7d-70c8-41b8-8c78-3009afd17356', 'b43a52cc-bfc9-435d-88f5-30542f31c8e6');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS "public"."role";
CREATE TABLE "public"."role" (
  "id" int8 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
),
  "name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO "public"."role" VALUES (1, 'ROLE_ADMIN');
INSERT INTO "public"."role" VALUES (2, 'ROLE_EMPLOYEE');
INSERT INTO "public"."role" VALUES (3, 'ROLE_CONTENT');
INSERT INTO "public"."role" VALUES (4, 'ROLE_PARTNER');
INSERT INTO "public"."role" VALUES (5, 'ROLE_MEMBER');

-- ----------------------------
-- Function structure for vn_unaccent
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."vn_unaccent"(text);
CREATE OR REPLACE FUNCTION "public"."vn_unaccent"(text)
  RETURNS "pg_catalog"."text" AS $BODY$
SELECT lower(translate($1,
'¹²³ÀÁẢẠÂẤẦẨẬẪÃÄÅÆàáảạâấầẩẫậãäåæĀāĂẮẰẲẴẶăắằẳẵặĄąÇçĆćĈĉĊċČčĎďĐđÈÉẸÊỂẾỀỄỆËèéẹểêềếễệëĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħĨÌÍỈỊÎÏìíỉịîïĩĪīĬĭĮįİıĲĳĴĵĶķĸĹĺĻļĽľĿŀŁłÑñŃńŅņŇňŉŊŋÒÓỎỌÔỐỒỔỖỘỔỐỒỔỖỘƠỚỜỞỠỢÕÖòóỏọôổốồổỗộơớờỡợởõöŌōŎŏŐőŒœØøŔŕŖŗŘřßŚśŜŝŞşŠšŢţŤťŦŧÙÚỦỤƯỪỨỬỮỰÛÜùúủụûưứừửữựüŨũŪūŬŭŮůŰűŲųŴŵÝýỲÿŶŷŸŹźŻżŽžёЁ',
'123AAAAAAAAAAAAAAaaaaaaaaaaaaaaAaAAAAAAaaaaaaAaCcCcCcCcCcDdDdEEEEEEEEEEeeeeeeeeeeEeEeEeEeEeGgGgGgGgHhHhIIIIIIIiiiiiiiIiIiIiIiIiJjKkkLlLlLlLlLlNnNnNnNnnNnOOOOOOOOOOOOOOOOOOOOOOOOoooooooooooooooooooOoOoOoEeOoRrRrRrSSsSsSsSsTtTtTtUUUUUUUUUUUUuuuuuuuuuuuuUuUuUuUuUuUuWwYyYyYyYZzZzZzеЕ'));
$BODY$
  LANGUAGE sql IMMUTABLE
  COST 100;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."activities_game_id_seq"
OWNED BY "public"."activities_game"."id";
SELECT setval('"public"."activities_game_id_seq"', 7, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."amenities_id_seq"
OWNED BY "public"."amenities"."id";
SELECT setval('"public"."amenities_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."feature_id_seq"
OWNED BY "public"."feature"."id";
SELECT setval('"public"."feature_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."hibernate_sequence"', 255, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."role_id_seq"
OWNED BY "public"."role"."id";
SELECT setval('"public"."role_id_seq"', 2, false);

-- ----------------------------
-- Uniques structure for table account
-- ----------------------------
ALTER TABLE "public"."account" ADD CONSTRAINT "uk_q0uja26qgu1atulenwup9rxyr" UNIQUE ("email");

-- ----------------------------
-- Primary Key structure for table account
-- ----------------------------
ALTER TABLE "public"."account" ADD CONSTRAINT "account_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table activities
-- ----------------------------
ALTER TABLE "public"."activities" ADD CONSTRAINT "activities_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table activities_game
-- ----------------------------
ALTER TABLE "public"."activities_game" ADD CONSTRAINT "activities_game_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table activities_image
-- ----------------------------
CREATE INDEX "activities_image_hotel_code_idx" ON "public"."activities_image" USING btree (
  "activities_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table activities_image
-- ----------------------------
ALTER TABLE "public"."activities_image" ADD CONSTRAINT "activities_image_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table activities_receipt
-- ----------------------------
ALTER TABLE "public"."activities_receipt" ADD CONSTRAINT "activities_receipt_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table amenities
-- ----------------------------
ALTER TABLE "public"."amenities" ADD CONSTRAINT "amenities_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table booking_contact
-- ----------------------------
ALTER TABLE "public"."booking_contact" ADD CONSTRAINT "booking_contact_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table favorite
-- ----------------------------
ALTER TABLE "public"."favorite" ADD CONSTRAINT "favorite_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table favorite_hotel
-- ----------------------------
ALTER TABLE "public"."favorite_hotel" ADD CONSTRAINT "favorite_hotel_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table feature
-- ----------------------------
ALTER TABLE "public"."feature" ADD CONSTRAINT "feature_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table hotel
-- ----------------------------
ALTER TABLE "public"."hotel" ADD CONSTRAINT "hotel_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table hotel_bookable_item
-- ----------------------------
CREATE INDEX "p_b_i_hotel_code_idx" ON "public"."hotel_bookable_item" USING btree (
  "hotel_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table hotel_bookable_item
-- ----------------------------
ALTER TABLE "public"."hotel_bookable_item" ADD CONSTRAINT "hotel_bookable_item_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table hotel_image
-- ----------------------------
CREATE INDEX "hotel_image_hotel_code_idx" ON "public"."hotel_image" USING btree (
  "hotel_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table hotel_image
-- ----------------------------
ALTER TABLE "public"."hotel_image" ADD CONSTRAINT "hotel_image_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table hotel_receipt
-- ----------------------------
ALTER TABLE "public"."hotel_receipt" ADD CONSTRAINT "hotel_receipt_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table post
-- ----------------------------
ALTER TABLE "public"."post" ADD CONSTRAINT "post_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table restaurant
-- ----------------------------
ALTER TABLE "public"."restaurant" ADD CONSTRAINT "restaurant_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table restaurant_image
-- ----------------------------
CREATE INDEX "restaurant_image_code_idx" ON "public"."restaurant_image" USING btree (
  "restaurant_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table restaurant_image
-- ----------------------------
ALTER TABLE "public"."restaurant_image" ADD CONSTRAINT "restaurant_image_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table restaurant_menu
-- ----------------------------
CREATE INDEX "r_m_restaurant_code_idx" ON "public"."restaurant_menu" USING btree (
  "restaurant_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table restaurant_menu
-- ----------------------------
ALTER TABLE "public"."restaurant_menu" ADD CONSTRAINT "restaurant_menu_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table restaurant_receipt
-- ----------------------------
ALTER TABLE "public"."restaurant_receipt" ADD CONSTRAINT "restaurant_receipt_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table role
-- ----------------------------
ALTER TABLE "public"."role" ADD CONSTRAINT "role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table account
-- ----------------------------
ALTER TABLE "public"."account" ADD CONSTRAINT "fkd4vb66o896tay3yy52oqxr9w0" FOREIGN KEY ("role_id") REFERENCES "public"."role" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table activities_receipt
-- ----------------------------
ALTER TABLE "public"."activities_receipt" ADD CONSTRAINT "fkl86kxmlkveexitipcnypa8jvs" FOREIGN KEY ("contact_id") REFERENCES "public"."booking_contact" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table hotel_receipt
-- ----------------------------
ALTER TABLE "public"."hotel_receipt" ADD CONSTRAINT "fksxv8ohy9v8cjpp3wsas99bnw9" FOREIGN KEY ("contact_id") REFERENCES "public"."booking_contact" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table restaurant_receipt
-- ----------------------------
ALTER TABLE "public"."restaurant_receipt" ADD CONSTRAINT "fk8tq5laypn8fkxcxgja1vqdxoh" FOREIGN KEY ("contact_id") REFERENCES "public"."booking_contact" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
