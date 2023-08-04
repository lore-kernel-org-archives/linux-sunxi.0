Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E26CA50
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Aug 2023 14:17:19 +0000 (UTC)
Received: from SoMainline.org (82-72-63-87.cable.dynamic.v4.ziggo.nl [82.72.63.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 0D4383F63B;
	Fri,  4 Aug 2023 15:58:38 +0200 (CEST)
Date: Fri, 4 Aug 2023 15:58:37 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Martin Botka <martin@biqu3d.com>
Cc: martin.botka1@gmail.com, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, Jami Kettunen <jamipkettunen@somainline.org>, 
	Paul Bouchara <paul.bouchara@somainline.org>, Martin Botka <martin.botka@somainline.org>, 
	Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andrew Lunn <andrew@lunn.ch>, Icenowy Zheng <uwu@icenowy.me>, 
	Ludwig Kormann <ludwig.kormann@ict42.de>, Heiko Stuebner <heiko@sntech.de>, 
	Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Chris Morgan <macromorgan@hotmail.com>, Jagan Teki <jagan@edgeble.ai>, 
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Add BigTreeTech CB1 SoM & Boards
Message-ID: <eglhj4ax6la44mkot55ttg3kduy3h3qfvapyyuoegfvpkyttdb@mcjrgl5eumfn>
References: <DC7CD91802A925BE+20230804090102.273029-1-martin@biqu3d.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DC7CD91802A925BE+20230804090102.273029-1-martin@biqu3d.com>

On 2023-08-04 11:00:28, Martin Botka wrote:
> Hello,
> This series adds a vendor prefix for BigTreeTech and adds BigTreeTech CB1,
> Manta board and BigTreeTech Pi.
> 
> CB1 is just an SoM thats based on AllWinner H616.
> BigTreeTech Manta boards are expander boards for CB1 and BigTreeTech Pi
> is an CB1 in Rpi style with few additional things like IR receiver and fan port
> on GPIO.
> 
> This work started before I was hired by BigTreeTech and thus majority of the
> patches are from SoMainline email and few are from my work email.
> 
> This series depends on commit https://lkml.org/lkml/2023/8/2/801
> "dt-bindings: mfd: x-powers,axp152: make interrupt optional for more chips".
> 
> Cheers,
> Martin
> 
> Martin Botka (4):
>   dt-bindings: vendor-prefixes: Add BigTreeTech
>   dt-bindings: arm: sunxi: Add BigTreeTech boards
>   arm64: dts: allwinner: h616: Add BigTreeTech CB1 SoM & boards support
>   arm64: dts: allwinner: h616: Add BigTreeTech Pi support
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |  11 ++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm64/boot/dts/allwinner/Makefile        |   2 +
>  .../sun50i-h616-bigtreetech-cb1-manta.dts     |  35 +++++
>  .../sun50i-h616-bigtreetech-cb1.dtsi          | 142 ++++++++++++++++++
>  .../allwinner/sun50i-h616-bigtreetech-pi.dts  |  68 +++++++++
>  6 files changed, 260 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dts
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
> 
> -- 
> 2.41.0
> 

The In-Reply-To header in this v2 series is also not pointing to the
cover letter, making all patches detached in my (and presumably others')
mailbox.

Here's what seems to be going on.  Something prepends an extra
identifier (before the +) to the Message-ID of the cover letter (and all
your other mails):

Message-ID: <DC7CD91802A925BE+20230804090102.273029-1-martin@biqu3d.com>

This is however not reflected in the patches of this series, which still
"reply to" the unmodified Message-ID:

In-Reply-To: <20230804090102.273029-1-martin@biqu3d.com>

As such, they don't seem to reply to an existing mail in my inbox, and
are hence not parented.

I doubt this is a "feature" that modern mail clients are supposed to
understand, or at least neomutt doesn't (and IIRC ThunderBird didn't
either).  Can you figure out, possibly with your SMTP server (provider),
how to prevent this before sending another series?  It wasn't a problem
when mails originated from SoMainline.org.

- Marijn

