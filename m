Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AF71B974
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 19:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713729449; cv=none; b=dE15T8IHs+SM6B3Y9m4xO483merCzUDvgqN4x5DfgwLqUr55/sxvPs12vrULtyjVs0R7lcUL8u3HtTSxzxGOdHxahFZwFHixqt2qf1seBuVTlou3R+lV++YBSzm8IZfw6eiKONshxwchZr+eINtBD78RczvlnVj/qBMdvwxglmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713729449; c=relaxed/simple;
	bh=efXD1Qv/kAEdBkbZzyouDJ1rmUvO0imo3+ybv0v75PA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OoqRzWrTb0lLwMcEBJEElbUuzW4I1GdYAbuL+fPEPiPnE5VZhtLfdImkUKuOQKANFBoKx2pEI6Ciy9Q6hpSA23F3/cN/xd5JIb+OUU2warRgvGa63y8BHnD8/u4D+DuTf2MZHMUVkBuIr275jh/ZJN6rMnJiARlTtNog4YuPIP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUObhkXj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUObhkXj"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41a4d9102dcso1961695e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 12:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713729446; x=1714334246; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWdX/Fk775nBpYl4rDPq0H/p5QVPSKIZBRRPn4D/xoc=;
        b=mUObhkXjpOHiARd6cWolaO4YIVicq4pQUQOhmXgAksmhd2kNpW79Q0pzku7U3zMSc4
         snd1aoeNko2sPxVOcLT9ChmbysOQpADktGzyT53LvzLlmD5sxwCGpAyWiUc49CIY9ahj
         azmteLQGtdoYpHLGtphvkSRQqI8q7ZsYJm4Zr8jCs40Mm3zDXJFHHYLy2IEu+ft82kUS
         y6ZUph+/j0NKRMt+04Vqra7V2No9U8BRrPnzthFhmRPKKteZ2xirGR07BIIMEtUnLS2C
         1pskULZT850JlQr+WuXrbNFufWwcH2eem7oKO9q3yWsynIeJlBH1vrtLkxsDsZBDlBHD
         c/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713729446; x=1714334246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWdX/Fk775nBpYl4rDPq0H/p5QVPSKIZBRRPn4D/xoc=;
        b=DXauTW/RJ/z29g5xYhpe1PUKCgoS5NVWiotnBAFcimK78PTWll8PHodxk5WCXfSjly
         u4sBEfMnl+/Q+FRJyZVjwnrLjtUR7V4H3bc03Xd30tEu+OaQ48mLaTSLteryLIixOmZu
         Is64uJex+YMXoHleU3FgXSz6juZGyAzpi28cWC9GTrZ6NRAXMCF2dyc+NuMGEyDLCh++
         hRxDSHoiQ2Vsj3QDe+XrY+kZNC+W6Q51jCYLJUYEbYt+QQH5fombv0XW9Bh6shwnENe7
         pzIwO8eHrWSXyikRG0MxhEVJRkCn9GN0Im2S5lMUyuvw2jlZQ8l1xY4Y7H3kXa7F4pva
         jJQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKjLJibTk5peMQcQOO3o8w+VaaK1VA5NasIvOLvt+/DzcN2Kslv7hT8kthJZ7FnOwNMN7COGlKynv4ICIsAcanxdlnnrCvG0esr0Q=
X-Gm-Message-State: AOJu0YzPwlEAG6dvkKBr9LHmqxqOsSOFCTlghteO1MUeokcBK/tNC0NT
	CZ/Sl4vm3vFLbnwtyzJoGF1xgYOf+M/ROJIl5CJ7DGCU1uEgaCQv
X-Google-Smtp-Source: AGHT+IE/u/1wW4JDdI97bb6vvTW1FRs57v0KjrCXVMCAkW2tNn2qGf7AQtcRuQ9M7lKhchv08tZE2Q==
X-Received: by 2002:a05:600c:4686:b0:418:201f:f991 with SMTP id p6-20020a05600c468600b00418201ff991mr4181483wmo.40.1713729445408;
        Sun, 21 Apr 2024 12:57:25 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id j10-20020a05600c190a00b00418a9961c47sm14260154wmq.47.2024.04.21.12.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 12:57:25 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: a.zummo@towertech.it, Alois Fertl <a.fertl@t-online.de>
