Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC7B3C5522
	for <linux-sunxi@lists.linux.dev>; Mon,  1 Jun 2026 14:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780325847; cv=none; b=fo/gEGY3sESzYTPCaecsKSSonH0Z1H1xBME0avGtMsnxB46+K2HgQUXI4xB+mJ0i2TjOWHDt25uyrZlNiDp2jkjWRAsaiHjnTlgRvVzmkt3/qiYuUzH47bynNrTXBPi1TX4h4VjAuZLUEd0MLTJS1U5yYil54BG+AZndbigClVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780325847; c=relaxed/simple;
	bh=3U/hoCMfqrN8WYMe6LpM/eJcEaNfw0c3jaGz+fXlIRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jw2RaGvNDdQnk58pxC0dvwCcveQWe2pJstNruMrWwv+7sw0bdtfVFeWQ8JTxm13nSR2yUxSzjkBKRzz4o4ixBBV9HAByQO6/RE9EwZDNBadXG1x1rIoYbbtCT1aKfZsYzEFdo+hhU2LwQLObcflRWmcAh3eR71a61aRIhh4wYt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsDvKCJM; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsDvKCJM"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so2681502f8f.1
        for <linux-sunxi@lists.linux.dev>; Mon, 01 Jun 2026 07:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780325845; x=1780930645; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gfecz+ZWs/BTOXCnvzAkst5tZtXH0lgY7BHeUFyc1xs=;
        b=NsDvKCJMAv3JzNYnZrOYFymGDY28Ay9FD39vnshllP72H/qLG0o5Aw/+TNxLKMwoqf
         DlH0IvKNeqhF0fbTrdVW3zFzYtbWxarcyusXnXl2GVwAE+jfk+VQ3NhOCsMdIhdVDZMf
         r9t3Plo6uXUnka4qOAa2k/zFs+/noZ/AsejUIE9eUEgMkq2aufqpsavRFdoQvVolWKKX
         bYLzPfy+kviOuYJxvMNb3gI6BW0rHIUlkqT1PEjv+rncjrZtzCSpQ7BdEPfFjSEo03Zf
         /6RuUAGI5No6Sz8O4jZ6YUmmVj/wvAPKMIag8XeEx1FvPDzjKg0tMbPVeVkiNI8S/ViO
         2okQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780325845; x=1780930645;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gfecz+ZWs/BTOXCnvzAkst5tZtXH0lgY7BHeUFyc1xs=;
        b=hpdtxJ1qkKzMcoEAehbBozt8w2+dfWNSag5lcrC4Hbrx7fQlhHqEqwlB4u7ycMfV4o
         8UmUx0YQBEJ6w/txeX5Ylahtfc7Nt2HriNgJxsUwxsaKImRWD44TtZzC/N7iGlAP1FdN
         3r8OsQcUCXjdjE2wxX3U86yE+FQL/vSv27NSHQU3aX7I2fpw0eW8T6aDIKrwk3KczJ0I
         iirdJtNCYalZXL/EY3vPAJkO8OrXjNY8W98dsDGkRkv48XR13MJVYh+6gVO4d07Kqc7/
         kVgBUhJpxRxn/m2i7LIpO7t490NtHzBAru54/J1b+MiluaNA/tgC3Ai9o5R49T7FwHMF
         4MUg==
X-Forwarded-Encrypted: i=1; AFNElJ8wDDSlr844R26a8A7hcTXWtoLpZy13gsrTAaxjbM/WVn6eVJgVZ4mooZxrlGHOHZVg+l+wGG1INYIJxw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzN/ACeNz+HpAoNJoB+L3etgbz90M6kVToQWK9TWoPKqcSqu2Q5
	qctXThGrHYEEX0Eyp8WiCqSeo6vEm9+2yoXqxOVRx7TCK1cyoIw8wOGC
