Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F191CAA78
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jan 2025 22:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737586691; cv=none; b=Rs7s4rRugOWEBKVMGjOdn4N9kW5GH9IJ8FQaF83mNzXcHBEFE9GETcVsuoVj/CsxbVzFIRGMh8QoZzUyYnbFoxuXxtDS5wXv384t3WH+5uLiYE2n4mymDD5i2IHXRoRBfyIoYAAzXrUyVVJ+v9881CpOfdbJrwlc/TrRH1OwUJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737586691; c=relaxed/simple;
	bh=XnI1poJQc8O5qaUJnfVt25oXI1SQjL+/Lx12G7Eytt8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kzeUYhtn38S0/3NlIcV1diA0Ly1rUtaaha+tMs2IvRPeNfVRyg9DBwHqxMN9YRE4QZzTksT8g4CLXh8CljmQTHyWMav6cleYqyDelpnNEQSzl/DpVeiwL/8IXOALSQO7trFd4N6n/77OAaUfq7WmqKp7L5oiSTJuT7SZOfaQ7So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GsDXo1mX; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GsDXo1mX"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43624b2d453so2797965e9.2
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jan 2025 14:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737586687; x=1738191487; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqVF0cBTijRuq0m7GTGEM8FFP9eJBtgNqw9jRV9T5lo=;
        b=GsDXo1mXvfcGGpT2fcRmR87QL9cw6e4hf9q0lcHNqJxGbZ6abam779XgS2paExbrcf
         VvVgJNStM9DEsAEACSPaKyD8eCfpnAgAb3DrBlE5J7uuxMe077I97j22cFa9HEo5NyEK
         9MS8uHsRpHiDwYn3eNFXR7A69ayW1ji1xgQ3hu7ZzU6huBa0e+6wyj9HvmOuAPyGBgbv
         j32dj0C++xlFBc3wL/PvjWkJ5TCA6Hz+R9fsOl6xjZ9opSYOuRNKZt2bv7RnBQaSS82a
         jXrTOckhiNxZsOXvoKooFk745ym77Yv0Kgz8ascezWjm8C6CzmFDjlNi9WHiuB8niV6C
         9gTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737586687; x=1738191487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqVF0cBTijRuq0m7GTGEM8FFP9eJBtgNqw9jRV9T5lo=;
        b=C6CzWcdfE1q6bivIpUZq9KKDuy4POB69zNZBiNLtelVAXj+vPp+Z3FXmhZIHijkSqG
         yr35OOpd1Zf5op3i7XySAyLCIM272kdhs2GsCzn6+WIB6NncQJZz7hbIdvnXOJUP4wDM
         XQhNq1HaLRe7Wd7xkUTXMg66dwVBen//KgsKhTKQdad+vI2AW3qIOfBGbWaXs48BLAi9
         nBvos178TCCian6L/2Bc8skclFl3w8PE+G0ppoh/3iluXqIfb/jtr4yDGqgX4YCcSbGb
         vml/6HfuwWJ0YxaAOxmWHwUrCuYn7wdEpSQcjq+vkI6IPc/9BnzRJvHFiJwC84sVueJ3
         qaQw==
X-Forwarded-Encrypted: i=1; AJvYcCXIQhOOpz4EYLaANz0X+RzqOLH1ADZpw0EKMeBOR0dZKm6Pkdd5VX/hZkZfykaMf9ShAZlCsiQFzBN/tQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwVtt9+yLvEmgMFbcbAqVBCh774cSg8G4hSN2mUDUNQ2s1/n0Df
	22q8oyEtV53sxaZVcZJr8xCHPQZY5xvMli+3SqmNqaeIiqYY5CZe
X-Gm-Gg: ASbGncuaDORYGTCmSFBNjsq3sgF+xhfCiPjzxS4o2VYvKgStZngQ2UzUKagqRoy7OqY
	zJhMhaL7Moz2lsXOd1tTTRdZ4oWeEnO/L/fp98Fo59GtocN7jOdDxKe3iYy5GvyxGf13iJgWWw1
	n9PRVMcW2/HcQ6Kq5vS/0/enfEOmEnBOUnejmsA6pOqqo3eto9pLxf4r2RDvYpZ5V05laLgvMMS
	gew3TqWNdn7nstAv/cj0ZV3QlkdHuygd0JHe2DuBFYof8mC77O1zNaYjBm+4zZ6GjcLX9Wrtobc
	+huZreHMDPlRSMy/VsLPgSsuqXz65oIr
X-Google-Smtp-Source: AGHT+IEQnQhWcYcYLwtPUsp3QOoc70eLrq7vJCaIVuPYRH/ywGliFi/4zTlOAPB9XOacsMLy93f4rg==
X-Received: by 2002:a05:6000:1f88:b0:385:fd31:ca23 with SMTP id ffacd0b85a97d-38bf57a7797mr24374385f8f.40.1737586687462;
        Wed, 22 Jan 2025 14:58:07 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31df412sm40115765e9.36.2025.01.22.14.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 14:58:06 -0800 (PST)
Date: Wed, 22 Jan 2025 22:58:05 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Anastasia Belova <abelova@astralinux.ru>
Cc: Emilio =?UTF-8?B?TMOzcGV6?= <emilio@elopez.com.ar>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Hans de Goede <hdegoede@redhat.com>, Maxime Ripard
 <mripard@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] clk: sunxi: add explicit casting to prevent overflow
Message-ID: <20250122225805.2ba6a062@pumpkin>
In-Reply-To: <20250120084719.63116-1-abelova@astralinux.ru>
References: <20250120084719.63116-1-abelova@astralinux.ru>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Jan 2025 11:47:16 +0300
Anastasia Belova <abelova@astralinux.ru> wrote:

> If n = 255, the result of multiplication of n and 24000000
> may not fit int type. Add explicit casting to prevent overflow.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.

You need to read and understand the code before writing any patches.
The '>> p' and '/ (m + 1)' are both just conditional 'divide by 2'.
So can be done before the multiply.
Since req->rate is 'signed long' and the value is a frequency it is
only just possible that it exceeds 31 bits (and will be wrong on 32bit
builds - but sun-9 might be 64bit only?)

In any case it would be sensible to force an unsigned divide.
So perhaps:
	unsigned int n = DIV_ROUND_UP(req->rate, 6000000ul);
	...
	req->rate = ((24000000ul >> p) / (m + 1)) * n;

David

> 
> Fixes: 6424e0aeebc4 ("clk: sunxi: rewrite sun9i_a80_get_pll4_factors()")
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> ---
>  drivers/clk/sunxi/clk-sun9i-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi/clk-sun9i-core.c b/drivers/clk/sunxi/clk-sun9i-core.c
> index d93c7a53c6c0..70fbd7390d96 100644
> --- a/drivers/clk/sunxi/clk-sun9i-core.c
> +++ b/drivers/clk/sunxi/clk-sun9i-core.c
> @@ -50,7 +50,7 @@ static void sun9i_a80_get_pll4_factors(struct factors_request *req)
>  	else if (n < 12)
>  		n = 12;
>  
> -	req->rate = ((24000000 * n) >> p) / (m + 1);
> +	req->rate = ((24000000ULL * n) >> p) / (m + 1);
>  	req->n = n;
>  	req->m = m;
>  	req->p = p;

