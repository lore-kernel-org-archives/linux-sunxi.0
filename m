Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D81A31D375
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Apr 2026 21:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775511368; cv=none; b=S1x9WnnUQq2g0HHSylvNWSFSUxFSfRKDreF0fdlOD73AkaT3u+2EfIe0znHmfNeD9BTFb3A8EJOBv887HQCryUc+UEsokiJZDU76EIP4khCeLFwZJH7targHyyXm42lLm6PRQLlkp3OJgLzQLMPA8Np3lXt5/3/u9B3N0nxQBUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775511368; c=relaxed/simple;
	bh=b0Wgvbpz+HNB/LpA6pQXXJH2pH4DEuY7f9/V/KBJUbs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DZRWCSE7iktvhlJ/+61bYZR3X8c94+T1Bmwy7gWdkhZV7C5XqH/QFQ9s04fNbOEARWm6L0oqpiANQ9sGSS1jM9FpVGaZAmJyGbmUOxGQ3z8K7nGp67dwBvl9pNTueAvS09OY0hbsOVlQXDTFNMSVlBb30Di1++NexslqI9msfq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ehatpOTX; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ehatpOTX"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EE262328;
	Mon,  6 Apr 2026 14:35:59 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BAC73F632;
	Mon,  6 Apr 2026 14:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775511365; bh=b0Wgvbpz+HNB/LpA6pQXXJH2pH4DEuY7f9/V/KBJUbs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ehatpOTXQbs3RvKwcaMOZuRToDlbax3NPHZqU2KakD+gPMinmjzgQhClpvFrYHwXu
	 DxkpY5BKMul3jypu9UdiR88dgMuhdkraauCvkJJamvNwrhyVI3ATHPmbyMEToFOTfB
	 cs1slNkeqnSw6Ic9oVIsJyl+N/5rfizQIGqZacyo=
Date: Mon, 6 Apr 2026 23:35:56 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Philippe Simons <simons.philippe@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, "Kory Maincent (TI.com)"
 <kory.maincent@bootlin.com>, Paul Kocialkowski <contact@paulk.fr>, Cody
 Eksal <masterr3c0rd@epochal.quest>, Samuel Holland <samuel@sholland.org>,
 Mikhail Kalashnikov <iuncuim@gmail.com>, u-boot@lists.denx.de, linux-sunxi
 <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH 1/2] sunxi: H616: dram: fix LPDDR3 TPR6 parsing
Message-ID: <20260406233556.32e31718@ryzen.lan>
In-Reply-To: <20260405195927.2837914-2-simons.philippe@gmail.com>
References: <20260405195927.2837914-1-simons.philippe@gmail.com>
	<20260405195927.2837914-2-simons.philippe@gmail.com>
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

On Sun,  5 Apr 2026 21:59:26 +0200
Philippe Simons <simons.philippe@gmail.com> wrote:

Hi Philippe,

thanks for taking care of sending this patch!

> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> When a user copies the vendor value of tpr6 into the mainline U-Boot,
> the code parses the tpr6 parameter incorrectly and writes the wrong value.

That sentence is hard to understand unless you know what this value is
about already. What about:

===============
Allwinner's BSP DRAM code uses parameter TPR6, presumably containing
some "Vref" parameter, to encode the values for *all* four supported DRAM
types. The code selects one byte based on the DRAM type used at runtime.
To allow copying DRAM parameters from vendor firmware, we used this value
and its encoding, but wrongly: the proper order of bytes is DDR3, DDR4,
LPDDR3, LPDDR4, from LSB to MSB, cf. the A523 and A133 DRAM code.

Correct the masking for LPDDR3 to fix DRAM operation on some boards
using this DRAM type.
==============

Plus we need the second patch merged into this one, otherwise this
would introduce (an admittedly theoretical) regression.

But the actual changes in both patches looks good to me.

Cheers,
Andre


> Fixes Vref parsing from TPR6. Proper order from LSB to MSB is DDR3, DDR4,
> LPDDR3 and LPDDR4
> 
> Fix that.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> [adjusted commit message]
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> ---
>  arch/arm/mach-sunxi/dram_sun50i_h616.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> index 3345c9b8e82..42a0550e015 100644
> --- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
> +++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> @@ -975,7 +975,7 @@ static bool mctl_phy_init(const struct dram_para *para,
>  		val = para->tpr6 & 0xff;
>  		break;
>  	case SUNXI_DRAM_TYPE_LPDDR3:
> -		val = para->tpr6 >> 8 & 0xff;
> +		val = para->tpr6 >> 16 & 0xff;
>  		break;
>  	case SUNXI_DRAM_TYPE_LPDDR4:
>  		val = para->tpr6 >> 24 & 0xff;

