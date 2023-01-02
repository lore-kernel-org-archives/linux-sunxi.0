Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908DC28EE
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Jan 2023 11:20:23 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8B57040003;
	Mon,  2 Jan 2023 11:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672658421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MIRjjM9BazxN62f1abUsHSvG9e7+Ah1eYy4khCLuHOg=;
	b=KzhEF7BmXRUeMlpa6FFiqhgXvb/e4/K3nKxns1522ql8Lm9/GUejSgz55GJfcoaVsywjUy
	BhJ4J2RfrLH7nzXAqPPrthOoYTibPtPffArZlSWeh9GsD5duXdSQTOClHpeubY91j6NJx+
	ohFG6ulXgj2TQ3cXY/EqmwWf1CyjPbsBcS0W07lja8j174LjHYUvBad3KC2Ga8ReJmpvg9
	bm/FqErp6NL6XtUOkDsBDFkL/VronM0EbYrxQVRWEqIHv0Jlbf90ARFCvrEh9wPQlGIWyS
	Q1K2iMypPXihNYJ4Nqf4yOGtQ75SKcgW8XfIRyP6NitLvt7kfPwteSPueBPkDQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/7] mtd: rawnand: sunxi: Remove an unnecessary check
Date: Mon,  2 Jan 2023 12:20:20 +0100
Message-Id: <20230102112020.250809-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229181526.53766-3-samuel@sholland.org>
References: 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'59186a402ab07d205428ee9f62ff0e95ecb06b63'
Content-Transfer-Encoding: 8bit

On Thu, 2022-12-29 at 18:15:21 UTC, Samuel Holland wrote:
> sunxi_nand->nsels cannot be zero, so the second check implies the first.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
