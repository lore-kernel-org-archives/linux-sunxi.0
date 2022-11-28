Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBE6A495
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Nov 2022 21:05:14 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ozlJN-00086j-Tx; Mon, 28 Nov 2022 22:05:09 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>, Guo Ren <guoren@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v2 11/12] riscv: Add the Allwinner SoC family Kconfig option
Date: Mon, 28 Nov 2022 22:05:08 +0100
Message-ID: <4413987.e9J7NaK4W3@diego>
In-Reply-To: <CAJF2gTRpL7X+Td6cHhzJ5u2sRo15e4BGh+RKjKwB7fh8v8J2-g@mail.gmail.com>
References: <20221125234656.47306-1-samuel@sholland.org> <Y4JAh72RUJFS/RtR@spud> <CAJF2gTRpL7X+Td6cHhzJ5u2sRo15e4BGh+RKjKwB7fh8v8J2-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Sonntag, 27. November 2022, 12:31:15 CET schrieb Guo Ren:
> On Sun, Nov 27, 2022 at 12:36 AM Conor Dooley <conor@kernel.org> wrote:
> >
> > On Fri, Nov 25, 2022 at 05:46:55PM -0600, Samuel Holland wrote:
> > > Allwinner manufactures the sunxi family of application processors. This
> > > includes the "sun8i" series of ARMv7 SoCs, the "sun50i" series of ARMv8
> > > SoCs, and now the "sun20i" series of 64-bit RISC-V SoCs.
> > >
> > > The first SoC in the sun20i series is D1, containing a single T-HEAD
> > > C906 core. D1s is a low-pin-count variant of D1 with co-packaged DRAM.
> > >
> > > Most peripherals are shared across the entire chip family. In fact, the
> > > ARMv7 T113 SoC is pin-compatible and almost entirely register-compatible
> > > with the D1s.
> > >
> > > This means many existing device drivers can be reused. To facilitate
> > > this reuse, name the symbol ARCH_SUNXI, since that is what the existing
> > > drivers have as their dependency.
> > >
> > > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > > Tested-by: Heiko Stuebner <heiko@sntech.de>
> > > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > > ---
> > >
> > > Changes in v2:
> > >  - Sort Kconfig as if we had done s/SOC_/ARCH_/ for future-proofing
> > >
> > >  arch/riscv/Kconfig.socs | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > > index 69774bb362d6..4c1dc2ca11f9 100644
> > > --- a/arch/riscv/Kconfig.socs
> > > +++ b/arch/riscv/Kconfig.socs
> > > @@ -26,6 +26,15 @@ config SOC_STARFIVE
> > >       help
> > >         This enables support for StarFive SoC platform hardware.
> > >
> > > +config ARCH_SUNXI
> > > +     bool "Allwinner sun20i SoCs"
> > > +     select ERRATA_THEAD if MMU && !XIP_KERNEL
> 
> depend on MMU
> depend on !XIP_KERNEL
> select ERRATA_THEAD

That sounds like a better variant.

The D1 / C906 _needs_ the errata for the memory handling
and the other alternative constraints require the !XIP

With the select, a xip-kernel would not boot at all on a D1


Heiko


