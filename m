Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1D04655A
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Dec 2023 17:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMf1EY8j"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40d3ae326f6so2596195e9.3
        for <linux-sunxi@lists.linux.dev>; Wed, 20 Dec 2023 09:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703091877; x=1703696677; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INk/MVNoQ2UUzk1dXHvibFqURoJv1a6zXTU0efZViEM=;
        b=iMf1EY8jR2gAF6YBjivrbHwi+7t6GPg3m0bxUTfMS7O8FJSVFqin6/KmA9i+tO+L9d
         IeUaDVztnsRUcFw4xYXlkrFFe3YEsOrWCEci4/z4cf7o+KkJswKLFP1v13foCqK0T8sf
         Y5o1owDLwv6bmkRuLLR1222RZ1zEytLiYJVJoG2tMdIgauc8WJpcOvNWOaxp70i/bhVp
         9xeOh66+yUOBsTgmlWJfl224KGqpizTtqvJf6eRnzzB/RlYU/MaQdY8rimj8tdx4XGO0
         PF1UwYUEXM9jQZ4rtB62Syo1jxRwB07oXHLGVEAuxWHfKaadORQamkRdJdnNoLpMP3NZ
         Pm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703091877; x=1703696677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INk/MVNoQ2UUzk1dXHvibFqURoJv1a6zXTU0efZViEM=;
        b=niOvEfq0FhKwpQqxUh+23nzontYt+gdI/D94YLGtH2Tsb2LqmrHGzCMjDJwV2cK6sR
         w3u+O7Tq9d39W30ZU7rWQLNKJQQ0jMoXtcOikkdK2QDU00RnrfnNUBNNExgDa/hvOEzW
         FqSQ8UD2Gczw6Z63Qu7oojYlXLKj7U49yRt9JaV/cb1RXKSvvMFQv52fBjDr/rqHNTsb
         YcPGuI5S37t85gfkjdFEsQ2+DraSYYWoVuBug0KHrWx1DEMUnFpLxjjJ349z50wzT2Rd
         LhNNYxxOOSjGoKhg/UH9+q3XY5SpVcZHlt5CJaAP10ACWRyaVVZ9CwqRZsTZZaynzpaX
         gJvg==
X-Gm-Message-State: AOJu0YxGVNoK9pPUGzAA/UHKYHnW1fajxv3JsFZkZlGt0ipaOQQc+8AL
	7Gwt+TixMeqXfx5e5O4bfds=
X-Google-Smtp-Source: AGHT+IHh6y/Y+b5+6bjmUDcz9Rc43dU9g/m+wQbExtDATUQ5/6ZmupKkVs8JknG1LfDY/thKOV7L8A==
X-Received: by 2002:a05:600c:5187:b0:40d:33cb:b577 with SMTP id fa7-20020a05600c518700b0040d33cbb577mr9913wmb.3.1703091877345;
        Wed, 20 Dec 2023 09:04:37 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id f12-20020a05600c154c00b0040d18ffbeeasm243399wmg.31.2023.12.20.09.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 09:04:32 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 =?utf-8?B?6bqm5YGl5bu6?= <maijianzhang@allwinnertech.com>
Subject: Re: [PATCH] gmac: sun8i: r40: add gmac tx_delay support
Date: Wed, 20 Dec 2023 18:04:28 +0100
Message-ID: <2370947.NG923GbCHz@jernej-laptop>
In-Reply-To: <ZYKvCQBD-SY9uVLF@debian.cyg>
References: <ZYKvCQBD-SY9uVLF@debian.cyg>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 20. december 2023 ob 10:08:25 CET je fuyao napisal(a):
> r40 can support tx_delay, so we add it.

I don't see how. User manual, 3.3.4.64. GMAC Clock Register talks only
about RX delay.

Best regards,
Jernej

> 
> Signed-off-by: fuyao <fuyao1697@cyg.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 137741b94122..fd07573afc9b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -127,6 +127,7 @@ static const struct emac_variant emac_variant_r40 = {
>  	.support_mii = true,
>  	.support_rgmii = true,
>  	.rx_delay_max = 7,
> +	.tx_delay_max = 7,
>  };
>  
>  static const struct emac_variant emac_variant_a64 = {
> 




