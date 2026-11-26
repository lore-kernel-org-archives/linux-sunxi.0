Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795714833;
	b=2XnO34E4YpoD2kUv3ofDXDe02yQetB0/VQzKo3m/iU68M8wIib120AI/bl/4epMndH7P
	 lyD16KPzMm+IHEcCorrDV8bXhifGSjnVjFLWxEeVCCxgqgTEGUI3qT/F72yC0moUdhUV6
	 f+AyVrOcV+4Z2kvD8/1ERF2Hr2esjO2AfaZgszlvS2MyqqR2I6iFG1uswXOn4mOw9D0Ft
	 +Sv/1F0YdCu+nRVRF2KzhaD2F2pdFYXJGHfsDEayXOTxJQIMd+iQzMnmwfFtt8LJzVnKF
	 0zEAvKhVAMOfSQJVEBdaVkTCNZEr2mYIJnqexmdnDxXvzQe+P01r4H6VudbjrAXTdLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
	b=To2TdoW2wZgx3PSHuz/jnk0uf2rvBVJWPy8pJfpeGO4ckV44sNL0qFGGV5GysYR+8B/h
	 UZ1SFR/y7WyauYJ/EY32Hj7Ypd/aYFEj0PexyLhBl1XVmc8SZ/kDMqDRlGllLiPVLLJer
	 ng+IbO2YmOh/ebd3Fg4ikqfufdGVWk9IX3aWUEmUzUSJtX8fetqljiyspN3oCp3gjHnxh
	 tsWT/vi2H+OvN2hQxU9Ve+Ru70YMVTVVHQE2hEX2/XHh/1xt5PxRqFx9sln9Z2q9h7KIK
	 ILDwXrLw6KFI3LSyD09PEKAmpr5baAnv+S42vo24RMxHXi9kI7aR89jYNnyWb5VoamA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=R2ORhOTa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3069606A329
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 17:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3069606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=R2ORhOTa
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-9213eb1f3a7so61608096d6.0
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 09:40:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795714832; cv=none;
        d=google.com; s=arc-20260327;
        b=GYTZGpoJvpgqGvdVVgGNgE30BJBUk3QIYUByZQvokdpVeLvMFFq57yHiYDvqSE+VBm
         6WCund2WK7R6cZyv473qKgvkYq5dRNEJq9tEbI7uh46JgvW6UVqSC9UydqpCKv8wq9lg
         89a+CocvRiapDktc8RWUQHRAbsGFI3MJanZQj3bUj2fDAkX2zVR2D0X7soaFscsCCIra
         jWkqLBzGTuRdhSk5amaHBbnWwTmzpd1CQYPUBVRDOW6AsgrLyb3biCWgA6nKyCipkj0G
         MoDT+B+99FziTNwEqAaqX5oIuX7JA7y5diDQ4BUX8waopbm7ZRVXNVPbaT5sjDUyEaBz
         qOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        fh=lvIeoSGsyxSPkOZ9rK9mSSWhwxhTxitZnoNATSk8b+o=;
        b=aJ780/bf56guNLbySmVUnMM3joPBlUExoW01pfGUARfz9MLUTIBpQ7qGZaxhhAkjbs
         ASQBPSQgcFpJ7DuhWKYkqiHK/LohJV4HJlEWVo6LbNEEXiuyf2jKKWwndbPrx+VCKMUw
         3f81ibVlerz96ZWd4PalZWafAOtXE6P2CkWRErgWUWXG/XvCUrVCjIw9nSLM5qTc2K74
         JTMpXvFRaV6j3NlUvWHgXjlomVIMDWjO50mT5p6CQ0O1lzYbydHMYcTrHnvULVd51Aab
         42+rIsECQ+BcBfyRb2HQHxU3G9zfPhlPn2Br6iUAbgra0J/U3BsulcF/RdfVRSzq1mB+
         BU1w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795714832; x=1796319632; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        b=R2ORhOTaxv4xlyqibLKlMJCphO49rLVpTIFuuTNDO5A/9j7yLPCjE/3bVQ+sU7gRp8
         EeZJ8k1oKzZAup4QRbX2rliyPTaHyqZ6Q5ezeiFytO4SUzNhhrAKADqJfGX4DSKKDqOY
         gqRTHn/7d64xUtQjBG25LRg7EqbmoLDEdAkx1qORy+GrqVA7Aexj8kA9KRAEF5/5e+eH
         9k0QC4wQpTwphRgPTsnmgZ/enh7r7TJz5CYbJ/6Ytxr8wBozAWz0FRArZl/+BxOORRa+
         OOI7daCWCTRy67q9/giVg0w1c2jU9FiD+0Xh6DEONXzshYjdQMVQlQgiGLiNDVCzOVgS
         ZYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714832; x=1796319632;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        b=tG9xaU4Czz1uDP2M6vXiNwhho7PGyxOgOKnHoKendn51dTl/yyurcH7+gfkMoAU6rM
         2IvsUFGcC0TPCrfCp8VYJFzAIjaqNIwQqPQjDgaDCYiFSIk77uY8JYqWXWhr1iseuP+r
         QMOzl4YIAmj8ChmKwV+qJEEFbqq5s49seIk4IFiAgpr1UWEHEsqaBU9I9IkzKumtQ/Fj
         SJ8yjhnZ67xRJpGs+EXJzLTXl4mf/8/njCSDmM4nH2O+bxj2a7cRHaWz90knWNKWUzeC
         1FJ1oARMqHnkDYUMooXOkQ2quEOdLc+VyjIE3S8GSbUtVyb/jutulNinem+Cyu8tNwOa
         uTmg==
