Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4736522D792
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 15:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768836670; cv=none; b=BqXt11QXHcdj1H3xrarsjwuiMQe5j6ai41yks+CbZEIyWMPXRFhZgrVoS4jhJoBmmZDFNmvaZ0V0QLRxL3I7O3pn+NYITRgWFmDIhGdsSIwVZbARIRHQ1NhKzfG3oHn9aYmIOLUwXAT7mA5MwRate0jvDA96YtbOkDyZZd5jnX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768836670; c=relaxed/simple;
	bh=TatnVb7ny9CCEFJxB7dm1vymHZukc7oW1NNCBzn2baY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UkhcFqxiG49sPPxL7B/qbbcu49iFQ1r1MCBPdsYEX5FQ57Wgr/RZo7fCRSInfNrg6egJ1c1O0/TjfdpNDFEdqHRC4tsX2LFysWAyGZJgmcKY9CaDnhRfdvwXqhqhE7fTmpK0zEF1/vm33xYMrt66KZYrgCJ1lIWdIPYM8MDqYkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKGyyDQj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKGyyDQj"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so51157425e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 07:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768836667; x=1769441467; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ns7cOXSE46lfBsQWk849lkgkSIYrG2jMFvsJs1yzrvA=;
        b=TKGyyDQjo9hEVOWwXowX1VH+wGe17/CSXO5H8oQpa4p8FZruaLEpDMDuJgKU045l8I
         +rYx1HzybFQP2u6QlyxE1xEhwxI77N5a/WCBcBvWrMpHlMxXhfeqaDwvQEpfQAdZvDJm
         u8D7iueEorTYpTgoMJFp8fg9se+xXeVEjU+jkjZ10QoOFOZWfr9jP2a2SrPYTkVlPUTy
         u4MhTW7PFr4uNPb31MftdHWtiGy7LJ/Gxtwf+NwRzC1m7+ie/WutogS5wperQYcIJx31
         vQBGD5owXHXvPEyTzB06ALus7sVy2M4a9xUcL/OSH8b/aBN7018A/BqsWN3MAOoA6EES
         Ds7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768836667; x=1769441467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ns7cOXSE46lfBsQWk849lkgkSIYrG2jMFvsJs1yzrvA=;
        b=Z3fIerSiKlu9wmKFitFGycEMwYl6P47eN6qfCshPd29MVzhxj2A3Bp0G4lJRNG1nuw
         O1BXVAtNds/5TCw9OiUyKEMyPb3FMyGAgDF09kUJIiLg3UjE/f7gR3Z62q3oR7QMnVZc
         ICwGVu+HF1F7xJ3ZqaTF0KQV/Pd13khsm01yH8mXjT748tl/59qbhhZK7i/1NtPFTxa1
         bM2cmJXbe5OYrknsPyZJn0cOIZ+hMyDZikXmTIjCCe0IgMVYBw3Ub4xrC3MWb2kj79AT
         CB3l+tiycqpFNzOTrp8hrtA0XPSWTrs8NaheZe4eWdA2uAKkBRnfQJA7342gR9U0DI5d
         IHZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwDCq0FjnoGue2O9FEKUXHUFFR/f9sisZAy5xnxr3/9hYM5GCL7dSYVWN0LcWHqiy21zGF9DHaVrRL0A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxlMNvsNiK2UiNlvjT/wFOcwZgbJq9CaPyzKHlJmYsbJrn7TwCP
	F4hH4/FjLUC7WtLkomr+J5sxkBIXmcmHEwUMWeiVuVQOYO+Rlcl1QHFm
X-Gm-Gg: AY/fxX5sMyWQYEjuTRPUwPenPbjDyYkwxHdJRuJz/h0tPaeVoAyg9vvcseDcN0PIhVZ
	L28kWXi9BSGx01EeNqWt7ib75r9nUKQebHxtTUIBvHGRXviK380nv5dP7sDbBFMoryU16bZk5lF
	2dex3ttRzDHPixZS6Cm1Y7XqO+15fbf1ihv5WFMziCnc3b4pYM2OWj2hxwTDR3knf670R9f0MkW
	Gr6+UT0YX9uCARHjZnOjUQ1I0LOsikhWkpRmLMMFIp+W2Fz56qpucYlgxKtdJlokMgrhP3GkCf1
	KXsmmB2O5Sio2pV6lNhmDBsRjx+stnRJ5HIbJErD7CpSzbKkN67+plpoar4Di0l20bwBXUgXR+R
	Do/Ukh/zwbh+xuseyZI80s7dMXegTNAXV82R88Sj+OlvTt+Br4NBlc4ryiIJ85gy2oeD8WnJeNJ
	uVAYV3QOa0pzOPUJSuOSXfeU/lRm3Hv/t1V9aZZ1N7cJYBfc65Y6/+y8kIyM1DL2xiHeW2l3WkN
	AShlA==
X-Received: by 2002:a05:600c:3e14:b0:47a:9560:ec28 with SMTP id 5b1f17b1804b1-4801e30b8ffmr153826015e9.13.1768836667321;
        Mon, 19 Jan 2026 07:31:07 -0800 (PST)
