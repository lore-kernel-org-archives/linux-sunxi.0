Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D400238C2A
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Oct 2025 15:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761148113; cv=none; b=RbEthE4yG+gl2yLc/U/Tq/dVt5ggqxcSWpr6HuSGdOBsaOCP9kKT9oaAfKC6fc6FdiTw5bDDH1DKEkg/z5zNXG3SKoIsDCcT5+YdCkPo4Hv8qtfy1OOirjgS6lslEp4ch7qecGBw+TjqNB33Ysd0mSpPmNPQZZ9Rz5kYXm5U8ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761148113; c=relaxed/simple;
	bh=MYzkj2EAfbjS5/yTfRBo+9A84zHOms8aeMazzrMuuDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uX8UV0UyTnwzNJvNhoWSx0IPu2k8fWYtB5GQNEViN2vZcJHl4tDQpxziKbc4uVjnSA6SQOgguxVeR1KijuU527pRL9YRiQ4WzXdiSEV7NidcdHCQapmfrYXEguGenuF8Vxx3f/u7KnnBWqTulOu5XdFd7ar3BT0IZWTbipSBan0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCzcw6hg; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCzcw6hg"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-427084a641aso3474241f8f.1
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Oct 2025 08:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761148110; x=1761752910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUhnfyAoo5ilFrAqmyIWfhfovaY9inNRMwx+n1ZoeVs=;
        b=OCzcw6hgAtYy4z8UkfrfL8SuqXrt1yC6Nv38HBvJZrY1mJu66+PKXE3fJBOvyHj5hB
         DAUAC8y6pgxaA55vVdmVnnqukciqYMN+1AOSVysQI4Sdgf0KtSX0SJ6MSwboHyt8ulLF
         f6dA9tAcBeXVzPinHgjQYfbhaai4QfIECdpCKMt58ga8QZVzP6YOSVpUTGEUAI9WdDaC
         EVj6oLNpQqM/TdtGQRcveYiMoXxwgfNWHhkJMmPzZ6KPCYk8NeiOgLTh1zvrLYIYL42b
         8PM33D9BK9unt2uB++0GC4/uxUSo1vdXwbf7q2/TJU81Xt8w/2j1x3fUalM8CCTqVGH4
         zWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761148110; x=1761752910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UUhnfyAoo5ilFrAqmyIWfhfovaY9inNRMwx+n1ZoeVs=;
        b=brRlTH4+m0LCMkKgEfdNJ73flnA5CE4ICrLTfj7guKAPsnvqJfiWwK0qxm+SR2WSSN
         ZFU7ykQ1O2YcrCxFkOaFcuj9cWxJ4pLiOqqJ1dHsPC1chgMjb9DKsFRnL+cCS3fauqsd
         LR1Wk14ZAvRBIQ4lEGL09c1LEfHMLkI0AnwAogHNW+38UfDp/a4gqy6SVZGUw25sGRNh
         9DWXgjjriu4AiyyYwlJgQD8QI3ylWSXNZ5HEVGsC75gTwhCHSD1Hsclc8o+TCxgSafLl
         AjSqee5UBPL+QWuqvZfFjDlppWkZpbkJcb5so9Dl2d3xjwtxS3OPJqN30tBkt65jbSde
         ITJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIkn7ai8oWRpfbFqa9XaCojOGhnoFzfiFyEA9s+ndVwec2Jx7qI8KYnTzALfFwGnUQW9fONnLAza/aRg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJQf3JgNinqNl7JLH3YP4AQS2QDeKdbfa5WQjEcq2TpREICnuJ
	dmq/gvaJphfxlPXYnZOFuoc0lJIidw8x1ea8LxwSbGnm5cJUTxgD00jZq/y4YQ==
X-Gm-Gg: ASbGncsPCQ8dIjZ7LVbcn618ZbaP79pz/MnAJX/L5Z79W7DadsQqRWKINl87a3HiQ56
	53vbQdpirRfx8Q61/yj80bfK8+lBhAGcpQ0IaQDmnw2OzCJ2IJOAyGROUDoJPDift4lCsYonVQB
	ppJq72GcSAcVy1JQHwKbCTmtb68CpqNm6lbQf8ihQaO+3xk1/cGbLhaX4Q9DpEsiLWAoXM06vIA
	mc34uQW4ohJsQ6tiwK98BzSUgq2QhahL+DGQ+CuPKVIx9QrvCEVVb7wfZxD48Y/HWRJpSk+z8Si
	zM/wNw4FvcPkFnjiG7XHjK3IFvSEtYXi4LfD4RbGcsTHQhgALqnpCEem67mPvV0oetP2OYrThWe
	5Vq4/rrUxwRJ0vETPyRyEy83MORuAgxl5+r7dv4DW3CimhsyMCQGHH5gvWtghkHpQhJrPc+PPMl
	fNpOPW08lPEBR8NqEGOpbhv+0RHNhfpCwnJGb7Q1qu/jXjvp/Cvg9qkmB6CA3pcHZU7Qxk5qh5t
	ZNU6w==
X-Google-Smtp-Source: AGHT+IGceNZC+hsDU5iNf4hy7oHNmkb8i7YV/yTP5Anzziu3s6OU669Yv3tn9CnVwmUwCH6ADfRs+g==
X-Received: by 2002:a05:6000:22c6:b0:427:23a:c339 with SMTP id ffacd0b85a97d-42704d6c507mr15006637f8f.14.1761148109425;
        Wed, 22 Oct 2025 08:48:29 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a993sm25826848f8f.24.2025.10.22.08.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 08:48:29 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Andre Przywara <andre.przywara@arm.com>
Cc: Rudi Horn <dyn-git@rudi-horn.de>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] sunxi: dram: detect non-power-of-2 sized DRAM chips
Date: Wed, 22 Oct 2025 17:48:27 +0200
Message-ID: <12763423.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20251021235334.7557-1-andre.przywara@arm.com>
References: <20251021235334.7557-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 22. oktober 2025 ob 01:53:34 Srednjeevropski poletni =C4=8Das je=
 Andre Przywara napisal(a):
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
> the size of the memory to 75% when this test fails.
>=20
> This enables boards which ship with such odd memory sizes.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi,
>=20
> I don't really have a board with such an odd size to test that, though the
> function worked on a 12GB A733 board. But that's not supporting the SPL
> or any kind of DRAM init yet, so was tested out of context.
> I would be grateful if anyone with a 1.5GB or 3GB board could test this.
>=20
> Thanks,
> Andre
>=20
>  arch/arm/include/asm/arch-sunxi/dram.h |  1 +
>  arch/arm/mach-sunxi/dram_dw_helpers.c  | 16 +++++++++++++++-
>  arch/arm/mach-sunxi/dram_helpers.c     | 12 ++++++++++++
>  3 files changed, 28 insertions(+), 1 deletion(-)
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
> index 24767354935..14f6b24c30f 100644
> --- a/arch/arm/mach-sunxi/dram_dw_helpers.c
> +++ b/arch/arm/mach-sunxi/dram_dw_helpers.c
> @@ -143,8 +143,22 @@ void mctl_auto_detect_dram_size(const struct dram_pa=
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
> +		size =3D (size / 4) * 3;
> +		debug("capping memory at %ld MB\n", size >> 20);

As I already commented in first version of this change, wouldn't it be good=
 to
add additional check here, just to be sure there is no misconfiguration? In=
 such
case it would be better to panic than continue with unstable system.

Best regards,
Jernej

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




