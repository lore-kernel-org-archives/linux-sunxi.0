Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8BE8483
	for <linux-sunxi@lists.linux.dev>; Sat, 11 Feb 2023 20:01:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D64E4B3;
	Sat, 11 Feb 2023 12:02:16 -0800 (PST)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D34683F71E;
	Sat, 11 Feb 2023 12:01:30 -0800 (PST)
Date: Sat, 11 Feb 2023 19:59:31 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Andreas Feldner <pelzi@flying-snail.de>
Cc: Maxime Ripard <maxime@cerno.tech>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sunxi: set minimal debounce on input-debounce
 0
Message-ID: <20230211195931.5f1b2abb@slackpad.lan>
In-Reply-To: <200d4457-9801-c862-0e86-850e3188f765@flying-snail.de>
References: <Y+FaVorMl37F5Dve@debian-qemu.internal.flying-snail.de>
	<20230207011608.2ce24d17@slackpad.lan>
	<d0534762-3785-ec2d-8d1e-aba0e39f701b@feldner-bv.de>
	<20230209202952.673d5a60@slackpad.lan>
	<20230210082936.qefzz4fsp3jpalvp@houat>
	<20230210094425.474cfba5@donnerap.cambridge.arm.com>
	<20230210100620.z6j7rvkiwyu7paij@houat>
	<20230210101814.2d36ae57@donnerap.cambridge.arm.com>
	<ba463d40-3d39-a621-b198-191fdbe239a1@feldner-bv.de>
	<20230211151358.3467b4f9@slackpad.lan>
	<200d4457-9801-c862-0e86-850e3188f765@flying-snail.de>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 11 Feb 2023 19:08:32 +0100
Andreas Feldner <pelzi@flying-snail.de> wrote:

Hi Andreas,

thanks for putting this together!

> sunxi-h3-h5 based boards have no support for switching
> off IRQ debouncing filter. This would be the expected
> behaviour of value 0 for the general pinctl parameter
> input-debounce.
> The current driver implementation ignores value 0
> for input-debounce, leaving the chip's default. This
> default, however, is not minimal, but equivalent to
> value 31 (microseconds).
>=20
> This patch does not ignore value 0 but instead makes
> sure the corresponding IRQ debounce filter is set
> to the shortest time selectable, i. e. the fast
> oscillator with a divider of 1 =3D=3D (2 ^ 0).
>=20
> The current default behaviour is explicitly ensured
> by including input-debounce=3D<31 31> in the relevant
> part of the devicetree.

The actual change looks alright to me, just some general comments:
- Please don't post new patches as replies to existing threads. Even a
  new revision of a previously posted series is a new thread.
- Your patch is whitespace deformed (no tabs, just spaces). This makes
  it impossible to apply without doing it manually. Your original patch
  was fine in this regard, not sure what you changed. In general it's
  recommended to use git send-email. For a simple patch it might be
  feasible to craft the email in a client (ideally by using an
  external editor), but make sure that it still applies. Sending to
  yourself first helps.
- You cannot mix DT changes and code changes in one patch, they have to
  be in separate patches. The DT change also brings up the question why
  this would be specific to H3/H5, I think this applies to virtually
  every Allwinner SoC.

Cheers,
Andre

>=20
> Fixes: 7c926492d38a ("pinctrl: sunxi: Add support for interrupt debouncin=
g")
>=20
> Signed-off-by: Andreas Feldner <pelzi@flying-snail.de>
> ---
>  =C2=A0arch/arm/boot/dts/sunxi-h3-h5.dtsi=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>  =C2=A0drivers/pinctrl/sunxi/pinctrl-sunxi.c | 40 +++++++++++++++--------=
----
>  =C2=A02 files changed, 24 insertions(+), 17 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi=20
> b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> index 686193bd6bd9..e9ed4948134d 100644
> --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> @@ -410,6 +410,7 @@ pio: pinctrl@1c20800 {
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 #gpio-cel=
ls =3D <3>;
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 interrupt=
-controller;
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 #interrup=
t-cells =3D <3>;
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 input-debounce =
=3D <31 31>;
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 csi_pins:=
 csi-pins {
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 pins =3D "PE0", "PE2", "PE3", "PE4", "PE5",
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c=20
> b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index f35179eceb4e..6798c8f4067e 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -1444,29 +1444,35 @@ static int sunxi_pinctrl_setup_debounce(struct=20
> sunxi_pinctrl *pctl,
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (ret)
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return re=
t;
>=20
> -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (!debounce)
> -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 continue;
> -
> -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 debounce_freq =3D DIV_ROUND_CLOSES=
T(USEC_PER_SEC, debounce);
> -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 losc_div =3D sunxi_pinctrl_get_deb=
ounce_div(losc,
> -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 debounc=
e_freq,
> -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 &losc_d=
iff);
> -
> -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 hosc_div =3D sunxi_pinctrl_get_deb=
ounce_div(hosc,
> -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 debounc=
e_freq,
> -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 &hosc_d=
iff);
> -
> -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (hosc_diff < losc_diff) {
> -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 div =3D hosc_di=
v;
> -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 src =3D 1;
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (debounce) {
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 debounce_freq =
=3D DIV_ROUND_CLOSEST(USEC_PER_SEC, debounce);
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 losc_div =3D su=
nxi_pinctrl_get_debounce_div(losc,
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 =C2=A0 debounce_freq,
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 =C2=A0 &losc_diff);
> +
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 hosc_div =3D su=
nxi_pinctrl_get_debounce_div(hosc,
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 =C2=A0 debounce_freq,
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 =C2=A0 &hosc_diff);
> +
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (hosc_diff <=
 losc_diff) {
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 div =3D hosc_div;
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 src =3D 1;
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 } else {
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 div =3D losc_div;
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 src =3D 0;
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 } else {
> -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 div =3D losc_di=
v;
> -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 src =3D 0;
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* lowest time =
as best approximation to "off" */
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 div =3D 0;
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 src =3D 1;
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 writel(src | div << 4,
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 pctl->membase +
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 sunxi_irq_debounce_reg_from_bank(pctl->desc, i));
> +
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_info("Debounce filter for IRQ b=
ank %d configured to %d us=20
> (reg %x)\n",
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 i, debounce, sr=
c | div << 4);
>  =C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0 return 0;

