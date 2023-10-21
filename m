Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16F91398
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Oct 2023 05:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0ADSotq"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40838915cecso12123685e9.2
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Oct 2023 22:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697867878; x=1698472678; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DohAdnCPE7Dl8CS2BqMvYC3xrE3yx8UxdqmJ2PLDETI=;
        b=h0ADSotqZInZagYnFeg8CE5cCTVUcUC2K4CNIFokmSIk0T6ZOsPmUyvVY167kbWXXw
         kOwjGeWJHkPcNfI3RldJZLV/0piNY+DQR5aSglUlbZsxvFDyP7g/NFWsywgkSiYduIks
         s8amog2uuBS6p8LIjEuYlZuRzf2j1d9kRDVMiQnwPJeBD4xrDkBF1Djnj04R+hnDQ8DP
         S+SFosq3nTmHDhJJVGF6I/tu4edyKneIvVrJfxiwckKpv6btbh7Ff/8z0GMC20yCJqy/
         aK4wg6zxHnYTRt1Lg2Gefao9fV1r5yuyPC6b97Hm7zcBO4ix3DDY+TFOccFsb0gCOKuY
         bQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697867878; x=1698472678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DohAdnCPE7Dl8CS2BqMvYC3xrE3yx8UxdqmJ2PLDETI=;
        b=LxyxZfIhNZVrSl6VWyGV5k01FgeLuUGpqLSYaFNfXsMW5Kgq2+Lf8X/x8rKxM46qSh
         hTn5Mzez+9b0fIziBWZNiLX1WdnXdNrrttdEtIw/yON2dOshJXvo6QAJt3J8ki/GTAC+
         s407RYz+rUFww3ZcLLK/IG8DJom6MEgsDHD+mjhk+P272NCm/3vPUXCjgMo2GwBkQTcq
         4uVjopWp+MwTtq+YltLvVJfjOKPBd/lkAveKbEhfyHB/UQPs2pDVHOXRv0nByO3cK8VM
         OEUEk820rO1UB4Il2TuY02sPSQ/suOE7/IiVXpmePqvG4TdVi1ynVy9SnV2mPKG61E9y
         EPRA==
X-Gm-Message-State: AOJu0YxQaUghPEhtCVPLBYOGkNolUPEGv5MtO/R15EbCdF5BNbOjFkLe
	zst870N2LDCMdqamON7SB3w=
X-Google-Smtp-Source: AGHT+IGNXrYh15KtEafcEan635sgeuPrtA+YrmWrZFdgBxTMugRZsSTVqWFs0BOBhu9s3j27fbaDOw==
X-Received: by 2002:adf:e644:0:b0:32d:9755:374b with SMTP id b4-20020adfe644000000b0032d9755374bmr3309414wrn.30.1697867877575;
        Fri, 20 Oct 2023 22:57:57 -0700 (PDT)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id v3-20020adff683000000b0032d9523de65sm3005915wrp.48.2023.10.20.22.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 22:57:57 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Gunjan Gupta <viraniac@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH 4/4] sunxi: DRAM: H6: use proper MMIO accessors in
 mctl_set_addrmap()
Date: Sat, 21 Oct 2023 07:57:56 +0200
Message-ID: <3255032.aeNJFYEL58@archlinux>
In-Reply-To: <20231021011025.568-5-andre.przywara@arm.com>
References:
 <20231021011025.568-1-andre.przywara@arm.com>
 <20231021011025.568-5-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, October 21, 2023 3:10:25 AM CEST Andre Przywara wrote:
