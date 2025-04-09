Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6031C265CA1
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Apr 2025 14:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744208950; cv=none; b=aNxUI+iz3JLdUa8B17rVbnSeRbfrQIa+1v6tsI9cqKlHXCMc6eFy2uZaGh8qRsyg56oIabQtXC3rn5VpBMBWILIkpc8F/xZ16QOpfNlbYgR7upjDpJYKi46cfVFmkhuloZEpe76Bqp13JUb5vXOtujmOJ/xijPHCNXvLGiuyU8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744208950; c=relaxed/simple;
	bh=7tgjpWGcvsQiaQk1D1ZIi87uvPyB6Ng7qdIUngtFPNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1Fv2kkWGKOFABElXEktIk0i7HhMzLuKGbseh9tuTpxl+O/5ZCPB6oqeScgtwXGwGHjM11oQyg5y9YK+aAsDHRIEnyKauPCxI5H9sM2SQxdk64hjuJ6juu5HwFId3z/A7oPOt27cOmoEUJhRJhso3MV7DOlnJ3MTYOqf7ZINdGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 074AC343336;
	Wed, 09 Apr 2025 14:29:06 +0000 (UTC)
Date: Wed, 9 Apr 2025 14:28:54 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 33/34] sunxi: A523: add DT files from Linux v3 branch
Message-ID: <20250409142854-GYA18396@gentoo>
References: <20250323113544.7933-1-andre.przywara@arm.com>
 <20250323113544.7933-34-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250323113544.7933-34-andre.przywara@arm.com>

Hi Andre,

On 11:35 Sun 23 Mar     , Andre Przywara wrote:
> This imports the (preliminary) devicetree files for the boards with the
> new Allwinner A523/T527/H728 SoCs, including the basic SoC .dtsi.
> 
> Those files have been reviewed and confirmed, but have not been merged
> into the official kernel repositories yet.
> 
> Pending upstream kernel repository:
> https://github.com/apritzel/linux/commits/a523-v3/
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/dts/sun55i-a523.dtsi          | 598 +++++++++++++++++++++++++
>  arch/arm/dts/sun55i-a527-radxa-a5e.dts | 299 +++++++++++++
>  arch/arm/dts/sun55i-h728-x96qpro+.dts  | 287 ++++++++++++
>  arch/arm/dts/sun55i-t527-avaota-a1.dts | 308 +++++++++++++
>  4 files changed, 1492 insertions(+)
>  create mode 100644 arch/arm/dts/sun55i-a523.dtsi
>  create mode 100644 arch/arm/dts/sun55i-a527-radxa-a5e.dts
>  create mode 100644 arch/arm/dts/sun55i-h728-x96qpro+.dts
>  create mode 100644 arch/arm/dts/sun55i-t527-avaota-a1.dts
> 
> diff --git a/arch/arm/dts/sun55i-a523.dtsi b/arch/arm/dts/sun55i-a523.dtsi
> new file mode 100644
> index 00000000000..ee485899ba0
> --- /dev/null
> +++ b/arch/arm/dts/sun55i-a523.dtsi
> @@ -0,0 +1,598 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +// Copyright (C) 2023-2024 Arm Ltd.
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/sun6i-rtc.h>
> +#include <dt-bindings/clock/sun55i-a523-ccu.h>
> +#include <dt-bindings/clock/sun55i-a523-r-ccu.h>
> +#include <dt-bindings/reset/sun55i-a523-ccu.h>
> +#include <dt-bindings/reset/sun55i-a523-r-ccu.h>
> +
> +
[...]
> +		ohci1: usb@4200400 {
> +			compatible = "allwinner,sun55i-a523-ohci",
> +				     "generic-ohci";
> +			reg = <0x4200400 0x100>;
> +			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_OHCI1>,
> +				 <&ccu CLK_USB_OHCI1>;
> +			resets = <&ccu RST_BUS_OHCI1>;
> +			phys = <&usbphy 1>;
> +			phy-names = "usb";
> +			status = "disabled";
> +		};
> +
> +		r_ccu: clock-controller@7010000 {
> +			compatible = "allwinner,sun55i-a523-r-ccu";
> +			reg = <0x7010000 0x250>;
> +			clocks = <&osc24M>,
> +				 <&rtc CLK_OSC32K>,
> +				 <&rtc CLK_IOSC>,
> +				 <&ccu CLK_PLL_PERIPH0_200M>,
[...]
> +				 <&ccu CLK_PLL_AUDIO0_4X>;

U-Boot 2025.04-rc5-00056-g1ef486ead58d (Apr 09 2025 - 22:06:21 +0800) Allwinner Technology

CPU:   Allwinner A523 (SUN55I)
Model: Radxa A5E
DRAM:  4 GiB
sunxi_set_gate: (CLK#35) unhandled
Core:  77 devices, 21 uclasses, devicetree: separate
..


I've got a "CLK unhandled" err, checked and found CLK_PLL_AUDIO0_4X is not
implemtend in clk driver - drivers/clk/sunxi/clk_a523.c

do you have any idea why this clk gate not implemented?
or somehow, I guess we could drop it from uboot if not used
(or no need to keep sync with kernel dts? I did no further check)

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
