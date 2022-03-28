Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD3E17F9
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Mar 2022 08:06:13 +0000 (UTC)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4KRlRK3MBsz55hL5
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Mar 2022 09:57:33 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:e89f:bbc:3ef3:db3f])
	by xavier.telenet-ops.be with bizsmtp
	id Bjx82700v1mfJzQ01jx8mS; Mon, 28 Mar 2022 09:57:26 +0200
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nYkFQ-0074P3-Bn; Mon, 28 Mar 2022 09:57:08 +0200
Date: Mon, 28 Mar 2022 09:57:08 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
X-X-Sender: geert@ramsan.of.borg
To: Ansuel Smith <ansuelsmth@gmail.com>
cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org, 
    linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org, 
    linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com, 
    linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, 
    chrome-platform@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
    linux-samsung-soc@vger.kernel.org, 
    linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com, 
    linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
    linux-tegra@vger.kernel.org, linux-oxnas@groups.io, 
    linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org, 
    linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
Subject: Re: [PATCH RFC 1/1] ARM/arm64: categorize dts in arm dir and fix
 dependency in arm64
In-Reply-To: <20220328000915.15041-2-ansuelsmth@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2203280956080.1685195@ramsan.of.borg>
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <20220328000915.15041-2-ansuelsmth@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

 	Hi Ansuel,

On Mon, 28 Mar 2022, Ansuel Smith wrote:
> - Categorize every dts in arm directory in subdirectory
> - Fix Makefile to address for the arm subdirectory
> - Fix any arm64 dependency
>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm/boot/dts/renasas/Makefile

s/renasas/renesas/

The actual split for the Renesas parts LGTM.

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
