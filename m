Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E202B9DD
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 19:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713985282; cv=none; b=kbBvmdaXRRnd8v+17lXf6D0IdXXPcaBZQmZVc3VQ/8sd+40Pn6M+ChPQA7C97FEu/9+XwSSc7jb2dq42KksR9lJNwi+4Cj5DWsZRaUboXL8/xuhwKg2rKfXhZPxettd0GV5uKX9A01HcBceOZl1J73PUZUaFFsipcj9XabU9f/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713985282; c=relaxed/simple;
	bh=wEniXoUp5G9HRaTQlppl6YOqzKstdjiCVhjp8WFbrik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LpLc+A5Qu0tOyu17Uk1YlxTIczZBJeA7TVk0V5hbNhg38Ny74ZJ54l14z0z2zP89wnBXSp9e1KsT0d1CRpnpMXKJEPQdkcRJ1xfApk2uWkxYOXuCcJuqjDQABSPzzGVzgpcxVqb365Ont3d7W53Qf35bMoShDFtkSTavYNtLnmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPlnv0+r; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPlnv0+r"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a58a36008ceso28873266b.0
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 12:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713985279; x=1714590079; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYb6lahma9ESsvjNNop/lnhNH+5GGNP092pV3MTMbcg=;
        b=VPlnv0+r0DkqQUiPZUdiTXRR563z7WKulruiN+6NYBeUeOuMo65qTxABgpWkAo/bEY
         rbm2pBQ6OeXXmPPpBBWeftwJ+EjfSc+RN8ZHGNJbT/dif2xu4l/YbB9nuK7zEjtvhM8T
         0DzBcbJJBiWvVQ5vdYiYA0QqktOaaLUjQ02jRyqOr5UlIVNtez5rdYDy66s6ds1i8pNN
         +w2kerxmF885bbuORbhGTmyHjAdvTgEyL4lrZvnqR0CQr3e7h112umpijZVhrgyKXswj
         64x+RXo+gi1yvIxj7xIiWT7CHPoCUnr8eN30rrhqUO3ye572ywXAH2qyPbjGbjTwgtOU
         Tt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713985279; x=1714590079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYb6lahma9ESsvjNNop/lnhNH+5GGNP092pV3MTMbcg=;
        b=ilPJA59oTfjViytO2d/dsMkoXS+TwjHS4kcLw2sFCqj59LDd01Ek9nzscHKLN0hgBG
         Q+VyKvyxDq2RDAAOMOdLD2D5JwmVNoNK90jG/4799SpkIThHpps76DoQHzae+nP0TiQp
         xAZ4Xo7rZeTZJgOLRZ1upLuR5vJkPWnfpLuBx9plwcIoWs4Zo2yLJ7LTR3SMYWt+6zCM
         gtrVDy/LbLFMnZlwRfz36D+rc+c+7UXNxjHbO79VYJEDc975qdZlsh9y5shbFVQCDkn5
         PlDZOXvjw+5h52/ONKfZzuE+Y+PPprw2qt3+fRQ0gwQCYlyAK/KCdsSv1E6ej7vq7dC/
         PdrQ==
X-Forwarded-Encrypted: i=1; AJvYcCViZ9TSkkLqqMNpBzrN72Wji4k9xoXBo2a6C9/zY3dY6eLFUtKMN1+DjfIt2LZu7XXhxplFcggmBURf0OjxJlRHMa6ZpjGAA+V81JQ=
X-Gm-Message-State: AOJu0YzLdkEdZEVURhzE9/AOO5bxLe/hPowx42/jL3OAvRNUxhVVNjo1
	wLJ8Nmce/4n4WLgqJD7QWq8QTQXMqi9+VQ/WTgN8cJTg7B6Piv9w
X-Google-Smtp-Source: AGHT+IGU+Yholg1eeeqBHS1/XbClARTXKkmiXuj6aUAvmgHd37s0Jp93MObOLF9sK0NFXS2Ld+XqaA==
X-Received: by 2002:a17:907:7241:b0:a58:a2f7:85e9 with SMTP id ds1-20020a170907724100b00a58a2f785e9mr1130309ejc.34.1713985278550;
        Wed, 24 Apr 2024 12:01:18 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id hg7-20020a170906f34700b00a4e5a6b57a2sm8624325ejb.163.2024.04.24.12.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 12:01:17 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Yangtao Li <tiny.windzz@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject:
 Re: [PATCH] cpufreq: sun50i: fix error returns in dt_has_supported_hw()
Date: Wed, 24 Apr 2024 21:01:16 +0200
Message-ID: <1882679.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <9bfe5703-b39b-4d98-9995-f6a7d0ea558d@moroto.mountain>
References: <9bfe5703-b39b-4d98-9995-f6a7d0ea558d@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne sreda, 24. april 2024 ob 13:40:11 GMT +2 je Dan Carpenter napisal(a):
> The dt_has_supported_hw() function returns type bool.  That means these
> negative error codes are cast to true but the function should return
> false instead.
> 
> Fixes: fa5aec9561cf ("cpufreq: sun50i: Add support for opp_supported_hw")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/cpufreq/sun50i-cpufreq-nvmem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> index cd50cea16a87..0b882765cd66 100644
> --- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> @@ -136,11 +136,11 @@ static bool dt_has_supported_hw(void)
>  
>  	cpu_dev = get_cpu_device(0);
>  	if (!cpu_dev)
> -		return -ENODEV;
> +		return false;
>  
>  	np = dev_pm_opp_of_get_opp_desc_node(cpu_dev);
>  	if (!np)
> -		return -ENOENT;
> +		return false;
>  
>  	for_each_child_of_node(np, opp) {
>  		if (of_find_property(opp, "opp-supported-hw", NULL)) {
> 




