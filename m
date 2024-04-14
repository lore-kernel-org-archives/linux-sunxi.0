Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE831E528
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 23:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713137871; cv=none; b=SuRkzSRN3fzFU0r0ajG7ZwjzTor2Dl2vIo0C0UkKzEhbX7imZmgAoCCKJLTnpYjwbtPbyPTIaKsM0gZ0nagboxnH4mS07IDL9hAnZeZBjv0yLRJ2c1ao2yUheeXAWGtC+w4dxzMwJNwK+AFd8mkelkruNTVayO6zNgGPi7bJmeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713137871; c=relaxed/simple;
	bh=N8PN0i9XFgCzv+tjanM5VtnZi/j1SkM2FUcJrDgpBRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OHNwhNY3g5X4X/ZH3lm0E6RIHu8aSe/aaqN3V3kZQyrU4KMmdCHdF52C70T2JtJSCUw0Xb13xwL+RMeU4a0y8SzPr3Alh+eDcvS7DWVK6cp5BaDAJ+OPiLqmXkyzIIgSC/FKR2pgixPCRVOsswVYlGq86Qr5M/Bxcx3L+magDDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73049339;
	Sun, 14 Apr 2024 16:38:16 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 557D13F64C;
	Sun, 14 Apr 2024 16:37:46 -0700 (PDT)
Date: Mon, 15 Apr 2024 00:37:40 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 mripard@kernel.org, samuel@sholland.org, jernej.skrabec@gmail.com,
 wens@csie.org, conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 robh@kernel.org, ryan@testtoast.com, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h616: Add NMI device node
Message-ID: <20240415003740.666759d0@minigeek.lan>
In-Reply-To: <20240414170424.614921-3-macroalpha82@gmail.com>
References: <20240414170424.614921-1-macroalpha82@gmail.com>
	<20240414170424.614921-3-macroalpha82@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 14 Apr 2024 12:04:24 -0500
Chris Morgan <macroalpha82@gmail.com> wrote:

Hi Chris,

> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add device node for the H616 Non Maskable Interrupt (NMI) controller.

You might want to mention that the NMI pad is not exposed on the H616 variants, but on
the T507 and H700 packages.

> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> index b2e85e52d1a1..1e066f3057be 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -775,6 +775,15 @@ r_ccu: clock@7010000 {
>  			#reset-cells = <1>;
>  		};
>  
> +		nmi_intc: interrupt-controller@7010320 {
> +			compatible = "allwinner,sun50i-h616-nmi",
> +				     "allwinner,sun9i-a80-nmi";
> +			reg = <0x07010320 0xc>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +

I can confirm that this matches the manual, and the registers behave as
described in the A80 manual. I don't have access to a chip with the NMI
pad exposed or used, so I cannot test this fully, but Chris'
experiments with the AXP717 PMIC connected to that pin on on H700
board seem to confirm that it indeed works.

So with that small amendment to the commit message please take my:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

>  		r_pio: pinctrl@7022000 {
>  			compatible = "allwinner,sun50i-h616-r-pinctrl";
>  			reg = <0x07022000 0x400>;

