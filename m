Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C34D7F
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Feb 2023 01:18:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F74C13D5;
	Mon,  6 Feb 2023 17:18:43 -0800 (PST)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A6243F71E;
	Mon,  6 Feb 2023 17:17:58 -0800 (PST)
Date: Tue, 7 Feb 2023 01:16:08 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Andreas Feldner <pelzi@flying-snail.de>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: allwinner: minimize irq debounce filter per
 default
Message-ID: <20230207011608.2ce24d17@slackpad.lan>
In-Reply-To: <Y+FaVorMl37F5Dve@debian-qemu.internal.flying-snail.de>
References: <Y+FaVorMl37F5Dve@debian-qemu.internal.flying-snail.de>
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

On Mon, 6 Feb 2023 20:51:50 +0100
Andreas Feldner <pelzi@flying-snail.de> wrote:

Hi Andreas,

thanks for taking care about this board and sending patches!

> The SoC features debounce logic for external interrupts. Per default,
> this is based on a 32kHz oscillator, in effect filtering away multiple
> interrupts separated by less than roughly 100=C3=AF=C2=BF=C2=BDs.
>=20
> This patch sets different defaults for this filter for this board:
> PG is connected to non-mechanical components, without any risk for
> showing bounces. PA is mostly exposed to GPIO pins, however the
> existence of a debounce filter is undesirable as well if electronic
> components are connected.

So how do you know if that's the case? It seems to be quite normal to
just connect mechanical switches to GPIO pins.

If you are trying to fix a particular issue you encountered, please
describe that here, and say how (or at least that) the patch fixes it.

And I would suggest to treat port G and port A differently. If you
need a lower debounce threshold for port A, you can apply a DT overlay
in U-Boot, just for your board.

> Additionally, the clock-frequency attribute is added for each of
> the 4 cores to eliminate the kernel error message on boot, that
> the attribute is missing.
>=20
> Signed-off-by: Andreas Feldner <pelzi@flying-snail.de>
> ---
>  .../dts/sun8i-h2-plus-bananapi-m2-zero.dts     | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts b/arch/=
arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> index d729b7c705db..1fc0d5d1e51a 100644
> --- a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> +++ b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> @@ -113,6 +113,22 @@ wifi_pwrseq: wifi_pwrseq {
> =20
>  &cpu0 {
>  	cpu-supply =3D <&reg_vdd_cpux>;
> +	clock-frequency =3D <1296000000>;

I see where you are coming from, this is really an unnecessary warning
message. However this message should be really removed from the kernel
instead of adding some rather meaningless value here.
The current DT spec marks this property as required, though, so I added
a PR there to get this fixed:
https://github.com/devicetree-org/devicetree-specification/pull/61
Once this is through, we can try to remove the kernel message.

> +};
> +
> +&cpu1 {
> +	cpu-supply =3D <&reg_vdd_cpux>;

I don't think we need this for every core?

> +	clock-frequency =3D <1296000000>;
> +};
> +
> +&cpu2 {
> +	cpu-supply =3D <&reg_vdd_cpux>;
> +	clock-frequency =3D <1296000000>;
> +};
> +
> +&cpu3 {
> +	cpu-supply =3D <&reg_vdd_cpux>;
> +	clock-frequency =3D <1296000000>;
>  };
> =20
>  &de {
> @@ -193,6 +209,8 @@ bluetooth {
>  };
> =20
>  &pio {
> +	/* 1=C3=AF=C2=BF=C2=BDs debounce filter on both IRQ banks */

Is that supposed to be <micro> in UTF-8? It seems to have got lost in
translation, or is that just me?

> +	input-debounce =3D <1 1>;

As mentioned above, I am not so sure this is generic enough to put it
here for PA. And what is the significance of "1 us", in particular? Is
that just the smallest value?

Cheers,
Andre

>  	gpio-line-names =3D
>  		/* PA */
>  		"CON2-P13", "CON2-P11", "CON2-P22", "CON2-P15",

