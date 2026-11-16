Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839911;
	b=RghJcSDih0P8nCcvHnuWtlg9sWX7OdhjhVo7dontyhx/oLQOdUifaMYzGq+hSpLn0Wc9
	 XJxV3MsqwhZOsiz8BuWorVqYxva65VXRf2V5/d1AtU0mr70yPp5RwgIhnk/DuZRcRHR2x
	 3W3A8U9vKrOr1z/bebJPpvdJUxR35K3AojrKjR5hOE4K26P2mg7W+t0B5Ym+cz3X4ZgsM
	 Cqwcbw1Yfb1UXpmPpvblONUUZ126ssFb7c3fEl79RuG7KDx1KiZy+EPZPDA6Xt/RxSnZV
	 I6rHkDoXICACviMWaIrvaoDSeHLhMspPigK3gW79TulMSgXQ+eIJ5WwCJdxajiUMgvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839911;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=AB+oE85rBz3kYmqVCq+Wu2uFRwaOKmFVZVyN/Ci/tK8=;
	b=z/xrdLwrJZiZ0PXBiMcdcmItks3C6X50lX5ds445OfivUCEIUHwDY9NyuEKW+N+BMz8H
	 byURFtzUo/b1ZAMjhHsdIIahvBHXbiS6MeesjI/oaOdoDOKc2HbI6jevtldb10lGxMbRP
	 /ew6/k/qXGD22xibmVv11T8QYkxV2makmFN4l8L5o566izi74M+g2Fd+yjEYcKQhr5wCF
	 0Nk9t7vzJMridwcwL3voOrZCQXLEsxRNQCVnbEp4jS4MloKpRSoofVa2cGrASPwLrNT+i
	 WL6s/5x6b0A8tnMhFtyS+7jb+T8AY6LUrv2f8+Gw18QtMYpJ/WNsymElVnz0T6PeLOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="H/vP6umn";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A28606A323
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 14:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H/vP6umn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C279E1F000C8
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 14:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794839910;
	bh=AB+oE85rBz3kYmqVCq+Wu2uFRwaOKmFVZVyN/Ci/tK8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=H/vP6umnpg8doI5lkkWefq+xXfyvGElZk8fQLWEIscLnlwSeBgmYHRXZxcPyPbakk
	 K4h/NnosT92GjGhxzcv1UGNmTNRlgHog2mDzmAqP4h+FL7Bka3t3W2pP9wWnS9B/k/
	 3/UXDvz9qLBS8asJOU1YAmNtDJAOXtSlqJ1CK7ocsdl6blwRi78YtUfGmofT/EE/ET
	 UM5SEV+m91UMb478Z8XVpg0MJFfpLcWetufctlmvhOVW8lpW4zjNfgpksVpUtS3Eu1
	 U236iqOy/gQKIyH5MMwVCkj5XDreYY+zRQhf9wSJuWxMwAiBQwJfeldLqsPTe+OkXk
	 oT1aPMz5L8RhQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c17a1775fcso2046647e87.3
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 06:38:30 -0800 (PST)
X-Gm-Message-State: APuU4Z//IfvrkyFEZgZraDcdNMmbnd9UhwzRT00yx85uVzqHpXKW3Wm5
	h+3vWVVma4lEfZAhqkK1ouaIolE0HMtvEcsSox69UQ22/5zwPbv+qhNeLJ4F7NohiLbObah9Eg6
	XuRxVOSKkKTMWT/QVlNkxs0JCXWJW8mg=
X-Received: by 2002:a05:6512:2204:b0:5c1:5984:a67e with SMTP id
 2adb3069b0e04-5c170b7e0bbmr4090987e87.56.1794839909219; Mon, 16 Nov 2026
 06:38:29 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026-sunxi-orangepi-3-lts-v3-0-98fef4f75184@gmail.com>
 <20261026-sunxi-orangepi-3-lts-v3-2-98fef4f75184@gmail.com>
 <CAGb2v65eCotQPfnFsj6XfExs=ybE+xPWMFUhC9DFJRehfv7XAQ@mail.gmail.com> <CAH87RzSWDuiA9w8-ZkZXjVmQ_3EbRGKu8dKUzBf=KhNJHZFgjA@mail.gmail.com>
