Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17832102
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Nov 2022 08:48:24 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id z4so12311168ljq.6
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Nov 2022 00:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DyUL1Og+jo/ZDOoPr1xJAw3+yzTWwfhyA3J40qaa04Q=;
        b=dr+YzF1C/E9DNwFAV4PvvIjJxwtxMPOZ6crnVboKYsr67l1ag6YTekN1wmi5vfztZd
         SfAt7DZLkzNlycNIzmURTmrED9EUMQ7BHBDOJT3ToK5KRJJyitHn8e/dqEizbz1JYgk5
         wDHmyCOIqGC5xPYaG/H5oBbns2FWIat46Xp0IQSLDQwAkecQ47Wh11gTfhCP+KJTs54n
         HatiPP6UXkG0Vekho88t3Sm+YogWgFkwVvgLvYVvx7QVJohTv4KsMGM0XTzYPKC8P9lh
         6F8zCM77yxVV4lRlljET+W80ArkhgPNhXKSlx0fiGzP39zxvD9bnycHiSyw1JmPEnZbN
         6lXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DyUL1Og+jo/ZDOoPr1xJAw3+yzTWwfhyA3J40qaa04Q=;
        b=YZwMKHwBWLW+wG2Esa+6I7aXNvDPQVI+gEP6S0SLISvTB1M5W8tdSd3uTelDvsjQn3
         dVIH0CsDTewNPaUzDLD0twgcBLwUGzudvkBQCaiMvqfOT+WitOrbIXZqsS7Dpvrot9Xk
         KImn7q1+vfn2eMjcTfQn/qIiGBEjDVmYPW6ZXLcxpWgVBvaa0IPYuVJZ06b2MFEXFPhI
         GGt4U+euSB4ZPAO3EGZh/bOjiq6GttnCwypBo8GT63vzPdhydbZeYTMnt/3Bz3S5bjAv
         Jp1RwIezroPlKvDqLM1Y81YDSgYHzYL8vu8ioQvwp08H6J8ChxhvkhuKJivTi9WUoQKB
         qc7w==
X-Gm-Message-State: ANoB5pnYho3NCX3/qsuKghflOJk/ZS8Jbsga4FYZA5n1GipG97YX/bnl
	F89QFgot7O1xmdnFV36ZpCh5VQ==
X-Google-Smtp-Source: AA0mqf6Emtt2xBvkwqUH0D6tAfeP1i9Zs/1xVxKY56Q42DNsjCvlHvNu8pLcBLZD7SKHBjNDZ9j+bQ==
X-Received: by 2002:a2e:8619:0:b0:279:88ce:468f with SMTP id a25-20020a2e8619000000b0027988ce468fmr6244869lji.312.1669625302909;
        Mon, 28 Nov 2022 00:48:22 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v3-20020a2e9243000000b002770eafaafbsm1161654ljg.99.2022.11.28.00.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 00:48:22 -0800 (PST)
Message-ID: <0e07745c-7bf8-ef1b-5ac9-6fc40031d7b6@linaro.org>
Date: Mon, 28 Nov 2022 09:48:21 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 5/6] dt-bindings: arm: sunxi: add Rongpin RP-H6B board
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Kaehlcke <mka@chromium.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20221127073140.2093897-1-uwu@icenowy.me>
 <20221127073140.2093897-6-uwu@icenowy.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221127073140.2093897-6-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/11/2022 08:31, Icenowy Zheng wrote:
> Rongpin RP-H6B is a development board with RP-H6C SoM, which uses an
> Allwinner H6 SoC.
> 
> Add compatible strings for it, including the board-specific compatible
> and the SoM compatible.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

