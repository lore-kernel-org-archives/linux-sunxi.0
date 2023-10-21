Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A8210FE
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Oct 2023 05:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mO/dm3Qp"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40836ea8cbaso11319055e9.0
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Oct 2023 22:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697867533; x=1698472333; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVwceQB+qnZEN4kSYJbjQLVDt4vupsiAhwrV9/H49AA=;
        b=mO/dm3QpLOxPRCf+r87Ck4hW8oMCdbgzgz8y6DzU//+/+F8MTk1Bv3q/9RMpMFFsFj
         n+hvz2LfLPC+nAXaew6CDBcv9icemn5K0BmV1C5uMJbRG5e2pp3UD0lGxYv5y0JAxh5k
         41SX4Lki2FhiAJSmpmp42q0gtCi2cG1eOOIJbzEPj+Ctjyp3lbhm5OvOJUgXwyVxFVZf
         rtBmnSHEUwNJMHBFRgkda2sajht0eA/4lhzRLmdv7misqI4ToCDpBl/0f4UpoiZ4tYac
         +jQqHDvOwYKC3Dqxrwet3I8fAAAdDSw9zA33W5dS+0kj9xBj/ag5ZMQNBBigd0CXT3KB
         2YZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697867533; x=1698472333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVwceQB+qnZEN4kSYJbjQLVDt4vupsiAhwrV9/H49AA=;
        b=xCGW/JD89Mwjy4OBWS7cQOgKXdF/77Ol+kl0eaDqGVwNqP5Vpfqqlnl+k+75VR8hEk
         8k8oYLFgbNPJz40ylmbWzL+H4HkkSqRv7LY6QyxzhTa4rCf3qgPpCsz+vECNmXWLZxMZ
         N4jGOoIXOQF5BeQcaXzoLGLMNt3/iQQpP59lHkAiC6nnUWxVg/potrJ562AqjiYZcdS3
         W4F7E/GGVAhCotc27U3ldz/76s9y67U4yMkvg1ZC785CHT1lTjzKXgVYfsmDForquJk9
         ELE61u6M7ySpxz+Vrrq6jRUgX5OMakLXGAchrYdiMxORyCt9UlRF4cTGcNEeQqgSt9sn
         L6pg==
X-Gm-Message-State: AOJu0YwYlP4LK0ry59mRSHFOaViPAYs2CpAl/n6JOyYN3oYfpd1lXeyk
	hi4lGryKiWrQHIi0EZ8ByA8=
X-Google-Smtp-Source: AGHT+IGgTVFlxhDBMTfUM/lzNVMF8Oo55P7F9tUTTDJmesMB+cbRTrluZQ9CG8P8IDu4PKh1QP6SzQ==
X-Received: by 2002:a05:600c:3c8d:b0:405:37bb:d942 with SMTP id bg13-20020a05600c3c8d00b0040537bbd942mr2865297wmb.4.1697867532873;
        Fri, 20 Oct 2023 22:52:12 -0700 (PDT)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id b14-20020a05600c4e0e00b0040607da271asm8519092wmq.31.2023.10.20.22.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 22:52:12 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Gunjan Gupta <viraniac@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/4] sunxi: DRAM: H6: const-ify DRAM function parameters
Date: Sat, 21 Oct 2023 07:52:11 +0200
Message-ID: <4839641.GXAFRqVoOG@archlinux>
In-Reply-To: <20231021011025.568-3-andre.przywara@arm.com>
References:
 <20231021011025.568-1-andre.przywara@arm.com>
 <20231021011025.568-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, October 21, 2023 3:10:23 AM CEST Andre Przywara wrote:
