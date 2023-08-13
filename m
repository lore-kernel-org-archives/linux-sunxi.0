Received: from out-114.mta1.migadu.com (out-114.mta1.migadu.com [95.215.58.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D72015A4
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Aug 2023 04:23:44 +0000 (UTC)
Date: Sun, 13 Aug 2023 14:23:23 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691900622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a6J4O4LcgB0OvYhD9lsAZN0hjV+jYfip4h50cDdtwXM=;
	b=rVBhQaLLGPc/hJvDQWXmWex9rEukDK7PwJImulIVytTKqLck/I3R6y9nlyEyvADT9RWl6X
	+VxaxBClb+sTt5ZPIP0lKXHybhiZaZrez04tQyrqu8zeSSayPCxU82o80rG7MfikOgLW8k
	BuvyNjZYuR/TNHeBx6ER2XBiQb7rgab5aU2wz35zbz7b9ALUJW9fqf6I51foFfFBkjAXcX
	CiIONMTYk7ZycnK+dmm/Ex0GC4VnP1MyUbdtu38lnvuY+/lpQV7acfjg1THU3Z2jstbUYg
	SYXdL44Fym4wk1gzUBET2HWn4pGvLnkhIoh7c6RzFLlQ/Oj7ozQHOgrWAEiKqw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: dts: allwinner: d1: Add CAN controller nodes
Message-ID: <ZNhau0j_tV3EXGxl@titan>
References: <20230807191952.2019208-1-contact@jookia.org>
 <CAGb2v66vqrNZ-ga-1O_bQ16BWXH=RmSHo2Kb+WHJyw-Nm1kWVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGb2v66vqrNZ-ga-1O_bQ16BWXH=RmSHo2Kb+WHJyw-Nm1kWVg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sun, Aug 13, 2023 at 12:17:27PM +0800, Chen-Yu Tsai wrote:
> > Signed-off-by: John Watts <contact@jookia.org>
> > ---
> > Changes in v3:
> > - Set default pinctrl for can controller
> > - Moved can nodes to proper location
> > - Moved can pins to proper location
> >
> >  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 34 +++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> > index d59b4acf183a..24f2e70d5886 100644
> > --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> > +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> > @@ -52,6 +52,18 @@ pio: pinctrl@2000000 {
> >                         #gpio-cells = <3>;
> >                         #interrupt-cells = <3>;
> >
> > +                       /omit-if-no-ref/
> 
> Just FYI this likely ends up doing nothing if you also have them
> referenced through a default pinctrl setting. They end up always
> referenced and always included. For the D1 series it looks like no
> peripheral has default pinctrl setting given.
>
> We can still keep it though. It would help when future chip variants
> specify different pinmuxes.

Oops, thanks for pointing that out. I'll try to avoid that mistake in future.

> The compatible string should be the first property. In other sunxi SoC dtsi
> files, we put the pinctrl just before the "status" property if it's present
> to specify a default pin muxing.

Oh that makes sense.

> 
> I can fix it up while applying.

Please do!

> ChenYu

Thanks,

John.
