Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DA725D202
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Mar 2025 16:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742919231; cv=none; b=VsXlsdo2BdvKAIfrgYar8NQeJbGkYQ6uXYe6xAginj0ePBJxpQxS+vowwwqKmwEf7ez/m529lAdoA0fYHx/qEPbMBiMn7ngajZLSS3MhPuaCUqJRiDuiZFmTnx1xKXt3jVHizMFBo/LXSZZnAqTKD3hVNrYy41G9DDsFv/AprS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742919231; c=relaxed/simple;
	bh=vhrkcD3f3RIlLuxv+zeNMHCAis6FPlc8Wt9nqKbBW9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HQSea2Imj7ts7IUi+zi4QDNcOMotDPT5fE8HmvSEaOkITMKBC+2jXlq/C/EA+FvjTsUzUUD79NValpg9mybPSIUU0y5GleeAhARFsekHBZcBRqiY0W6NlRKm27LgPy3ds4T3y1tN5fICum8N19HNa1O/1b02Mnj+1Tt1vP1U+ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFMhJoyx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFMhJoyx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43690d4605dso41568275e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Mar 2025 09:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742919228; x=1743524028; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/TYpWG8Tu95bi+rSvHSLhGf06sfL2qUKyVTKktd0ZM=;
        b=QFMhJoyxQ06yqFgzVptxOB+q2TouMjCpM1BK2ozw84eD5YYhW1s+aUYIhmNsbqLkZ8
         s3lolzXDf4366Y4DfI0fRm7YDLR9FXnNg21+EALrbutol8r9aNxjiXQdsCgD1R60hRVG
         YDbkkMdIxZ3RhHFyPfFTm5bqIZQfpZ/K27C6fyUaeIc31SubJmiykOy+6Tr/51idr+vC
         m3S+4kZX9egBYIcLPXijTKmoy0EjnGRxdspNOgrVD8ZeWwserjzTX6Gl4IUkjLTNGceQ
         sd1jeNfOLnJRGedQbeEti1InWR9OaUztlSrYPQuvWdflu2NMySVYfAbujIew1O2Mxft2
         3yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742919228; x=1743524028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/TYpWG8Tu95bi+rSvHSLhGf06sfL2qUKyVTKktd0ZM=;
        b=uWG8seSBaQxVkEHJJ+s67kWA2KE7UnCC03evB/jVDjsWNb4BmRdgGWyIsVLWDm+QzQ
         K6gEWsJKrvovd7He5AXqgYi/wFH6YEX6vf35x78TZTjOJOfXGCZ3P8z1KM90xpKqBsfJ
         xD0lUHgsC5atMiYhKLlYckuP4aYkEXt1DZCKaaOgnffiG6X4UojNArwh/uBCEi/5+bQE
         dfFk8uBe7pmIzH1x9JFgw5AFzek9iBheBgMSH19x3VuF80hB36lGDeMcrfvUSHY6tesn
         +aLxGRUqwJ9Wy2iYWTqll+X3Oh2A4IDFK6nmvXBGyY5G/8qNVCI1oHafAFlE19Mi/R7e
         ZzlA==
X-Forwarded-Encrypted: i=1; AJvYcCXPO09rinHKAVdAiYuXqmvREFMmWRIdSaaAWiJIFoHdYFr3tsx8c0bxb4NRFEHUBrA736y/TFLomTuUPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOJjvhzC0eo1ee9XtRU0Uw9Bryy0AzLViiMmSImDBm5TT1rPvf
	gbhGtpNt6PxPk4Evzx1kCz3/Lv4XhXVTUeiGOA1IStlJPHDs3Git
X-Gm-Gg: ASbGncuwXYDqA8XaRYRxZ0rBeZ6EahMdAR7OauP0eTGwMHomqp3s8LiVw4H7lwSDwce
	Joj27flBDfpruNoEOXNvIN/t2lPGPqgkAqtn+kBNcSPRFAz0u2TuCTOo8OYrEC2fTVqc2b8LAva
	6V4pxDIulqE05MvO3bihwvvLRGluOEXMp1XhhyAmcuT7LCfvKPzmpty+v9JN5OKTqarRiTz4D1c
	03raDmbVIiHixaSjf8mMLQc/rP3suWawFjXudnre7DCRFD7G/frMw2t1FtH+5EsmcIj7C7Zhki6
	95mhRe4M8J2vlcZYWuitvbK7SArzmZW5ognfWRcUKxOFzsVsJvAB8/qN/zTDG7TIwEDgAn6dz7U
	skh4FIQB3LCPAZ1qQAQK5tvVCR/I5klw=
