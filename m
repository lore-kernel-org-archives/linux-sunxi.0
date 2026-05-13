Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0569299929;
	Wed, 13 May 2026 01:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778634145; cv=none; b=U0cOebCxTBZA6AdpichsIQwu3qrqa+qdjowA77ozA2PpkYXCpbhJJpuRrtE+TiyLL9o7kMXRvttHeVEK3D6GwlMkxBzxZ353A+oFTeadfuq2TQ/xWNdJOfm8cLimLy3qv3t7MYddd/DKX80dp9iwvQ9KD2F5F2oTmZTtBEczh5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778634145; c=relaxed/simple;
	bh=/m8IIh5p88Q0k+jI72tlQ89ReyEX/okTEYIeE2M4/O0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oPb2xMZ0wOoAG3pSPMAYeG1kPs941m8uM10+OBvclLYM2ZhSqUT9NMPrWmq6vlYPJQNDpXKcUk/awb9j39D2GiHsaATe+O6m2P6+qhyFRckkDaInWenjI7+gQXvY7W7ec1RqlKzccF6L2x6gg7FDbtOo3k/AXelqTE+2uMKH1O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPYJegWw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPYJegWw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF96C2BCB8;
	Wed, 13 May 2026 01:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778634143;
	bh=/m8IIh5p88Q0k+jI72tlQ89ReyEX/okTEYIeE2M4/O0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=KPYJegWw14Dz89JXD34hYgzgK8Mtdjc2Bjr7gel8Y2JkBZPrfCvaQ20hdNilpu/mL
	 qQQVHM67sJrNISev0m5kLCFFCx4Hcpb1oxgT74qRsvf77WxdScfeZRYlq6TbDuRnFG
	 p/jmq3nUBzHS58qvcsxwT/5gmv6j+IQ+dhhVotJ1ZpQH2wYq0W/jjQraTUqNzG0FaQ
	 JITTRWA17celgXtbwxk4u6SOfpJ9G+J/1gfW4AynwBMuilD6mJ8aR1/ywRawRoYdRb
	 IX5ssKiCS9pfUhv/pzLE8HOCKC0SphBhkmx6NaLVfJFajgVRFT5vfaF98vRgxKxG7d
	 MvRP05yra22BQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: Cubie A5E: enable SPI flash
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260511221741.25888-1-andre.przywara@arm.com>
References: <20260511221741.25888-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 01:02:22 +0000
Message-Id: <20260513010223.6BF96C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing `spi-rx-bus-width` and `spi-tx-bus-width` properties res=
trict the SPI flash to 1-bit mode despite hardware Quad SPI configuration.
- [Low] Unnecessary `#address-cells` and `#size-cells` defined in the `flas=
h@0` node without child nodes.
--

commit 90d57abd1dc9fc1a77a15be6ce437a4b3378df17
Author: Andre Przywara <andre.przywara@arm.com>

arm64: dts: allwinner: Cubie A5E: enable SPI flash

This commit enables the SPI0 device tree node for the Cubie A5E board.
It describes the configuration for the 16MiB SPI NOR flash connected
to the SPI0 bus.

> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> @@ -344,6 +344,21 @@ &r_pio {
>  	vcc-pm-supply =3D <&reg_aldo3>;
>  };
> =20
> +&spi0  {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&spi0_pc_pins>, <&spi0_cs0_pc_pin>,
> +		    <&spi0_hold_pc_pin>, <&spi0_wp_pc_pin>;
> +	status =3D "okay";
> +
> +	flash@0 {
> +		compatible =3D "winbond,w25q128", "jedec,spi-nor";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <40000000>;

Since the pinctrl-0 configuration explicitly maps the hardware WP and HOLD
pins to the SPI controller, should this node also include
spi-rx-bus-width =3D <4> and spi-tx-bus-width =3D <4>?

Without these properties, the SPI driver defaults to standard 1-bit mode,
failing to utilize the board's wired Quad SPI capabilities. Additionally,
if the board lacks external pull-ups, could muxing the active-low WP and
HOLD pins to the SPI controller in 1-bit mode leave the pins floating and
risk unintended write-protect or hold states?

> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;

This isn't a bug, but since this flash node does not contain any child
partition nodes, these #address-cells and #size-cells properties are
unnecessary and trigger standard dtc warnings.

> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511221741.2588=
8-1-andre.przywara@arm.com?part=3D1
