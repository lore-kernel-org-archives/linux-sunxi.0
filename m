Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26671C54BB
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jan 2025 20:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737664057; cv=none; b=mv0W3KNcM4pPzTcH/0nL/iMEsDA+M3qwv7MI/wtxTiOMr+VL5YSUZ6/fQG+F1hdWvbOwjEnfXI9b1bQDXMzU4CsF7jLcfiJj2wjLS7M/GVGXswrVNX0UYBmd0aJJTP6qy0wUoh1kbSFuWlco/R/beLVF9FvVG83FVfd+QQ9G3x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737664057; c=relaxed/simple;
	bh=XjYNMqbWZ4n/XbjzqN1/SpWN54nBY4NkBU2QqHtYu+U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JVQ5Q+e1YOhMPeWkS5EW+dpcua7UDd3s93dp1LnJJ2tIPIi/qXZYbud8oUqVAfFGQX+xkRgxzfEx2okR9Y66e5P+N2YeR4qxz0zr+cN+QT9AhBMJV59uSK53G0vuymVzPiU5jaSbqI/Q+xtk7YvwamE5XX+MOvvfJHMSozZVCSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pq5nbXCI; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pq5nbXCI"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-438a39e659cso9079295e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 23 Jan 2025 12:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737664054; x=1738268854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00Jd7qfRLvc64aDOsfuy6UISvWMt9cQyEiI056IRJNA=;
        b=Pq5nbXCIeXGRfWFXbUkXN3/+1ZG/BgN3frd+wAFKxSqCg2zTx9/pM3Q/KL5B8sx1Ic
         5p6TlyA1ivd/EQdUDSJxeGZC2/A4A8AGKpxj8Ayuy7K9BbM8OPAr+1kc1ZYTPdTW27wn
         jLQ8i3qrde8/bLd28hZnIC05aLjrBy45TYuLo9sHsSYZEFLncy2PQsmguzkC2efxEMzG
         xkRJ5K15o55bqpqWMxSENk7l+vJPwYN5wrhnltk+/jxqqtfp+FokTy0F61aaLPyBwCZf
         5gRgkoFHvEJqH4qXdOXQWI9IymwPAMM+kxpirr8LbGHFnrV4ptIRReS3fMxVy6Z3/TVJ
         kjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737664054; x=1738268854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00Jd7qfRLvc64aDOsfuy6UISvWMt9cQyEiI056IRJNA=;
        b=NXgRp2qZ+nqQ5K2IjVPQxXxT4X/rryrY7RlP+nfJAA4xmHT7nNg+QfNKOK9O3wH6XF
         VfYAiUwjeHZ3oQ9Qc31kkzgfhuo+ZpBQ2KOD+l47ZmgWHCi0eEGYF0rZDEtnKLFz6on4
         JnL2skKTShs55+VaNlwYD9LaNfToRJevMtnbt6KH3bFlKd5pH1tKkm4nnYv5pkbrH8d3
         yvzy2W66fnAXrbhbO6omCc0zbgfNj6z0l/ygAbcg9EfqCutNpG8WFEaRCPGq8moRB64E
         2Y3a/zAY1PEpzkXKA6QwBffRgHe6AvBT0oSHJ8DjVnxya2FTzPAcpnJwd2aVn1oQkAmL
         UvvA==
X-Forwarded-Encrypted: i=1; AJvYcCWsq5rlUk46VIcXqcFxzTCeiSZtTCPGC20kbHHSjVckC88CCDS+cOG24AFSatIkQ8rljxZYmLKhlujnRw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcxF7vaPQ37Bg8I6Fg2jJ4YBVnPoH/3HDUjzjj8cv8STVtpbbG
	zYiRkAaGYqnLVrjzpA2lAitic2yNf2x7KGPKczdKx8gGdwrg7OiF
X-Gm-Gg: ASbGncskEMpLybbvEC8ElaGZv5KEjSHpKDqAyJvd4DYa5r3ea4u4N5d9gFuhA2S46rF
	VNltaqH0oAC+ISihGATqvOajYSJirpKEu7brd53ZTrxuCy5QKjo+Anf9A8gfoF2GbL7bMl9vjE6
	dNHyTuPB7XuMHGpT+lmxYBWWOOqSB5ZZzVs0NiMGnar5nM4KHSjKcBI/LpVOMqJvRlYEfqSI5+Z
	ORz+pTgBNu9jSBGB/5zKuzuIbOfZgdJWq6TZIw/cdMFyIFMZPmtCHgzeuZWfLSYFq25rq/POCsQ
	ReIe3MNaJqXY+dgmwoSsnUiQ1WKdrguZSIXMCKNmLH4=
X-Google-Smtp-Source: AGHT+IELmIj4TMdtO6F0JzBvp13pItF/CqH7DVKu4Caf20C2VuLCa8NuLXlr21iKRQntmJ/EV7Urrw==
X-Received: by 2002:a05:600c:3c82:b0:434:f623:9fe3 with SMTP id 5b1f17b1804b1-438913e024emr291117265e9.16.1737664053774;
        Thu, 23 Jan 2025 12:27:33 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd507e0csm2624815e9.20.2025.01.23.12.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 12:27:33 -0800 (PST)
