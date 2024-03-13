Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D24460BA4
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Mar 2024 18:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710353981; cv=none; b=AwM4ieIFQeiA5kmk20yMkrIQcLvAAhhraehwItBnKm7JwP4Srd1cSzEOYZO69/+7sYMub+oCPG8LMyfGRJCUSZ8y6X7DKQOUaIte+CSRor3RYnLWahHFl8IO4mvOe+Sef8y/A0+IgchEXFNhDkjxdPNcGzoYV8EKR1hwj3MiCeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710353981; c=relaxed/simple;
	bh=sFEx9EamTD3MBPAzuFxki6UN7ViktTDSTCqur/C/nLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aI+1t4uCmTesovAX2UriG9DIJudYDJEOGsBBtoM2MnxbwiuHEFwl3+eNmrwF0bq6DsbYxrIxDsLoyValubIEykrtwfHzwzVDoPTanaujgbv+KOV42gF9JEy37Itdot1ikAreYXgjHHODV1pjRsB8/d881FWPFW30cIuKwmGNY7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtKZjT7X; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtKZjT7X"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-413e6a11280so1121275e9.1
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Mar 2024 11:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710353978; x=1710958778; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwM77+n02Bo5Xptc9aWDNDUBbm1WtjmR5t0ZnrE2toM=;
        b=AtKZjT7XZ2jbCbMfczBwyIfdJVjK25WiFVlWhSh23bABSRpMYPvuWEpB9VPhQXWhi1
         NhbiBfC6KbBt646PPLfG9yDz/1014DNURB8GsjbyuUQba7lpfEnIXw23IWGmERqTDJ5Y
         /UhZbuYoB+smxY8dy9RSk4At3CEn2iQI525jHYDsUAHGnBeZaFzv88bcQqSWZm8SrZvx
         6IlTNihSOmC1yR4MHSqxKtzkxYM3Q1EiU1sKVuEMe6F3NFOnN2Gw0mkE0+EHO7sLNLq6
         8IM00HQzCd0kj4VH/DlqbwJiI7MSDJnVOjeAtufJm0bZ3kQp78uwgobN8iUsakpt5wfh
         U/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710353978; x=1710958778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SwM77+n02Bo5Xptc9aWDNDUBbm1WtjmR5t0ZnrE2toM=;
        b=xGu0CP1XwdesRYhRvP5lSCwDLPQniEVrK+0wkmMpoAOCGi6Nq51pf4yogBDOLjsBM6
         sXAf5ESpLxVzYrb6rWfXTa37Hzd8otMvNQtNG+I88LoSjh+RFGw/AnN+N9A+RdpDLrlB
         Wr/Wwa2sXH9HrKU1iE3XUtkocm5/IVWkhQX/9Qz/oqskjOrg7kFn23ku5f+3DLud9djY
         bIxkU9EklE/6YmecTg5fw+O5uctAw52t53A1AmDE6amw9wrRQHsFdPJgeLs55WBsbaa7
         /HsP3r2ytehd7yz8ugIu5mxsiEbfrAawvaC7ZfBpjOxUaFOS+pABLBkqEXzPPXkxFNQx
         6bww==
X-Forwarded-Encrypted: i=1; AJvYcCUssvZ1Wg98msr3liw936ToSJhGOziYaBtDR3Or+zYJxMDo4KK3ploEbD0/A3FKRdr9eZITLJsM5ZeDm9K69Pvmp0Qq53Ag4MfQwHg=
X-Gm-Message-State: AOJu0Yxa6KcNbUBgPhstGp3vY2sVKi1jLCVA6hxhoG5ocn5eUbFoaouA
	O4KP/tMct2rmtlFrYkpRRLWWEDAr7Y605uNSxjQHj6oY0nv4PJ0f
X-Google-Smtp-Source: AGHT+IFlvx5P3FvCMw0RLTEExCoJ3AlezUzg/TACD26EKiNO9ZAOgIth5qkO0ze33vBplTbp7wq6XQ==
X-Received: by 2002:a05:600c:45c8:b0:413:3890:25f4 with SMTP id s8-20020a05600c45c800b00413389025f4mr539775wmo.36.1710353977808;
        Wed, 13 Mar 2024 11:19:37 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id q6-20020a05600c46c600b004132aa2f857sm3034508wmo.17.2024.03.13.11.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 11:19:37 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Oltmanns <frank@oltmanns.dev>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Frank Oltmanns <frank@oltmanns.dev>, Erico Nunes <nunes.erico@gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: allwinner: a64: Run GPU at 432 MHz
Date: Wed, 13 Mar 2024 19:19:35 +0100
Message-ID: <1978377.usQuhbGJ8B@jernej-laptop>
In-Reply-To: <20240310-pinephone-pll-fixes-v4-5-46fc80c83637@oltmanns.dev>
References:
 <20240310-pinephone-pll-fixes-v4-0-46fc80c83637@oltmanns.dev>
 <20240310-pinephone-pll-fixes-v4-5-46fc80c83637@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 10. marec 2024 ob 14:21:15 CET je Frank Oltmanns napisal(a):
> The Allwinner A64's GPU has currently three operating points. However,
> the BSP runs the GPU fixed at 432 MHz. In addition, at least one of the
> devices using that SoC - the pinephone - shows unstabilities (see link)
> that can be circumvented by running the GPU at a fixed rate.
> 
> Therefore, remove the other two operating points from the GPU OPP table,
> so that the GPU runs at a fixed rate of 432 MHz.
> 
> Link: https://gitlab.com/postmarketOS/pmaports/-/issues/805
> Acked-by: Erico Nunes <nunes.erico@gmail.com>
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 57ac18738c99..c810380aab6d 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -107,14 +107,6 @@ de: display-engine {
>  	gpu_opp_table: opp-table-gpu {
>  		compatible = "operating-points-v2";
>  
> -		opp-120000000 {
> -			opp-hz = /bits/ 64 <120000000>;
> -		};
> -
> -		opp-312000000 {
> -			opp-hz = /bits/ 64 <312000000>;
> -		};
> -
>  		opp-432000000 {
>  			opp-hz = /bits/ 64 <432000000>;
>  		};
> 
> 




