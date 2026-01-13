Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC88A945
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Jan 2026 01:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768267884; cv=none; b=EnrKv4vseVunNdTQSB/tV3Sqy+TO7mdknzO0AlfITEpOITmWOT3JRJT6ow7v5TeWroiyKhOQgmQuNOc1xt9eo4TxgvkJGyb+IJP2kZ4dSwZHgX4bqNn94lvZVaNYFtQgGTxvGvFT77LlVujvlmGjNSCK4VvBJRx26vWyXS/e1dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768267884; c=relaxed/simple;
	bh=HgKhOhFeA7PPjdt4mGn5U7PNDa+udJUMyzfkuLqYBlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=txQEJX2aqvVc+x+EOaudgBBm9i8Ih+A8q+QSrxmn0LY47AHnG0Lrxa71MHqWBDDq4UQ94Zp5Yql54G0idsjH+2GbdACsjIn+8EIv1rsXFZTyEnxSJSZ9uKvF59Z03TLahrx9xkT8giE2EYE3Ik5eN/waE2N7egG7fh5gT2XdQgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 74D0434102E;
	Tue, 13 Jan 2026 01:31:21 +0000 (UTC)
Date: Tue, 13 Jan 2026 09:31:17 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
	Jagan Teki <jagan@amarulasolutions.com>,
	Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <contact@paulk.fr>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v2 01/10] sunxi: sun60i: initial support for A733 SoC
Message-ID: <20260113013117-GYB24058@gentoo.org>
References: <20251130-01-a733-soc-support-v2-0-18bdd4376fad@gentoo.org>
 <20251130-01-a733-soc-support-v2-1-18bdd4376fad@gentoo.org>
 <20260102014019.36db66d4@minigeek.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102014019.36db66d4@minigeek.lan>

Hi Andre,

On 01:40 Fri 02 Jan     , Andre Przywara wrote:
> On Sun, 30 Nov 2025 21:45:10 +0000
> Yixun Lan <dlan@gentoo.org> wrote:
> 
> Hi Yixun,
> 
> thanks for updating this series, and sorry for the delay in the review.
> 
> As for this patch: it should go to the end of the series, since it
> already introduces the possibility to select the new SoC, even though
> the rest of the code isn't ready yet. And I think we should drop the 
> "select SUPPORT_SPL", since it's not really supported, without the DRAM
see my comment in other thread

> code. If we rely on FEL to load U-Boot anyway, we can much simpler load
> TF-A and U-Boot proper directly, no need for any FIT image.
I haven't went the way to lod TF-A, U-Boot separately even use FEL,
but insted, still follow previous traditionl way - combine all images
together, that's TF-A, SPL, U-Boot..

for this reason I'd just keep configurations of SUPPORT_SPL and FIT..

> And thanks for using the SUNXI_GEN_NCAT2 symbol, btw!
> 
> One small thing below...
> 
> > Add basic support for Allwinner A733 SoC.
> > 
> > - Include some basic register definitions
> > - Introduce a new SUN60I A733 Kconfig option
> > - Ssetup RVBAR register properly according to docs
> > - Config max DDR size 16GB
> > - Config SRAM 0x62000 for TF-A
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > 
..
> >  config SYS_BOARD
> >  	default "sunxi"
> > @@ -1186,6 +1199,7 @@ config SPL_STACK_R_ADDR
> >  	default 0x4fe00000 if MACH_SUN50I
> >  	default 0x4fe00000 if SUN50I_GEN_H6
> >  	default 0x4fe00000 if SUNXI_GEN_NCAT2
> > +	default 0x4fe00000 if MACH_SUN60I_A733
> 
> This is not needed, since the same address is already selected by NCAT2.
> 
will drop it

-- 
Yixun Lan (dlan)