Received: from jernej-laptop.localnet (213-161-4-198.dynamic.telemach.net. [213.161.4.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996cefdsm23132480f8f.24.2026.01.19.07.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 07:31:05 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Andre Przywara <andre.przywara@arm.com>
Cc: Rudi Horn <dyn-git@rudi-horn.de>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2] sunxi: dram: detect non-power-of-2 sized DRAM chips
Date: Mon, 19 Jan 2026 16:31:03 +0100
Message-ID: <2813637.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20260118235905.23752-1-andre.przywara@arm.com>
References: <20260118235905.23752-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 19. januar 2026 ob 00:59:05 Srednjeevropski standardni =C4=
=8Das je Andre Przywara napisal(a):
> Some boards feature an "odd" DRAM size, where the total RAM is 1.5GB or
> 3GB. Our existing DRAM size detection routines can only detect power-of-2
> sized configuration, and on those boards the DRAM size is overestimated,
> so this typically breaks the boot quite early.
>=20
> There doesn't seem to be an easy explicit way to detect those odd-sized
> chips, but we can test whether the later part of the memory behaves like
> memory, by verifying that a written pattern can be read back.
> Experiments show that there is no aliasing effect here, as all locations
> in the unimplemented range always return some fixed pattern, and cannot
> be changed.
>=20
> Also so far all those boards use a factor of 3 of some lower power-of-2
> number, or 3/4th of some higher number. The size detection routine
> discovers the higher number, so we can check for some memory cells beyond
> 75% of the detected size to be legit.
>=20
> Add a routine the inverts all bits at a given location in memory, and
> reads that back to prove that the new value was stored.
> Then test the memory cell at exactly 3/4th of the detected size, and cap
> the size of the memory to 75% when this test fails. For good measure
> also make sure that memory just below the assumed memory end really
> works.
>=20
> This enables boards which ship with such odd memory sizes.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi,
>=20
> v2 just adds the "positive" check, so whether memory just below 3/4th is
> accessible, when the test for above 3/4th failed.
> Please test if you have a board with such "odd"-sized DRAM.
>=20
> Cheers,
> Andre

This looks good to me now!

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
>  arch/arm/include/asm/arch-sunxi/dram.h |  1 +
>  arch/arm/mach-sunxi/dram_dw_helpers.c  | 22 +++++++++++++++++++++-
>  arch/arm/mach-sunxi/dram_helpers.c     | 12 ++++++++++++
>  3 files changed, 34 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/include/asm/arch-sunxi/dram.h b/arch/arm/include/as=
m/arch-sunxi/dram.h
> index 0eccb1e6c28..59e2e980bfa 100644
> --- a/arch/arm/include/asm/arch-sunxi/dram.h
> +++ b/arch/arm/include/asm/arch-sunxi/dram.h
> @@ -45,5 +45,6 @@ unsigned long sunxi_dram_init(void);
>  void mctl_await_completion(u32 *reg, u32 mask, u32 val);
>  bool mctl_mem_matches(u32 offset);
>  bool mctl_mem_matches_base(u32 offset, ulong base);
> +bool mctl_check_memory(phys_addr_t addr);
> =20
>  #endif /* _SUNXI_DRAM_H */
> diff --git a/arch/arm/mach-sunxi/dram_dw_helpers.c b/arch/arm/mach-sunxi/=
dram_dw_helpers.c
> index 24767354935..d2af2d57fde 100644
> --- a/arch/arm/mach-sunxi/dram_dw_helpers.c
> +++ b/arch/arm/mach-sunxi/dram_dw_helpers.c
> @@ -143,8 +143,28 @@ void mctl_auto_detect_dram_size(const struct dram_pa=
ra *para,
> =20
>  unsigned long mctl_calc_size(const struct dram_config *config)
>  {
> +	unsigned long size;
>  	u8 width =3D config->bus_full_width ? 4 : 2;
> =20
>  	/* 8 banks */
> -	return (1ULL << (config->cols + config->rows + 3)) * width * config->ra=
nks;
> +	size =3D (1ULL << (config->cols + config->rows + 3)) * width *
> +		config->ranks;
> +
> +	/*
> +	 * There are boards with non-power-of-2 sized DRAM chips, like 1.5GB
> +	 * or 3GB. They are detected as the larger power-of-2 (2GB and 4GB),
> +	 * so test the last quarter for being able to store values.
> +	 */
> +	if (!mctl_check_memory(CFG_SYS_SDRAM_BASE + size / 4 * 3)) {
> +		if (mctl_check_memory(CFG_SYS_SDRAM_BASE + size / 4 * 3 - 64)) {
> +			size =3D (size / 4) * 3;
> +			debug("capping memory at %ld MB\n", size >> 20);
> +		} else {
> +			printf("DRAM test failure at address 0x%lx\n",
> +			       CFG_SYS_SDRAM_BASE + size / 4 * 3 - 64);
> +			return 0;
> +		}
> +	}
> +
> +	return size;
>  }
> diff --git a/arch/arm/mach-sunxi/dram_helpers.c b/arch/arm/mach-sunxi/dra=
m_helpers.c
> index 83dbe4ca98f..376b7d14f86 100644
> --- a/arch/arm/mach-sunxi/dram_helpers.c
> +++ b/arch/arm/mach-sunxi/dram_helpers.c
> @@ -62,3 +62,15 @@ bool mctl_mem_matches(u32 offset)
>  	return mctl_mem_matches_base(offset, CFG_SYS_SDRAM_BASE);
>  }
>  #endif
> +
> +bool mctl_check_memory(phys_addr_t addr)
> +{
> +	uint32_t orig, val;
> +
> +	orig =3D readl(addr);
> +	writel(~orig, addr);
> +	val =3D readl(addr);
> +	writel(orig, addr);
> +
> +	return ~orig =3D=3D val;
> +}
>=20




