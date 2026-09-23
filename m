Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D030A43DEA3;
	Wed, 23 Sep 2026 20:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195688; cv=none; b=I0OWnSJAF4+oZTqWRZosgxC0LlbYWteR+HJkkH3l9+Sn448RlgTmI3YwYkeHpjPGjXZoyX4cC0v8BNz0wtlcVP4zCTQHnKKyfQE+6mrRTeGyRZq1/lg8YW7L2zhwg+yNgqmqNHj8nkEOGSP5mqss8Nh1C7wgOOi30hR1/uTXJL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195688; c=relaxed/simple;
	bh=Jk5ulvdGQcNVR0ri8LNRaYyJeMS1cs0lX2hZnaRW8Fc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m83GukbqrtmXSiR0obChJyjSzTmgdI728Ch7daty0r4x3Exueypq7NwvAZC1Q+EthSEEF/EMTXxsNeCWWCpPfFxXMR+cJ4M5Vw3EqoRBpmBjO4q9OrqYU9cgQzohrzV7RseWM9SJV3LcvSS4kGmCtUqTlY+KzLKgRLVFhWT2Ya4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Msd3/UXU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Msd3/UXU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA231F000FF;
	Wed, 23 Sep 2026 20:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790195677;
	bh=w+aeGkTJ7JiclhipvXtXVdOJhP85yAoECKiV3zSlJVA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Msd3/UXU8fE8ESF1u6hgVGLw4/jz6yiNkTzQi1MI2X8r57oMq34hTTtUaMrF0jxGc
	 q6s4ZnD5zKLhP4cV6Ajvcd03nP/O0RCkXqMko5G55NWAO5YkxRRV5XOl0ENMllLeRp
	 LqDbDHt5U/F/nppVxmBVVCfFlvVfgfC6HcIHpo1tQN/G2+7ymG17YXNkxKSl9olOOU
	 dEjom5jvZYv7pZWiJi+PN/FDdmfKQGr7QJYSdGXenp1XppRHd+u6JUSmfXaIfL6+1r
	 EqQT1iQXKiSN96lXSCa3lu7PL85E57ntEXlCLYhzNRcvG3r1DtdNs4IEOEGAm+/hNv
	 bwRCGa2AQpmTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 11/11] ARM: sunxi: add B288 and the PocketBook Verse
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: robh@kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923201701.43391-11-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
 <20260923201701.43391-11-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 20:34:37 +0000
Message-Id: <20260923203437.8DA231F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm: sunxi: uart0 console missing pinctrl configuration
- [Medium] arm: sunxi: missing enable-method and cpucfg node for Cortex-A7 =
SMP bringup
--

commit fe74da2c07014471bb495768fef663601319d9c4
Author: Pablo Mazzini <pmazzini@gmail.com>

ARM: sunxi: add B288 and the PocketBook Verse board

This commit adds device tree support for the Allwinner B288 SoC and the
PocketBook Verse (PB629) board. It explicitly notes that
arm,cpu-registers-not-fw-configured is required due to the boot0 bootloader
failing to set virtual timer registers.

> diff --git a/arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts =
b/arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts
> new file mode 100644
> index 0000000000000..91c89d5a097e6
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts
[ ... ]
> +&uart0 {
> +	status =3D "okay";
> +};

[Severity: Medium]
Does this node need to reference the uart0_pb_pins pinctrl configuration?

The base sun8i-b288.dtsi defines uart0_pb_pins specifically to configure th=
e=20
pins for uart0, and this board file designates uart0 as the console UART.

Neither file assigns this pinctrl configuration to the uart0 node (for exam=
ple,
by adding pinctrl-names =3D "default"; pinctrl-0 =3D <&uart0_pb_pins>;).

Relying on the bootloader (like boot0 or U-Boot) to implicitly leave the pi=
ns
correctly multiplexed can be brittle, and might cause the serial console to
break across suspend/resume cycles where the pinctrl driver may reinitialize
or power-cycle the pin banks.

[ ... ]
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-b288.dtsi b/arch/arm/boot/=
dts/allwinner/sun8i-b288.dtsi
> new file mode 100644
> index 0000000000000..58668d5813680
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-b288.dtsi
[ ... ]
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible =3D "arm,cortex-a7";
> +			device_type =3D "cpu";
> +			reg =3D <0>;
> +			clocks =3D <&ccu CLK_CPUX>;
> +			clock-names =3D "cpu";
> +		};
> +
> +		cpu1: cpu@1 {
> +			compatible =3D "arm,cortex-a7";
> +			device_type =3D "cpu";
> +			reg =3D <1>;
> +			clocks =3D <&ccu CLK_CPUX>;
> +			clock-names =3D "cpu";
> +		};
> +	};

[Severity: Medium]
Will the kernel fail to bring up CPU1 without an enable-method and cpucfg n=
ode?

The commit message explicitly states the platform relies on Allwinner's
proprietary boot0 bootloader, which implies it does not use TF-A and thus l=
acks
PSCI firmware support.

On ARMv7, without PSCI, the kernel requires an enable-method property
(e.g., enable-method =3D "allwinner,sun8i-a23") on the CPU nodes to route t=
o the
correct secondary core bringup routines in mach-sunxi/platsmp.c.

Additionally, legacy Allwinner SMP bringup requires a cpucfg hardware node =
to
assert resets and power on the secondary cores.

Because both the enable-method property and the cpucfg node are omitted from
this DT, will this degrade the dual-core SoC to a single-core system?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923201701.4339=
1-1-pmazzini@gmail.com?part=3D11
