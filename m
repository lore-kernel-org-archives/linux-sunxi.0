Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DFC5332EC5
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 11:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164613; cv=none; b=fz/ejwVzKdpbQCyri8KfLwfT4zwNQgvbBYJ4uSTXsY38G2NmYCI/EmdevA1iZSTwieEAhHl7gOglCUKo9fPJsDb6GN610z/gGtl9Ii5PTvrzDTuNa+3YRrS8ap7zzWNjADEtze1jfjmyzWoHJOfu7upHDXvGWTELw8+6j94tXvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164613; c=relaxed/simple;
	bh=rfBvROneOxvFiFGA1DJHYz02QbgdSPyyiUbedPA58/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YTFLoOCf/B3qVJnYtf0gvqQE3R7xffpwzqQmAS6u9mjtG6JzfKYUTEoUVxh2wf4R3ap/iM882PCvJKgh4cgkBKczWqH4/Htw3wsQNaYYSL2/eeoqhcnxhfItIGHxoH7NCuMpXloCQlbBohlvRPhxdGsdJXWvHDBFZ3gjOyYCdpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=slGCOZi+; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="slGCOZi+"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D76E1570;
	Wed, 23 Sep 2026 04:56:36 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A689B3F86F;
	Wed, 23 Sep 2026 04:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790164599; bh=rfBvROneOxvFiFGA1DJHYz02QbgdSPyyiUbedPA58/4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=slGCOZi+UwC2ItMYCDjPlR0zxyhv95lkVs3mdKzmmuKYrXFxSqxMWGh9Nvul2kL+H
	 8DSvwROJ46G8k67OFvAD8ZwCbkC71YumjZiPPB2wavzbHNaoMug4Obhq1AMK9nIVcQ
	 X1J0fnGwzTXVTnu6mknf0huFgXz1U20XbPpDuiXc=
Message-ID: <d527ed43-1632-4460-b431-9711e8587004@arm.com>
Date: Wed, 23 Sep 2026 13:56:37 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: allwinner: h616: orangepi-zero2w: add
 24-pin expansion overlay
To: Vladimir <anykey196@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20260923112009.1062-1-anykey196@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260923112009.1062-1-anykey196@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vladimir,

thanks for your patches, but please do not send new revisions that 
quickly! The kernel doc says to leave *at least* 24 hours between 
respins, but I would wait even longer: we are all humans, mostly 
hobbyists, so please give all the reviewers some time to have a look!

Thanks,
Andre

On 9/23/26 13:20, Vladimir wrote:
> The optional 24-pin expansion board carries two buttons on LRADC channel 0
> and an IR receiver.  Keep them out of the base board .dts: with the board
> detached the LRADC input and the IR receiver pin are not driven and float,
> which can produce phantom key presses and interrupt storms.
> 
> Provide them as a devicetree overlay instead, following the existing
> sun8i-orangepi-zero-interface-board.dtso approach.
> 
> Tested on: OrangePi Zero 2W (Allwinner H618) with the 24-pin expansion board.
> 
> Signed-off-by: Vladimir <anykey196@gmail.com>
> ---
>   arch/arm64/boot/dts/allwinner/Makefile        |  2 +
>   .../sun50i-h618-orangepi-zero2w-24pin.dtso    | 42 +++++++++++++++++++
>   2 files changed, 44 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> index d1f768dd646..e4576030276 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -57,6 +57,8 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-orangepi-zero2.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-x96-mate.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-longanpi-3h.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w-24pin.dtb
> +sun50i-h618-orangepi-zero2w-24pin-dtbs := sun50i-h618-orangepi-zero2w.dtb sun50i-h618-orangepi-zero2w-24pin.dtbo
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-transpeed-8k618-t.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-yuzukihd-chameleon.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso
> new file mode 100644
> index 00000000000..2d7e98e4b66
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
> +/*
> + * Device tree overlay for the Orange Pi Zero 2W 24-pin expansion board.
> + *
> + * The expansion board provides two buttons wired to LRADC channel 0 and an
> + * IR receiver.  These are only present when the board is attached, so they
> + * are deliberately kept out of the base .dts: on a bare board the LRADC
> + * input and the IR receiver pin are not driven and float, which can cause
> + * phantom key presses and interrupt storms.
> + *
> + * Apply on top of:
> + *   arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/input/input.h>
> +
> +&lradc {
> +	vref-supply = <&reg_vcc3v3>;
> +	status = "okay";
> +	wakeup-source;
> +
> +	button-1000 {
> +		label = "KEY_1";
> +		linux,code = <KEY_1>;
> +		channel = <0>;
> +		voltage = <1000000>;
> +	};
> +
> +	button-1600 {
> +		label = "KEY_ENTER";
> +		linux,code = <KEY_ENTER>;
> +		channel = <0>;
> +		voltage = <1600000>;
> +	};
> +};
> +
> +&ir {
> +	status = "okay";
> +};

