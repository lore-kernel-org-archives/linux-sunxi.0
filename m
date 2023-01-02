Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E3928EE
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Jan 2023 11:20:20 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5E606100008;
	Mon,  2 Jan 2023 11:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672658412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N7TQ4TvrTvrJPMfHspAvP+gisAsh/2xMjTMPVTSfd7U=;
	b=IdbGqCCJh4+VvT6tHQLRj9e/YC+ZXKojvE2Hei/lKu7Wakc7tNGPzaWamWIyp+Ym2WX5yu
	7wWAUS+cnZOf4POflsF6JRcBV0t9jAuBbbf5DR5kXKOrq/GtxFe0wVfvoVmlBVSWi833wk
	A3IAvO+40CR7fpb+qxnC8/YpRNjqKPrahR2wNB2Xnv7BXDDoIAbjkQn53H4GRVt2tT4Rz6
	MU93kYJbD2xd71FBWM81CpCX/x9qn8YG1sAu2fy+IH4nzReNORyvOHcwG9irWhUcEm2hBR
	VeGgNAs5a3IGMyZmtNPl6pvjiJBFOpldZVS0p0RNCy54jcODnhJ/W4C9CbsbKQ==
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
Subject: Re: [PATCH 5/7] mtd: rawnand: sunxi: Fix the size of the last OOB region
Date: Mon,  2 Jan 2023 12:20:08 +0100
Message-Id: <20230102112008.250724-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229181526.53766-6-samuel@sholland.org>
References: 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'34569d869532b54d6e360d224a0254dcdd6a1785'
Content-Transfer-Encoding: 8bit

On Thu, 2022-12-29 at 18:15:24 UTC, Samuel Holland wrote:
> The previous code assigned to the wrong structure member.
> 
> Fixes: c66811e6d350 ("mtd: nand: sunxi: switch to mtd_ooblayout_ops")
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Acked-By: Dhruva Gole <d-gole@ti.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
