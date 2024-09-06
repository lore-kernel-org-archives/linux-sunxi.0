Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2A9BE46
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Sep 2024 00:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725581917; cv=none; b=jLTDjrlU/PUveLrcgi9jFQEywuz70I4/bcw+u5bP4OMW2Ud12r61hWEpAaDuIJNwN7a3zKOgmq1+bgvRae/fctKHmbxJYygQX2UzzNTkAncQzByWGfs9gKhN8r+aClzyW/oUv93MsTWA7JjSnpLoz3rA4Qydjqt6taGqhD7WngI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725581917; c=relaxed/simple;
	bh=NC5X27Thr4dFVYkiG74pqo5oAzTnH0f9ePun42RhP6U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s/uO4Hx5C1Lmw3WPHfU3vqUCalxuC/o1w6ZzvyKAlzAn6Grp1p1bgcdd27TFHLDQ3cC1HW+AvNQt8fBYi0aH2GZzWfyLmaBdeZ1eu17H4+LN5W2dIio3TZ/tn4PWR3p3oRgghuMIxcCEExDCls2t8XtXcFzWcsPJb8lrGe3P2Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 624E7DA7;
	Thu,  5 Sep 2024 17:19:00 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B09023F66E;
	Thu,  5 Sep 2024 17:18:32 -0700 (PDT)
Date: Fri, 6 Sep 2024 01:17:51 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: uis <uis9936@gmail.com>
Cc: linux-sunxi@lists.linux.dev, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org
Subject: Re: [PATCH] arm: dts: allwinner: a10: Add DMA for emac
Message-ID: <20240906011751.35bd01eb@minigeek.lan>
In-Reply-To: <CA+vsu7uNL0N9XQp=gxA4wO14iVAHqo8ySFXuPPkQiTqMqVJJzA@mail.gmail.com>
References: <CA+vsu7uNL0N9XQp=gxA4wO14iVAHqo8ySFXuPPkQiTqMqVJJzA@mail.gmail.com>
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

On Wed, 4 Sep 2024 12:10:57 +0300
uis <uis9936@gmail.com> wrote:

Hi,

> RX DMA should be already used by driver, TX still isn't

As Chen-Yu mentioned, you would need a better commit message.

I tested this on the original Cubieboard, and it worked fine. With some
very crude netcat based testing I didn't see any performance or CPU
benefit, but the DMA engine seemed to have been utilised, and the
"missing DMA" messages vanished from dmesg.
Also checked the manual for the DRQ numbers: they match.

So with a proper commit message:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

> Signed-off-by: uis <uis9936@gmail.com>

I think the kernel contribution rules require a bit more of a real name
here.

Cheers,
Andre

> ---
>  arch/arm/boot/dts/allwinner/sun4i-a10.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
> b/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
> index 51a6464aab9a..299e12aadf9c 100644
> --- a/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
> @@ -314,6 +314,9 @@ emac: ethernet@1c0b000 {
>   reg = <0x01c0b000 0x1000>;
>   interrupts = <55>;
>   clocks = <&ccu CLK_AHB_EMAC>;
> + dmas = <&dma SUN4I_DMA_DEDICATED 7>,
> +       <&dma SUN4I_DMA_DEDICATED 6>;
> + dma-names = "rx", "tx";
>   allwinner,sram = <&emac_sram 1>;
>   pinctrl-names = "default";
>   pinctrl-0 = <&emac_pins>;
> --
> I had to resend message as plain text
> 