X-Gm-Gg: Acq92OEmSKi5q9enNIY1uWyMfLmM3CyQ69MefghCIPeeCt1/m+7k3zxe8GRByidNmxS
	un5X9GfNSqExNVU7pbyd2+GcFnvafrOooDerZkbe4C1krZ75NMM/iBPwaWR3sDMSJj+HfhjAew7
	9kUiTbmkO8mfGqAduYOPSkK0cdOUcJzGdOYlST2L6GriUmCUttVpzEQuGnGSbO0Owd0VxZxq1XU
	drHmtHWjkhtKCa8gWgHpfijjXIq1WOoy+v11vxDWIgs6IFdAtjXwZ8azZA9Vqk8IchYS2wILfLV
	cLysmDkGRxdbWo0NzFD1xN/mNo2IzgDU4pJhda8wou5WkFL4Y4k5yN4+SNPUyyvEK3gtCZOtccY
	cAprLhpH+/OV7RhyQaLqjha2hywy3GbtJ3yr4VxlCl5jr1C/NtNgShB86dOAlvbXP7nLtc1kgNG
	lxTij94/FNeAT1dYyqReO4wpHSGg+wt1R3xQ==
X-Received: by 2002:a5d:59c6:0:b0:45e:e936:5e30 with SMTP id ffacd0b85a97d-45ef6e696cbmr18803207f8f.6.1780325844434;
        Mon, 01 Jun 2026 07:57:24 -0700 (PDT)
Received: from Red ([2a01:cb1d:897:7800:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45ef34a03f8sm27548200f8f.7.2026.06.01.07.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:57:23 -0700 (PDT)
Date: Mon, 1 Jun 2026 16:57:21 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Tianchu Chen <tianchu.chen@linux.dev>, herbert@gondor.apana.org.au,
	davem@davemloft.net, wens@kernel.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: sun4i-ss - clamp PRNG seed length to prevent
 heap overflow
Message-ID: <ah2d0RyZcVp614_k@Red>
References: <af749a8447bd7f0e9dd26ca6c87e9c6afecb09d9@linux.dev>
 <4d4407c05835a50413fa1e974e3aa3f4abfe2d5b@linux.dev>
 <20260529161057.GA2706@sol>
 <ahnIbpBLyn5z_siT@Red>
 <20260529173341.GA566433@google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529173341.GA566433@google.com>

Le Fri, May 29, 2026 at 05:33:41PM +0000, Eric Biggers a écrit :
> On Fri, May 29, 2026 at 07:10:06PM +0200, Corentin Labbe wrote:
> > Le Fri, May 29, 2026 at 09:10:57AM -0700, Eric Biggers a écrit :
> > > On Fri, May 29, 2026 at 08:08:01AM +0000, Tianchu Chen wrote:
> > > > From: Tianchu Chen <flynnnchen@tencent.com>
> > > > 
> > > > sun4i_ss_prng_seed() copies the user-supplied seed into ss->seed
> > > > using the user-provided length with no bounds check. The crypto core
> > > > does not enforce slen <= seedsize before calling into the driver, so a
> > > > userspace caller via AF_ALG setsockopt(ALG_SET_KEY) can pass up to
> > > > sysctl_optmem_max bytes, overflowing the fixed-size buffer and
> > > > corrupting adjacent heap memory.
> > > > 
> > > > Clamp the copy length to the buffer size, matching the approach used by
> > > > loongson-rng for oversized seeds.
> > > > 
> > > > Discovered by Atuin - Automated Vulnerability Discovery Engine.
> > > > 
> > > > Fixes: 6298e948215f ("crypto: sunxi-ss - Add Allwinner Security System crypto accelerator")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
> > > > ---
> > > > v2: Silently clamp oversized seeds with min_t instead of returning
> > > >     -EINVAL (Herbert Xu).
> > > 
> > > sun4i-ss-prng.c is useless, is still broken, and should just be deleted.
> > 
> > Hello
> > 
> > useless ? clearly no, it helped a lot on devices where it is.
> 
> The only way this code is reachable is via "rng" algorithm type in
> AF_ALG, which is almost never used.  Everyone just uses the regular
> Linux RNG (/dev/random etc) instead, as they should.
> 
> In fact, anyone were to accidentally use this it would be a security
> vulnerability, seeing as sun4i_ss_prng_generate() doesn't actually fill
> in all the bytes that were requested.  It also doesn't wait for the FIFO
> to be ready when reading data from it.
> 
> Is it possible that there's a misunderstanding here and you think this
> provides entropy to the regular Linux RNG?  It doesn't.  hwrng does
> that, crypto_rng does not.
> 

I believe to have used rngd for that. ( or something like that)

Anyway, I understand why want to remove it.
