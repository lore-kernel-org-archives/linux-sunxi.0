Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1BF17B431
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jul 2024 10:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720003843; cv=none; b=jdP16rxmitRHwztTtieEgXmNrl44z+NCgmpiPj0WaIOL8ML/irRApox4WAreOyOv2dFpMGm6rf2vBKPtqwNk5WW6iN5i/zXj93YBD22CgdWHpvEgDMbhu+hs+UNEed20Xo9VfBGlrXiZNGrr+czf8zZQ3HG80Z2ZFSjVWFCgB/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720003843; c=relaxed/simple;
	bh=97g5hVGvQ1qwpc2CPaPuBD9gaA9Pvxly1JlZf2rwD3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzHMnmdNphAZt4tZRnYko+GG1RXSWgToHJIrxCsv//BAHLKkMHiOKGBK+xWyEYpR9VfSxvOeMNad8Xwu66iqZLKdjRjr8axaVfmpcHmFtbt8gM+BR+EMp9U1M3G+am+zWxK/cEu8GjtZri5gm/Drb42DOEZFuJdUHltFNA19oh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TMLMZ8UT; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TMLMZ8UT"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52e8b27f493so3796145e87.2
        for <linux-sunxi@lists.linux.dev>; Wed, 03 Jul 2024 03:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720003840; x=1720608640; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mAbweGD+BN+79RknZZB5w0QdvnNoIWN8iG0fgQ2u8ZA=;
        b=TMLMZ8UTZLQzYEx2veYFVdG0rRABvPubA/kQAH4Zy/dub/PLLl4pNj2UuwdJQgBHMd
         DMbbS5laqUAwA8GE2FzqNdPpntbVQK772VqX/i+uyoEH5XCeNfYiWXkVMFAie0ViNgvS
         SXy6pTgmxQezchxxtdoVFeCzK2/ayFwQzy7/qJ3JV6ZYjp0PqaLzXNMjb2oimx1Ia/Xy
         rCTEmCRlt2R2QgNXz6H3afPfnoDt9zDGgE/ziRCy3F7hRRPkcJulXH8HL1RUqpGvOyLw
         80T+mJMADCEqUQLzSF7bJnFUpEyIVIuQxyXa2xuGXMLDXpsIPTYa8oKh5Aez9FtKTwJc
         mi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720003840; x=1720608640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAbweGD+BN+79RknZZB5w0QdvnNoIWN8iG0fgQ2u8ZA=;
        b=DUhoqMTvuRPIgKW1hVRWFhKoT5Mcpght0WVS4id8ATZbl9aDmTcYMXxo6rQuexEt25
         K94snMhO1P46t/rrY/CcyBQC/+8KyxZn10lcqJlSJcosUfIzFSvOf79N3MOsCpWorCiq
         xs4LKWTbP3OkAcBIV/zffJjhDx/td5SkRGow5w7cRy/5zBAKcg8pHZb4biXUJqu5VX6f
         tcpKLtiJsh8jx5WPYXj+swaHFl5NkhQygTaVP39ksSTQiGk7rNMOmAVZDvGGsGyve8la
         AGjZDbDUV+s+jiAm5If1gxpxkNAT3fxRwEPi1f+sDFVyK2K29xBSIHHSV/iQ3hS2Tye7
         BsqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXoB4DsUQ5TjJOWdpTGYyKseqFGEoZ2ncPreMeWK/otwN2ayVSJ15JdQn7/pIhMTFMhPyT39eK6H//3JL7fidZ2vO2oE+49zfVwEM=
X-Gm-Message-State: AOJu0YwkqBmaqcbsqBfytDbbqthHkr9Bo0VsuJ0AIfo0qAcvL0ZmPOAH
	zNyiOs2gPgzurvbUUyGK7D29Ei+zDMJjouPFFhdWjqLCaVJ8FGcaODRYs90vju0=
X-Google-Smtp-Source: AGHT+IHOOKL4YyNeD/zQtvaedknaKcTA38zEaMOgcwZsU9QXJ4gpOSNYzoc+NWDud4SlyJkddZjdUA==
X-Received: by 2002:a05:6512:39d3:b0:52e:7688:2817 with SMTP id 2adb3069b0e04-52e8266eaebmr6364231e87.17.1720003839232;
        Wed, 03 Jul 2024 03:50:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab0b7fesm2128928e87.31.2024.07.03.03.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:50:38 -0700 (PDT)
Date: Wed, 3 Jul 2024 13:50:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michal Simek <michal.simek@amd.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 08/10] clk: qcom: lpasscc-sc8280xp: Constify struct
 regmap_config
Message-ID: <wc5hbb77tc2dalf6feg23ptdxdd7cjhshkgnbeiknalqicu7gn@jghelw744yot>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
 <20240703-clk-const-regmap-v1-8-7d15a0671d6f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703-clk-const-regmap-v1-8-7d15a0671d6f@gmail.com>

On Wed, Jul 03, 2024 at 11:50:21AM GMT, Javier Carrasco wrote:
> `lpass_audiocc_sc8280xp_regmap_config` and `lpasscc_sc8280x_regmap_config`
> are not modified and can be declared as const to move their data to a
> read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/clk/qcom/lpasscc-sc8280xp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
