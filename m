Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B4F152DF3
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Mar 2024 20:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711573029; cv=none; b=olcRjz16+KPCeeLmNcLmKTNW6Qed1PnnaKsauoEUIRzAm+QasKISQC1cq47pN/ynLNRlub8f3bNk59TiVmWSLcZqROvv7uRIfhjh6njitnaswBxAfLmE5gQU/iFraLI9yN2W74d4VVYwRTwk+gfLMnjMuBykwEthI/Q92SgWtSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711573029; c=relaxed/simple;
	bh=ASykyg23JcxT/XGhYWgv+/4msMSXbAY7lg2eIAUlMbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lmRQc1KvsxJAldcrow+AMkISKiVsAvjx5EsDiIt4+WmVDu8WuBAemgiznUNCXXpkauESZRLZXa5nF7hkHJjrv3yDkV/CPycxWZw4EZgWM8BQjaPOgLRYV0AzGHR7th7Q3yW4gr9JkWsiWbfdWXKN7TMx/R+7/vcL564W8ojOvI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPM0/xZm; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPM0/xZm"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a4a3a5e47baso31451266b.2
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Mar 2024 13:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711573026; x=1712177826; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLxG9EcnVkh0DSQcXX7ogAec3EJe03+5XzYJOhrYVn4=;
        b=iPM0/xZmpOqjPxsrKMB++r/5klf5Utcd6Jh7H0mFCGIfT4jTxMJEx9L+rzWF+JflxF
         AQDYXMpNQRY1uO6HMDZwPP3qnJ/P47iJN2xjhwM3Vbx4bC75VvtcOqOGB+xjb/go/qkg
         vCRjIpdaBBQeWaar8gRYJpo7ACd14GPeKKBqSoldv8Ou1G2nJPYsA/GCkJcUw61twwff
         WsB2YMdszT9UF6WEALsA4FTHocI1+JWcZ5CF+veaefwLHU3JZIeccqWwsh+/bEe9GUiX
         IvDqpBB+s7DTkakymdIU8ftDCbzGFtji6V3dl0PAKk6kctuwTXtAehGelQoRBF5AYyY8
         bCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711573026; x=1712177826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLxG9EcnVkh0DSQcXX7ogAec3EJe03+5XzYJOhrYVn4=;
        b=RYI17GLtpFrD8c7Nx3URU6Q4niPrGEA6Eua7MO1YiS9MPyu3FEsHpbHYiLwtyyff7D
         iqFNpuCaGAGCf92hqQJwVWmBJSNMy4MUOWlGxjBaOTzcUlhqlCcuBN/TMCP1KccvHN0W
         cW84nGbxkSledavBkEKWOl6PD/ofMOn2jNHvCjMqvw/jyNGuC5R5Z44/KqBOIcR6oFdf
         3tmckMbE3BSlXY4Rqj5vcLTVpJY9vnWFIGr+9aM3eP5uWHBDhH3rxVjo1Pbadf3rARfB
         gItVf3Vqgk7UI/jma9oWYEfS02r2KwAjMTrlgj1gIbjCjdx6OWXBh71eld4lQoc/zS1Y
         Yo7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6pqMWUgZ/a42+9jnXIY9qD9yOaxwRrOlx2u7TRNafKHfh7zHlBgoKMvQHGn5uAXK3sdISAwmpWmfFty7ymDi2BNODs04b+bNyaFc=
X-Gm-Message-State: AOJu0YxPX71gUBMsCz3GLv8gtWNAI0yakx5m55CEihNIP8TnHgJXUZ4R
	CR5Mmk/GlbYQrQPMMt2Osn792YukuesHuqjeXQeawUgq91SSAPyu
X-Google-Smtp-Source: AGHT+IEgamyfp26jk5puLJyAWoiz0SiekS9aAN+NI95EWS6Ohw6UAKgRKR/78XIAsNl9tlEJTNqMsg==
X-Received: by 2002:a17:906:c4c:b0:a4d:f7ca:1856 with SMTP id t12-20020a1709060c4c00b00a4df7ca1856mr381084ejf.61.1711573026016;
        Wed, 27 Mar 2024 13:57:06 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id hg11-20020a1709072ccb00b00a4e03823107sm1231928ejc.210.2024.03.27.13.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:57:05 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>,
 Martin Botka <martin.botka@somainline.org>,
 Martin Botka <martin.botka1@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>, Ryan Walklin <ryan@testtoast.com>
Subject:
 Re: [PATCH v3 2/8] cpufreq: dt-platdev: Blocklist Allwinner H616/618 SoCs
Date: Wed, 27 Mar 2024 21:57:04 +0100
Message-ID: <4334338.ejJDZkT8p0@jernej-laptop>
In-Reply-To: <20240326114743.712167-3-andre.przywara@arm.com>
References:
 <20240326114743.712167-1-andre.przywara@arm.com>
 <20240326114743.712167-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne torek, 26. marec 2024 ob 12:47:37 CET je Andre Przywara napisal(a):
> From: Martin Botka <martin.botka@somainline.org>
> 
> The AllWinner H616 SoC will use the (extended) H6 OPP driver, so add
> them to the cpufreq-dt blocklist, to not create the device twice.
> This also affects the closely related sibling SoCs H618 and H700.
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index b993a498084bc..86d8baa816795 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -104,6 +104,9 @@ static const struct of_device_id allowlist[] __initconst = {
>   */
>  static const struct of_device_id blocklist[] __initconst = {
>  	{ .compatible = "allwinner,sun50i-h6", },
> +	{ .compatible = "allwinner,sun50i-h616", },
> +	{ .compatible = "allwinner,sun50i-h618", },
> +	{ .compatible = "allwinner,sun50i-h700", },
>  
>  	{ .compatible = "apple,arm-platform", },
>  
> 




