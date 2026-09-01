Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A69A455636
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Sep 2026 07:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247261; cv=none; b=huckLzk2/yXE9FaQgIR63fBeTRejSSl6s6SpXsaaBxdMwOc4waBgvVkTE37bAu/BXr9FaAR6Dyj7XCwlQQ7L0V638MWJHbAkGsegE9QXJvx5t2LyBexGS2KQbIfEkv8hODRhUb8HWWY5OD+IR+PhwZsHVtt0yz5paUVKQDs8+UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247261; c=relaxed/simple;
	bh=TJW+ZiT5oYVtElCrK2VJYF5Z8RxcnedgcUFRUh6BMIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NCJ4eccDbr5INO+BvX2Dxpgl6gMPJIiWA06Vk1OStD7ND5TLKDh5Qc2tj7Bq0XZKun+AKzSudyvFVQrVASbSd/a3fH3AN6bbTplpUsQEckddv1XHPOLlejaGjgqBbEYIll8taxAVI4fM9z9B6RrWnxvPzDFJzVgh+xGoQTs686o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-52f9e79ed93so43445301cf.1
        for <linux-sunxi@lists.linux.dev>; Tue, 01 Sep 2026 00:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247259; x=1788852059;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jx+XoqcBBsA+m2qrM8HxfQHaaz8x8crvSJWq14ITrJ0=;
        b=XO/Bpr0kdpYkesbcPTRqHw8g470D/BRrCUzTFIi7X1HmX3DpJudIMvzVbZALWD7M84
         73YOIfpEjdOVayiATzEzb3kkRPOtckwoPSqi34YS3gJkq+fCg134GKmkSPWi1d2FBVWt
         pdQv9pDpaoc+G4VyjW6cDzQedd9pgGdFaUqb19GqzDjcaKBXsDkbeu5nw4nqmyLWfpWf
         tkx04Dht7PniqH1vlfZ+vyOpn4iTZtMc2Ukn5i75HIs3YJGKxHEDrQYM6EsJFL4+TNTk
         TZro9o1BY14T+Qf354a+HJCC9xRkW0i7LrsSC1dummG+s8r+NhsbATrnyFaxyGVJeFHF
         YZPw==
X-Forwarded-Encrypted: i=1; AHgh+RrUEl3Y36l0/OIk8pItbvjFB7IAha7UhZFCkMEQSUL84ydaK4zWCD9fqcEv9KW4AyRhapDQ/osLJOdoFQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nWkYAqMzr4nJxv02wK/WR2hLp6/14nm7VZ5I76QivWH7kF1JgI
	C48L9rh8TYYLSIlNCF3/z8g2yNkyFpju4x3+GyQ0O/Vxf3kE+eiByxnjMTB0KfWX
X-Gm-Gg: AR+sD10LeNezO+K0SdhxnHNIKRVSVePorF9+0sNa6I1WqXHk3CMv3t/j5ikyJ8J6XWB
	Mz/rW0HcDoke3fUFx1eH47zmkvVuEbwa+RtF5XPemHFVS+O9EnksgVraRzJwPf4Zmf4xOLqV/tI
	CrIQ+XWza+3oc0RzLG4gYyZEP4ppGmrLlGnAEXorlpQW0k3UAyV/adVxYP/splh8k4qOzxx5Lww
	o9l3zSv7tPFB7axPt69xbiyROnenkmjYaNjxCoc7yfCtDYkr4C0QzCSfjjMhZmuIcIN2Cgj5i2B
	otlmglmslbrN+3uUGrEFHOHcYnM8IdW5J2h4dl3dd7lj4vDOPgrNEO2muy6n2CI6vr+8I/CpGGe
	2nYsmV7g7/a9oCDKuhO6r+RdkeEFQAGvI2fKhwhIFqOSImCogJhIxBLxgor4pXngwv2sVZt5oN8
	+VxEP3Z1PZ9HSK9RSv+F27DVQB4Lfa/0KwIHktgs60JM9RtzpI9GFkJpiNnEpBYz4YyQGwj8aUh
	zTDBypnsu21jQYV5IEbhC8cCg==
X-Received: by 2002:a05:622a:1348:b0:51c:d52:6049 with SMTP id d75a77b69052e-52fb95f8f8amr324530561cf.28.1788247258763;
        Tue, 01 Sep 2026 00:20:58 -0700 (PDT)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com. [209.85.219.53])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe54adcasm88596041cf.3.2026.09.01.00.20.58
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 00:20:58 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-90cc372d6b2so40757656d6.3
        for <linux-sunxi@lists.linux.dev>; Tue, 01 Sep 2026 00:20:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByD9MCor+ErF2HPkyLkMR0ANRo9DwiUjh/WcG3Fx7eDV+nXhx/bGanu+u8AktPNml+A2+xrzN1S0SKGCA==@lists.linux.dev
X-Received: by 2002:a05:6102:a50:b0:77e:6f90:4aad with SMTP id
 ada2fe7eead31-785962b2f0fmr9912673137.2.1788246874251; Tue, 01 Sep 2026
 00:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <apWfW5ahiYagw0OR@redhat.com>
In-Reply-To: <apWfW5ahiYagw0OR@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Sep 2026 09:14:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
X-Gm-Features: AcwNN1V5M0ZQ_v_xaH6RI1jedVGh-HNyKWbpGWR_Rc-YS9IPBF0NOfuHqPh0NM0
Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
Subject: Re: [PATCH 00/45] clk: Make sure clk_init_data is fully initialized
 (part two)
To: Brian Masney <bmasney@redhat.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Linus Walleij <linusw@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, David Lechner <david@lechnology.com>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	arm-scmi@vger.kernel.org, imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Mon, 31 Aug 2026 at 17:36, Brian Masney <bmasney@redhat.com> wrote:
> On Fri, Aug 21, 2026 at 10:53:10AM +0200, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Hence this series aims to make sure all members are fully initialized,
> > to avoid such bugs, and to prevent future breakage when converting
> > drivers to a different method for specifying the parents.
> >
> > Part One[1] fixed all cases that I identified to be real bugs, in
> > response to a crash I saw on BeagleBone Black.
> >
> > This series is the clock subpart of Part Two, which fixes remaining
> > cases that are currently harmless.  These are still fragile, and may
> > cause future breakage when converting drivers to a different method for
> > specifying the parents.

[...]

> 44 / 45 patches have been added to clk-next. I took it all for simplicity
> rather than everyone trying to cherry pick just their parts.

Thanks!

> Geert: The only patch that didn't apply was:
>
>   [PATCH 27/45] clk: renesas: Make sure clk_init_data is fully initialized
>
> I didn't look into it too much.

No worries, I have queued it in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
