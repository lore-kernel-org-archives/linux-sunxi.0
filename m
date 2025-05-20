Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029BC25C829
	for <linux-sunxi@lists.linux.dev>; Tue, 20 May 2025 08:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747728690; cv=none; b=HUB7mmXFj/KG9uM2A7+Fazkj2YuoPTp8MQ5ZpVv13SSNa64gMN36Q7PWbYxeCk/nAKpd0nFmbrgq/ksnLrUBPZMvLav/kU22A+nRWZX94cjrfAzrP0XdSG8vTUaInGO/aw9YtRsNJNTFjCyvf+ySVi9QlZtZ2Jr5pdfiTeHT8r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747728690; c=relaxed/simple;
	bh=y5EmAe9o1zmGJZdkHBYv6dujAOOGfoyt38w5bFxu95I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWn0u90aqBErE+pfvVvjgvnNqvaQ1mZKOKVeUYSE20NYPlZDV2n5hCNbIaW2PQT9WAnsfJwzAbJ10dujfC33idKt/bBBboak4UKby8MGoDAzMtbtybGTZYmrawONm+SGBFcv7FOi1DtZNqQdmBR3Hl4LMevpjck78qWEAh0odis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iv8vLJJG; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iv8vLJJG"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso51836945e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 20 May 2025 01:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747728687; x=1748333487; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bMQS8LhbxO7fSprRTvxryhpgj+eGd6U/hKwb3rgYqas=;
        b=iv8vLJJGbR9h4eY6AlGQWS0gEs6ppHvWp8zVi9wXzPRC6hPNmmS18HsjLI1ExJX++P
         81xSbkP0hbRIgCLcZXQU6BlU9KYAkupMLG7yyOZE9KP9fYZ7c3pTG+ah9VlQtbjQnMRQ
         piW6gT5gGrJ0c69Nq6+iza6+rV8tC4kFSvQhfg5Nl10H8fZZCZwzVJNaXZgRqDWxB1GG
         SD2auptvQxpq+kgpRa+7gz2bkt/wFsYQeYVR/pTvcGhnw9LkjMBuP3y9MjNCR/UXr3z4
         j/mbkKs02greykvN3lbaXysji5MFTAdZy+b/oALJd7H4eVz6TBF8HbDM2iCmSi378VkO
         rjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747728687; x=1748333487;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bMQS8LhbxO7fSprRTvxryhpgj+eGd6U/hKwb3rgYqas=;
        b=IiY1hl2dys0GiIxxfi3GTUa6iXt8S5IxT2DPMqeDAZEdRcufZsQ1di90g9aNHu78t4
         OCyQx8xA1kZmC5HuPnQMy0CoBYVnVHAA8TskGXBz87ypvqD5gboc/o9JXoaoZ2x3GEDK
         VYqF+VYKzPqMnnmNq89D9FEomXI39gQz4XZYJSjCN0DcblDQ3U+To9Tfyi8OJViSAV6Y
         7poszjZk4FFk2ZvK3oANNOX7MwSgVpZNPiYDLkkIgCjcNyzKI8ESry5t303p1SgRQ1aB
         AucVtJnHPTmOIb23Ie3VoAblvgOKbhZ06uAVaojITIVC6SeeBq9i3F7ykjP9Ry8NxZ3U
         ZzOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjPpq4a1pRb31oFPN93x6zl6wJQuBFQg3l1KxYGAnvYyUW2VQ5b4PV7C5fx3S7/E3AWGi9SBNn67TMWw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxak37TZNJyF3FepsR3f7XpTZW1UAdSYPyVFohqZl3h2OgnbG1T
	1syMisqMpSKozT8dygc3qv/iz2X3e7pqTzoq0hXKCt6ydMg404HltKHQ
X-Gm-Gg: ASbGncsg6RT9m+X7XJKt3JeMLdexz7vBxqGPR/C8vFF4QGxTQzCfTnD4KX+1KwA9kZR
	dC6r7pHx0CIhmPlliorrxgXgFZJPFFtpS4bXMx5DGEBgdvbYtadiL6jzhOQ5TPmfz+YHHfpfY3I
	/CfQ1lJmYUssyXchlAtNo1IK7n6lcIr0hdg3Q4mNDBClfzPgQ896gYDqp7pnWPe01tEtA07s30s
	6HeyUZFT+Ja3BNaTSJhdHBj8LqZEKGEosUwDgTg2YPE7MvsczXgygNMLtR/kA8Ev7JwI9e+Rz28
	IhKUITzxfa2jOzKol42P3qunKGXH+SVufRFP5MxQkSRiSsbfMlHk
X-Google-Smtp-Source: AGHT+IHPt5mJFjG5oAuprYIeJnO/pC95ipGYDXia9QgdBEyS/izQKeoP0AicXPY7/tdYWNp50rrG9Q==
X-Received: by 2002:a05:6000:2510:b0:3a3:5c8b:5581 with SMTP id ffacd0b85a97d-3a35fe5c56bmr11561628f8f.4.1747728687040;
        Tue, 20 May 2025 01:11:27 -0700 (PDT)
Received: from Red ([2a01:cb1d:897:7800:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a3632a2bffsm13922363f8f.32.2025.05.20.01.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 01:11:26 -0700 (PDT)
Date: Tue, 20 May 2025 10:11:24 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] net: dwmac-sun8i: Use parsed internal PHY address
 instead of 1
Message-ID: <aCw5LAx1Nmfxk8Y4@Red>
References: <20250519164936.4172658-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250519164936.4172658-1-paulk@sys-base.io>

Le Mon, May 19, 2025 at 06:49:36PM +0200, Paul Kocialkowski a écrit :
> While the MDIO address of the internal PHY on Allwinner sun8i chips is
> generally 1, of_mdio_parse_addr is used to cleanly parse the address
> from the device-tree instead of hardcoding it.
> 
> A commit reworking the code ditched the parsed value and hardcoded the
> value 1 instead, which didn't really break anything but is more fragile
> and not future-proof.
> 
> Restore the initial behavior using the parsed address returned from the
> helper.
> 
> Fixes: 634db83b8265 ("net: stmmac: dwmac-sun8i: Handle integrated/external MDIOs")
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 85723a78793a..6c7e8655a7eb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -964,7 +964,7 @@ static int sun8i_dwmac_set_syscon(struct device *dev,
>  		/* of_mdio_parse_addr returns a valid (0 ~ 31) PHY
>  		 * address. No need to mask it again.
>  		 */
> -		reg |= 1 << H3_EPHY_ADDR_SHIFT;
> +		reg |= ret << H3_EPHY_ADDR_SHIFT;
>  	} else {
>  		/* For SoCs without internal PHY the PHY selection bit should be
>  		 * set to 0 (external PHY).
> -- 
> 2.49.0
> 

Acked-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Tested-on: sun50i-h6-orangepi-one-plus
Tested-on: sun8i-h3-orangepi-pc

Thanks
Regards
