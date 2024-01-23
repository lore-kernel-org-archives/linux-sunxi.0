Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F138E811E7
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 17:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706031912; cv=none; b=RKFkHwoy20vV4TssUnej4j0Zr9JPh+jBFCrHPcK8fAfMrcMWm4rWnMlBjuGyj6KvMXJe64I05bl4d/kwfLKRuzvU8PVhOInkJqMeCQsbdYVrs5r2krC3+zOq0q0In45aVmXCsdYyrPAqgPhtbWH0JX/AXXZ1pI+YABScreahdXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706031912; c=relaxed/simple;
	bh=hiYpf5YTmy2SgRtEVXbmJOPkhwnjcJIUaFmiSYESsd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TxXAh1hIqyNZyECEPjSjszGYsgU1Kh3OSCFsEB6ea6tBiQSnLS6RsMKRSvAmhJh2AFe3M5GhghQsGO3eq5J1v3anBwd3oruv68BaDGJSa6fU8Hzu1JBLaNhYPQ1KXIhYu8zg4BMTyd7ncWpu5cWRLionRt0DI+2ipFOptcAuu7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g00yfUzl; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g00yfUzl"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33922b66bd7so3159519f8f.2
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 09:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706031909; x=1706636709; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4oyBrQ4+qtvNHd22bRaiLV27J7OcLKPIojk24G7ULU=;
        b=g00yfUzlvDMtgbV5njFvyf2udDFrDhBML0G0f1YfuM1n8i7ppCOZFpP0UtQj53QYff
         EG9ZERfCmi0wDgC29WmfnUwCGvzEECqwZXFGmPwj5GTv2mfs4/dHkAvfuPzzMDNHr1P5
         kiCqnaNeFVtrR8jXDolBAswwZm2qKH+A5ssE8HgrXx+lUzPYmAXg0bfg1k8th9hD8Vpy
         6nPWoFbstyTiJ1fiFLUPYMqUCrVZ0+JAcb+6wvvpm63IK13exfn9kQ3YQpeGoZjUBbTA
         gUrlKwx5rCmMRPEfKmLWPuTf2JXLGAyk9Xid6IwGzI6ph95jfbIApmKlL+kQOc+AkEgd
         wwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706031909; x=1706636709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4oyBrQ4+qtvNHd22bRaiLV27J7OcLKPIojk24G7ULU=;
        b=BSaKIoXaH4VXwiz0S16+2rlpnXpRyekefDC01Yzz8AcVjFKAh55DLqCYB2xsqZoY+8
         xjU972tudIl5XUv/79bbBea+ZxjIyVjS9a0KPPoPi2+vdCSXjEtnMUT4Yr2RIMMkxdBu
         uCZeTK19zBmbr1a86oC8hJKTpoIViEkcMwuZJTR1DvlaTuR10TuFFHM7RL8+k8dT8dvT
         vFbXGtWlsv4Pah1VA4LXPfGmLhNBEZq2PAtk+1UEVzqyfm4BwJFttLBfaQ6cpkpkI7Hv
         WldG1qaxaTkbqRXiKvfmtoGJLxMzFc03wvFHYwLtaUMfTYwVlTtYFgtM9fFZdtFKIZkX
         jH2g==
X-Gm-Message-State: AOJu0YxQAfiVj6+1t447UnXMGSi9cHEQZF/VN7CHhnJIK583+ISohVEj
	92L+chl3BsYtj0ApYByo/0YNVdBvpbmO8OlRFxBN5kCaH+Y/6s4f
X-Google-Smtp-Source: AGHT+IFvQq2aPOGlvF4JOsf/hb7L41ATp/rSHCn3ZpEvu3AEHPAoSdqMSCs8os0KHLA0EEadsR8H9A==
X-Received: by 2002:adf:e84c:0:b0:337:cdc1:daff with SMTP id d12-20020adfe84c000000b00337cdc1daffmr3997048wrn.71.1706031908892;
        Tue, 23 Jan 2024 09:45:08 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-14-70.dynamic.telemach.net. [86.58.14.70])
        by smtp.gmail.com with ESMTPSA id x8-20020adfdd88000000b003392ae3aee8sm9009835wrl.97.2024.01.23.09.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 09:45:08 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Erick Archer <erick.archer@gmx.com>
Cc: Erick Archer <erick.archer@gmx.com>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] crypto: sun8i-ce - Use kcalloc() instead of kzalloc()
Date: Tue, 23 Jan 2024 18:45:07 +0100
Message-ID: <1876185.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20240121153407.8348-1-erick.archer@gmx.com>
References: <20240121153407.8348-1-erick.archer@gmx.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 21. januar 2024 ob 16:34:07 CET je Erick Archer napisal(a):
> As noted in the "Deprecated Interfaces, Language Features, Attributes,
> and Conventions" documentation [1], size calculations (especially
> multiplication) should not be performed in memory allocator (or similar)
> function arguments due to the risk of them overflowing. This could lead
> to values wrapping around and a smaller allocation being made than the
> caller was expecting. Using those allocations could lead to linear
> overflows of heap memory and other misbehaviors.
> 
> So, use the purpose specific kcalloc() function instead of the argument
> size * count in the kzalloc() function.
> 
> Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/162
> Signed-off-by: Erick Archer <erick.archer@gmx.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej




