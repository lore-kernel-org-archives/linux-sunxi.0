Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A5E2C82
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Nov 2021 09:07:28 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 42BE23200907;
	Mon, 22 Nov 2021 04:07:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 22 Nov 2021 04:07:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=fm1; bh=
	LOwyR3SU1ameaj8zUnf/E4kX0J8aeTERW2J1xGtMV9E=; b=FU2uqHd4hCCk1rHE
	8aVq2cwK/UZJC+irHd/RabT5bmul4AvWJuozdSz+xp4byBfAHaXnHjR1AB8cR3C2
	MTo1PuSS0puWWV36BtC4SP5AKWuJF+MMEEjE1HNGl5wTvXdnW0ccZL/qsxxmLUfD
	dnz5Tez1xM4Mrhqg8mI3qVQPDosxAr1JuC4b+0g6ox4x9oTeckAltrGX45TFO44G
	ogU3ZPRSpcCw56Svn98ZxtZLgW5JlTePY/lTzfHgMe3sIttObd52SBfhUYuEkOCb
	h8PLfOHnhSk0ZpWDmr2PO79Y0ZS5fFFy82KGIewrFBoO/L/LrCBiZ/8LKT2grxFt
	69TAsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=LOwyR3SU1ameaj8zUnf/E4kX0J8aeTERW2J1xGtMV
	9E=; b=XzpZ4bvPcBDfF7NBcGgNxQjWakkuXCdFnirbrYrWHBv5pqzqtThflDmNV
	cW3KbpJP+mGdEAatPGASDBpJuEQ93I2xHVHqwca9WQRzMniGUSTp6g1++bEb2KBj
	w6tX3v1uqWqwij8mPLqWD5Qqbn+7KAdEubCdQGV3Z3CmaHAUeqABTztf1DxCqOCn
	andhd5NMvMldN2uMHTCrT0LwFwdfzGtJ1WATtPdpprf5tUmq+G3o236KJ0z6lbsn
	DqsNDx+b6Y3+6SpUTML08eeshyonsUGjiUyaCqNQJ/zOtIfoT9v+KTSoJNeE/k+r
	4k5i/clSzakq1mZqI3zWomO9BghNg==
X-ME-Sender: <xms:zl2bYfAIa9E_nA7HYfx1EUP8XtsZ-VhBDnl1f3bHvjkjE_0VqHqPzg>
    <xme:zl2bYViK0PmHdS75ihUHeyEYzgQt7Dv2YMTHDhSxYnSAUD-2parLe62W0UeMn-osg
    oAMnAgR-dzTF9JUexc>
X-ME-Received: <xmr:zl2bYalPlooTWzSFTndBcl1aopgvaFxYLTk8W-LainHpCRqPCy2z7fEiB8wbjZDVcakOgOxZTUgDH2ZPF22-tDeDgUOmiNoxXXs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeefgdduvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
    ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:zl2bYRwtQVDj5jEMGTuTovE8c75uMBHnjc0KrL3eO7rqsmIZ6ZKuFw>
    <xmx:zl2bYUQhW9RrTJw8sspGUMDuCDQcYHQNKxj9DbNzucZMGSwh9FGciA>
    <xmx:zl2bYUbeRm6ePEj03bvjubRDvzyYBmQGV4219mJpdwkzHZdHFBsVJg>
    <xmx:zl2bYTGKbLouB1Hczf7WjwKqOY4IgoCuEzz68_ERZj3JyqtJgbkaXw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Nov 2021 04:07:26 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	wens@csie.org,
	mripard@kernel.org
Cc: Maxime Ripard <maxime@cerno.tech>,
	samuel@sholland.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] bus: sunxi-rsb: Fix shutdown
Date: Mon, 22 Nov 2021 10:07:23 +0100
Message-Id: <163757202921.21051.5589721835708378046.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211121083537.612473-1-jernej.skrabec@gmail.com>
References: <20211121083537.612473-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 21 Nov 2021 09:35:37 +0100, Jernej Skrabec wrote:
> Function sunxi_rsb_hw_exit() is sometimes called with pm runtime
> disabled, so in such cases pm_runtime_resume() will fail with -EACCES.
> 
> Instead of doing whole dance of enabling pm runtime and thus clock just
> to disable it again immediately, just check if disabling clock is
> needed. That way calling pm_runtime_resume() is not needed at all.
> 
> [...]

Applied to sunxi/linux.git (sunxi/drivers-for-5.17).

Thanks!
Maxime
