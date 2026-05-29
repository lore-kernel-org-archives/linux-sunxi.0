Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7D4376A1C
	for <linux-sunxi@lists.linux.dev>; Fri, 29 May 2026 17:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780074612; cv=none; b=LaDAlJn5NB2HaKPRLA/WKD7XnAy7HJcVmGoNfm2UmspTpLG/rc2UrGJYwvNeDtpJsoB0DJ5TmGBje6GezX0bEIiw5jlNfd9Osk7rhVdfdYym9KJ5MmlDyWQXA0sQpNhqckXnBGYrIXWSTryHR4YD0kEUz5ZRBDSpgguzEkq9uv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780074612; c=relaxed/simple;
	bh=dgeJvvjQc5QMwRX5JtGFSTlN6V6uNPGM8Ed0SvjA7so=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKWJt9pgOPhbNyyV5VHILgg6KMLnw/Ywdlz/fmVQVT77mtINMro2XH3onxkFjmM/q3f7ePLfXXekgYhWdGF4yqW1hAhyfHjSbFRbbnyxeKOtfprhEB6yyb3rF2d8GXwuOFRTG5PMpudtPd205vKo/YrCLdxrC89UT8rrCfbLvEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pl0JrlDy; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pl0JrlDy"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7c0de780bf1so128862197b3.2
        for <linux-sunxi@lists.linux.dev>; Fri, 29 May 2026 10:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780074610; x=1780679410; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XEa79tV2eMzpcPWIo8LBBqUX2PeWclrMmzllPIEalhs=;
        b=pl0JrlDyUpVnWhRscdpnu7PTZYudar+mn0dfpVgzf8aLgPfdHG6/5jS6ZETzpcj4Dh
         Dg1oevdzw2QxMqQCTazYyKeThjp0xTwq+5y0ks8A7d7C9E7imQlWESGLcmSLpBXN8NPB
         zZMR0rcsA+Mkossw3LyxVDLjnHbbYWGlGf1ERkYxQHU74WMhKWH+5vzJrSDfJvJo32Rv
         Q3VGDy5kA4zR0I5KEZS2DJvWrrTqU/RJ6kljApKHkweQfV82SyX8seS8/wEyQEJ1nI8K
         jBEPFBYReegS8svHV3MqsJjFT6i1/17DVTzYank9hWyoYA3wKVT5pxU6IQKRRAY3n1RE
         B8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780074610; x=1780679410;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XEa79tV2eMzpcPWIo8LBBqUX2PeWclrMmzllPIEalhs=;
        b=c/sWvGeCv6Iztim2ap3a0Cesa7q3E2YmDLxdnJFtXxlsWC3X8zK+/qHzo63meWxrzr
         1BJMahD+1rI+RhXWP0DsmlgZYJLwX6MHUBdCNbXM+1XDEI/fAWjT86SdAZCp2Afr+Bex
         jpcdMyx7bx6eSkNqrChWSNroCHk5uWo7bRUz+xQMr2MKMxtfQsK6kylSByzysWog55GX
         ok8GdHHy0dBcLS3bY64FKT+Z3cH1JCaHwccWRBaG7vSOyIIpIwgUzcxIDgv5V5DSDdWp
         zbakyQv1KhJQjDMcjApBQMrPrx9VzCQqtYsILl/xdAbcb4jf2lLrZa9jzp0XByp9AgUt
         sB6w==
X-Forwarded-Encrypted: i=1; AFNElJ9IqE+5AgjAeI0fmA/ztn+E4hJ6Tr+k0OH97vCb3bTSWtouW2kc8vlIiHB9r73SFUU7HieujBqu6LJuHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyUreUf+fu/kuyNRPk2KCHiGJj/1A2Qk9uTXhCRK7VJTH8ehAU2
	QRT8dgBkLAzmrgx9PtBOCzfJIR+KoSQqCb8RywoIfOYZSnnunsd8ask2
X-Gm-Gg: Acq92OG0MYgCCXos+70A8gLJ0alw6Z8bpaXB7vjfzUcu6mDBkJtMpqCkHXORrKi9jSa
	01cyl0q4RTOOgFQw4lCDeGa3v4zgjRTgUWBQAth9XzV/+nQG/Pcn8hz0rgwXGTFh4aE7zZn7QE8
	3QvOFNCsVVkXwbNgPq1nQwL+Bu4QNay9tSYDX8kHi/ug4Fwdv5rqVqj3sQ7y6p/8GAGhvbrNXUu
	iN+lMs4YAspJZC4mrWUsI69S82xClHTvnCr/2wVUM+abz5LGAPktaQgQAKvST8tmeZePZNa9Ad7
	MxH7KzMCnkJFLeYev6hR8I2Fa+xLxcYWkDYhgX2Dx85R3/YR3Vc7baw/rjUy+KlQP1o5DmwewnD
	byqIvKKBQ8YH0wM3v1cil7BSvhJP+CC9KV8GdYXNzQOPYJUya+1d3yIrouFm41uecHJ32j8pVIY
	9bNWx9Tywdj+Sr5ZzjamQVsnzDErQetXv7Pw==
X-Received: by 2002:a05:690c:e34b:b0:7d0:261a:6bd with SMTP id 00721157ae682-7e05f11c4ffmr1672527b3.44.1780074610517;
        Fri, 29 May 2026 10:10:10 -0700 (PDT)
Received: from Red ([2a01:cb1d:897:7800:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 00721157ae682-7de689e58d9sm8427927b3.21.2026.05.29.10.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 10:10:09 -0700 (PDT)
Date: Fri, 29 May 2026 19:10:06 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Tianchu Chen <tianchu.chen@linux.dev>, herbert@gondor.apana.org.au,
	davem@davemloft.net, wens@kernel.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: sun4i-ss - clamp PRNG seed length to prevent
 heap overflow
Message-ID: <ahnIbpBLyn5z_siT@Red>
References: <af749a8447bd7f0e9dd26ca6c87e9c6afecb09d9@linux.dev>
 <4d4407c05835a50413fa1e974e3aa3f4abfe2d5b@linux.dev>
 <20260529161057.GA2706@sol>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529161057.GA2706@sol>

Le Fri, May 29, 2026 at 09:10:57AM -0700, Eric Biggers a écrit :
> On Fri, May 29, 2026 at 08:08:01AM +0000, Tianchu Chen wrote:
> > From: Tianchu Chen <flynnnchen@tencent.com>
> > 
> > sun4i_ss_prng_seed() copies the user-supplied seed into ss->seed
> > using the user-provided length with no bounds check. The crypto core
> > does not enforce slen <= seedsize before calling into the driver, so a
> > userspace caller via AF_ALG setsockopt(ALG_SET_KEY) can pass up to
> > sysctl_optmem_max bytes, overflowing the fixed-size buffer and
> > corrupting adjacent heap memory.
> > 
> > Clamp the copy length to the buffer size, matching the approach used by
> > loongson-rng for oversized seeds.
> > 
> > Discovered by Atuin - Automated Vulnerability Discovery Engine.
> > 
> > Fixes: 6298e948215f ("crypto: sunxi-ss - Add Allwinner Security System crypto accelerator")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
> > ---
> > v2: Silently clamp oversized seeds with min_t instead of returning
> >     -EINVAL (Herbert Xu).
> 
> sun4i-ss-prng.c is useless, is still broken, and should just be deleted.

Hello

useless ? clearly no, it helped a lot on devices where it is.

Regards