Date: Thu, 23 Jan 2025 20:27:32 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Anastasia Belova <abelova@astralinux.ru>, Emilio =?UTF-8?B?TMOzcGV6?=
 <emilio@elopez.com.ar>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: Re: [PATCH] clk: sunxi: add explicit casting to prevent overflow
Message-ID: <20250123202732.5f7eb52b@pumpkin>
In-Reply-To: <20250123005556.57b2331d@minigeek.lan>
References: <20250120084719.63116-1-abelova@astralinux.ru>
	<20250122225805.2ba6a062@pumpkin>
	<20250123005556.57b2331d@minigeek.lan>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Jan 2025 00:55:56 +0000
Andre Przywara <andre.przywara@arm.com> wrote:

> On Wed, 22 Jan 2025 22:58:05 +0000
> David Laight <david.laight.linux@gmail.com> wrote:
> 
> Hi,
> 
> please note that this is all practically irrelevant:
> - PLL4 is PLL_PERIPH0, which is meant to be fixed to 960MHz. Linux
>   would not change this frequency.
> - the Allwinner A80 is both old and quite rare/obscure: the most
>   prominent board (Cubieboard4) was broken for a while and nobody
>   noticed
> - this "allwinner,sun9i-a80-pll4-clk" clock is not used by any DT
>   in the kernel, so it's effectively dead code
> 
> But just for sports:

Doesn't surprise me ...

> 
> > On Mon, 20 Jan 2025 11:47:16 +0300
> > Anastasia Belova <abelova@astralinux.ru> wrote:
> >   
> > > If n = 255, the result of multiplication of n and 24000000
> > > may not fit int type. Add explicit casting to prevent overflow.
> > > 
> > > Found by Linux Verification Center (linuxtesting.org) with SVACE.    
> > 
> > You need to read and understand the code before writing any patches.
> > The '>> p' and '/ (m + 1)' are both just conditional 'divide by 2'.
> > So can be done before the multiply.  
> 
> Well, normally you would try to multiply first, then divide, to avoid
> losing precision. In this case it's fine, since it's just dividing by 2
> or 4, and 24E6 is dividable by both, so no loss. But the formula in the
> data sheet is written as "24MHz*N/(Input_div+1)/(Output_div+1)", which
> matches the code (somewhat).

That PLL can generate all sorts of frequencies due to the multiply
and divide (as well as the shift).
The code was clearly sub-optimal for arbitrary frequencies :-)
 
> So I think it's indeed better to divide first here, to avoid using
> heavy library based 64-bit mul/div algorithms, just for this one corner
> case, but it would need a comment, to point to the problem and avoid
> people "fixing it back".
> 
> > Since req->rate is 'signed long' and the value is a frequency it is  
> 
> struct factors_request.rate is "unsigned long"
> 
> > only just possible that it exceeds 31 bits (and will be wrong on 32bit
> > builds - but sun-9 might be 64bit only?)  
> 
> The A80 has Cortex-A7 cores, so it's 32-bit only. The SoC can address
> more than 4GB, but that's not relevant here.

I couldn't decide whether the code was for 32bit or not.
Using 'long' is pretty dubious almost everywhere.
I'm sure it is a hangover from people worried about int being 16bit.
But that has never been true for linux (or pretty much any unix since
the early 1980s).

>  
> > In any case it would be sensible to force an unsigned divide.
> > So perhaps:
> > 	unsigned int n = DIV_ROUND_UP(req->rate, 6000000ul);
> > 	...
> > 	req->rate = ((24000000ul >> p) / (m + 1)) * n;  
> 
> Yeah, I don't think we need the "long" qualifier, but this looks like
> indeed the best solution, just with an added comment.

Maybe just mention it only need to generate 96MHz.

> And we probably
> want to change the type of "p" and "m" to u8 on the way, to match the
> struct and make them unsigned as well.

Make them unsigned, but not u8.
The u8 would get promoted to signed int before any arithmetic.

	David

> 
> Cheers,
> Andre
>  
> 
> > 
> > David
> >   
> > > 
> > > Fixes: 6424e0aeebc4 ("clk: sunxi: rewrite sun9i_a80_get_pll4_factors()")
> > > Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> > > ---
> > >  drivers/clk/sunxi/clk-sun9i-core.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/clk/sunxi/clk-sun9i-core.c b/drivers/clk/sunxi/clk-sun9i-core.c
> > > index d93c7a53c6c0..70fbd7390d96 100644
> > > --- a/drivers/clk/sunxi/clk-sun9i-core.c
> > > +++ b/drivers/clk/sunxi/clk-sun9i-core.c
> > > @@ -50,7 +50,7 @@ static void sun9i_a80_get_pll4_factors(struct factors_request *req)
> > >  	else if (n < 12)
> > >  		n = 12;
> > >  
> > > -	req->rate = ((24000000 * n) >> p) / (m + 1);
> > > +	req->rate = ((24000000ULL * n) >> p) / (m + 1);
> > >  	req->n = n;
> > >  	req->m = m;
> > >  	req->p = p;    
> > 
> >   
> 

