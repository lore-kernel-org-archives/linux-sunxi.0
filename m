Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F631EEA2C
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Apr 2025 13:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743858276; cv=none; b=iFjoSI5JYdIyck6Qa6qhtaeWrYj7GPHNm5INfgP7KDHhAHUuDdEJR7SfmVffyi24l9H7Qpgm3N2ur7V07YisArbvsrqFfvLCfS3f5hOkvfsACjx/BAElp+lt6G+dgjWm3mZtFpoNGetkZ/L4KI/R4IEUo9VbWmuYTc/mHrQG46U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743858276; c=relaxed/simple;
	bh=dl8KMg41gRXn0M/XcAFlnd91lGvfUvk3bXJX3xp2RpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BwWqcixLeVLGS+TllbZLWuiJmvpixnR0rL1H8qsZMhbHFygmaLdq98/pSVJxrCLRppQXWGfkcKYsr4DBapD+qJZ9zgi2DT4dayJjR6J89mBZCjywALPTMV38yaz+HqZt5cAWXgmLtCth3fd9g/NynUiOm2jrw+9Z51zztNs/PMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 5CD6A34325F;
	Sat, 05 Apr 2025 13:04:33 +0000 (UTC)
Date: Sat, 5 Apr 2025 13:04:29 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 00/34] sunxi: clock refactoring and Allwinner A523 support
Message-ID: <20250405130429-GYA9988@gentoo>
References: <20250323113544.7933-1-andre.przywara@arm.com>
 <20250405024433-GYA8928@gentoo>
 <20250405133248.62927bff@minigeek.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405133248.62927bff@minigeek.lan>

Hi Andre:

On 13:32 Sat 05 Apr     , Andre Przywara wrote:
> On Sat, 5 Apr 2025 02:44:33 +0000
> Yixun Lan <dlan@gentoo.org> wrote:
> 
> Hi,
> 
> > On 11:35 Sun 23 Mar     , Andre Przywara wrote:
> > > This series introduces support for the Allwinner A523 SoC family. The
> > > same die is used in different packages: the A523, A527, T527, and H728:
> > > they connect a different set of peripherals to the pins, or enable extra
> > > goodies like an NPU. From a U-Boot perspective those chips do not differ
> > > much, all the differences are described in the board DT files.
> > > These patches are not the most refined at the moment, but I hope that
> > > people start reviewing them, so we can merge the ones that are ready,
> > > to reduce their number.
...
> > is ATF loading address correct, 0x54000 here? which seems override sp address?
> 
> Yes, that's the correct address. Which SP would it collide with, anyway?
> 
> So in summary you did everything right, and the SPL is returning to FEL
> with DRAM initialised, which is the biggest hurdle.
> Just use the correct A523 TF-A branch and build target.
>
right, with correct ATF, I'm able to boot into uboot console
also, emmc works on radxa a5e board (same change with avaota-a1)..

thanks
-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
