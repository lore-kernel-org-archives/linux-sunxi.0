Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8B31DF27F;
	Wed, 22 Jul 2026 20:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784753183; cv=none; b=ed4ZgRoR4F7XwtjWVZn4CBvZoICgTM4NifT/Ofx6Q76JZgaaMi2vnvUHXXcum0Y+PuIvclnO+sg6P/Y+vkB6vy2IZL1nwoWylAjbd1j6bXJKtVxDckvyG9XsH9Iuo7bhLS2fDPvqkllAh8Sc2FuWTjuQlwFE+kcKWsVIFmkaoJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784753183; c=relaxed/simple;
	bh=F8xfwXt7RuNRymjxBQp/GrNPAYosUvBCfRlRrRK19+w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=We8tk4oehJPFR5QlF2mG1yKq8YxhqxJvMx4f5J7Aw44jqtB7cf3NwXmEaWrepOJ8kI+yyL5Oyu6teQL5MxdYh+nKBsVRA5aJWCHAQyWqu0vrudnbBitwy2lVq5+0Cgetrje1ifZ6ADNpoUiEAiMjuh3OhDRTCuhUmKbPjZNjzAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRBicLso; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRBicLso"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212C51F000E9;
	Wed, 22 Jul 2026 20:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784753182;
	bh=B7u7wYkCYGrIaxGWVn8VkaXnLdJbdSqo25DFPqzV9MM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oRBicLsoJxnzB5x52QzEt39ov/7uR8zO7EUJac/4saFrPwbvGYBr736eP3FJiDOCy
	 5dw/CXm3fwb3AVaq2xD6LXxrgBVcYVCugMadUAWg3MFgcXEi9Qi6FdY7NuCfr08Xl3
	 7G8hDNAo0iuUvUq++OELlpLBc6x8iru32yNJjwEG6Ab797UBo+JkauexvPCDwtQOdY
	 Sv0VK3RCNKJhwuSKa84qFLta8cm+EPIiYJ//O4AGuiOOSYstyaY5Ygrmfbvz7XiTiT
	 kvET1hNc8GfeYHsXuVzOEx0cQ9GT/MqrNnmXWmABb+ueEOr73w8YVWrTsvXmGzByFn
	 MU+L+Hb1jHjGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: sun9i-a80: Add thermal sensor and thermal
 zones
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U8O2cmVuIEhhbnRlbA==?= <fugininsane@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260722203341.2917852-4-fugininsane@googlemail.com>
References: <20260722203341.2917852-1-fugininsane@googlemail.com>
 <20260722203341.2917852-4-fugininsane@googlemail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 20:46:21 +0000
Message-Id: <20260722204622.212C51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The thermal zones for the CPU clusters are incorrectly named relat=
ive to their mapped hardware sensors, risking incorrect cooling mitigations.
- [High] The A80 thermal sensor driver lacks a `.calibrate` callback, resul=
ting in a NULL pointer dereference if `nvmem` calibration data is ever prov=
ided.
- [Medium] The critical trip point temperature does not match the driver's =
emergency shutdown threshold as explicitly claimed in the commit message.
- [Low] The 'ths' node is not sorted properly by unit address.
--

--- Patch [3]: [PATCH 3/3] ARM: dts: sun9i-a80: Add thermal sensor and ther=
mal zones ---
commit cb2cbf274b6f042626c2998af64fc2030a9af3ea
Author: Philipp Rossak <embed3d@gmail.com>

ARM: dts: sun9i-a80: Add thermal sensor and thermal zones

This commit adds the device node for the A80 thermal sensor and the thermal
zones to the device tree. It maps the sensors to the big CPU cluster, DRAM,
GPU, and little CPU cluster.

> [soeren: rebased from the 2018 series, fixed the interrupt number
> (SPI 115 as in the vendor BSP; verified on hardware - SPI 31 stays
> silent), added critical trip points matching the driver's emergency
> shutdown threshold]

[Severity: Medium]
Does the trip point temperature match the driver's emergency shutdown
threshold as claimed in the commit message?

The commit message states that the patch adds trip points matching the
driver's emergency shutdown threshold, which is around 105C. However, the
device tree source sets the temperature to 100C (100000). Could the commit
message be more precise about this difference?

> diff --git a/arch/arm/boot/dts/allwinner/sun9i-a80.dtsi b/arch/arm/boot/d=
ts/allwinner/sun9i-a80.dtsi
> index a1ae0929cec9d..8e7f8cd943d2e 100644
> --- a/arch/arm/boot/dts/allwinner/sun9i-a80.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun9i-a80.dtsi
> @@ -941,6 +941,16 @@ ccu: clock@6000000 {
>  			#reset-cells =3D <1>;
>  		};
> =20
> +		ths: thermal-sensor@6004c00 {

[Severity: Low]
Is this node sorted properly by unit address?

This thermal-sensor@6004c00 node is inserted between clock@6000000 and
timer@6000c00. Since 0x06004c00 is numerically greater than 0x06000c00, it
appears to break the standard ascending order sorting of unit addresses.

> +			compatible =3D "allwinner,sun9i-a80-ths";

[Severity: High]
Does the sun9i-a80-ths driver lack a calibrate callback?

If an nvmem calibration cell is provided in the device tree, the driver
unconditionally calls the calibrate callback:

drivers/thermal/sun8i_thermal.c:sun8i_ths_calibrate() {
    ...
    tmdev->chip->calibrate(tmdev, caldata, callen);
    ...
}

Will this cause a NULL pointer dereference during driver probe if calibrati=
on
data is ever provided, since sun9i-a80-ths omits this function pointer?

> +			reg =3D <0x06004c00 0x100>;
> +			interrupts =3D <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_GPADC>, <&ccu CLK_GPADC>;
> +			clock-names =3D "bus", "mod";
> +			resets =3D <&ccu RST_BUS_GPADC>;
> +			#thermal-sensor-cells =3D <1>;
> +		};
> +
>  		timer@6000c00 {

[ ... ]

> @@ -1250,4 +1260,62 @@ r_rsb: rsb@8003400 {
>  			#size-cells =3D <0>;
>  		};
>  	};
> +
> +	thermal-zones {
> +		cpu0_thermal: cpu0-thermal {
> +			polling-delay-passive =3D <1000>;
> +			polling-delay =3D <5000>;
> +			thermal-sensors =3D <&ths 0>;

[Severity: High]
Are the thermal zones for the CPU clusters incorrectly named relative to th=
eir
mapped hardware sensors?

The commit message notes that sensor 0 is located beside the big CPU cluster
(cpu4-7), and sensor 3 is beside the little CPU cluster (cpu0-3).

Here cpu0-thermal is mapped to sensor 0 (the big cluster). Will this cause
userspace daemons or future device tree cooling maps to incorrectly throttle
the little cluster when the big cluster overheats?

[ ... ]

> +		cpu2_thermal: cpu2-thermal {
> +			polling-delay-passive =3D <1000>;
> +			polling-delay =3D <5000>;
> +			thermal-sensors =3D <&ths 3>;

[Severity: High]
Similar to the question above, cpu2-thermal targets sensor 3, which monitors
the little cluster. Is this misleadingly named, risking incorrect cooling
mitigations?

> +
> +			trips {
> +				cpu2_crit: cpu2-crit {
> +					temperature =3D <100000>;
> +					hysteresis =3D <2000>;
> +					type =3D "critical";
> +				};
> +			};
> +		};
> +	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722203341.2917=
852-1-fugininsane@googlemail.com?part=3D3
