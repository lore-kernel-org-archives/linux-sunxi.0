Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C991DA53
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 16:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mc6h99wv"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40c48d7a7a7so40704045e9.3
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 08:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702571418; x=1703176218; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xE01ZdGgOUbKW6jdSRaQsPD8axcaxCU7gBZ6Hb9nfkU=;
        b=mc6h99wvTWkZMfOjmy0tNToV/NGI2gSwHScNV4JiHctmxauOm9clE/23hQ6q3yG/vq
         Hh0xx3NHmog6BKNZJ3x2mSYcZUOhJ+xFVSx9kQXdO8Vdd8Zxbp2hAYJn2qc26ng9rnGz
         j8acBqkH82iuHNWNU2VTTJl9yhHNPwngwh/Djzez3A3ONJVMzHMPSR8EB6LexrtltEE8
         qmANONZ4CgfO/sNWpKtAXfrcSW8U4CABOsEmKhYCK6V535EkzOqp+MTK07T3QE5o03js
         Ithls6ePwo22xOcSTm+ZpZUmBfy9+UA7Y/Q3Uc/St+cpKLqi/yomc8BMzTGAg9e6yO9F
         KNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702571418; x=1703176218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xE01ZdGgOUbKW6jdSRaQsPD8axcaxCU7gBZ6Hb9nfkU=;
        b=syR2jGHDaP8+GN9+Ia4gFPVushFavhfZO9yL+P/qbozq9CWxTYZyiK6zR3PwPsFoiU
         AP1upuP3keWSGdVfbywNr8VABnjUl4TVG+aDpwGyUk7NmUu/LSdE5Y/Sg2WhQFwqP5T0
         QGAGJfyS7tVmUTusVAwGsVSXrQbGu6MFox2OX69VPD9S9VdLi3ZD/BbhnZuDYkAnTjuh
         0tHRTYzH51+T9NjNvVua66fup3ghUVz9avQFRmDzLwZ5CUuNbiTlWqK4dtlvBh3s4gmH
         lFTN6vzIbDVb94+bP/tDfkT2aTmb9q+FZG1jUyYe0BjJWJ98pju4y6Rw4LRFZTZiYZ6C
         gjwA==
X-Gm-Message-State: AOJu0Yw8B6Pwu2f/G92mRLRVnzGxTTB1FNeR2RSM3mMqe1i1iGiosXSz
	mX5u9OxtntsxcL6Asx7cs1s=
X-Google-Smtp-Source: AGHT+IEt3Nf2FCXCesN3uRpXrcfJ59x2f6UcAcLrd557rYe94mku6UBCBQZa/o3m9hOoz7r2BA5Z3A==
X-Received: by 2002:a05:600c:1392:b0:40c:55c4:45ec with SMTP id u18-20020a05600c139200b0040c55c445ecmr2704032wmf.46.1702571417702;
        Thu, 14 Dec 2023 08:30:17 -0800 (PST)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id i1-20020a05600c354100b0040c411da99csm19770588wmq.48.2023.12.14.08.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 08:30:17 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject:
 Re: [PATCH 3/5] cpufreq: dt-platdev: Blocklist allwinner,sun20i-d1 SoC
Date: Thu, 14 Dec 2023 17:30:15 +0100
Message-ID: <3459481.QJadu78ljV@archlinux>
In-Reply-To: <20231214103342.30775-4-fusibrandon13@gmail.com>
References:
 <20231214103342.30775-1-fusibrandon13@gmail.com>
 <20231214103342.30775-4-fusibrandon13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, December 14, 2023 11:33:40 AM CET Brandon Cheo Fusi wrote:
> The Allwinner D1 uses H6 cpufreq driver. Add it to blocklist
> so the "cpufreq-dt" device is not created twice.
> 
> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index bd1e1357c..2febcfc2c 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -104,6 +104,7 @@ static const struct of_device_id allowlist[] __initconst = {
>   */
>  static const struct of_device_id blocklist[] __initconst = {
>  	{ .compatible = "allwinner,sun50i-h6", },
> +	{ .compatible = "allwinner,sun20i-d1", },

This should not be needed since you're using H6 variant for a fallback.

Best regards,
Jernej

>  
>  	{ .compatible = "apple,arm-platform", },
>  
> 




