Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B278836
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Apr 2025 04:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744863063; cv=none; b=Fkn4iZP2XS6A3WMZgXl+A6myexsYntnC4HEA+aairbSuTbfLqzCYGQ/cctBjPltWYsJxHJ+/8nE3GN8vXLWycq7ZaDsYbcsapmTqt2qIOAqEgW452WGec9eHz8fKIZTYJhImUE98C+C5MlRktUZGpMBnOhVsmZwGL0keRN6dFfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744863063; c=relaxed/simple;
	bh=nP7vJaLq646Bbonu2sdlzrRYYgyMuqN688tDxuxuddI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEBJKUucnIB4KJjiYX56jKONzROHFOCNL24gx1OBW06jE2z1ZLlkdshDqStK9t2A0H/ahhzoD+arysCnqS2YIk55+ODGqw6ZWN6ROJiVysJYjkZUEjZPGHeDazTHnbw500vyKuxk7tNTZ1w4EWf49TfvwudoPL4i0MhEc0ZUbWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CE87B343128;
	Thu, 17 Apr 2025 04:11:00 +0000 (UTC)
Date: Thu, 17 Apr 2025 04:10:55 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de,
	Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 0/3] sunxi: add "fake" FEL button feature
Message-ID: <20250417041055-GYC34332@gentoo>
References: <20250417000539.3709-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417000539.3709-1-andre.przywara@arm.com>

On 01:05 Thu 17 Apr     , Andre Przywara wrote:
> Some boards with Allwinner SoCs feature a "FEL" key, sometimes also
> labelled "uboot", which allows to easily enter the BootROM FEL mode, when
> pressed upon power-on or reset. This allows to access the USB-OTG boot
> protocol, for convenient access to memory and uploading code.
> 
> Add a software emulation of this functionality for boards without a button
> connected to this special SoC pin, to give easy FEL access to more
> boards. Any GPIO can be used, as long as the button uses active-low
> logic.
> 
> This is used on the X96 Mate TV box, where the hidden "update" button is
> actually just some GPIO, checked by the vendor firmware.
> 
> Please have a look!
> 
for the series

Tested-by: Yixun Lan <dlan@gentoo.org> # On A527 SoC
Reviewed-by: Yixun Lan <dlan@gentoo.org>

> Cheers,
> Andre
> 
> Changelog v1 .. v2:
> - add patch to fix return_to_fel() prototype
> - document signal needs to be active-low
> - activate internal pull-up resistors
> - add patch to activate button on the X96 Mate TV box
> 
> Andre Przywara (3):
>   sunxi: fix return_to_fel() prototype
>   sunxi: add "fake" FEL pin support
>   sunxi: x96_mate: Add "fake" FEL key definition
> 
>  arch/arm/include/asm/arch-sunxi/sys_proto.h |  4 +--
>  arch/arm/mach-sunxi/Kconfig                 | 10 +++++++
>  arch/arm/mach-sunxi/board.c                 | 31 +++++++++++++++++++++
>  configs/x96_mate_defconfig                  |  1 +
>  4 files changed, 44 insertions(+), 2 deletions(-)
> 
> -- 
> 2.46.3
> 

-- 
Yixun Lan (dlan)