Cc: alexandre.belloni@bootlin.com, wens@csie.org, samuel@sholland.org,
 linux-rtc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, a.fertl@t-online.de
Subject: Re: [PATCH v2 1/1] drivers/rtc: rtc-sun6i: AutoCal Internal OSC Clock
Date: Sun, 21 Apr 2024 21:57:24 +0200
Message-ID: <6035510.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20240421183633.117326-1-a.fertl@t-online.de>
References: <20240421183633.117326-1-a.fertl@t-online.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 21. april 2024 ob 20:36:33 GMT +2 je Alois Fertl napisal(a):
> I have a M98-8K PLUS Magcubic TV-Box based on the Allwinner H618 SOC.
> On board is a Sp6330 wifi/bt module that requires a 32kHz clock to
> operate correctly. Without this change the clock from the SOC is
> ~29kHz and BT module does not start up. The patch enables the Internal
> OSC Clock Auto Calibration of the H616/H618 which than provides the
> necessary 32kHz and the BT module initializes successfully.
> Add a flag and set it for H6 AND H616. The H618 is the same as H616
> regarding rtc.
> 
> v1->v2
> - add flag and activate for H6 AND H616

Please move changelog below --- line.

> 
> Signed-off-by: Alois Fertl <a.fertl@t-online.de>
> ---
>  drivers/rtc/rtc-sun6i.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index e0b85a0d5645..5d0c917b2099 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -42,6 +42,11 @@
>  
>  #define SUN6I_LOSC_CLK_PRESCAL			0x0008
>  
> +#define SUN6I_LOSC_CLK_AUTO_CAL			0x000c
> +#define SUN6I_LOSC_CLK_AUTO_CAL_16MS		BIT(2)
> +#define SUN6I_LOSC_CLK_AUTO_CAL_EANABLE		BIT(1)

EANABLE -> ENABLE

> +#define SUN6I_LOSC_CLK_AUTO_CAL_SEL_CAL		BIT(0)
> +
>  /* RTC */
>  #define SUN6I_RTC_YMD				0x0010
>  #define SUN6I_RTC_HMS				0x0014
> @@ -126,7 +131,6 @@
>   *     registers (R40, H6)
>   *   - SYS power domain controls (R40)
>   *   - DCXO controls (H6)
> - *   - RC oscillator calibration (H6)
>   *
>   * These functions are not covered by this driver.
>   */
> @@ -138,6 +142,7 @@ struct sun6i_rtc_clk_data {
>  	unsigned int has_losc_en : 1;
>  	unsigned int has_auto_swt : 1;
>  	unsigned int no_ext_losc : 1;
> +	unsigned int has_auto_cal : 1;
>  };
>  
>  #define RTC_LINEAR_DAY	BIT(0)
> @@ -268,6 +273,13 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
>  	}
>  	writel(reg, rtc->base + SUN6I_LOSC_CTRL);
>  
> +	if (rtc->data->has_auto_cal) {
> +		/* Enable internal OSC clock auto calibration */
> +		reg = (SUN6I_LOSC_CLK_AUTO_CAL_16MS | SUN6I_LOSC_CLK_AUTO_CAL_EANABLE |
> +				SUN6I_LOSC_CLK_AUTO_CAL_SEL_CAL);

Remove parenthesis and fix indentation. Since macro names are pretty long,
maybe put one per line.

Is this safe to be done even on the boards with external 32k crystal?

Best regards,
Jernej

> +		writel(reg, rtc->base + SUN6I_LOSC_CLK_AUTO_CAL);
> +	}
> +
>  	/* Yes, I know, this is ugly. */
>  	sun6i_rtc = rtc;
>  
> @@ -380,6 +392,7 @@ static const struct sun6i_rtc_clk_data sun50i_h6_rtc_data = {
>  	.has_out_clk = 1,
>  	.has_losc_en = 1,
>  	.has_auto_swt = 1,
> +	.has_auto_cal = 1,
>  };
>  
>  static void __init sun50i_h6_rtc_clk_init(struct device_node *node)
> @@ -395,6 +408,7 @@ static const struct sun6i_rtc_clk_data sun50i_h616_rtc_data = {
>  	.has_prescaler = 1,
>  	.has_out_clk = 1,
>  	.no_ext_losc = 1,
> +	.has_auto_cal = 1,
>  };
>  
>  static void __init sun50i_h616_rtc_clk_init(struct device_node *node)
> 




