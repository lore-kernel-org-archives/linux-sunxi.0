Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E6F263F52
	for <linux-sunxi@lists.linux.dev>; Tue, 20 May 2025 08:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747729497; cv=none; b=RkHqa7shKCZq6YHCmlAV43hfwG9p2+oNDHal0YdcEib6P/v7fWY9exZRUjmPHi3RKgyhFGqBOd1kp5+HRAfdDJs0VVjdAY52nCED9SCw0gr3lol48XkwDN1quRz7fCBLKxQftBVpmxpHCEqCt8Jm9JqKcJPDHb+FiCJFdKbT+t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747729497; c=relaxed/simple;
	bh=T/BPs7AVr5XnkfJdKRAT/wF0DytkqWa/g+g70eIDPuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYic9lHQKj8mOJOzcZWqxugj6UGZtBR+blp9xSBStf3Ao87tinFqJJcgyaVaejv8pQcQRk40eEnT3SHQZS3l4MeVTSEEhtxi/SKP2csTBq3Gnkw8steCgh5y0YkInG/L5qpFK/q8/Izry6WsK+tdOpPDDgiKj4oy638Boi9sEQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvKo7m0i; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvKo7m0i"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-441c99459e9so33868205e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 20 May 2025 01:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747729492; x=1748334292; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pBe9HFmfYkZA0vZ9epGzGQwP62XWv9bdcLFLfgUYqN4=;
        b=jvKo7m0iU/ggPCX9UJp4RQop93L4O14BJpFP7YgbPTZr4YW7s1aI4yIvI6z4BQizbg
         GIKTv9SiW2Y+YM8Cg2wlvmVy8Axt6iGy+7ANxJO3Y8MYNaasA9OBf+0P16SS0AVh3COE
         3n7fevO46PBHTwJwvf0k29DnaE5IDV4Jn2OSZUsEq7x+zY9kBiw/vl7qLccTdtNLLz9Q
         YKF4sf9E4n551WTrsGt0FULp9BlcgJsauBeneIbSQcQFxFKUogAzpm5JGVTgJ35ApqeJ
         7dwRB2BoGhjNKdOS4uq37WkvUdSCe40w2Kfa4e9+aUJmTNKB1g+lkWDZrFe6VfrBjXuM
         k74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747729492; x=1748334292;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBe9HFmfYkZA0vZ9epGzGQwP62XWv9bdcLFLfgUYqN4=;
        b=iZ1N6MfHPLhWSYNJXyVhxHJLPvKXsD5QOax9kyMsc5ivwuJ4vhFCFDxXdE6L6+hREB
         p2gps2YxSraCllIE04KmwfNaMD8uoAr1BaW27S6pNy7ODGcd9wPU6gzvjqj/6iDWMs8I
         prd5PwQUEiocvgP/c/CiGaYt9wkSEziW/eC+33/yHuTGbcmQ5VZfjQMOM11nrxlKfwQE
         5Sys9lO5OKmqkb9zN6ruLA5i9vY999N088Slbc3CPS4b2s1qyVaXGjUohuexeN9OvmNN
         qdq1bB6FI7kvi7DeiRp2VvxixVLYKtJ3rTC3GR5tJJVG9lGL/wpQhHdlWqNnGzXVwBsr
         uzWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnruyKgVo1zzZniyhfWCXY6vlp2JczYcwz+qmHyq37T7kG2FviBOKZD7n9SogluQTyqCYXe9/vRz/14g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy36YX6MbX1B5vbm2gv1GgOKQAlG+l8SgnBi3fUPiFI2ojCledy
	HfVQI9krKoCcc9ouPJMChpuMHPPCsI6zGabU8l3cUD44yZCCXZSl28o5
X-Gm-Gg: ASbGnctwQhKKcj69MNQMYecN30o3M1o743he2fwL3KU/ThPkc32mws9LmpbPDzeD1po
	bqjo/g67yvim6sbT+FOw2f9/5l7uIHayZSfOGIDVTzVvu2BC4sZNjjIHMrupnXEVze+r55/ce0E
	qoDKYQ9XtOxTCC/GdSB2TodhqOQLly7ZLfqKD0RbMmrr4LbG9pYHmMMCN7MHq4HFkGGKPRFZ9MW
	AAS2KP6Rp7w7gZdTMiYU9byIo50bHXPhj3ZugqlcL3TlIiFSsDclQyHpFuVxP391DcoWzvQQCxe
	rbIJMHhyrcENoz7lxBV2SE09tVpL8rlTaITfLOdCZNWby5lX2nRZ
X-Google-Smtp-Source: AGHT+IFiq7yNzRMHYgxf8Y2AvL/vFL+N/JR75NfHsu+y2i1yEiKH/7J56FYwi2SZ/j61+N05P1IBwQ==
X-Received: by 2002:a05:600c:8597:b0:445:cd3:fa00 with SMTP id 5b1f17b1804b1-4450cd3faafmr73300515e9.4.1747729492130;
        Tue, 20 May 2025 01:24:52 -0700 (PDT)
Received: from Red ([2a01:cb1d:897:7800:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-447f74cce5bsm20578415e9.24.2025.05.20.01.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 01:24:51 -0700 (PDT)
Date: Tue, 20 May 2025 10:24:49 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] crypto: sun8i-ce - fix nents passed to dma_unmap_sg()
Message-ID: <aCw8UVORVj7GFc22@Red>
References: <20250519151350.3442981-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250519151350.3442981-1-ovidiu.panait.oss@gmail.com>

Le Mon, May 19, 2025 at 06:13:48PM +0300, Ovidiu Panait a écrit :
> In sun8i_ce_cipher_unprepare(), dma_unmap_sg() is incorrectly called with
> the number of entries returned by dma_map_sg(), rather than using the
> original number of entries passed when mapping the scatterlist.
> 
> To fix this, stash the original number of entries passed to dma_map_sg()
> in the request context.
> 
> Fixes: 0605fa0f7826 ("crypto: sun8i-ce - split into prepare/run/unprepare")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Hello

All patches are:
Acked-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>

Thanks
Regards
