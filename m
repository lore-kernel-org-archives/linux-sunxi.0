Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2792224FA
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Jan 2026 00:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767314486; cv=none; b=u2mtp2iqXVmqEWqnD4KF2cB7jjcKx48hNJTomZnZyyvylCbNRWNKxR/lUfiuJXayegf2Gt3Hi3GQS6YMzpztPx1XimcNo+97CQy9ih/DX5G4S44B/SFcFbJ+ob1FKwtQipAd7D//X7KijdbdZtV8xBWJZF/SyOO1XI/Zox6o1Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767314486; c=relaxed/simple;
	bh=l781lT2Hqi3UwhTVHg3GrqMtodlsPR+KubdRE8nUa6M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dh2yqFCiJDXss/ttDLVhWT3KpAaf1yeU8/X+N1xKpLPsIqKAZyHNBM86lKAX3SfCYHcaULKYK9hQbl9qmJjPBT1MW1WgqVJ2FgusT8K4add3BXdhw6VjxKldn5nzZhF6Klbp7lNb0+WgblqMPbSr//w0/71PTbBagv9g0jApFNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31156497;
	Thu,  1 Jan 2026 16:41:17 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89E893F694;
	Thu,  1 Jan 2026 16:41:22 -0800 (PST)
Date: Fri, 2 Jan 2026 01:40:33 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev, Jagan Teki
 <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Paul Kocialkowski <contact@paulk.fr>, Samuel
 Holland <samuel@sholland.org>
Subject: Re: [PATCH v2 02/10] sunxi: spl: a733: config text and stack
 address
Message-ID: <20260102014033.26410b4c@minigeek.lan>
In-Reply-To: <20251130-01-a733-soc-support-v2-2-18bdd4376fad@gentoo.org>
References: <20251130-01-a733-soc-support-v2-0-18bdd4376fad@gentoo.org>
	<20251130-01-a733-soc-support-v2-2-18bdd4376fad@gentoo.org>
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

On Sun, 30 Nov 2025 21:45:11 +0000
Yixun Lan <dlan@gentoo.org> wrote:

> Add some ciritial SPL settings for A733 SoC
> 
> - Set SPL MAX SIZE to 180KB, 0x47000 - 0x74000
> - Set SPL running address to 0x47000, with a header padded before
>   the image, so the final SPL text address need to shift 0x60 bytes.
> - Set Stack address

The patch separation for those addresses looks a bit arbitrary, since
there are other SPL specific addresses in patch 01/10, and we don't
really support an SPL anyway.
So either drop this patch, or merge it into the previous one.

Cheers,
Andre

> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  common/spl/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/common/spl/Kconfig b/common/spl/Kconfig
> index 24d6ce5d739..ba98b76bbc6 100644
> --- a/common/spl/Kconfig
> +++ b/common/spl/Kconfig
> @@ -81,6 +81,7 @@ config SPL_MAX_SIZE
>  	default 0xec00 if OMAP34XX
>  	default 0x10000 if ARCH_MX6 && !MX6_OCRAM_256KB
>  	default 0xbfa0 if MACH_SUN50I_H616 || MACH_SUN50I_A133 || MACH_SUN55I_A523
> +	default 0x2d000 if MACH_SUN60I_A733
>  	default 0x7000 if RCAR_GEN3
>  	default 0x5fa0 if SUNXI_SRAM_ADDRESS = 0x0
>  	default 0x7fa0 if ARCH_SUNXI
> @@ -279,6 +280,7 @@ config SPL_TEXT_BASE
>  	default 0x40301350 if OMAP54XX
>  	default 0x10060 if MACH_SUN50I || MACH_SUN50I_H5 || MACH_SUN9I
>  	default 0x44060 if MACH_SUN55I_A523
> +	default 0x47060 if MACH_SUN60I_A733
>  	default 0x20060 if SUN50I_GEN_H6 || SUNXI_GEN_NCAT2
>  	default 0x00060 if ARCH_SUNXI
>  	default 0xfffc0000 if ARCH_ZYNQMP
> @@ -434,6 +436,7 @@ config SPL_STACK
>  	default 0x52a00 if MACH_SUN50I_H616
>  	default 0x40000 if MACH_SUN8I_R528 || MACH_SUN50I_A133
>  	default 0x44000 if MACH_SUN55I_A523
> +	default 0x5A000 if MACH_SUN60I_A733
>  	default 0x54000 if MACH_SUN50I || MACH_SUN50I_H5
>  	default 0x18000 if MACH_SUN9I
>  	default 0x8000 if ARCH_SUNXI
> 

