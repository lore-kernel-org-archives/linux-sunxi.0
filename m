Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA602147E6
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Aug 2026 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787575709; cv=none; b=AY2THGhY5ke/v1/EVZcWdXP9gPaQOtbYhSL/iMSOvbzynNyS2CYaDsn6NSoKyJkW0E3y0Sq7wqSPQX1Mvxj7IO9mxTB+9DQLl/BcSLnt+fx0G43nBmZOm4vhSmsY2TCddaCo9wykFy/V7SQs/fKvMNSKBz6WGlM0SKtMixwXIZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787575709; c=relaxed/simple;
	bh=lI76YK88ZltuQHg9+zsDOjRNQgdjPki/p5J+GduZo2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YIN5saJIMYW6ZvCCbD0faSlqjKH4wIOhNZ8cV3eHaMbCdBhTfJehHzce3eBfMx3H0D1rZPrQ/34AimO8Fv/ldERWB0ZsM+qLnaA++GJF/3edJAvjihnAg7WiimIE1fTS+ALVOhJPsA4E37kxXhi73kd8iMGfjoBQkNpCEwxs6Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-836c5b01e82so45602097b3.0
        for <linux-sunxi@lists.linux.dev>; Mon, 24 Aug 2026 05:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787575707; x=1788180507;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9ghuoduRfOzi+AYpDw8t1/oQryAhFbodaTAoc1849Hg=;
        b=cKKw6xx/nD/B/k4+xntxkbr26GShafmUjUwTioPhYbN4Icp8un0J1jQBh8oTILJIjj
         H18C0qVkY/ToVA646Q8FI6X3bOjpZe7LEFOJTS4dZ4iIFSbGSbA7s+VEPrl1OQA2R8J9
         DQM80JAAVKlUmJ9s4ReWKW/uemFccrCpkHWNzeteUziF8LTb5IO3DRI6zCNsCi/m77s+
         QqDhdPs90F1B95mD8ngtrxicBVNQI+CmHaHay75oYBDlgRATAKjcTjP77O/JD5Ezg7DY
         E+zIGzzkVZmBYXlEuqKXTlntgOQxmTbX2/nDsswa0B/sLadPo6Iapk9Ph+0m4ov6Jr1g
         WZzA==
X-Forwarded-Encrypted: i=1; AHgh+Rpb99sZ5kXQcHenOX2B8lcmjzYtuDorkk+qCFrxreob9i5g1Xp53UBRQygnNvFtvRwqL0jZ2rpJ/5hWXg==@lists.linux.dev
X-Gm-Message-State: AFuF++l3MqzcF8MdpQQ5jIr8O0jWYo+1dF5EBtkVOk74YiuXwGtk7P3r
	J9OsIBLspccd5YPugw2Qt/P2ZOYHIBfMC9vqjQ/IIOshzOxbg/dN9nShWHX77geH
X-Gm-Gg: AR+sD118PZRzFtFyAlUpzZNrR2zi3d0ApGFnPRgQaO5/YZPLJ6psq/tCQ0ErRLt+hUf
	zESik06nAtOzBB+MVZDvfALU0kQljwUjahl2bFABqR/6Pixoe/A+BHYgrGsrHCWCRpI5F5ZDoVZ
	0uXriLVPoE6MddnPVZ0FCVq4dIHwVHyV08zdJ714a80acDMGSXaVz4c5eFdSwStrxwImAWqwBPJ
	1hf+5rpHwwXd4XZNGafPqMDhNSuzSLI/tXIyNCF00oTWN9mWjL9jsqQTaZz8y6BgvIsD8drje8V
	eQTLdXNU35rIATT03ioePoeSan9vNQlwigAaqLewvLUCJS0TZVpG2rscDqihHx5/GSHgaqCswzY
	gZxyR6WpF9ug7rhwEHe5yJ+sUaOUUO2W8bEUa/8r6Xn6omLoWP8krDRekVKEpgUZY+EPJ6DW55O
	bKIxKd5J8nJ8nFW0+qfUCReWQx3YYPihPe07X/xfLbMeAwQfNylabZBQF5yPea8nlgiaBQnlW0+
	r+DPSaJ7EGP53Swi2W8ee33vZSOoA==
X-Received: by 2002:a05:690c:6004:b0:84c:6169:49f4 with SMTP id 00721157ae682-84c61694bdbmr77270667b3.19.1787575707117;
        Mon, 24 Aug 2026 05:48:27 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84cacac4e25sm32404887b3.47.2026.08.24.05.48.26
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 05:48:26 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81f64e8dfbcso48596727b3.2
        for <linux-sunxi@lists.linux.dev>; Mon, 24 Aug 2026 05:48:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq0CtWCfka2U9mBqbu3SLOMku8nKOrKxiqbSUoznFs/IDHZe8ysfo6yOvA1PmGqVK2GLvGPivYCE9dn+Q==@lists.linux.dev
X-Received: by 2002:a05:6102:26c5:b0:772:5acc:b848 with SMTP id
 ada2fe7eead31-77a62c46273mr7826182137.6.1787575289120; Mon, 24 Aug 2026
 05:41:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <87b3e83137e1a987f3c69d214706e93ef3898cab.1787239813.git.geert+renesas@glider.be>
 <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
In-Reply-To: <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 14:41:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnXTAVZ_eBfoWNe-sy6BC1X+5EHkDw9R0TAA65Opzi_Q@mail.gmail.com>
X-Gm-Features: AcwNN1UOdKQEkPlARJoVF2UurscVPaHj9T1_AXs-3b7YtVRMAHuDfcVjJgM-XPk
Message-ID: <CAMuHMdWnXTAVZ_eBfoWNe-sy6BC1X+5EHkDw9R0TAA65Opzi_Q@mail.gmail.com>
Subject: Re: [PATCH 29/45] clk: samsung: Make sure clk_init_data is fully initialized
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
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

Hi Krzysztof,

On Fri, 21 Aug 2026 at 13:04, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 21/08/2026 10:53, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Make sure all members are fully initialized, to avoid such bugs, and to
> > prevent future breakage when converting drivers to a different method
> > for specifying the parents.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thank you!

> Let me know if I should take it via Samsung SoC clock tree. I assume by
> default this will go directly via clock tree.

In that case, please provide your Acked-by, so the clock maintainers
don't have to parse your English response to find out ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
