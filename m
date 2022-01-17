Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D21173
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Jan 2022 09:00:51 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 25-20020a05600c231900b003497473a9c4so22597573wmo.5
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Jan 2022 01:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uNxywBtauiiSbb3v20qOTEdwlBSnjvT+NFkq6wnHG6A=;
        b=uYkZcRpC+5iTrpZNb91jTzRJhL0QSKUVPAyDMv1MG/vmYA1FaYKyiluW/8H3cbEl5m
         AaABkXSAwpn+YTH/gjQedlKZvEa1Emvw20NgSd0XkVIsPqPVji1WIBqEoREbb6BEdK24
         FdFfy750P7/grkZOpaMbXeyRhj+mO8lML2jBMN+2FWkTrjgvQvn2YEVR8UIejpaVMls7
         WDLyypu2FSvzLEiLNjYzS+HFluXWbjErYbfVSP6HBN3Nxmg0nbFfLl3c6Y6sWrETTzoo
         fiw76/uA19CPZUGjm5ZKngbUmtqZqRoluJCyBWWYLCjhMynacVRLur9kUB8jD/D1zBTB
         4YbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uNxywBtauiiSbb3v20qOTEdwlBSnjvT+NFkq6wnHG6A=;
        b=Ac5PirEI/o1nNSJMd2uHZ3P6e7hRcz0DAKv0UbzT629LVtWTUdSWJF3Nq652SJObJd
         wHj0jMFmmMF2PBsLSW71OmcgqgMxEeo+zkLSi2K45JWoLDZMFgyAL8PH2PLoN6j/5DcS
         PW5G0m0eWELDTVLW/914eZuQ8GtXFcRs3DFxAkfZLsXa5a1YKY6Aj8gBRI1j89rhJNEI
         yy5OL3R8bsrV9w6wrn+fBSlqS8FPaPMQKVEPv6Fk3LgeVK5px1IB0rTKBTX15+E1lUuN
         o6VZljLs0a03oIWd5HHmfgAWWcqZptFflXuoUHZkKuWPKWwtxwtvrd54IVgzyRh3VSjC
         YygA==
X-Gm-Message-State: AOAM530BeIpb1JnqZKEQwa2kmAJ1a261puUlKWl0euYDkiT6fZwDAetu
	laGGGXA/aA++Jw3Ur++gusCugA==
X-Google-Smtp-Source: ABdhPJy38hNJCJT4tL2Qb1TkrATt+lRfqvgALC0NS55iT+Qdy/srg+77wndo1Hj9NAop5w193ZmUqg==
X-Received: by 2002:adf:f390:: with SMTP id m16mr18858434wro.651.1642410049663;
        Mon, 17 Jan 2022 01:00:49 -0800 (PST)
Received: from google.com ([31.124.24.179])
        by smtp.gmail.com with ESMTPSA id i6sm8859710wrf.21.2022.01.17.01.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 01:00:49 -0800 (PST)
Date: Mon, 17 Jan 2022 09:00:49 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Evgeny Boger <boger@wirenboard.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] iio: adc: sun4i-gpadc-iio: no temp sensor on R40
Message-ID: <YeUwQfkdWbEZlnh2@google.com>
References: <20211119191456.510435-1-boger@wirenboard.com>
 <20211119191456.510435-2-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211119191456.510435-2-boger@wirenboard.com>

On Fri, 19 Nov 2021, Evgeny Boger wrote:

> R40 SoC has touchscreen controller also serving as general-purpose ADC.
> The hardware is very similar to A31, except that R40 has separate
> calibrated thermal sensor IP (handled by sun8i_thermal).
> 
> Despite the temperature sensor in the RTP is never mentioned in
> the R40 family user manuals, it appears to be working. However,
> it's not very useful as it lacks calibration data and there is another
> fully functioning temperature sensor anyway.
> 
> This patch disables the temperature sensor in RTP/GPADC IP on R40.
> 
> The reason for disabling the temperature sensor is that the IP
> needs to be switched back and forth between RTP and GPADC modes for
> temperature measurements. Not only this introduces delays, but it also
> disturbs external circuitry by injecting current into ADC inputs.
> 
> Signed-off-by: Evgeny Boger <boger@wirenboard.com>
> ---
>  drivers/iio/adc/sun4i-gpadc-iio.c | 32 +++++++++++++++++++++++--------
>  drivers/mfd/sun4i-gpadc.c         | 17 ++++++++++++++++

Please split these out.

They don't *need* to go in via a single tree.

>  2 files changed, 41 insertions(+), 8 deletions(-)

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