In-Reply-To: <CAH87RzSWDuiA9w8-ZkZXjVmQ_3EbRGKu8dKUzBf=KhNJHZFgjA@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 16 Nov 2026 22:38:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Fd4ZN7fbTwcz45wK4Sc=hD10gjaVCYgW+HDa8O7W7_w@mail.gmail.com>
X-Gm-Features: AclHuK96KoHqco8_GcNqfELYX9slSpaQgkQilXtuce9_buWQRgFm-Lbh0tQJI6I
Message-ID: <CAGb2v64Fd4ZN7fbTwcz45wK4Sc=hD10gjaVCYgW+HDa8O7W7_w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
To: Cristian Filipescu <filipescu.cristian@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 7:47=E2=80=AFAM Cristian Filipescu
<filipescu.cristian@gmail.com> wrote:
>
> Hi Chen-Yu,
>
> On Sun, Nov 15, 2026 at 3:14=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wr=
ote:
> >
> > On Tue, Oct 27, 2026 at 7:34=E2=80=AFAM Cristian Filipescu via B4 Relay
> > <devnull+filipescu.cristian.gmail.com@kernel.org> wrote:
> > >
> > > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> > >
> > > Add the board description for the Allwinner H6-based Orange Pi 3 LTS,
> > > including its regulators, storage, Ethernet PHY, LEDs and USB ports.
> > >
> > > Specify the Motorcomm YT8531C PHY ID to avoid early ID autodetection,
> > > which failed on MAC driver rebind. Reset the sole PHY at MDIO bus
> > > registration and keep reset outside interface detach so its configure=
d
> > > 125 MHz clock output is retained. Use PHY-internal RGMII delays.
> > >
> > > Select the weakest GPIO drive level for both LEDs. Enable 1.8 V eMMC
> > > DDR52 and HS200 modes; retain the H6 maximum frequency of 150 MHz.
> > >
> > > Link: https://lore.kernel.org/linux-sunxi/20250413134318.66681-3-jern=
ej.skrabec@gmail.com/
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > Signed-off-by: Cristian Filipescu <filipescu.cristian@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
> > >  .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 379 +++++++++++=
++++++++++
> > >  2 files changed, 380 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot=
/dts/allwinner/Makefile
> > > index aa21f58a4..7ea136380 100644
> > > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > > @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-ze=
ro-plus.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-plus2.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-beelink-gs1.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3.dtb
> > > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3-lts.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-lite2.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-one-plus.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.d=
ts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > > new file mode 100644
> > > index 000000000..e2ca41b94
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > > @@ -0,0 +1,379 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +// Copyright (C) 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
> > > +// Based on sun50i-h6-orangepi-3.dts, which is:
> > > +// Copyright (C) 2019 Ond=C5=99ej Jirman <megous@megous.com>
> >
> > We now have a common sun50i-h6-orangepi.dtsi file. You really should
> > rewrite this patch to just use that as a base.  It is mostly the same
> > across all the OrangePi H6 boards.
>
> v4 now uses that include and keeps the LTS-specific additions
> and overrides. I compared the resolved DTBs to check the inherited
> properties and preserved the LTS electrical settings, except for the
> review changes described below. Common naming cleanups are deferred.

[...]

> > Set the supply on all cores.
>
> Done. All four running CPU nodes reference DCDCA, and all four CPUs are
> online with the shared cpufreq policy.

I should've mentioned that since this is already enabled at the .dtsi
level, you shouldn't add it anymore. If anything, it's the .dtsi file
that should have all cores referencing the regulator.

[...]

> > > +&mmc1 {
> > > +       vmmc-supply =3D <&reg_wifi_3v3>;
> > > +       vqmmc-supply =3D <&reg_bldo3>;
> >
> > Something is fishy here. The schematic also shows vcc-wifi-io (on the a=
w859
> > side) directly derived from vcc-wifi (reg_wifi_3v3). I suggest at least
> > checking with a multimeter to confirm what the voltage is on the VDDIO
> > pin of the module.
> >
>
> Regarding the AW859A I/O supply, I traced U60 pin 22 (VDDIO) to
> VCC-WIFI-IO, which is connected to BLDO3 in the schematic. I measured
> 1.8 V at an RW1 pad relative to board ground. This supports keeping the
> existing BLDO3 vqmmc assignment; I have left it unchanged.

You traced it on the board or on the schematic?

Can you test at U60? The schematic has two options for I/O voltage from
the LDOs, and then another from VCC-WIFI, hence I would like to be
certain. I imagine the SMT components aren't labeled on the board, so
it would be somewhat hard / eye-hurting to trace the board directly.

[...]

> > > +&usb2otg {
> > > +       dr_mode =3D "host";
> > > +       status =3D "okay";
> > > +};
> > > +
> > > +&usb2phy {
> > > +       usb0_id_det-gpios =3D <&pio 2 15 GPIO_ACTIVE_HIGH>; /* PC15 *=
/
> >
> > This isn't connected to anything but a pull-up. And you already specifi=
ed
> > host mode only above.
>
> Removed usb0_id_det-gpios with /delete-property/ so the common include's
> PC6 setting is removed too. USB0 remains fixed to host mode. The running
> DT confirms the ID GPIO property is absent and dr_mode is host.

Thanks!
ChenYu