X-Forwarded-Encrypted: i=1; AL+hErHNcGKsMlt2kZwUNX4QordkJCApEt/VeSDpjw4k+/hFKUGYlCtmiTCVmyp2p/e6DhOPO/3ToBzBuO/1xA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/KjlhD9fhz2ukj0sC4UwMM1VFFfrp+hfRV+1PwqBLWwbppiP4C
	+elmT7NkyfzTiqAC2p4ulo4z/CMIgwUWOIXctrqcAUGbN2oXjo6Tv1+S/gs7RCikdXBk8HS4Jb5
	1xQ1lJjc/MNeI+JjQQr5w2IWf7xaKgowKiZqIiKR6TA==
X-Gm-Gg: AZFdTZcPQoxVQadsZJYrtsytUk6bLrsF5013MRowE3gbdgSQbeDCbZ5+PBjFPVUrkvl
	73nfUG3rkzoH1N1W5/b/X6Klq9zUE2bnJ3se6DmV0SIV80ybqI2pjpk5t8IViU2A4RMluzpTk24
	gdPekBbWlBHROSLtzomB//2GYFwXSc+Ykik96eOT9yP3nMdR1UNMkSEIRtVAGFvpc9UgoOlH0HP
	qGedqneRLv3d8x0CYC1Z9Z3tK7G6Ro7N05Lth0PjPub/y1I0WTVl+cMlwlHKGCrGbU9OV78VihX
	pcmWzPBkxr3Ec8bezp46ZgqjAUDp6lEv7JWslP7e2ORjI/+dQHqVzUCNYUBFBohIF5UuHULDdV5
	gON9QkUqOKW4afXKL7oBuSkoci5JvG1Zgn3X5PZiisp8oKJB+lnGrasAT9bZdNYLivDYYB6M=
X-Received: by 2002:a05:6214:3c9d:b0:91c:9316:f4e8 with SMTP id
 6a1803df08f44-92134baab8amr374316166d6.54.1795714831544; Thu, 26 Nov 2026
 09:40:31 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
 <awcZcuSbse5g3FWK@monoceros> <87v75jyiw2.fsf@bootlin.com> <awg4ubbFu0FksThB@monoceros>
 <87a4mvwv1b.fsf@bootlin.com>
In-Reply-To: <87a4mvwv1b.fsf@bootlin.com>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 26 Nov 2026 17:40:20 +0000
X-Gm-Features: Aa3M54pTYXahjqTv7_MT1I1wEAeHDvmXQpnCEn41MhhclxuSVrfOIbrke1NKz3k
Message-ID: <CAA6zWZKPY-wjq_sbheLBK-k1b6rCdXs353b7j-fTYB6vTGLmGA@mail.gmail.com>
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id arrays
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, Joern Engel <joern@lazybastard.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Michal Simek <michal.simek@amd.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Han Xu <han.xu@nxp.com>, 
	Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Liang Yang <liang.yang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Let me know what you intend to do.
I might as well address the nitpick since we are refactoring already,
so please wait for v2.

> Not related but since you were removing the /* sentinel */ comment
> sometimes, when do we get rid of those extra entries entirely?
I don't really know if there are any plans for that, I certainly will
not attempt that anytime soon.

Thanks,
Pawel
