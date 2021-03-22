Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1391D5F
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Mar 2021 14:18:47 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id c8so4202837wrq.11
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Mar 2021 07:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eDCWh6/zJaj6zj0loMji4f0PCuzcxZ0geR05LJmW8Tg=;
        b=oVyA+z3y23uEnKtQkY1RQf5yBOuxoeerXKQv7B381EZ76ZS862W5ZxxSKg2fAoC19m
         YE5wIA6FXOdsJY8P6ap7/h4Z02gjoxAqK5eB0iEJRDvasHi17g7tCithsM+mpdkg15ys
         5qc2ONzgmVZp56LOkrB9V9pUvk1Wjk2VTSzv3mFa4yanuJmGBMXRG/4jREIBVtzDN0tK
         XU69jMatGZFzSkq5Rv6ckSkcmoUQtnLuCXDT6t3DuPILC76D5F85UyV8mU0PUeMGKFjd
         GqjxqA6ojxl/3+po1xeqe4ZRjh6yIlggCJoRyeTdgt8YcI55JWl3P16jdlw0hl2yoaOj
         +fUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eDCWh6/zJaj6zj0loMji4f0PCuzcxZ0geR05LJmW8Tg=;
        b=ZuETyV7ZVS2EAEKO8EtDLDS0DRdCMs4MSNZSWqbjIphVnab5lLiMJnZjQd/ZPnDctp
         d4gKeFFg0bvVWgur/tm41QOKL9KC8RnLl4hmtm+F0qNF65lfbkQo0OsVIAaGLw0gaSSd
         a+jH7IWnbP0JYm2cFh5IL51x5TNJ7C6KSYVGmG64I1+26Jpm4Un68Uy9GsMxlo3mmFXo
         wwe+Deeq6eCfFfsLvdvq7A/vj+GEWCqGB1q7Crs+NOSKnTTw5OB8C+KdOhAADaJrhRSE
         g4bNdFqYtYcSKzQ05YM5EB07pQnUoE0pPRSngbGIF9hkvkSFNfKhfu4nUZT4o0n8uTsE
         ZKsg==
X-Gm-Message-State: AOAM533KtUzVKD4P+X7LLW+/aIFbjw0Z9/6FBT+893B8T5+Xv69I/ciA
	ZoqJtUjpL5HJBsBNCfF7J0XHrQ==
X-Google-Smtp-Source: ABdhPJx4TchNaAFzgkknT14TZmeFXnxSJqznxfQPDOGIN4glPGFPb8gW6hhV2mLK1NhbSD4LnbVcbQ==
X-Received: by 2002:a5d:55c4:: with SMTP id i4mr18636846wrw.84.1616422726280;
        Mon, 22 Mar 2021 07:18:46 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:2091:71d6:3ab2:37f2? ([2a01:e34:ed2f:f020:2091:71d6:3ab2:37f2])
        by smtp.googlemail.com with ESMTPSA id r11sm20213102wrm.26.2021.03.22.07.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 07:18:45 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] arm64: sunxi: Enable the sun4i timer
To: Samuel Holland <samuel@sholland.org>, Thomas Gleixner
 <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210322044707.19479-1-samuel@sholland.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <7bb14a82-5dc9-cefe-4b58-1d2c83974965@linaro.org>
Date: Mon, 22 Mar 2021 15:18:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210322044707.19479-1-samuel@sholland.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22/03/2021 05:47, Samuel Holland wrote:
> In preparation for adding CPU idle states, hook up the sun4i timer.
> Having a non-c3stop clockevent source available is necessary for all
> CPUs to simultaneously enter a local-timer-stop idle state.

Why simultaneously ?

> Changes from v1:
>   - Removed H616 changes (depends on an unmerged patch set)
>   - Reworded the patch 4-5 commit messages for clarity
>   - Added Acked-by tags
> 
> Samuel Holland (5):
>   dt-bindings: timer: Simplify conditional expressions
>   dt-bindings: timer: Add compatibles for sun50i timers
>   arm64: dts: allwinner: a64: Sort watchdog node
>   arm64: dts: allwinner: Add sun4i MMIO timer nodes
>   arm64: sunxi: Build the sun4i timer driver
> 
>  .../timer/allwinner,sun4i-a10-timer.yaml      | 42 +++++++++----------
>  arch/arm64/Kconfig.platforms                  |  1 +
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 25 +++++++----
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |  9 ++++
>  4 files changed, 46 insertions(+), 31 deletions(-)
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
