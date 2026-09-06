Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EB93655E6;
	Sun,  6 Sep 2026 16:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788711676; cv=none; b=oEatJwzI9XNHpVN8fiPKtJpbF81x7nLs9wuur2Laxv5+CI/FNvjPM5eIV6lpjbt6lUtD0oBhzxXBZOTIixElYYT/PYZTaU6/w3PZMYJymHGzM8x08zuWJvgAC8oh2OlKsLfB7P+aUE7+UF8/7JFVo6KvnS5/vIHmimY629z0wi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788711676; c=relaxed/simple;
	bh=8Btp3NzMPwMRkolt0numaLKKHe87rzDvKCSxNfmSusQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hOPbp7/k4mHQXW5FpG0BTiqFNSC2o2RAmV4Ne5Sg1JVeEKOYwAhhteMweDDxFHO/YrFn8KRookeBebsd0wBBVVSDpDugG+SmsG2s+CLOLLQZfzmFOhPDVWrAshKCOTofqPiAFKzfkKK/jEWnI+JRgtDgDTF+erJa72EfVK9dBOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtEphq73; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtEphq73"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38461F00A3A;
	Sun,  6 Sep 2026 16:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788711673;
	bh=mq/nt0mQF+jwDav9tfH/pY4uCNm7W1WiUF/cl+EKNHY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YtEphq734v5jSIVup9oMbeAmWn2e4qIujiTpS94Vb5A04e9ZKkKPOeZ8AhiHK6VG8
	 4Hba2UXQvsoiKU8ShpI0p/gUR30VttQ3slXYIpTaZmU/sO66b9VeiWzFLkjuJXrhGW
	 E8fnO8Dcf8OHMCp+GshCQX1Zp81TspH/agqc655Myuo19t/8vztwWMP/DdN3x3pf8b
	 qdqUNLLvPJQbAvbV0/V0Fx4kmn6sj76JA6cqrLDs4sNkd2TzFdZYGQd1ptZnu5UqPg
	 QxM7bvRam0cQnWFvOAnqWK41nBzyvvVyOcMMkt7uSvxHz4hqkGb1aAh2KEufcOzIEG
	 I6KUJiqWG+rTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: Add SPC Glee 10.1 A64
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SnVhbiBDYXJsb3MgR3V0acOpcnJleiBMYXZhZG8=?= <jcarlosgl96@proton.me>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260906-b4-spc-glee-a64-v1-v1-2-621df2155e31@proton.me>
References: <20260906-b4-spc-glee-a64-v1-v1-0-621df2155e31@proton.me>
 <20260906-b4-spc-glee-a64-v1-v1-2-621df2155e31@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 16:21:12 +0000
Message-Id: <20260906162112.E38461F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing sun50i-a64-cpu-opp.dtsi include breaks CPUfreq and therm=
al cooling
- [Medium] Missing usb_power_supply enablement breaks USB charger detection
--

commit bdf7f6917d0d11f91550b9e8dcb96f41a0c5bde4
Author: Juan Carlos Guti=C3=A9rrez Lavado <jcarlosgl96@proton.me>

arm64: dts: allwinner: Add SPC Glee 10.1 A64

Add support for the SPC Glee 10.1 tablet based on the Allwinner A64. It
describes essential components including the PMIC, microSD, UART, and USB.

> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-spc-glee.dts b/arch=
/arm64/boot/dts/allwinner/sun50i-a64-spc-glee.dts
> new file mode 100644
> index 0000000000000..1ca7c36de65e2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-spc-glee.dts
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2026 SPC Glee A64 Linux contributors
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-a64.dtsi"

[Severity: Medium]
Does this board device tree omission break CPUfreq and thermal cooling?

By omitting the sun50i-a64-cpu-opp.dtsi include here, the board device tree
includes the base SoC definitions but lacks the CPU operating points requir=
ed
for cpufreq and thermal management.

During boot, the thermal and cpufreq-dt drivers will probe the CPU nodes but
find no operating-points-v2 property. This can cause the cpufreq driver to
abort initialization, leaving the CPU pinned to the fixed bootloader
frequency and preventing the registration of CPU cooling devices. The therm=
al
framework would then be unable to actively throttle the CPU, which may risk
thermal trip shutdowns under load and degrade battery life.

Should the sun50i-a64-cpu-opp.dtsi file be included here?

[ ... ]

> +&usb_otg {
> +	dr_mode =3D "peripheral";
> +	status =3D "okay";
> +};
> +
> +&usbphy {
> +	status =3D "okay";
> +};

[Severity: Medium]
Does enabling the usbphy without enabling the usb_power_supply break USB
charger detection?

The usbphy node is enabled, but the required &usb_power_supply node (which
monitors VBUS on the PMIC) is completely omitted and not linked via
usb0_vbus_power-supply.

Because the AXP803 PMIC's USB power supply node defaults to disabled in
axp803.dtsi, failing to override it to okay in the board file means the AXP
USB power supply driver (axp20x_usb_power) will not probe.

As a result, userspace tools will not know when a USB charger is connected.
Furthermore, without being linked to the usbphy, the USB PHY driver will
forcefully assume VBUS is always present, which could cause erratic USB
peripheral state transitions when unplugged.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-b4-spc-gle=
e-a64-v1-v1-0-621df2155e31@proton.me?part=3D2