> For accessing MMIO registers, we must not rely on the compiler to
> realise every access to a struct which we made point to some MMIO base
> address. From a compiler's point of view, those writes could be
> considered pointless, since no code consumes them later on: the compiler
> would actually be free to optimise them away.
> 
> So we need at least the "volatile" attribute in the pointer declaration,
> but a better fix is of course to use the proper MMIO accessors (writel),
> as we do everywhere else.
> Since MMIO writes are already ordered within themselves (courtesy of the
> "device nGnRnE" memory attribures), and we don't do any DMA operation
> which would requrire synchronising with normal memory accesses, we can
> use the cheaper writel_relaxed() accessor, which have the additional
> advantange of saving one instruction, for each call.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Great catch! I wonder if this ever caused any issue.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm/mach-sunxi/dram_sun50i_h6.c | 69 ++++++++++++++++------------
>  1 file changed, 39 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/arm/mach-sunxi/dram_sun50i_h6.c
> b/arch/arm/mach-sunxi/dram_sun50i_h6.c index 8e959f4c600..89e855c1a7d
> 100644
> --- a/arch/arm/mach-sunxi/dram_sun50i_h6.c
> +++ b/arch/arm/mach-sunxi/dram_sun50i_h6.c
> @@ -192,77 +192,86 @@ static void mctl_set_addrmap(const struct dram_config
> *config)
> 
>  	/* Ranks */
>  	if (ranks == 2)
> -		mctl_ctl->addrmap[0] = rows + cols - 3;
> +		writel_relaxed(rows + cols - 3, &mctl_ctl->addrmap[0]);
>  	else
> -		mctl_ctl->addrmap[0] = 0x1F;
> +		writel_relaxed(0x1f, &mctl_ctl->addrmap[0]);
> 
>  	/* Banks, hardcoded to 8 banks now */
> -	mctl_ctl->addrmap[1] = (cols - 2) | (cols - 2) << 8 | (cols - 2) 
<< 16;
> +	writel_relaxed((cols - 2) | (cols - 2) << 8 | (cols - 2) << 16,
> +		       &mctl_ctl->addrmap[1]);
> 
>  	/* Columns */
> -	mctl_ctl->addrmap[2] = 0;
> +	writel_relaxed(0, &mctl_ctl->addrmap[2]);
>  	switch (cols) {
>  	case 7:
> -		mctl_ctl->addrmap[3] = 0x1F1F1F00;
> -		mctl_ctl->addrmap[4] = 0x1F1F;
> +		writel_relaxed(0x1f1f1f00, &mctl_ctl->addrmap[3]);
> +		writel_relaxed(0x1f1f, &mctl_ctl->addrmap[4]);
>  		break;
>  	case 8:
> -		mctl_ctl->addrmap[3] = 0x1F1F0000;
> -		mctl_ctl->addrmap[4] = 0x1F1F;
> +		writel_relaxed(0x1f1f0000, &mctl_ctl->addrmap[3]);
> +		writel_relaxed(0x1f1f, &mctl_ctl->addrmap[4]);
>  		break;
>  	case 9:
> -		mctl_ctl->addrmap[3] = 0x1F000000;
> -		mctl_ctl->addrmap[4] = 0x1F1F;
> +		writel_relaxed(0x1f000000, &mctl_ctl->addrmap[3]);
> +		writel_relaxed(0x1f1f, &mctl_ctl->addrmap[4]);
>  		break;
>  	case 10:
> -		mctl_ctl->addrmap[3] = 0;
> -		mctl_ctl->addrmap[4] = 0x1F1F;
> +		writel_relaxed(0, &mctl_ctl->addrmap[3]);
> +		writel_relaxed(0x1f1f, &mctl_ctl->addrmap[4]);
>  		break;
>  	case 11:
> -		mctl_ctl->addrmap[3] = 0;
> -		mctl_ctl->addrmap[4] = 0x1F00;
> +		writel_relaxed(0, &mctl_ctl->addrmap[3]);
> +		writel_relaxed(0x1f00, &mctl_ctl->addrmap[4]);
>  		break;
>  	case 12:
> -		mctl_ctl->addrmap[3] = 0;
> -		mctl_ctl->addrmap[4] = 0;
> +		writel_relaxed(0, &mctl_ctl->addrmap[3]);
> +		writel_relaxed(0, &mctl_ctl->addrmap[4]);
>  		break;
>  	default:
>  		panic("Unsupported DRAM configuration: column number 
invalid\n");
>  	}
> 
>  	/* Rows */
> -	mctl_ctl->addrmap[5] = (cols - 3) | ((cols - 3) << 8) | ((cols - 
3) << 16)
> | ((cols - 3) << 24); +	writel_relaxed((cols - 3) | ((cols - 3) << 8) |
> ((cols - 3) << 16) | ((cols - 3) << 24), +		       &mctl_ctl-
>addrmap[5]);
>  	switch (rows) {
>  	case 13:
> -		mctl_ctl->addrmap[6] = (cols - 3) | 0x0F0F0F00;
> -		mctl_ctl->addrmap[7] = 0x0F0F;
> +		writel_relaxed((cols - 3) | 0x0f0f0f00, &mctl_ctl-
>addrmap[6]);
> +		writel_relaxed(0x0f0f, &mctl_ctl->addrmap[7]);
>  		break;
>  	case 14:
> -		mctl_ctl->addrmap[6] = (cols - 3) | ((cols - 3) << 8) | 
0x0F0F0000;
> -		mctl_ctl->addrmap[7] = 0x0F0F;
> +		writel_relaxed((cols - 3) | ((cols - 3) << 8) | 
0x0f0f0000,
> +			       &mctl_ctl->addrmap[6]);
> +		writel_relaxed(0x0f0f, &mctl_ctl->addrmap[7]);
>  		break;
>  	case 15:
> -		mctl_ctl->addrmap[6] = (cols - 3) | ((cols - 3) << 8) | 
((cols - 3) <<
> 16) | 0x0F000000; -		mctl_ctl->addrmap[7] = 0x0F0F;
> +		writel_relaxed((cols - 3) | ((cols - 3) << 8) | ((cols - 
3) << 16) |
> 0x0f000000, +				&mctl_ctl-
>addrmap[6]);
> +		writel_relaxed(0x0f0f, &mctl_ctl->addrmap[7]);
>  		break;
>  	case 16:
> -		mctl_ctl->addrmap[6] = (cols - 3) | ((cols - 3) << 8) | 
((cols - 3) <<
> 16) | ((cols - 3) << 24); -		mctl_ctl->addrmap[7] = 0x0F0F;
> +		writel_relaxed((cols - 3) | ((cols - 3) << 8) | ((cols - 
3) << 16) |
> ((cols - 3) << 24), +			       &mctl_ctl-
>addrmap[6]);
> +		writel_relaxed(0x0f0f, &mctl_ctl->addrmap[7]);
>  		break;
>  	case 17:
> -		mctl_ctl->addrmap[6] = (cols - 3) | ((cols - 3) << 8) | 
((cols - 3) <<
> 16) | ((cols - 3) << 24); -		mctl_ctl->addrmap[7] = (cols - 3) | 
0x0F00;
> +		writel_relaxed((cols - 3) | ((cols - 3) << 8) | ((cols - 
3) << 16) |
> ((cols - 3) << 24), +			       &mctl_ctl-
>addrmap[6]);
> +		writel_relaxed((cols - 3) | 0x0f00, &mctl_ctl-
>addrmap[7]);
>  		break;
>  	case 18:
> -		mctl_ctl->addrmap[6] = (cols - 3) | ((cols - 3) << 8) | 
((cols - 3) <<
> 16) | ((cols - 3) << 24); -		mctl_ctl->addrmap[7] = (cols - 3) | 
((cols -
> 3) << 8);
> +		writel_relaxed((cols - 3) | ((cols - 3) << 8) | ((cols - 
3) << 16) |
> ((cols - 3) << 24), +			       &mctl_ctl-
>addrmap[6]);
> +		writel_relaxed((cols - 3) | ((cols - 3) << 8),
> +			       &mctl_ctl->addrmap[7]);
>  		break;
>  	default:
>  		panic("Unsupported DRAM configuration: row number 
invalid\n");
>  	}
> 
>  	/* Bank groups, DDR4 only */
> -	mctl_ctl->addrmap[8] = 0x3F3F;
> +	writel_relaxed(0x3f3f, &mctl_ctl->addrmap[8]);
> +	dsb();
>  }
> 
>  static void mctl_com_init(const struct dram_para *para,




