Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9D3374728;
	Sat, 13 Jun 2026 11:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781351420; cv=none; b=pT/HcSC7VjdV0IhqDdXBkHkEMrTQIRly0vffSprkzt6cIw1KP4ccenxyvHwPm0QMtbEorjzHpNJmEbLjXQ4hci18gJVqGd+KXukelJ16y99L1u9HkbGDNShdqu2ImYKWTrlSD2ieecLru8QHWjsUKPuhDgOVKjsm7NwD7mRyHxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781351420; c=relaxed/simple;
	bh=gBPGsjsJJw8C6S1/99m7O7L1JU4dJJlui6HmSTzcJiY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KC/G1RWWVjAn4tvrndF7yI+T91/UibbrnvissCKHdGATbb8O3z5isvItBtpeOQ1hQB/Y67+tfUmm4CcoMavLeuxFnOAyAayCpsAfX08Za7FtU9aiRevJEMKFHQ188MUJtPI+5McjO+kcUfegFdaO8uVYOOQdy4pk4fEhfcuoXIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJiTOny2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJiTOny2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A111F00A3F;
	Sat, 13 Jun 2026 11:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781351419;
	bh=erkZj5hqHW6bXkpo4dZEwW77jrkRwARJOKmvsY/EhT0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DJiTOny2/V6+izDu1dUMfbuCRx2se/NaZmdtbKhOXgy+uvS+Ww8lG/NLuGpiVv4cm
	 AZsSJodMPaqowPitxJmiJcWx8wfGgMNZ8dUZdRj5ZdeOG6Rm6gu/G21rRlW0AUREeP
	 iHEp4h5JSJq9PKsLxYs3oi+ENFjtM+NRi9mtf9d9lTb4C2qOxyRnCrPmnWoZ0XhncN
	 2R4fWO/sA1z5WMC77XLX1x58gmIaMoEaWdbkVRL3zRUEpdgo/x6rdTW9iu1w89WXGW
	 YGockjpuVJXz8jTWU8GUwstdX8WDx+T6uyX82HiIP4qVJZUstLe+Skx4RydK52HKi+
	 du6i/3RYAP2dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: allwinner: add Allwinner A733 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Enzo Adriano via B4 Relay" <devnull+enzo.adriano.code.gmail.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260613-a733-dts-v1-public-ready-v1-3-7787c94681db@gmail.com>
References: <20260613-a733-dts-v1-public-ready-v1-3-7787c94681db@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 13 Jun 2026 11:50:18 +0000
Message-Id: <20260613115018.D3A111F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The patch references missing header files for CCU clock and reset b=
indings, which will cause a build failure.
- [Low] New compatible strings for the CCU and pinctrl are used without bei=
ng documented in the YAML schemas.
--

commit 08b3c222d5fc2b42b4c8ea3dd602ebcc113d5545
Author: Enzo Adriano <enzo.adriano.code@gmail.com>

arm64: dts: allwinner: add Allwinner A733 SoC

Add the initial A733 SoC description with CPUs, timers, interrupt
controller, clocks, pinctrl, UART0, and MMC0.

Keep peripherals disabled by default. Board DTS files can enable only the
devices that are proven on their hardware.

> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/=
boot/dts/allwinner/sun60i-a733.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
> @@ -0,0 +1,198 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/sun60i-a733-ccu.h>
> +#include <dt-bindings/reset/sun60i-a733-ccu.h>

[Severity: Low]
Are these header files introduced in a different patch? Compiling this devi=
ce
tree will fail at the preprocessor stage because these headers are missing
from the baseline tree and aren't added in this patch.

[ ... ]

> +		pio: pinctrl@2000000 {
> +			compatible =3D "allwinner,sun60i-a733-pinctrl";

[Severity: Low]
Are these new compatible strings documented in the dt-binding YAML schemas?
Adding new compatibles without their corresponding binding documentation wi=
ll
trigger make dtbs_check warnings.

> +			reg =3D <0x02000000 0x600>;

[ ... ]

> +		ccu: clock-controller@2002000 {
> +			compatible =3D "allwinner,sun60i-a733-ccu";

[Severity: Low]
Will this compatible string also need to be added to the YAML schemas to
avoid validation warnings?

> +			reg =3D <0x02002000 0x2000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260613-a733-dts-v=
1-public-ready-v1-0-7787c94681db@gmail.com?part=3D3
