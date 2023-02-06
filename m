Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91513C2C
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Feb 2023 11:55:25 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DFE9224000A;
	Mon,  6 Feb 2023 11:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675684517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H7t8Uwdr1dUJSd52cm7PrFoTbxTBWVyGF5I8T/aNAD8=;
	b=S0xt4XCCUU+Bl0tfBnzQdpC9rGWP4Bilb8BHVsQScGNlc00ICg3W2OQQGadNy4PML2JImG
	n+v7MeRBXObu3B7NCJy4Y2mvOQ81maYs7Kgnic3io6kcWTZ46YYQ/526vFUBTzNgAD0fUg
	JzCgYXUNywRG2SENlg6PV/8vOevm8d4FMzf0XiomOycFlkXGzMMLq3Qm2jxH64gb3OnO0Q
	Fi+XvMEddM0eroxdnfcwDPjmlKmIDbkHxwc3/l2zxopUdB4mhiIqyX6AUztQcxkaOuBjj2
	KlE7FfbnM3gGnYfmqmJwlIbn6jftDsdVbDgnqEAXT58My05+36O3bO8Zc7ze4g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 3/3] mtd: rawnand: sunxi: Precompute the ECC_CTL register value
Date: Mon,  6 Feb 2023 12:55:14 +0100
Message-Id: <20230206115514.560804-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204143520.9682-4-samuel@sholland.org>
References: 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ef3e6327ff04af8527b3558e023e99f1cc241bce'
Content-Transfer-Encoding: 8bit

On Sat, 2023-02-04 at 14:35:20 UTC, Samuel Holland wrote:
> The value computed by this function never changes for a given chip.
> Compute the whole register value once up front, instead of every time
> the ECC engine is enabled.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
