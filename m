Received: from mail.siol.net (mailoutvs2.siol.net [185.57.226.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E55B72
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Apr 2021 03:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.siol.net (Postfix) with ESMTP id 021CF5253B6;
	Mon, 26 Apr 2021 18:14:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
	by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id efKXyrXyEAug; Mon, 26 Apr 2021 18:14:20 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
	by mail.siol.net (Postfix) with ESMTPS id B92B5525B66;
	Mon, 26 Apr 2021 18:14:20 +0200 (CEST)
Received: from kista.localnet (cpe-86-58-17-133.cable.triera.net [86.58.17.133])
	(Authenticated sender: jernej.skrabec@siol.net)
	by mail.siol.net (Postfix) with ESMTPA id 3CA995253B6;
	Mon, 26 Apr 2021 18:14:19 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Jagan Teki <jagan@amarulasolutions.com>, linux-sunxi@googlegroups.com
Cc: Samuel Holland <samuel@sholland.org>, Icenowy Zheng <icenowy@aosc.io>, u-boot@lists.denx.de, linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev, andre.przywara@arm.com
Subject: Re: [linux-sunxi] [PATCH] sunxi: board: Add H616 MMC2 pins
Date: Mon, 26 Apr 2021 18:14:18 +0200
Message-ID: <3812926.Gie0PPOfKQ@kista>
In-Reply-To: <20210426121446.8013-1-andre.przywara@arm.com>
References: <20210426121446.8013-1-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 26. april 2021 ob 14:14:46 CEST je Andre Przywara napisal(a):
> We hardcode the pinctrl setting for the MMC controllers in boards.c,
> since we need them also in the SPL, where there is no DT yet.
> 
> Add the respective setting for the H616 SoC, to enable eMMC on boards
> with this SoC as well.
> Also to make diagnosing this problem easier, print a warning if a board
> tries to setup MMC2 pins without a respective SoC setting being defined.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>

Best regards,
Jernej



