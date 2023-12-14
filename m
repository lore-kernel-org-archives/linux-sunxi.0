Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B3A5F1E8
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 16:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcvbZSda"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40c2db2ee28so89067275e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 08:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702571373; x=1703176173; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzQGVhzK9qgzTVRhSljpGjlLUwC8cdffhqMfyCAFf7I=;
        b=jcvbZSdaIJcoA+EIiJxQodX+pMUcbTMG8EnP4of9HwfKduABBRteUmJird9JrUXwHW
         Uw2J2AoxubGC1ZRge4FeoodcfBis7FZyIpmeqJR8207gy5wi+HeMsWqXRtWSnJsRSH8K
         ZU4TErqPtHd4cvwCDaOvggwH43YoAA/RG9snkXT6ysbWCd2+BWRahJqR8xdEWRqni5ZX
         Uw27Qfgxy5SfcfmT7ap7vFbsSqxTA6aB8kyn6JYEZZASCHT/b3IR6vFE1Owinf2nSJKw
         1Xou3JejSb6lNB1g/sCqbfCYVC2IsQSNxJeP3ZiFXU0rTCi67/PzHma7ZvDh0S2RWOMd
         LfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702571373; x=1703176173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzQGVhzK9qgzTVRhSljpGjlLUwC8cdffhqMfyCAFf7I=;
        b=WhbgjzxEEg1uqyYau1rsMGfuq8eutS9/gX23/NhnHreBkO43yEN/AxXcY5Ue4K0E/r
         nDD4ANtAWkMdb892QPvta3Fb07C6S59j7d+5c0qhC8kOoI8zB4tEIXkVmGJK0SibN5qa
         STDSTBM/niwNp6EnPUqRgiwDr+Xo96ozy35j800uYqV4iWnosnA8AsRkjKSrDvmyL1F/
         1V9SHUX1iv/7j42M60B7yd7CAo/f1rtJoUzL+l0jF6fVZpJwu++fYiid9xlvNbS+Ii1X
         yEPyeKomNnueLCYwJQIW2XpI7ss5G2F6Qy8GFjFIVYToyiApJfx4wNjs1t+bTsBme4h3
         UmCA==
X-Gm-Message-State: AOJu0YxbU34ZL9vBZDTZ15I0MiGw+T8vcL0V1qa7mKakEJnDWu1SmdK/
	2nL8k2c6jGzJw+WXDAZvQ10=
X-Google-Smtp-Source: AGHT+IFN5ZJPrgJWQSUN0ieEOEfcOtwuEvWwJAPclnmbsShFkrfXSYtGFxx2cJxfVHSsuqkS0Ivihg==
X-Received: by 2002:a05:600c:d1:b0:40c:26f4:dda9 with SMTP id u17-20020a05600c00d100b0040c26f4dda9mr5404229wmm.187.1702571372498;
        Thu, 14 Dec 2023 08:29:32 -0800 (PST)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id m29-20020a05600c3b1d00b0040b3515cdf8sm25377092wms.7.2023.12.14.08.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 08:29:32 -0800 (PST)
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
Subject: Re: [PATCH 2/5] cpufreq: sun50i: Add D1 support
Date: Thu, 14 Dec 2023 17:29:30 +0100
Message-ID: <8351928.NyiUUSuA9g@archlinux>
In-Reply-To: <20231214103342.30775-3-fusibrandon13@gmail.com>
References:
 <20231214103342.30775-1-fusibrandon13@gmail.com>
 <20231214103342.30775-3-fusibrandon13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, December 14, 2023 11:33:39 AM CET Brandon Cheo Fusi wrote:
> Add support for D1 based devices to the Allwinner H6 cpufreq
> driver
> 
> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> ---
>  drivers/cpufreq/sun50i-cpufreq-nvmem.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> index 32a9c88f8..ccf83780f 100644
> --- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> @@ -160,6 +160,7 @@ static struct platform_driver sun50i_cpufreq_driver = {
>  
>  static const struct of_device_id sun50i_cpufreq_match_list[] = {
>  	{ .compatible = "allwinner,sun50i-h6" },
> +	{ .compatible = "allwinner,sun20i-d1" },

This is not needed, as there is no functionality change.

Best regards,
Jernej

>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, sun50i_cpufreq_match_list);
> 




