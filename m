Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D605E27AC5A
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Aug 2025 15:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754063474; cv=none; b=jAN8x7mI3dHkBjLRANsqN3iQ5rauD+PHC/deqN3Gx1T+K7tT7lJSe4znoxbLL9fvwf4A60cEUXqGrgMTfTH640FqrLT3Uf2AJxATRQz9TOVt2IPvkilxvlEwrBrdYLzgbG/PDTqr90FN9Z7KPGy6eFgEqMz6Shdc25VjT6Sq4Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754063474; c=relaxed/simple;
	bh=pMjZMHyXsah02oJWaYEl7jthCMfZyvFyNUzvnku9K9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsbOP2INg0acIcdKLMSBBaT/fbHYSyAIssi9oDHlDbGJ2p8ahxEi4GBmweq5rdj/YPLy0HrvG2HqVZ/c7m4A02TM1lU8KcAnpuag7gsRgijLTTISXrbNEmLsrkCUEo5puQp3lU+9o6Z0904qvVfG5vqECGWWb66Z4X+//pt4wT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.147.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id DB289340B10;
	Fri, 01 Aug 2025 15:51:06 +0000 (UTC)
Date: Fri, 1 Aug 2025 23:50:53 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>,
	linux-sunxi@lists.linux.dev,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 0/2] sunxi: a523: enable Ethernet
Message-ID: <20250801155053-GYA919340@gentoo>
References: <20250801002726.8924-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801002726.8924-1-andre.przywara@arm.com>

Hi Andre,

On 01:27 Fri 01 Aug     , Andre Przywara wrote:
> The first of the two Ethernet controllers in the Allwinner A527/T527
> SoCs is compatible to the IP used in the A64 SoC, which our MAC driver
> already supports. Since the recent DT update brought us the DT
> description of the network interface, enable the driver and thus
> Ethernet functionality on the two boards that work.
> Patch 1/2 fixes the function name for the RGMII pins in the pinctrl
> driver, while patch 2/2 just enables building the sun8i-emac driver.
> 
> Please have a look and test!
> 
Thanks for pushing this

Tested-by: Yixun Lan <dlan@gentoo.org> # Radxa A5E

> Cheers,
> Andre
> 
> Andre Przywara (2):
>   pinctrl: sunxi: a523: change Ethernet pin function name
>   sunxi: a527: radxa/avaota: enable Ethernet
> 
>  configs/avaota-a1_defconfig           | 2 ++
>  configs/radxa-cubie-a5e_defconfig     | 2 ++
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
>  3 files changed, 5 insertions(+), 1 deletion(-)
> 
> -- 
> 2.46.3
> 

-- 
Yixun Lan (dlan)
