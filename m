Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4492D0620;
	Sun, 27 Sep 2026 15:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790522957; cv=none; b=JOJrnY/10hunHBJniiIsi3i1Ocm2wuHrfxzYuDwJtOoQPxmrL2ep2SiCZ3YxQLAoElJEVAR3XQktLzALrUgSmzVv9ABhr6hBRmdb7mBQuSDQJ3gWZLSIVapEgtrcmBM66VRNiqyjtLCN4EktWc/Wbt4ZhIz1ISo73oD+/BnqKN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790522957; c=relaxed/simple;
	bh=VLiPdDsLVT16n6ghmv5NUCt+5x30URL+9lzOl9R2Br4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QlCv8nE822T45aLFssdAWf1OCkNQg0c9kEkyVmPAQ+EsbJXpY4SuPtU8w5IpOFv9wpVafaYpUgyPifEfp9JbpdGLu3ABV/8hFzI53ZYvCU37Vg0OnJYtgF9KqjHKi739YCK/OLY4ExPueJI5YK8+JKwtoC6/qvV/ORXxKoZlEek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUFiAp1S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUFiAp1S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320081F000FF;
	Sun, 27 Sep 2026 15:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790522956;
	bh=HJs8/Vh9L+mBCZ+S+KWLE/lR3SXeSdCjHyvRUCphIKc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VUFiAp1SDCt6vEhEu0NPAO+Wta+3YDhl7bvr1n9lHKHaZNXJYfcF7wxfI44jVMpsk
	 g8L6+PhiEAkjBt74cFrRqECAk5jbFRBDm/iYl+57pIxgW39hTslrp1spLVmdR3dkYE
	 8+o0eGx+lQkCTK0VzlEpwzur2oMl4d2I3c4Zuyp87rwfp53chQcjX5NWy3NUbQUZjS
	 +IZWamx4BA608yQfxYC+ggY3fcIPG+a8S7zAUgbulY2PI2yCCurxq2vCPsi6TFHREw
	 81wQjt1m+rzyFSRyTTlC8IcrldVrhwvWtRwjHeLxvoF3r3GnV8/PH2tJxF562LiW1k
	 zsERfmL3X6Mbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/11] ARM: sunxi: add B288 and the PocketBook Verse
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260927151016.186493-12-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
 <20260927151016.186493-12-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 15:29:15 +0000
Message-Id: <20260927152916.320081F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm: missing SMP enable-method prevents secondary CPU boot
- [Low] serial: missing pinctrl assignment for uart0
--

commit 5bd2057523d9c0e8b398682ab9b915f189883892
Author: Pablo Mazzini <pmazzini@gmail.com>

ARM: sunxi: add B288 and the PocketBook Verse board

This commit introduces device tree support for the Allwinner B288 SoC and
the PocketBook Verse board. It configures the CPU, timers, and basic
peripherals like MMC, I2C, and UART.

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

[Severity: Low]
Is the pin control configuration missing here? The uart0 node is enabled, b=
ut
it lacks the pinctrl-names and pinctrl-0 properties.=20

There is a uart0_pb_pins group defined in sun8i-b288.dtsi, but it appears t=
o be
unreferenced. Without explicit pinctrl properties, the kernel might rely on=
 the
bootloader's initial pin state, which could lead to a broken serial console
after suspend/resume cycles.

[ ... ]

> diff --git a/arch/arm/boot/dts/allwinner/sun8i-b288.dtsi b/arch/arm/boot/=
dts/allwinner/sun8i-b288.dtsi
> new file mode 100644
> index 0000000000000..f5feec87defcc
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
Does the cpus block or the cpu1 node need an enable-method property to
properly bring up the secondary core?=20

Because this board uses Allwinner's boot0 rather than PSCI, the kernel's
smp_init() sequence may not have the necessary operations to wake this
secondary core if a custom enable-method isn't defined, which would result =
in
the loss of SMP functionality.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927151016.1864=
93-1-pmazzini@gmail.com?part=3D11
