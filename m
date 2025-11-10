Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DE6309DD8
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Nov 2025 11:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762772879; cv=none; b=ljGC+uiTG2XyhJFNVGtSjPDlxuy/RN7v+7pQzXR8plUdPkhAsiVt+0e/SJao/b0SJ1aDkM8c4U62ZukHu4bBM9swQ5zyT+szeI8anbIHoWCLQkuh50cylfVB8JpgJdw117lsCWT2vyT8L71p0swGWoe4XamU8t2M00o/PYRpkXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762772879; c=relaxed/simple;
	bh=PV0nu9hpPV+PdL37EjWKyESOoKW7BglfhP4iUdE0IM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFynPFthD4BDqnjmpp0z8k45uwYYz8sh9YS7dLm+LoD6jaF6ffmsKhyxDVEuvRgjgN7jg7EsYcaKSZTFrd52L8I+vCu8ABuoc7XQfsdqrhlAuunkdH25IKLYY2S6ePCo3TfCHRDPHG1IemVqOgwV1Rp6zIKgTHqMgsTjg43X/98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KGiSoO7C; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KGiSoO7C"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-781997d195aso1800493b3a.3
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Nov 2025 03:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772877; x=1763377677; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1teV5v5SqS6pFrvXlRn/4yX/VJMz/VkOekGlZHXTNkk=;
        b=KGiSoO7CXVYzeB3n1Zo2CnKRWo+CT1Na0950ZQ+pJNFt+CIk4RxCzr8B07MhaUbTwW
         qBPJuz+lZR3Hgdps/Fxk64j4WTL1bD6lUs9r+bfJzKDRspTxCnQjCdMgHptM14e4uUkB
         rgsXtI/RCBu78sIv6lU1JpsjDoaYBTws6dxe4tI01Si5nR954n+OFlNbvQaMlV/H9CiV
         JTh09x45COm7E1j4jmLiJij36eDI99eXvqxg7yB7W0vwUUcM/wIPu+5hX0wyU0IZL+Q4
         w2exJzaXEVQo4gfSUkjmdAX1F3m2CDONSXN2NgUAya0Lkvj0OXl6v2ShHHNaySYdw7IP
         Ezcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772877; x=1763377677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1teV5v5SqS6pFrvXlRn/4yX/VJMz/VkOekGlZHXTNkk=;
        b=SW1Q3MIoNIB+COR3GPCgGdLz3hq6fYr6sJ+jw0hDmZgBLhFOwxfcgIGXytE8BDvXMc
         yYowbYwZZ/v/m2vddG/OSdP3LFMi6/RlRXq18D5Xt4NlSWrOo7Ao5brnsH4h3cRlSrhE
         xS57Lc+SfK9iRaOlSmEPIabkoihEJHcF2cTHpETw12d8X0+lBSNaVerXL3UDeXER58NN
         g4ywb9H9EfMBDtgAAlPxz2HdbTsr+HzdVHFZ7yFyd7HqjdOPF4ba9TRzERmoD0XtWylQ
         SAnjgfbefHVheH1jLUD9tfuixOgCiaXqwwAhhon4vlW+7fV3KYT+5eFOc8jt5zakBKaQ
         YFmg==
X-Forwarded-Encrypted: i=1; AJvYcCX7BZ8C8H0wLNvniZUwGJyYiAh1MKhS/0jO90DwRDki0/tFIfthca0h8k2TsCuXYaDw6Gp+N9piau1Sqw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwSRHvW/TJmxHnCclRsw1sHoffh2yeg7tjhPphhea3D9ReKl48p
	8fdRV/ftDsKM4ETD5Q6HcM+tjaA0S5f3qSqwPzrZKf3Ohf7xDzNaHIjF8OFq5VbAsB4=
X-Gm-Gg: ASbGncv1QU55X6weFuiL+6wd6dKowhDIRUGvgc1D2p/ZcQS8Yx7igr8yRhheOiYTkBP
	Ll/Gtqsy5DKFgV/1im5PXXjp1x56Am8ei+phVgp4wAYqm5ZQ4TEYzljLKg248bThdVOrNb7lCUa
	L8EVPLEtKw4xYqRUMqteQdYs0bL2IbVat5jfJwcMCzM9zllhubKSdGjKP2NI/02LtYnZ+EKmbEl
	QXzoAwmYhGfm2dS1xGR9Qn1ZimiwwZduptBEAoQmOgdLHPCMILhnJ5F7k7n8fTI4Zbh+sLlhO2Q
	vows4Ij3xXyXd+9zwuU8K09HxyBqqJxKFxPDW1QEhQlYoZzZyMt2zmNrICgktriVHLD/pBz+C7H
	RPFTgCGzvPn3mGO2aEaYAjfrzu3xfj0GEXjob/rb1MJbwc1nJfOBKYfdTtGirDJ8fdOl92b65jr
	2pxMzZ/7Gs3Yo=
X-Google-Smtp-Source: AGHT+IEI5dvtjpf7UreD77ujcsma8Qc91uG0xXgrZUKvQ1Ri3S/fmPHsBQ3EzHdR5mFgTf1mYnto9Q==
X-Received: by 2002:a05:6a00:1990:b0:7aa:2d04:ccf6 with SMTP id d2e1a72fcca58-7b2232f8c80mr9070041b3a.0.1762772877004;
        Mon, 10 Nov 2025 03:07:57 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9c09cd6sm11397368b3a.23.2025.11.10.03.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:07:56 -0800 (PST)
Date: Mon, 10 Nov 2025 16:37:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 04/13] cpufreq: sun50i: Simplify with
 of_machine_device_match()
Message-ID: <awphoxojc3benzdam47mcx7pqty26ohrwpgv46kimg7nl53rqc@szq3aqjqsbrc>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-4-d780ea1780c2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-4-d780ea1780c2@linaro.org>

On 06-11-25, 20:07, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node and matching against it with
> new of_machine_device_match() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
