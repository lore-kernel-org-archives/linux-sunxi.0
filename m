Received: from mail.siol.net (mailoutvs12.siol.net [185.57.226.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7A471
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Apr 2021 21:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.siol.net (Zimbra) with ESMTP id 362CC524A80;
	Sun, 11 Apr 2021 20:16:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
	by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Yh0Hz7uPS1UE; Sun, 11 Apr 2021 20:16:26 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
	by mail.siol.net (Zimbra) with ESMTPS id ED9E0524AA4;
	Sun, 11 Apr 2021 20:16:25 +0200 (CEST)
Received: from kista.localnet (cpe-86-58-17-133.cable.triera.net [86.58.17.133])
	(Authenticated sender: jernej.skrabec@siol.net)
	by mail.siol.net (Zimbra) with ESMTPA id E1BAE524A80;
	Sun, 11 Apr 2021 20:16:24 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: xiangyang3@huawei.com, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>, Xiang Yang <xiangyang3@huawei.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] media: sunxi: sun8i-rotate: fix PM reference leak in rotate_start_streaming()
Date: Sun, 11 Apr 2021 20:16:24 +0200
Message-ID: <2001311.PWddzm8SjH@kista>
In-Reply-To: <20210409064658.90493-1-xiangyang3@huawei.com>
References: <20210409064658.90493-1-xiangyang3@huawei.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 09. april 2021 ob 08:46:58 CEST je Xiang Yang napisal(a):
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> counter balanced.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Xiang Yang <xiangyang3@huawei.com>

Acked-by: Jernej Skrabec <jernej.skrabec@siol.net>

Best regards,
Jernej


