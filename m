Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C623D978
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Jan 2024 19:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WRwQ1u5I"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40d5336986cso43972195e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 09 Jan 2024 11:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704829971; x=1705434771; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BI/48/E7Md2QE++iHyjNqxZ4Ipvc83BNLpeu7Fm4++A=;
        b=WRwQ1u5IGFZuGOKzCuJ4VVrpGYtlIjYD33iwdu9ccmhBekjKhgxqikWbZ/tarFgxQ0
         513RCXP3hVY2By75/oBQkvTKRF8Pss82YV8vLcDydPOo3HW8ebHxYnX5/iFrTwIWx9ek
         cRnsoNaGD1suIiFmw6b9fXGDJ3kwJtbRt8XFQU3lPoBYExSmxuIEAWwkELpDkfcahVfU
         DZ+1ByASZb5uz3jyq9y2FzsjOsXI5+6q7KL3gaqfxeCEj3Wlp+on64p9N3kAj3IIyRIU
         udUtNYuELMEZUAqRAI1JG0K8UDA9+JNJ9H4nmlRdnCyhE9SLQGe3CAxpvAo6K0Uyu5p6
         T8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704829971; x=1705434771;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BI/48/E7Md2QE++iHyjNqxZ4Ipvc83BNLpeu7Fm4++A=;
        b=liYITHReW1vzMgQtmL6wff4DqqzkV+Wz+yVSUXF9dtg1AboSJXu/lMBGmbq/MKZR2c
         GGoV/93dMI91glpKaNRJcdWILEPYUTwOT87LXVaCUlMDRIbldtum3ta2MojG411gdrLv
         iLDEUUZtJwpcD2wY6NXoxW4kOVypBZzEtXcO7CIFNutZLpwFaouJaX49yPjyoYiVyjCv
         +Q4IqM75bd3QocI8cBm05wRaMebH2Kf3c0yhPeDwwsz6tLC+tvpMrGO18iawd7EDuLtm
         KW0poZjyXLohjk7q5sM2clRIsroOsNjS6Aiz8eO5UwjZsc7lEXpKgPGK4aQfr/YLRalP
         EdlA==
X-Gm-Message-State: AOJu0YwPG1tN6bnBCXjGJMOMxjsspFUsCGDxK49P/QIUtcda5GZtc2oD
	q3mzRXOSiIz6+L3ANrNOgInpzkbjZnQGew==
X-Google-Smtp-Source: AGHT+IE6HSL59hPqBUMbNpE6skT8szvU3eRO5hKrvBl3DRfpljPdLWzn6Ca47i5HcCIyTcytaHSX3w==
X-Received: by 2002:a05:600c:4504:b0:40d:9255:4aca with SMTP id t4-20020a05600c450400b0040d92554acamr2804029wmo.119.1704829971274;
        Tue, 09 Jan 2024 11:52:51 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id w1-20020a5d6801000000b00336be33649csm3193258wru.9.2024.01.09.11.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 11:52:50 -0800 (PST)
Message-ID: <2815d43d-d016-4656-9ad9-33d4af04f479@linaro.org>
Date: Tue, 9 Jan 2024 20:52:48 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] dt-bindings: gpu: Rename img,powervr to
 img,powervr-rogue
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Adam Ford <aford173@gmail.com>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, =?UTF-8?Q?Beno=C3=AEt_Cousson?=
 <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Paul Cercueil <paul@crapouillou.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-mips@vger.kernel.org
References: <20240109171950.31010-1-afd@ti.com>
 <20240109171950.31010-2-afd@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240109171950.31010-2-afd@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/01/2024 18:19, Andrew Davis wrote:
> This binding will be used for GPUs starting from Series6 (Rogue)
> and later. A different binding document will describe Series5.
> With that the name "img,powervr" is too generic, rename to
> "img,powervr-rogue" to avoid confusion.
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Andrew Davis <afd@ti.com>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Frank Binns <frank.binns@imgtec.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