> There are quite some functions in the Allwinner H6 DRAM "driver", some
> of them actually change the parameters in the structure passed to them,
> but many are actually not.
> 
> To increase the optimisation potential for the code, mark those functions
> that just read members of the passed dram_para struct as "const".
> Use the opportunity to avoid the forward declarations by moving the
> mctl_core_init() function.
> 
> This in itself does not decrease the code size, but lays the groundwork
> for future changes doing so.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  .../include/asm/arch-sunxi/dram_sun50i_h6.h   |  6 +--
>  arch/arm/mach-sunxi/dram_sun50i_h6.c          | 48 +++++++++----------
>  .../mach-sunxi/dram_timings/h6_ddr3_1333.c    |  2 +-
>  arch/arm/mach-sunxi/dram_timings/h6_lpddr3.c  |  2 +-
>  4 files changed, 27 insertions(+), 31 deletions(-)
> 
> diff --git a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h6.h
> b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h6.h index
> be02655cdd5..a7c6435220f 100644
> --- a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h6.h
> +++ b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h6.h
> @@ -313,8 +313,8 @@ check_member(sunxi_mctl_phy_reg, dx[3].reserved_0xf0,
> 0xaf0); */
>  #define RD_LINES_PER_BYTE_LANE	(BITS_PER_BYTE + 6)
>  struct dram_para {
> -	u32 clk;
> -	enum sunxi_dram_type type;
> +	const u32 clk;
> +	const enum sunxi_dram_type type;
>  	u8 cols;
>  	u8 rows;
>  	u8 ranks;
> @@ -331,6 +331,6 @@ static inline int ns_to_t(int nanoseconds)
>  	return DIV_ROUND_UP(ctrl_freq * nanoseconds, 1000);
>  }
> 
> -void mctl_set_timing_params(struct dram_para *para);
> +void mctl_set_timing_params(const struct dram_para *para);
> 
>  #endif /* _SUNXI_DRAM_SUN50I_H6_H */
> diff --git a/arch/arm/mach-sunxi/dram_sun50i_h6.c
> b/arch/arm/mach-sunxi/dram_sun50i_h6.c index 43a2d19f084..1187f1960a0
> 100644
> --- a/arch/arm/mach-sunxi/dram_sun50i_h6.c
> +++ b/arch/arm/mach-sunxi/dram_sun50i_h6.c
> @@ -36,25 +36,6 @@
>   * similar PHY is ZynqMP.
>   */
> 
> -static void mctl_sys_init(struct dram_para *para);
> -static void mctl_com_init(struct dram_para *para);
> -static bool mctl_channel_init(struct dram_para *para);
> -
> -static bool mctl_core_init(struct dram_para *para)
> -{
> -	mctl_sys_init(para);
> -	mctl_com_init(para);
> -	switch (para->type) {
> -	case SUNXI_DRAM_TYPE_LPDDR3:
> -	case SUNXI_DRAM_TYPE_DDR3:
> -		mctl_set_timing_params(para);
> -		break;
> -	default:
> -		panic("Unsupported DRAM type!");
> -	};
> -	return mctl_channel_init(para);
> -}
> -
>  /* PHY initialisation */
>  static void mctl_phy_pir_init(u32 val)
>  {
> @@ -152,7 +133,7 @@ static void mctl_set_master_priority(void)
>  	MBUS_CONF(HDCP2,  true,    HIGH, 2,  100,   64,   32);
>  }
> 
> -static void mctl_sys_init(struct dram_para *para)
> +static void mctl_sys_init(u32 clk_rate)
>  {
>  	struct sunxi_ccm_reg * const ccm =
>  			(struct sunxi_ccm_reg *)SUNXI_CCM_BASE;
> @@ -173,7 +154,7 @@ static void mctl_sys_init(struct dram_para *para)
> 
>  	/* Set PLL5 rate to doubled DRAM clock rate */
>  	writel(CCM_PLL5_CTRL_EN | CCM_PLL5_LOCK_EN |
> -	       CCM_PLL5_CTRL_N(para->clk * 2 / 24), &ccm->pll5_cfg);
> +	       CCM_PLL5_CTRL_N(clk_rate * 2 / 24), &ccm->pll5_cfg);
>  	mctl_await_completion(&ccm->pll5_cfg, CCM_PLL5_LOCK, 
CCM_PLL5_LOCK);
> 
>  	/* Configure DRAM mod clock */
> @@ -198,7 +179,7 @@ static void mctl_sys_init(struct dram_para *para)
>  	writel(0x8000, &mctl_ctl->unk_0x00c);
>  }
> 
> -static void mctl_set_addrmap(struct dram_para *para)
> +static void mctl_set_addrmap(const struct dram_para *para)
>  {
>  	struct sunxi_mctl_ctl_reg * const mctl_ctl =
>  			(struct sunxi_mctl_ctl_reg 
*)SUNXI_DRAM_CTL0_BASE;
> @@ -284,7 +265,7 @@ static void mctl_set_addrmap(struct dram_para *para)
>  	mctl_ctl->addrmap[8] = 0x3F3F;
>  }
> 
> -static void mctl_com_init(struct dram_para *para)
> +static void mctl_com_init(const struct dram_para *para)
>  {
>  	struct sunxi_mctl_com_reg * const mctl_com =
>  			(struct sunxi_mctl_com_reg 
*)SUNXI_DRAM_COM_BASE;
> @@ -354,7 +335,7 @@ static void mctl_com_init(struct dram_para *para)
>  	}
>  }
> 
> -static void mctl_bit_delay_set(struct dram_para *para)
> +static void mctl_bit_delay_set(const struct dram_para *para)
>  {
>  	struct sunxi_mctl_phy_reg * const mctl_phy =
>  			(struct sunxi_mctl_phy_reg 
*)SUNXI_DRAM_PHY0_BASE;
> @@ -413,7 +394,7 @@ static void mctl_bit_delay_set(struct dram_para *para)
>  	}
>  }
> 
> -static bool mctl_channel_init(struct dram_para *para)
> +static bool mctl_channel_init(const struct dram_para *para)
>  {
>  	struct sunxi_mctl_com_reg * const mctl_com =
>  			(struct sunxi_mctl_com_reg 
*)SUNXI_DRAM_COM_BASE;
> @@ -563,6 +544,21 @@ static bool mctl_channel_init(struct dram_para *para)
>  	return true;
>  }
> 
> +static bool mctl_core_init(const struct dram_para *para)
> +{
> +	mctl_sys_init(para->clk);
> +	mctl_com_init(para);
> +	switch (para->type) {
> +	case SUNXI_DRAM_TYPE_LPDDR3:
> +	case SUNXI_DRAM_TYPE_DDR3:
> +		mctl_set_timing_params(para);
> +		break;
> +	default:
> +		panic("Unsupported DRAM type!");
> +	};
> +	return mctl_channel_init(para);
> +}
> +
>  static void mctl_auto_detect_rank_width(struct dram_para *para)
>  {
>  	/* this is minimum size that it's supported */
> @@ -637,7 +633,7 @@ static void mctl_auto_detect_dram_size(struct dram_para
> *para) }
>  }
> 
> -unsigned long mctl_calc_size(struct dram_para *para)
> +unsigned long mctl_calc_size(const struct dram_para *para)
>  {
>  	u8 width = para->bus_full_width ? 4 : 2;
> 
> diff --git a/arch/arm/mach-sunxi/dram_timings/h6_ddr3_1333.c
> b/arch/arm/mach-sunxi/dram_timings/h6_ddr3_1333.c index
> 2136ca3a4cb..6dde6e78717 100644
> --- a/arch/arm/mach-sunxi/dram_timings/h6_ddr3_1333.c
> +++ b/arch/arm/mach-sunxi/dram_timings/h6_ddr3_1333.c
> @@ -38,7 +38,7 @@ static u32 mr_ddr3[7] = {
>  };
> 
>  /* TODO: flexible timing */
> -void mctl_set_timing_params(struct dram_para *para)
> +void mctl_set_timing_params(const struct dram_para *para)
>  {
>  	struct sunxi_mctl_ctl_reg * const mctl_ctl =
>  			(struct sunxi_mctl_ctl_reg 
*)SUNXI_DRAM_CTL0_BASE;
> diff --git a/arch/arm/mach-sunxi/dram_timings/h6_lpddr3.c
> b/arch/arm/mach-sunxi/dram_timings/h6_lpddr3.c index
> 10008601134..2a95484322c 100644
> --- a/arch/arm/mach-sunxi/dram_timings/h6_lpddr3.c
> +++ b/arch/arm/mach-sunxi/dram_timings/h6_lpddr3.c
> @@ -17,7 +17,7 @@ static u32 mr_lpddr3[12] = {
>  };
> 
>  /* TODO: flexible timing */
> -void mctl_set_timing_params(struct dram_para *para)
> +void mctl_set_timing_params(const struct dram_para *para)
>  {
>  	struct sunxi_mctl_ctl_reg * const mctl_ctl =
>  			(struct sunxi_mctl_ctl_reg 
*)SUNXI_DRAM_CTL0_BASE;




