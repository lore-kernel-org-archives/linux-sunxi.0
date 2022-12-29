Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31FA1FAF
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Dec 2022 18:15:30 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 2E28332008FF;
	Thu, 29 Dec 2022 13:15:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 29 Dec 2022 13:15:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1672337728; x=1672424128; bh=7ZnnX15h1ezrtWz76vu0WOxPl
	qy17P9/bTAqG1Jqm8A=; b=rJvbNw70l3N+VRXKsAkKi2rMSIheT3BGiT+PgUT/8
	pEw7Zswjwt9Vw51KqvfY1EYZh0UbZMkvwycGNzrfx4PKaMvVPOYDqYkcGsk6xBvp
	BvyKwtHjJwJiGRhkGUnHy9FdYxrmIeAlQWJofJkmAXdzLwr2pxohFc/2D9G+948U
	xhs0P//UNUbkQKTKndtgow8Fk2Sc00523D+D6e90GX2G6jf02KkLhdSIaCcNCS8U
	Vtir197MXUf2MNKB11Obi38wbGIfioGSZg3OpBvMB+bUNpoRay6FiSpkAQ1cNpSb
	je6nL2/CK0Cx491Hh6yz/6mHDgkbSAKWj4Md6/hUyrAxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1672337728; x=1672424128; bh=7ZnnX15h1ezrtWz76vu0WOxPlqy17P9/bTA
	qG1Jqm8A=; b=hsgpT/wy9I3pFv8aaDrH8/UuB+r/nNkZ2VBEJ6CAPPw6Dag1uoA
	pbZGioHT/Q+FIpP6L+J+zhbrkz2N9itg+bLynbuazqv3A3K6i3gPDsaFHBV4LmAf
	9Ewt6CpkthnBMq4vqyKHIMrq3WyB60yg/a5JQhd5aCqPbqGCFcJcBXT9+iMUo0iB
	ejH7hDCDmomUA9lffIuFluc4lnQQS0un6UfQxioe2LTf5wFn3Wv66ncm6TAH3aXH
	+5WduoXDvXGX894L/5hyqTbAgbbWUEMeOxEdrNoDh3LlU6BeU/tBMReBeMm5Q+MK
	hUq+MnH596Xqvt6AaGNaguwKmPfrtTLfgRQ==
X-ME-Sender: <xms:P9mtY388Hhu4itoTzQZIt0pAAQjNRL2aCWCEjOH5xSLSdJTiU66F3g>
    <xme:P9mtYzv4Q-Um-ze7O3K1OLwO01gB784EnNpqWK0tsO-amn6WZF7PwHQDgxc_2hxAp
    TxpohAgbDCDgYbrLA>
X-ME-Received: <xmr:P9mtY1ALuqbZ6GFQMCVrHKZ_IJrscgQrk-gMPZhymJ010pxauaznyiVJwtaSmwBhm4sW41RFJ577rESdx7KGAMCKonDq6ILyUI__ywzm2QGD-B8GW5aAvjWO5VexLZ9cb5sk4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepkeevlefhjeeuleeltedvjedvfeefteegleehueejffehgffffeekhefh
    hfekkeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:P9mtYzcdBDa7fJmrEW2S0fy9MgcsxvbNZN0Kc0ra11atUDXczPiuvQ>
    <xmx:P9mtY8Oe946Vb4VC4m8XDld8kOX4xQMn8fdeS42Y2YRDopbUu7bNHQ>
    <xmx:P9mtY1lnvE5otaf8EDN-sL-B-GKLlC5JMXWz3uUDkW9beM3N9r2Bkg>
    <xmx:QNmtY9Fn39z5_iN-3TAmYb0rLhp8290xUSe1ohsM3C87jURzL6faHQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 13:15:27 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/7] mtd: rawnand: sunxi: Bug fixes and cleanup
Date: Thu, 29 Dec 2022 12:15:19 -0600
Message-Id: <20221229181526.53766-1-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have an A33 tablet with MLC NAND, and I wanted to use mainline Linux
to dump the NAND. To do that, I updated this driver's ECC ops to fully
utilize the hardware for ECC and scrambling. This made the driver
compatible with the existing (scrambled) on-flash bad block map, and I
was able to read the full NAND contents.

This series contains some initial bug fixes and cleanup from that
effort. The changes to the ECC ops will come as a separate series.


Samuel Holland (7):
  mtd: rawnand: sunxi: Clean up chips after failed init
  mtd: rawnand: sunxi: Remove an unnecessary check
  mtd: rawnand: sunxi: Remove an unnecessary check
  mtd: rawnand: sunxi: Fix ECC strength maximization
  mtd: rawnand: sunxi: Fix the size of the last OOB region
  mtd: rawnand: sunxi: Update OOB layout to match hardware
  mtd: rawnand: sunxi: Precompute the ECC_CTL register value

 drivers/mtd/nand/raw/sunxi_nand.c | 132 ++++++++++--------------------
 1 file changed, 42 insertions(+), 90 deletions(-)

-- 
2.37.4

