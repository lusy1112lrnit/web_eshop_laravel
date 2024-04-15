-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2024 at 03:45 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartshop_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `user_id`, `title`, `subtitle`, `image`, `category`, `content`, `created_at`, `updated_at`) VALUES
(1, 3, 'The Personality Trait That Makes People Happier', '', 'blog-1.jpg', 'TRAVEL', '', NULL, NULL),
(2, 3, 'This was one of our first days in Hawaii last week.', '', 'blog-2.jpg', 'CodeLeanON', '', NULL, NULL),
(3, 3, 'Last week I had my first work trip of the year to Sonoma Valley', '', 'blog-3.jpg', 'TRAVEL', '', NULL, NULL),
(4, 3, 'Happppppy New Year! I know I am a little late on this post', '', 'blog-4.jpg', 'CodeLeanON', '', NULL, NULL),
(5, 3, 'Absolue collection. The Lancome team has been one…', '', 'blog-5.jpg', 'MODEL', '', NULL, NULL),
(6, 3, 'Writing has always been kind of therapeutic for me', '', 'blog-6.jpg', 'CodeLeanON', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `messages` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Apple', NULL, NULL),
(2, 'Samsung', NULL, NULL),
(3, 'Xiaomi', NULL, NULL),
(4, 'Sony', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_12_09_085528_create_orders_table', 1),
(6, '2020_12_09_085832_create_order_details_table', 1),
(7, '2020_12_09_085936_create_products_table', 1),
(8, '2020_12_09_090029_create_brands_table', 1),
(9, '2020_12_09_090110_create_product_categories_table', 1),
(10, '2020_12_09_090148_create_product_images_table', 1),
(11, '2020_12_09_090228_create_product_details_table', 1),
(12, '2020_12_09_090308_create_product_comments_table', 1),
(13, '2020_12_09_090355_create_blogs_table', 1),
(14, '2020_12_09_090437_create_blog_comments_table', 1),
(15, '2024_04_12_185704_add_company_name_to_users_table', 2),
(16, '2024_04_14_155343_add_google_id_in_users_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `country` varchar(255) NOT NULL,
  `street_address` varchar(255) NOT NULL,
  `postcode_zip` varchar(255) NOT NULL,
  `town_city` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `amount` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL,
  `product_category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `price` double NOT NULL,
  `qty` int(11) NOT NULL,
  `discount` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `featured` tinyint(1) NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `product_category_id`, `name`, `description`, `content`, `price`, `qty`, `discount`, `weight`, `sku`, `featured`, `tag`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Iphone 15', 'Điện thoại là một thiết bị di động được sử dụng rộng rãi trong cuộc sống hàng ngày. Dù ban đầu được thiết kế để thực hiện cuộc gọi và nhắn tin, điện thoại ngày nay đã trở thành một công cụ đa chức năng với nhiều tính năng bổ sung như truy cập internet, chụp ảnh, quay video, chơi game, xem video, nghe nhạc và nhiều tính năng khác.', 'Điện thoại đã trở thành một phần không thể thiếu trong cuộc sống hàng ngày của chúng ta. Nó không chỉ là một công cụ giao tiếp, mà còn là một trợ thủ đa năng, một nguồn giải trí và một cửa sổ mở ra thế giới.', 24500000, 20, 20000000, 1.3, '00012', 1, 'ios', NULL, NULL),
(2, 2, 2, 'Samsung S20', 'Điện thoại là một thiết bị di động được sử dụng rộng rãi trong cuộc sống hàng ngày. Dù ban đầu được thiết kế để thực hiện cuộc gọi và nhắn tin, điện thoại ngày nay đã trở thành một công cụ đa chức năng với nhiều tính năng bổ sung như truy cập internet, chụp ảnh, quay video, chơi game, xem video, nghe nhạc và nhiều tính năng khác.', 'Điện thoại đã trở thành một phần không thể thiếu trong cuộc sống hàng ngày của chúng ta. Nó không chỉ là một công cụ giao tiếp, mà còn là một trợ thủ đa năng, một nguồn giải trí và một cửa sổ mở ra thế giới.\n', 20000000, 20, 16000000, NULL, NULL, 1, 'android', NULL, NULL),
(3, 1, 1, 'Iphone 14', 'Điện thoại là một thiết bị di động được sử dụng rộng rãi trong cuộc sống hàng ngày. Dù ban đầu được thiết kế để thực hiện cuộc gọi và nhắn tin, điện thoại ngày nay đã trở thành một công cụ đa chức năng với nhiều tính năng bổ sung như truy cập internet, chụp ảnh, quay video, chơi game, xem video, nghe nhạc và nhiều tính năng khác.', 'Điện thoại đã trở thành một phần không thể thiếu trong cuộc sống hàng ngày của chúng ta. Nó không chỉ là một công cụ giao tiếp, mà còn là một trợ thủ đa năng, một nguồn giải trí và một cửa sổ mở ra thế giới.\n\nĐiện thoại ngày nay không chỉ giúp chúng ta thực hiện cuộc gọi và nhắn tin một cách dễ dàng, mà còn cung cấp một loạt các tính năng và ứng dụng giúp chúng ta hoàn thành các nhiệm vụ hàng ngày một cách hiệu quả hơn. Từ quản lý lịch trình, ghi chú, đến truy cập email và mạng xã hội, điện thoại giúp chúng ta duy trì kết nối với thế giới xung quanh một cách thuận tiện và nhanh chóng.\n\nNgoài ra, điện thoại cũng là một nguồn giải trí không thể thiếu. Với màn hình lớn và độ phân giải cao, chúng ta có thể thưởng thức video, xem phim, nghe nhạc, chơi game, và đọc sách mọi lúc mọi nơi. Các ứng dụng giải trí đa dạng trên điện thoại mang lại cho chúng ta trải nghiệm giải trí cá nhân và thư giãn tuyệt vời.', 20000000, 20, 18500000, NULL, NULL, 1, 'ios', NULL, NULL),
(4, 4, 2, 'Sony Ultra', 'Điện thoại là một thiết bị di động được sử dụng rộng rãi trong cuộc sống hàng ngày. Dù ban đầu được thiết kế để thực hiện cuộc gọi và nhắn tin, điện thoại ngày nay đã trở thành một công cụ đa chức năng với nhiều tính năng bổ sung như truy cập internet, chụp ảnh, quay video, chơi game, xem video, nghe nhạc và nhiều tính năng khác.', 'Điện thoại đã trở thành một phần không thể thiếu trong cuộc sống hàng ngày của chúng ta. Nó không chỉ là một công cụ giao tiếp, mà còn là một trợ thủ đa năng, một nguồn giải trí và một cửa sổ mở ra thế giới.\n\nĐiện thoại ngày nay không chỉ giúp chúng ta thực hiện cuộc gọi và nhắn tin một cách dễ dàng, mà còn cung cấp một loạt các tính năng và ứng dụng giúp chúng ta hoàn thành các nhiệm vụ hàng ngày một cách hiệu quả hơn. Từ quản lý lịch trình, ghi chú, đến truy cập email và mạng xã hội, điện thoại giúp chúng ta duy trì kết nối với thế giới xung quanh một cách thuận tiện và nhanh chóng.\n\nNgoài ra, điện thoại cũng là một nguồn giải trí không thể thiếu. Với màn hình lớn và độ phân giải cao, chúng ta có thể thưởng thức video, xem phim, nghe nhạc, chơi game, và đọc sách mọi lúc mọi nơi. Các ứng dụng giải trí đa dạng trên điện thoại mang lại cho chúng ta trải nghiệm giải trí cá nhân và thư giãn tuyệt vời.', 20000000, 20, 16000000, NULL, NULL, 1, 'android', NULL, NULL),
(5, 1, 1, 'Iphone 13', 'Điện thoại là một thiết bị di động được sử dụng rộng rãi trong cuộc sống hàng ngày. Dù ban đầu được thiết kế để thực hiện cuộc gọi và nhắn tin, điện thoại ngày nay đã trở thành một công cụ đa chức năng với nhiều tính năng bổ sung như truy cập internet, chụp ảnh, quay video, chơi game, xem video, nghe nhạc và nhiều tính năng khác.', 'Điện thoại đã trở thành một phần không thể thiếu trong cuộc sống hàng ngày của chúng ta. Nó không chỉ là một công cụ giao tiếp, mà còn là một trợ thủ đa năng, một nguồn giải trí và một cửa sổ mở ra thế giới.\n\nĐiện thoại ngày nay không chỉ giúp chúng ta thực hiện cuộc gọi và nhắn tin một cách dễ dàng, mà còn cung cấp một loạt các tính năng và ứng dụng giúp chúng ta hoàn thành các nhiệm vụ hàng ngày một cách hiệu quả hơn. Từ quản lý lịch trình, ghi chú, đến truy cập email và mạng xã hội, điện thoại giúp chúng ta duy trì kết nối với thế giới xung quanh một cách thuận tiện và nhanh chóng.\n\nNgoài ra, điện thoại cũng là một nguồn giải trí không thể thiếu. Với màn hình lớn và độ phân giải cao, chúng ta có thể thưởng thức video, xem phim, nghe nhạc, chơi game, và đọc sách mọi lúc mọi nơi. Các ứng dụng giải trí đa dạng trên điện thoại mang lại cho chúng ta trải nghiệm giải trí cá nhân và thư giãn tuyệt vời.', 18000000, 20, 16000000, NULL, NULL, 0, 'ios', NULL, NULL),
(6, 3, 2, 'Xiaomi Poco X3 Pro', 'Điện thoại là một thiết bị di động được sử dụng rộng rãi trong cuộc sống hàng ngày. Dù ban đầu được thiết kế để thực hiện cuộc gọi và nhắn tin, điện thoại ngày nay đã trở thành một công cụ đa chức năng với nhiều tính năng bổ sung như truy cập internet, chụp ảnh, quay video, chơi game, xem video, nghe nhạc và nhiều tính năng khác.', 'Điện thoại đã trở thành một phần không thể thiếu trong cuộc sống hàng ngày của chúng ta. Nó không chỉ là một công cụ giao tiếp, mà còn là một trợ thủ đa năng, một nguồn giải trí và một cửa sổ mở ra thế giới.\n\nĐiện thoại ngày nay không chỉ giúp chúng ta thực hiện cuộc gọi và nhắn tin một cách dễ dàng, mà còn cung cấp một loạt các tính năng và ứng dụng giúp chúng ta hoàn thành các nhiệm vụ hàng ngày một cách hiệu quả hơn. Từ quản lý lịch trình, ghi chú, đến truy cập email và mạng xã hội, điện thoại giúp chúng ta duy trì kết nối với thế giới xung quanh một cách thuận tiện và nhanh chóng.\n\nNgoài ra, điện thoại cũng là một nguồn giải trí không thể thiếu. Với màn hình lớn và độ phân giải cao, chúng ta có thể thưởng thức video, xem phim, nghe nhạc, chơi game, và đọc sách mọi lúc mọi nơi. Các ứng dụng giải trí đa dạng trên điện thoại mang lại cho chúng ta trải nghiệm giải trí cá nhân và thư giãn tuyệt vời.', 6000000, 20, 5000000, NULL, NULL, 1, 'android', NULL, NULL),
(7, 1, 1, 'Iphone 12 HIHI', '<p>Điện thoại l&agrave; một thiết bị di động được sử dụng rộng r&atilde;i trong cuộc sống h&agrave;ng ng&agrave;y. D&ugrave; ban đầu được thiết kế để thực hiện cuộc gọi v&agrave; nhắn tin, điện thoại ng&agrave;y nay đ&atilde; trở th&agrave;nh một c&ocirc;ng cụ đa chức năng với nhiều t&iacute;nh năng bổ sung như truy cập internet, chụp ảnh, quay video, chơi game, xem video, nghe nhạc v&agrave; nhiều t&iacute;nh năng kh&aacute;c.</p>', 'Điện thoại đã trở thành một phần không thể thiếu trong cuộc sống hàng ngày của chúng ta. Nó không chỉ là một công cụ giao tiếp, mà còn là một trợ thủ đa năng, một nguồn giải trí và một cửa sổ mở ra thế giới.Điện thoại ngày nay không chỉ giúp chúng ta thực hiện cuộc gọi và nhắn tin một cách dễ dàng, mà còn cung cấp một loạt các tính năng và ứng dụng giúp chúng ta hoàn thành các nhiệm vụ hàng ngày một cách hiệu quả hơn. Từ quản lý lịch trình, ghi chú, đến truy cập email và mạng xã hội, điện thoại giúp chúng ta duy trì kết nối với thế giới xung quanh một cách thuận tiện và nhanh chóng.Ngoài ra, điện thoại cũng là một nguồn giải trí không thể thiếu. Với màn hình lớn và độ phân giải cao, chúng ta có thể thưởng thức video, xem phim, nghe nhạc, chơi game, và đọc sách mọi lúc mọi nơi. Các ứng dụng giải trí đa dạng trên điện thoại mang lại cho chúng ta trải nghiệm giải trí cá nhân và thư giãn tuyệt vời.', 16000000, 20, 12000000, 150, '12500', 1, 'ios', NULL, '2024-04-13 09:49:26'),
(8, 1, 2, 'Samsung S22', 'Điện thoại là một thiết bị di động được sử dụng rộng rãi trong cuộc sống hàng ngày. Dù ban đầu được thiết kế để thực hiện cuộc gọi và nhắn tin, điện thoại ngày nay đã trở thành một công cụ đa chức năng với nhiều tính năng bổ sung như truy cập internet, chụp ảnh, quay video, chơi game, xem video, nghe nhạc và nhiều tính năng khác.', 'Điện thoại đã trở thành một phần không thể thiếu trong cuộc sống hàng ngày của chúng ta. Nó không chỉ là một công cụ giao tiếp, mà còn là một trợ thủ đa năng, một nguồn giải trí và một cửa sổ mở ra thế giới.\n\nĐiện thoại ngày nay không chỉ giúp chúng ta thực hiện cuộc gọi và nhắn tin một cách dễ dàng, mà còn cung cấp một loạt các tính năng và ứng dụng giúp chúng ta hoàn thành các nhiệm vụ hàng ngày một cách hiệu quả hơn. Từ quản lý lịch trình, ghi chú, đến truy cập email và mạng xã hội, điện thoại giúp chúng ta duy trì kết nối với thế giới xung quanh một cách thuận tiện và nhanh chóng.\n\nNgoài ra, điện thoại cũng là một nguồn giải trí không thể thiếu. Với màn hình lớn và độ phân giải cao, chúng ta có thể thưởng thức video, xem phim, nghe nhạc, chơi game, và đọc sách mọi lúc mọi nơi. Các ứng dụng giải trí đa dạng trên điện thoại mang lại cho chúng ta trải nghiệm giải trí cá nhân và thư giãn tuyệt vời.', 22000000, 20, 20000000, NULL, NULL, 1, 'android', NULL, NULL),
(9, 1, 1, 'Iphone 15 Pro Max', 'Điện thoại là một thiết bị di động được sử dụng rộng rãi trong cuộc sống hàng ngày. Dù ban đầu được thiết kế để thực hiện cuộc gọi và nhắn tin, điện thoại ngày nay đã trở thành một công cụ đa chức năng với nhiều tính năng bổ sung như truy cập internet, chụp ảnh, quay video, chơi game, xem video, nghe nhạc và nhiều tính năng khác.', 'Điện thoại đã trở thành một phần không thể thiếu trong cuộc sống hàng ngày của chúng ta. Nó không chỉ là một công cụ giao tiếp, mà còn là một trợ thủ đa năng, một nguồn giải trí và một cửa sổ mở ra thế giới.\n\nĐiện thoại ngày nay không chỉ giúp chúng ta thực hiện cuộc gọi và nhắn tin một cách dễ dàng, mà còn cung cấp một loạt các tính năng và ứng dụng giúp chúng ta hoàn thành các nhiệm vụ hàng ngày một cách hiệu quả hơn. Từ quản lý lịch trình, ghi chú, đến truy cập email và mạng xã hội, điện thoại giúp chúng ta duy trì kết nối với thế giới xung quanh một cách thuận tiện và nhanh chóng.\n\nNgoài ra, điện thoại cũng là một nguồn giải trí không thể thiếu. Với màn hình lớn và độ phân giải cao, chúng ta có thể thưởng thức video, xem phim, nghe nhạc, chơi game, và đọc sách mọi lúc mọi nơi. Các ứng dụng giải trí đa dạng trên điện thoại mang lại cho chúng ta trải nghiệm giải trí cá nhân và thư giãn tuyệt vời.', 30000000, 20, 25000000, NULL, NULL, 1, 'ios', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'ios', NULL, NULL),
(2, 'android', NULL, NULL),
(3, 'windowsphone', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_comments`
--

CREATE TABLE `product_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `messages` varchar(255) NOT NULL,
  `rating` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_comments`
--

INSERT INTO `product_comments` (`id`, `product_id`, `user_id`, `email`, `name`, `messages`, `rating`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'BrandonKelley@gmail.com', 'Brandon Kelley', 'Nice !', 4, NULL, NULL),
(2, 1, 5, 'RoyBanks@gmail.com', 'Roy Banks', 'Nice !', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `color` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`id`, `product_id`, `color`, `size`, `qty`, `created_at`, `updated_at`) VALUES
(1, 1, 'blue', 'S', 5, NULL, NULL),
(2, 1, 'blue', 'M', 5, NULL, NULL),
(3, 1, 'blue', 'L', 5, NULL, NULL),
(4, 1, 'blue', 'XS', 5, NULL, NULL),
(5, 1, 'yellow', 'S', 0, NULL, NULL),
(6, 1, 'violet', 'S', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `path`, `created_at`, `updated_at`) VALUES
(1, 1, 'product-1.jpg', NULL, NULL),
(2, 1, 'product-1-2.jpg', NULL, NULL),
(3, 1, 'product-1-3.jpg', NULL, NULL),
(4, 2, 'product-2.jpg', NULL, NULL),
(5, 3, 'product-3.jpg', NULL, NULL),
(6, 4, 'product-4.jpg', NULL, NULL),
(7, 5, 'product-5.jpg', NULL, NULL),
(8, 6, 'product-6.jpg', NULL, NULL),
(9, 7, 'product-7.jpg', NULL, NULL),
(10, 8, 'product-8.jpg', NULL, NULL),
(11, 9, 'product-9.jpg', NULL, NULL),
(12, 16, 'product-1.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `postcode_zip` varchar(255) DEFAULT NULL,
  `town_city` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `level` tinyint(4) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `company_name`, `country`, `street_address`, `postcode_zip`, `town_city`, `phone`, `remember_token`, `avatar`, `level`, `description`, `created_at`, `updated_at`, `google_id`) VALUES
(1, 'smartshop', 'smartshop@gmail.com', NULL, '$2y$10$J7.bJFE3T06So/kF2ZV8VenHBTW7/yZOQRlL5sRvO72AZObbbo0tm', NULL, NULL, NULL, NULL, NULL, '0984006000', 'tc6bg3bGU1WU344TuEpZTO132SbQsBfRiuzR265tYpsZzowWjRn8xUWDZjLh', 'cat_661a091e43bdf_240413_042502.png', 0, NULL, NULL, '2024-04-12 21:25:02', NULL),
(2, 'admin', 'admin@gmail.com', NULL, '$2y$10$GFOPrD6cVt9.x7XHgftHc.8h165crPNVDSqwP8NNAHhVgxVdYxsYO', NULL, NULL, NULL, NULL, NULL, '0971009000', 'byToGLPuUnZH6XqbnO8ik7kQGbLX2CONb8TVhrILKYzNh1yp2Ofa0cLhmBsG', 'cat_661a09e7365eb_240413_042823.png', 1, NULL, NULL, '2024-04-12 21:28:23', NULL),
(3, 'Shane Lynch', 'ShaneLynch@gmail.com', NULL, '$2y$10$posafaK1KOWh6g60yg21se3N9ghav8hEEemunSF/kGPsR8X3Cyiyu', NULL, NULL, NULL, NULL, NULL, '0971234567', NULL, NULL, 2, NULL, NULL, '2024-04-12 21:41:33', NULL),
(4, 'Brandon Kelley', 'BrandonKelley@gmail.com', NULL, '$2y$10$Ca93unh3d//KYCAKqCPwxOYbbK094vAEuKC5CRJqdL7.bcHwdA.Za', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'avatar-1.png', 1, NULL, NULL, NULL, NULL),
(5, 'Roy Banks', 'RoyBanks@gmail.com', NULL, '$2y$10$nZiBPEFY26dPjHug435OZef4P7d1BNTqafeeqRqBmDPsoqaqIER2e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'avatar-2.png', 1, NULL, NULL, NULL, NULL),
(27, 'van', 'van@gmail.com', NULL, '$2y$10$NBqR7VNtRGOXCb6okJSMN.8y7Z04mp7oro3ImqjCf/stWd2NDHa6y', 'van', 'van', 'van', '70000', 'Hcm', '0984008000', NULL, NULL, 2, 'vanvan', '2024-04-12 17:59:38', '2024-04-12 17:59:38', NULL),
(28, 'dao', 'dao@gmail.com', NULL, '$2y$10$h3GEAG7cW8DQobiQ11pL9u81YrJcP3tAJ1hX6y0Yr7kH8/EgZHWNW', 'dao', 'Vietnam', 'Tran phu', '60000', 'Ha Noi', '0981002000', NULL, NULL, 1, 'dao dao', '2024-04-12 18:13:07', '2024-04-12 18:13:07', NULL),
(30, 'truc', 'truc@gmail.com', NULL, '$2y$10$nCulINqr05.yvc6OJKyXvegzr4j4Bksl2rOzMr77JsT5pCIi/YfdK', 'truc', 'Vietnam', 'truc', '60000', 'Ha Noi', '0982003000', 'SApbUEJC7VQwYU2jCxU3YWgMF3Symj3VVb9yBPILRH5aE1XusB9NGStCLFV2', NULL, 2, 'tructructructruc', '2024-04-12 18:17:33', '2024-04-12 18:17:33', NULL),
(31, 'test', 'test@gmail.com', NULL, '$2y$10$vJCCJqTxrpQEi5FhrrnVHO8cUtDalQ901vPlC0o9ondUFSo5K/eVW', 'test', 'test', 'test', 'test', 'test', 'test', NULL, 'cat_6619fa339c838_240413_032123.png', 1, 'test', '2024-04-12 20:21:23', '2024-04-12 20:21:23', NULL),
(32, 'test12', 'test12@gmail.com', NULL, '$2y$10$14Or5MeNnrskBZDgPiyhDOZaFjSeQhUvnrMKEO79vyDt0Yefpqxje', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, '2024-04-13 00:14:32', '2024-04-13 00:14:32', NULL),
(33, 'luongsi', 'lamluongsi@gmail.com', NULL, '$2y$10$FcVEAiOIIf2T4DzXXHdnK.ch5zvlEBQxqUc3GeoiCZuW7DhjK/cwG', 'lan lan', 'Vietnam', '4/13 xóm chỉ p10 q5', '70000', 'Hcm', '0982978827', NULL, 'cat_661c0ec1cdcf5_240414_051337.png', 1, NULL, '2024-04-14 10:13:37', '2024-04-14 18:40:56', '114469900173601994973');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_comments`
--
ALTER TABLE `product_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_comments`
--
ALTER TABLE `product_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
