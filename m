Received: from thales.epochal.quest (thales.epochal.quest [51.222.15.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082F81DED78
	for <linux-sunxi@lists.linux.dev>; Mon, 12 May 2025 15:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.222.15.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747063269; cv=none; b=IectVZDlgf1snSYdjtz4pyspPIPQvuF0ePl4DvUQ2569S2M3ntAX74xk02mls94xhOHZjBtP939SywuGqRs2cE1/riNvwV9djPiQG/Ya/+9vCrZCPe1z3cMcmhkil6rkbou9JPAf3l4bGHopR1OYXLVY4wGo+rUG1oCpOwJ2BKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747063269; c=relaxed/simple;
	bh=QuLJIuAQnXAdeilq2O8Kju7ulUQVs2l2UzjpfDomQCg=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=gWzqx0R9jIyth9gGZ3A9zYl11Zzp6WprFdEI9M9UUc1QGA7NLqmVsBEZmExjQvB++sCbV9iojOONM1cwdlfIPKsbO9bLxO8YV7w9A2wVNsU1m/oam2wXQhB9K4l93RZzOZwPs0GxQbFFruaXSvl83E6ZB/B6F2vJ48Zwgpo9oAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epochal.quest; spf=pass smtp.mailfrom=epochal.quest; dkim=pass (2048-bit key) header.d=epochal.quest header.i=@epochal.quest header.b=F1v1ZMK3; arc=none smtp.client-ip=51.222.15.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epochal.quest
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=epochal.quest
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=epochal.quest header.i=@epochal.quest header.b="F1v1ZMK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1747062759;
	bh=QuLJIuAQnXAdeilq2O8Kju7ulUQVs2l2UzjpfDomQCg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=F1v1ZMK3O9J2OID5oiYW2O1Gd6ANC517BZRfaLJJQhCNwlvOrc0uF/9dqzxkuvIFX
	 ltC/ZBG6bqQYZ1Gxlhd0shGEiviTCQh6ZpABVq1tUmF8b+318yEK9rNiRZqEfym2IV
	 Ap1va4i1X5D95Yf39G/+2GREGqBozrfUKPuK9rRArjcs3y9vYuEOaIGYs03fegAUSH
	 44O+Sffa3qvx5s9t6eT8yX0m9qLsQPa/MiDeMVM68G4bUyH9aYPrghxs5syJN8Qi1e
	 rGTFHrBc4mFKFm7BZh/4LAfHGw8M1Xq6SJ1yFJDdzLwUckboVF/Hmtn70MpIGe1cFT
	 hLC2sHbghWJcw==
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 12 May 2025 12:12:36 -0300
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Jagan Teki <jagan@amarulasolutions.com>, Philippe
 Simons <simons.philippe@gmail.com>, Sumit Garg <sumit.garg@kernel.org>,
 linux-sunxi@lists.linux.dev, Tom Rini <trini@konsulko.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v2 1/6] sunxi: A133: add DRAM init code
In-Reply-To: <20250511011003.15654-2-andre.przywara@arm.com>
References: <20250511011003.15654-1-andre.przywara@arm.com>
 <20250511011003.15654-2-andre.przywara@arm.com>
Message-ID: <20165cde26bb95b5f79d01d37f1f4af2@epochal.quest>
X-Sender: masterr3c0rd@epochal.quest
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025/05/10 10:09 pm, Andre Przywara wrote:
> From: Cody Eksal <masterr3c0rd@epochal.quest>
> 
> This adds preliminary support for the DRAM controller in the Allwinner
> A100/A133 SoCs.
> This is work in progress, and has rough edges, but works on at least
> three different boards. It contains support for DDR4 and LPDDR4.
> 
> [Andre: formatting fixes, adapt to mainline, drop unused parameters,
> 	remove struct struct sunxi_mctl_com_reg, hardcode MR registers,
> 	switch to mctl_check_pattern(), remove simple DRAM check]

Thank you Andre for cleaning up my patches. Life has a nasty way of
getting in the way when it's least convenient.

Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>

- Cody

> ---
>  .../include/asm/arch-sunxi/cpu_sun50i_h6.h    |    4 +
>  arch/arm/include/asm/arch-sunxi/dram.h        |    2 +
>  .../include/asm/arch-sunxi/dram_sun50i_a133.h |  230 ++++
>  arch/arm/mach-sunxi/Kconfig                   |  104 +-
>  arch/arm/mach-sunxi/Makefile                  |    2 +
>  arch/arm/mach-sunxi/dram_sun50i_a133.c        | 1204 +++++++++++++++++
>  arch/arm/mach-sunxi/dram_timings/Makefile     |    2 +
>  arch/arm/mach-sunxi/dram_timings/a133_ddr4.c  |   80 ++
>  .../arm/mach-sunxi/dram_timings/a133_lpddr4.c |  102 ++
>  9 files changed, 1722 insertions(+), 8 deletions(-)
>  create mode 100644 arch/arm/include/asm/arch-sunxi/dram_sun50i_a133.h
>  create mode 100644 arch/arm/mach-sunxi/dram_sun50i_a133.c
>  create mode 100644 arch/arm/mach-sunxi/dram_timings/a133_ddr4.c
>  create mode 100644 arch/arm/mach-sunxi/dram_timings/a133_lpddr4.c
> 
