Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818726;
	b=yaVXI/gbwxgassAJyifKB8hXU8LHUti3lqZNTveUXOzRbhNsx+Pt4M1Lv0b0GSkKMyNN
	 UOJbW+jzd9ck06vmAbPRuwG4Ayz19Ywf7A/X+R9SG8hNpVeV4D2fptyoAj/Z+tOU8RabE
	 ghTIXlD+7WlymQoB0DhvTFBOQ+r9HHSByNsq43zSCqaM/tjTwrB6739NuIbQgjuHkLCA5
	 FsQu2xjPkI3YLGxUJFdV2TwLFjXuc+XRcImN84khrDDXYZZldD4VTiYCAOzPsInCgaGJV
	 ntD15Btt1bl9dhQSg53erlw4IBz3YEzqAu3b73KZJtE3UuLXkskJWl6QbpykghnDU8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818726;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HG//4ieE7u/vdx8PM3hg5E75iSq8aL+fAVM6oD03geM=;
	b=rIYPmnfhKMgvqyZl9tPACaYQ3Yl/XZthEOFTKnl+dFoFejILThEe5T/sP18q8WROCnMo
	 o4ZPNX7Ap5WnrbfQxXQGTVahgLML9y0w4YMhPjGdOQkSN+cevjrkN93kkRYLHMW6GuuAe
	 g897GYrWQOyJG1x1P6yi4F8/Ms6od+dTfCp6aYwvsJ7R84gqrfI5bg1xf5XvThEuvISVe
	 FFT5JDTRs3ND8kr3kLiH0FHBtpSAXJfLopDvuJWQTqHs6B6LZyBtbw+k6+LH+/z+dyCqd
	 8UPy9jnB2kJEACGrOrqXKUz/GCDRk5Q/ClFtX9JyxAYuWfVci3VXwVWpan/kyQzHEzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AoM+D1ab;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE99C606A33F;
	Wed,  4 Nov 2026 18:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AoM+D1ab
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0383B1F000C1;
	Wed,  4 Nov 2026 18:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793818725;
	bh=HG//4ieE7u/vdx8PM3hg5E75iSq8aL+fAVM6oD03geM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AoM+D1abXxDHpikXq+21xUZt2akd4j5LuCGHGF2SnE8EJdSwLx9cOHbPN1uMb5iqS
	 VLE3UM3/UZ9qGEswG9MFIcmeaFgrIKoR21hw8zR0QhzX5UVXSb8MRZoVxR9ZQmBqLQ
	 fnSwxWphi/kKdm24pzU2HjW4AamQbgjDNgbInm+GZIRcGWArFAsnYYtKShJGcG1WBy
	 Y/g0k643lGjFyFujQVyhSnucKnx4l2iCne9Bvg3nBi0v1uUlO5YZV5yjsvfxekDmC+
	 6vUwaJ7IsUPnOurD7AHgCwy66hmdwVN1VGcUo6+jcEoo1OxLXoL+t6K3PUCydZQFCa
	 hpExyX6Ey/Q1w==
Message-ID: <sashiko-outbox-197898@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: h6: Add GPU OPP table to all
 boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104184940.882833-2-jernej.skrabec@gmail.com>
References: <20261104184940.882833-1-jernej.skrabec@gmail.com>
 <20261104184940.882833-2-jernej.skrabec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 18:58:44 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] arm64: dts: allwinner: h6: missing regulator-ramp-delay on reg_d=
cdcc
--

commit ba32fa6c0b22c915eb543aebaebb44bdfbbd45e8
Author: Jernej Skrabec <jernej.skrabec@gmail.com>

arm64: dts: allwinner: h6: Add GPU OPP table to all boards

This commit includes sun50i-h6-gpu-opp.dtsi across the remaining Allwinner
H6 board device trees so that devfreq can scale the GPU clock rate and
voltage.

> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch=
/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> index e34dbb9920216..2948369cd659b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> @@ -5,6 +5,7 @@
>  /dts-v1/;
> =20
>  #include "sun50i-h6.dtsi"
> +#include "sun50i-h6-gpu-opp.dtsi"

[Severity: Medium]
Should reg_dcdcc in sun50i-h6-orangepi.dtsi also specify
regulator-ramp-delay =3D <2500> when enabling the GPU OPP table here?

In arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi, &gpu uses
mali-supply =3D <&reg_dcdcc>, which is currently defined without a ramp del=
ay:

	reg_dcdcc: dcdcc {
		regulator-enable-ramp-delay =3D <32000>;
		regulator-min-microvolt =3D <810000>;
		regulator-max-microvolt =3D <1080000>;
		regulator-name =3D "vdd-gpu";
	};

In drivers/regulator/axp20x-regulator.c, axp806_regulators defines DCDCC via
AXP_DESC_RANGES(), which leaves desc.ramp_delay as 0 and uses
axp20x_ops_range without a set_voltage_time or set_voltage_time_sel callbac=
k.

When Panfrost devfreq scales up the GPU OPP on OrangePi One Plus or OrangePi
Lite2, the call chain:

	_set_opp()
	  -> _generic_set_opp_regulator()
	  -> regulator_set_voltage_Unlocked()
	  -> _regulator_do_set_voltage()
	  -> _regulator_set_voltage_time()

checks rdev->constraints->ramp_delay and rdev->desc->ramp_delay. Because bo=
th
are 0, _regulator_set_voltage_time() returns 0 and _set_opp() immediately
raises CLK_GPU via opp_table->config_clks() before the AXP805 DCDCC buck
regulator output has ramped up to the target voltage.

All other AXP805-based H6 board device trees that include
sun50i-h6-gpu-opp.dtsi (sun50i-h6-beelink-gs1.dts, sun50i-h6-orangepi-3.dts,
sun50i-h6-pine-h64.dts, and sun50i-h6-taiqicat-a01.dts) set
regulator-ramp-delay =3D <2500> on reg_dcdcc (added in commits 67533f873ad7,
ebae33c3f6ce, and fe79ea577be8).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104184940.8828=
33-1-jernej.skrabec@gmail.com?part=3D1