X-Google-Smtp-Source: AGHT+IE5K5+KWhyMqNd/oWylDaIWUAKFAV+sWpCvLcUBmvZaXCmZvQtYds//Ndv9HXrwn1/j5n9rSQ==
X-Received: by 2002:a5d:5f92:0:b0:391:4389:f363 with SMTP id ffacd0b85a97d-3997f91bc76mr14013562f8f.21.1742919227412;
        Tue, 25 Mar 2025 09:13:47 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbd1c7sm157742995e9.40.2025.03.25.09.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 09:13:47 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Peng Fan <peng.fan@nxp.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Tom Rini <trini@konsulko.com>, Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: FIXUP! sunxi: mmc: Improve reset procedure
Date: Tue, 25 Mar 2025 17:13:46 +0100
Message-ID: <2772552.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20250325142737.1702796-1-andre.przywara@arm.com>
References:
 <20250325133953.1dab37c8@donnerap.manchester.arm.com>
 <20250325142737.1702796-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 25. marec 2025 ob 15:27:37 Srednjeevropski standardni =C4=8Das j=
e Andre Przywara napisal(a):
> Hi Jernej,
>=20
> what do you think about this solution the A10 compilation problem?
> That looks like a simple change, somewhat half of the way to the proper
> solution.
> If you agree, I'd squash that into your patch, then push it for U-Boot
> next.

Sure, I'm all for it.  Sorry for missing this, it seems so obvious now.

Best regards,
Jernej

>=20
> Cheers,
> Andre
>=20
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/mmc/sunxi_mmc.c | 10 +++++-----
>  drivers/mmc/sunxi_mmc.h |  4 ++++
>  2 files changed, 9 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
> index 31dbfb10c59..951e6acd34d 100644
> --- a/drivers/mmc/sunxi_mmc.c
> +++ b/drivers/mmc/sunxi_mmc.c
> @@ -449,23 +449,23 @@ out:
>  	return error;
>  }
> =20
> -static void sunxi_mmc_reset(struct sunxi_mmc *regs)
> +static void sunxi_mmc_reset(void *regs)
>  {
>  	/* Reset controller */
> -	writel(SUNXI_MMC_GCTRL_RESET, &regs->gctrl);
> +	writel(SUNXI_MMC_GCTRL_RESET, regs + SUNXI_MMC_GCTRL);
>  	udelay(1000);
> =20
>  	if (IS_ENABLED(CONFIG_SUN50I_GEN_H6) || IS_ENABLED(CONFIG_SUNXI_GEN_NCA=
T2)) {
>  		/* Reset card */
> -		writel(SUNXI_MMC_HWRST_ASSERT, &regs->hwrst);
> +		writel(SUNXI_MMC_HWRST_ASSERT, regs + SUNXI_MMC_HWRST);
>  		udelay(10);
> -		writel(SUNXI_MMC_HWRST_DEASSERT, &regs->hwrst);
> +		writel(SUNXI_MMC_HWRST_DEASSERT, regs + SUNXI_MMC_HWRST);
>  		udelay(300);
> =20
>  		/* Setup FIFO R/W threshold. Needed on H616. */
>  		writel(SUNXI_MMC_THLDC_READ_THLD(512) |
>  		       SUNXI_MMC_THLDC_WRITE_EN |
> -		       SUNXI_MMC_THLDC_READ_EN, &regs->thldc);
> +		       SUNXI_MMC_THLDC_READ_EN, regs + SUNXI_MMC_THLDC);
>  	}
>  }
> =20
> diff --git a/drivers/mmc/sunxi_mmc.h b/drivers/mmc/sunxi_mmc.h
> index 9d55904c213..bc313dcabe0 100644
> --- a/drivers/mmc/sunxi_mmc.h
> +++ b/drivers/mmc/sunxi_mmc.h
> @@ -12,6 +12,10 @@
> =20
>  #include <linux/types.h>
> =20
> +#define SUNXI_MMC_GCTRL		0x000
> +#define SUNXI_MMC_HWRST		0x078
> +#define SUNXI_MMC_THLDC		0x100
> +
>  struct sunxi_mmc {
>  	u32 gctrl;		/* 0x00 global control */
>  	u32 clkcr;		/* 0x04 clock control */
>=20




