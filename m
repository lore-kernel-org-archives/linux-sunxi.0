Received: from dsmtpq4-prd-nl2-vfz.edge.unified.services (dsmtpq4-prd-nl2-vfz.edge.unified.services [84.116.73.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FB113FEE
	for <linux-sunxi@lists.linux.dev>; Sat,  9 May 2026 12:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.116.73.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778330009; cv=none; b=LPTcdaSSYoUD/3OZHtOs7hhMVlj13LN6oVA38iwjNsxXH0nfZJcf0qf4rojNpv3bjEDHvVZJUvMjxOIG7VAup7qMAifjHV5sxan0Iwbg9r1t2qIJ3yOugFEUizqUMH2fv6c+3atU23qdd6vKFCMfpHc0FGzmWN1L6Upx1IMFIPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778330009; c=relaxed/simple;
	bh=kkC00Hm4PasArfja3LA/UXc0OW6JjSzi6RiGJEIqRc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tl89+xZuARo1kLXWCuTQZ3iVooWyDLsRMxp8ZZtncpcR2zKgwOn10sPQ49RgXvWpQSZx5yN6FpJuJ3v5Q9dsmHONEPjNjXWj3L2On82KDlWmNw1lVM8YBFwoGdAJ65Nx1ybK5UxTY0Sk64IHxRflmRVGMunfc9ShzYmVCFWkcTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ziggo.nl; spf=pass smtp.mailfrom=ziggo.nl; dkim=pass (2048-bit key) header.d=ziggo.nl header.i=@ziggo.nl header.b=TffVbMC4; arc=none smtp.client-ip=84.116.73.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ziggo.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziggo.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziggo.nl header.i=@ziggo.nl header.b="TffVbMC4"
Received: from csmtpq4-prd-nl2-vfz.edge.unified.services ([84.116.73.104])
	by dsmtpq4-prd-nl2-vfz.edge.unified.services with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97)
	(envelope-from <lvd2@ziggo.nl>)
	id 1wLgI9-00000003AIC-2huj
	for linux-sunxi@lists.linux.dev;
	Sat, 09 May 2026 13:56:21 +0200
Received: from csmtp2-prd-nl1-vfz.nl1.unified.services ([100.107.80.24] helo=csmtp2-prd-nl1-vfz.edge.unified.services)
	by csmtpq4-prd-nl2-vfz.edge.unified.services with esmtp (Exim 4.97)
	(envelope-from <lvd2@ziggo.nl>)
	id 1wLgI2-00000007uPo-1wtt
	for linux-sunxi@lists.linux.dev;
	Sat, 09 May 2026 13:56:14 +0200
Received: from pivobook ([31.151.14.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 256/256 bits)
	(Client did not present a certificate)
	by csmtp2-prd-nl1-vfz.edge.unified.services with ESMTPSA
	id LgI1wNynmrfEILgI2wlUBZ; Sat, 09 May 2026 13:56:14 +0200
X-Env-Mailfrom: lvd2@ziggo.nl
X-Env-Rcptto: linux-sunxi@lists.linux.dev
X-SourceIP: 31.151.14.30
X-CNFS-Analysis: v=2.4 cv=JpPBas4C c=1 sm=1 tr=0 ts=69ff20de cx=a_exe
 a=NV7W8VvOCisUEaGs51tmdQ==:117 a=NV7W8VvOCisUEaGs51tmdQ==:17
 a=IkcTkHD0fZMA:10 a=mZ4yd4CqamDfb6olylMA:9 a=QEXdDO2ut3YA:10
X-Authenticated-Sender: lvd2@ziggo.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ziggo.nl;
	s=202002corplgsmtpnl; t=1778327774;
	bh=kkC00Hm4PasArfja3LA/UXc0OW6JjSzi6RiGJEIqRc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TffVbMC4PBOTtUqdc6fFXUHBP/WEJKpDws7pW1ZzzphfAP05D43Z0yqf0/i3JDsGp
	 raUSMPu/yohAEfFrwcUMMLElU81nynerwaTe2hnJr1dbY1SoxrJzFg2HVtRsNRbX1E
	 WHbgtkM5CGZgWGAJYFbOoedrG3lIeS73lHLRfR55P9Io9jdK2AFieerVKT4W/s2Xtv
	 rdvmCRf0EHtVFiyp9lmwic1QzUskhYUrOaq46L+ryoL7ELvibG8/akWSe+q53rKSqw
	 bI9ozCRLfmIHjRI985Rj57JuJSurGFJGI5VUepLMr9JbG6wm1QkXOHTeVa9iv4RSr7
	 fdGfqMeklXRLQ==
Date: Sat, 9 May 2026 13:56:12 +0200
From: Vadim Akimov <lvd2@ziggo.nl>
To: Anup Patel <apatel@ventanamicro.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] RISC-V: Define pgprot_dmacoherent() for non-coherent
 devices
Message-ID: <af8g3DlQhHSME-0_@pivobook>
References: <20250820152316.1012757-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820152316.1012757-1-apatel@ventanamicro.com>
X-CMAE-Envelope: MS4xfNDTPr0vul+5v/KwGl5RI2QffcB7SymM16QmsJPTDk+WVAVIDIZFOdV76cwlQ5gPqx1/N6mVa4RFxpehkcP6L+t26aC2pigYtcqHH4ngn+IfNkWRGX0+
 nC5dUN/AHZ+BWYddiFotvlnydDGmcajOzZiTVToRGJbHFmCgW0STW2Pnb0c6/kGQcaqw6FwZe/hYJTd4B2bTVs5KFysWd9Hp5eNvh1JVqr5lB63yFkIpLST8
 77+6AduirQaBdkNLxp640R8Xji7afv+QG7REZvIFTfh0UoXYwUD7L5SY5b30eNOGeXR/UuqSMdj4318dH8400SzIf/lCCYfxqKsGUGNSan+LzqtYNnK1ZhyL
 iqRmPZmaau+dYDIfPSvGKVLY0QSDG73HEyIju1dvA1i/dXumI6jB2Wf3XlW+Q5M82aEk04TgpYoTquJJZ9G+wBNMh3Dpb5fcyx0AnhjcGp+sJcxseLD/n+un
 ADBeT1ptOeKRMWPjP2OC8XWfZY8krZapdqzrzNxtAK/H/HUjPsRHyfbYj4G1woy7olKiIXAtr8RsWRL3qzt6HFYO/3C4G7fIMdsUWQ==

Hi,

On Wed, Aug 20, 2025 at 08:53:16PM +0530, Anup Patel wrote:

> The pgprot_dmacoherent() is used when allocating memory for
> non-coherent devices and by default pgprot_dmacoherent() is
> same as pgprot_noncached() unless architecture overrides it.
 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 91697fbf1f90..00d8bdaf1e8d 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h

> +#define pgprot_dmacoherent pgprot_writecombine

This single-line patch, as implemented in commit 00b58d2c25d10fecffbebaa0c369fc9d0a6de397 for 6.6.y,
breaks allwinner D1 SDcard handling:

[    0.000000] Linux version 6.6.115 (surfin@nedoserver) (riscv64-unknown-linux-gnu-gcc () 11.3.0, GNU ld (GNU Binutils) 2.38) #1 Tue May  5 10:25:47 MSK 2026

[    4.886823] sunxi-mmc 4020000.mmc: Got CD GPIO
[    4.893625] sunxi-mmc 4021000.mmc: allocated mmc-pwrseq
[    4.941711] sunxi-mmc 4021000.mmc: initialized, max. request size: 2048 KB, uses new timings mode
[    4.958033] sunxi-mmc 4020000.mmc: initialized, max. request size: 2048 KB, uses new timings mode
[    4.990692] sunxi-mmc 4021000.mmc: card claims to support voltages below defined range
[    5.009712] mmc1: new high speed SDIO card at address 0001

then following never happens with that patch, i.e. no SD card is found.

#[    5.109896] mmc0: new high speed SDHC card at address 0001
#[    5.116546] mmcblk0: mmc0:0001 EB1QT 29.8 GiB
#[    5.128887]  mmcblk0: p1 p2

