Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434EE63A0
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Jul 2023 08:11:44 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 91DE8D470C
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Jul 2023 07:58:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B8AF2000C;
	Thu, 13 Jul 2023 07:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E9q2SKNt2PhBmQJxTl3Ovldz3f96cAdwP/DWOmBPMQA=;
	b=IocbEYCQ3NmhSKcKpvl75FWn1Vfro53riOL8Pc/QTA14U411GxTT34cT+w2zf+xP/iBmCw
	u+x570VKhpqXC3Sjx90LMl+JYfirHXY/HGCJIlG1SQY6cVXJztoWlxJqyhYAwgxdcO631F
	Obule/bqODSEB5Xf9O2ax9kVOP7lwSqvYzEvBhWgzCO93GiWs+6Qfw/R5WvOPE152mQQCP
	v5hu8l4Apa6ia3vA4zEIy5kRciVOBB1IuJIDJHhw+g1ABHBNLsPJG86HKtuA4CaCuUNSTC
	WXw7gc/QBf2k/YqoxXe62wEXREMZ7hSJT7GjpJL+l09oW2OnxOpn5gEua6hOPw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/18] mtd: rawnand: sunxi: Use devm_platform_get_and_ioremap_resource()
Date: Thu, 13 Jul 2023 09:58:25 +0200
Message-Id: <20230713075825.486421-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230707040622.78174-1-frank.li@vivo.com>
References: 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'81a16e154cc03e3ec76537694ab4afb8df3965eb'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Fri, 2023-07-07 at 04:06:05 UTC, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
