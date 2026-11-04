Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819141;
	b=BuhxPqdKLnJH3/bR8sB1m7yzFb8H44n1E8zoPeMSlV0EWBakxONeMprsAcdoGsWgZ+od
	 yaqGWwxfkmC0tdF6OkzqYHTr7lkrP3iW9HrcL1lbdLNt9dH4Py68708TB7V7+7NgC8csq
	 HH1DF31FcwLWVgCoq7AQ8xxPtoiLGiTuL50RKsBwx0bKEC5umwhwfCqwL2Zq8Am284eAm
	 B9jw0MIvcn1hUxPxiy6Oz3PGeGRPYm9EqtHTzbN1PJCWlIawVfSUTQpOLbAoV2u28SvGg
	 zRRpUpmn0/cnBrsGGvPZRMMGN66tUM6BixQFbAfh3jsToE4bpVwHR7tkkNot4I40zZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819141;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gR5uI1cPt3Tr0Xz+ubUXALHUnd/ie9gEemiGlXHNy64=;
	b=2uJwhQrAcPHRkvSsIDJ3eN52fGYnXLMg4X/di4+k0LLbqx8umqQP5PivWNOre6LL6HTV
	 X5S9EwWnM136uX8P+zBZWzJBQEdjtSSGBD5CkHW5uJarCwL6nZVWEx523YgFjiBCKikcs
	 vUQM17O2pXngje28she4iYs0ANN1kr/3aTukA36ENy0ECR0DmL4GA5cmU0jUPfUnGxr/8
	 01HqQRkuBa5mathUMF120ezT0zHHqimLFwY0w3qnhQ/NaZlIlsA90ofxvHB/L/M3B1yGn
	 54A5Ncn4n8oZFewU4/Lp+Fq/iAXKzHFcMPhSTLMB05jKTLVKS3KVgn38Q2NPWqcy9Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BxVWdjvG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B88606A335;
	Wed,  4 Nov 2026 19:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BxVWdjvG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C3B1F00919;
	Wed,  4 Nov 2026 19:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793819141;
	bh=gR5uI1cPt3Tr0Xz+ubUXALHUnd/ie9gEemiGlXHNy64=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BxVWdjvGtSfebF+2wEtFaRveknqXlFgKIgd/Y5U++WDklfEDK57827kX4k0PGe9TD
	 ql4+hM2bt1xJeHing2nbrAtRJFLOUP/RcNFUm4nfd0CKUeaOqUbeigPIeYWO+Qtmqh
	 i3gwbpBEk+VFaWxKtfLTQ5GFaYpbx4PeVhjzqWe/O4gNjEHW6OP11gcnQswchG/Iop
	 AC/ZFbckvZ3t+czyoeT6XFgUD0AGv2t6yohTLc4d5eaVh4xzhNvZRmcHiordXGYNcf
	 Q1ewPI27xTfmvHdczL00fgajPRASJ2w7rXH+T25p5dHGtnFrDJUo6xahJ+0i/inKdE
	 dR873V2dRQtrA==
Message-ID: <sashiko-outbox-197915@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: orangepi: Enable CPU
 frequency scaling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104184940.882833-3-jernej.skrabec@gmail.com>
References: <20261104184940.882833-1-jernej.skrabec@gmail.com>
 <20261104184940.882833-3-jernej.skrabec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 19:05:40 +0000
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
- [Medium] arm64: dts: allwinner: h6: missing regulator-ramp-delay in orang=
epi.dtsi
--

commit 756d3d30d1a6d15f42bf1d5d2b8437c122fdde4e
Author: Jernej Skrabec <jernej.skrabec@gmail.com>

arm64: dts: allwinner: h6: orangepi: Enable CPU frequency scaling

This commit includes sun50i-h6-cpu-opp.dtsi and sets cpu-supply on cpu0 to
reg_dcdca in sun50i-h6-orangepi.dtsi to enable CPU frequency scaling on the
Orange Pi One Plus and Lite2.

> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch=
/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> index 2948369cd659b..b7351b1db97c5 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> @@ -5,6 +5,7 @@
>  /dts-v1/;
> =20
>  #include "sun50i-h6.dtsi"
> +#include "sun50i-h6-cpu-opp.dtsi"
>  #include "sun50i-h6-gpu-opp.dtsi"
> =20
>  #include <dt-bindings/gpio/gpio.h>
> @@ -65,6 +66,10 @@ reg_vcc5v: vcc5v {
>  	};
>  };
> =20
> +&cpu0 {
> +	cpu-supply =3D <&reg_dcdca>;
> +};

[Severity: Medium]
Should reg_dcdca (and reg_dcdcc) in sun50i-h6-orangepi.dtsi also specify
regulator-ramp-delay =3D <2500>; now that voltage scaling is enabled on
reg_dcdca?

In sun50i-h6-orangepi.dtsi, reg_dcdca and reg_dcdcc currently omit
regulator-ramp-delay:

			reg_dcdca: dcdca {
				regulator-always-on;
				regulator-min-microvolt =3D <810000>;
				regulator-max-microvolt =3D <1080000>;
				regulator-name =3D "vdd-cpu";
			};

			reg_dcdcc: dcdcc {
				regulator-enable-ramp-delay =3D <32000>;
				regulator-min-microvolt =3D <810000>;
				regulator-max-microvolt =3D <1080000>;
				regulator-name =3D "vdd-gpu";
			};

In drivers/regulator/axp20x-regulator.c, the AXP806 DCDCA and DCDCC
descriptors are defined with AXP_DESC_RANGES(), which leaves desc->ramp_del=
ay
at 0 and uses axp20x_ops_range without set_voltage_time or
set_voltage_time_sel callbacks.

When cpufreq-dt (or panfrost devfreq) scales up to a higher OPP via:

  dev_pm_opp_set_rate()
    -> _set_opp()
      -> _opp_config_regulator_single()
        -> _set_opp_voltage()
          -> regulator_set_voltage_triplet()
            -> _regulator_do_set_voltage()
              -> _regulator_set_voltage_time()

_regulator_set_voltage_time() checks:

	if (rdev->constraints->ramp_delay)
		ramp_delay =3D rdev->constraints->ramp_delay;
	else if (rdev->desc->ramp_delay)
		ramp_delay =3D rdev->desc->ramp_delay;

Without regulator-ramp-delay in the device tree, _regulator_set_voltage_tim=
e()
returns 0, so _regulator_do_set_voltage() skips waiting for the AXP805 buck
converter output voltage to ramp up before _opp_config_clk_single() calls
clk_set_rate() to switch the PLL to the higher frequency.

Other AXP805-based H6 board device trees (including sun50i-h6-orangepi-3.dts
in commit ebae33c3f6cee9, sun50i-h6-beelink-gs1.dts in commit 67533f873ad7e=
2,
sun50i-h6-pine-h64.dts in commit fe79ea577be81e, and
sun50i-h6-taiqicat-a01.dts) set regulator-ramp-delay =3D <2500>; on reg_dcd=
ca
and reg_dcdcc.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104184940.8828=
33-1-jernej.skrabec@gmail.com?part=3D2
