Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com [203.205.221.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C677633
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Oct 2023 07:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1696230413;
	bh=KbiIDVqYx/Hqu7Kevx/zAeGKtx3irkDPMTvz4wlChv4=;
	h=From:To:Cc:Subject:Date;
	b=ttcUC145LvmebblIZT/tEyXmv3JDtaE+fyK50esm0T5mQP0vByFDC2JBUgFY5V6KQ
	 wuEwhdCiCy87hzqorg/UuD4/0k/CsWshgudfVAGz4Rq6Jhvzlyc41FAieHiTJdIXpI
	 uz4wWCdqt2TARIN4+YVEug4lGUuFqHQeQ3/s1Pfo=
Received: from localhost ([124.78.196.55])
	by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
	id 7C122A29; Mon, 02 Oct 2023 14:31:01 +0800
X-QQ-mid: xmsmtpt1696228261taj4szpb8
Message-ID: <tencent_71C4303B139415DEE0FDD7940CD0D5C24C06@qq.com>
X-QQ-XMAILINFO: M5WvXNp9ZPrQGtd5IHGbwdgtJZjE+w5pzFBDCvedbjBktYVltEqzVY05h5rmS+
	 qH6SjIWcXI6XoALOYbOPYs0tmpW14SCV4ShX8Gafjqq4NUgJkj5/G0sr4helmMAN2Usx8ljvOqCY
	 4zqF8VdzpaHAvMhgDUx7o/UKt4MtUI9+xt/xGJowUIVHdx9R1pnEZxaofUNOagqHCtrS+GziGh4y
	 +gQNI5CvVyEFAGMQS7BdgVRczeAl6l70FG0E0kkQlA0QWAaEakoiWHw2Nb9sywvyZjsv9TUy2kJT
	 PLGq90xID07ztU1CxahPHdV51Y0TRzV5xHX5L6OFi0S3WWyBZT9KIV9vSUBqBg2XRX/V/OST4SHt
	 Ty+fU0HdIWk0KWJQetVL3eoH2Fg3AOKtbVdWZCXMRp1KFccLpSuCYH0mVr7a8cMxhXnDC3Vw23ZD
	 MOX2EDYN7+xJu+Ovo3JB1D+CKkIPAzl8/C0IZJzLKP8ND3QJVqVCUPc/cO+7HRJtzpqo6eAEMENs
	 GdSjycfHjuF4uFgQ5UxhMDqtkwJoPZnwUl7f5cB4bWSlXWXZtpCcqTC1PNNnnaX4KRKd671rzQL1
	 9gQOzlPZ+g6nyh6L3gH0l/ss3di3kd6t3L9etwSVu1QR5ZyYsnBsno3div2ggWECuOPXVbH3LG1y
	 1+gDaE+6S/PO+bNW1/rPffvWk0lyykPjjmECERU7bvVkOTBA5eO7apM9Q5xDJnZnYZcY35wQhffL
	 M/yyfcFxsrvLibK56B1Gx/jS/F/ts3r/WaR2O9tVDNukgDYQVKgOkDb/Mjk0yStSLgPnSaB4Kggu
	 npx35ejNFLTcGZ/Oy74OcPd0qdy0mZ7FL068/OsNJdkZY5J66RChhen45uRZzY9p0PTZbgPCpFVn
	 +/Zyq57+e6tHfA9QvRM+ZIZazfNJi0BoqGtAaz8cCTy+nWZMDqYIcIWEjzw+JE5eT3OqkxoGnAVb
	 s7yUHirftSzPA2ob70cWcsTNfNKqkN
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Woody Zhang <woodylab@foxmail.com>
To: Mark Brown <broonie@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Woody Zhang <woodylab@foxmail.com>
Subject: [PATCH 0/2] spi: sunxi: Fix memory leak on device removal
Date: Mon,  2 Oct 2023 14:29:57 +0800
X-OQ-MSGID: <20231002062957.1741396-1-woodylab@foxmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call spi_master_put to free the spi_master structure on device removal
and driver detachment.

Woody Zhang (2):
  spi: sun6i: Fix memory leak on device removal
  spi: sun4i: Fix memory leak on device removal

 drivers/spi/spi-sun4i.c | 3 +++
 drivers/spi/spi-sun6i.c | 1 +
 2 files changed, 4 insertions(+)

-- 
2.39.2

