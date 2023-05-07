Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31671C04
	for <linux-sunxi@lists.linux.dev>; Sun,  7 May 2023 07:42:06 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-966287b0f72so142737366b.0
        for <linux-sunxi@lists.linux.dev>; Sun, 07 May 2023 00:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683445325; x=1686037325;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c7LsKf4hNT2P5PU2ttlrUN6/LYaDAzA948pWoMKox5c=;
        b=TX9CyL9LubB7HCIURG1+Ps8Dc78L8mIBTUrXGedjhosEQ9iGX02LHYszg9TadB6CIo
         46yO19v0VUHLl0c2X3gChl153ImEt4S78UNNmTdjCtmq0Mg5eSwBpbOLhAupYxwkJKNJ
         oS/a/+Ed1XYEN2PJhetpM0ZjoYqIugG/vENX+nFzkLsJqi7FBL8rbcy6dSMMmtJpmjbN
         AJ5k5+eK/CYl7DJ6BZjPwSgPXGvHR58IALV+mBNX2Zw0OyvUEq6ps8Y1zwhXJCrbdS3F
         7jbe5cLaSf2y9pzcu9lP/I2g6xCkmiZmmrQByTDD8u2loJ937K/2v512Zy+mKhzhRvjI
         XNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683445325; x=1686037325;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c7LsKf4hNT2P5PU2ttlrUN6/LYaDAzA948pWoMKox5c=;
        b=lm26XL7u6PU2Qp/0iD9LuPgXq0KmHkzvXrq5cJ45m5RALRdoiThbJ5t6jyPu07DXvS
         0OE/o3dLr5FxQ6tll8COZDpBJKjNUWrMm1HDOcmUwjfkQaH2iIPZaDhktlcS8UjRcW0d
         m8USeVmQ4RLdVrUdGEW5ea2wNRbcaflkO79u4dPBOkgsonVTgFp2lT0uRZ/d0ejnR/d1
         8Z/fybKjiFW7ZuzFOGxmnRXAVt0qkV3gqM/fn1a59/oOkhSiEzqDvmmM5wvU3inTHg6j
         Zs+Ib5owbQOd5lckVuAZz2A8t0CXW7vV8eQIThVVIwZwgmJl5+4Y5fyhYpyrctJB+yJu
         yRWw==
X-Gm-Message-State: AC+VfDzflgo4tllolN0ozjnpJSx7XVkJPn9zZYYS2rBzsCZda2Cq0Vzf
	PryLuyEAZfdov09JWdhbi1nIWA==
X-Google-Smtp-Source: ACHHUZ7nHVchL2fZ7oJnUcsF/P+oA4g2/9hI1INf/q09JsCXCI3jglN2cYEWYgHUD9C7ig0v6LaKlQ==
X-Received: by 2002:a17:907:36c1:b0:94e:e082:15b2 with SMTP id bj1-20020a17090736c100b0094ee08215b2mr5508501ejc.55.1683445324962;
        Sun, 07 May 2023 00:42:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:183b:950f:b4d5:135a? ([2a02:810d:15c0:828:183b:950f:b4d5:135a])
        by smtp.gmail.com with ESMTPSA id j23-20020a170906051700b00960005e09a3sm3350111eja.61.2023.05.07.00.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 May 2023 00:42:04 -0700 (PDT)
Message-ID: <e757679d-0037-b2ec-f5f7-6ad4e6500508@linaro.org>
Date: Sun, 7 May 2023 09:42:02 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/6] dt-bindings: spi: sun6i: add DT bindings for
 Allwinner R329 SPI
To: Maxim Kiselev <bigunclemax@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Icenowy Zheng <icenowy@aosc.io>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Heiko Stuebner <heiko.stuebner@vrull.eu>, Maxime Ripard
 <mripard@kernel.org>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230506073018.1411583-1-bigunclemax@gmail.com>
 <20230506073018.1411583-2-bigunclemax@gmail.com>
 <e38cbcdf-5963-fb00-d7b2-66d4129f9fce@linaro.org>
 <CALHCpMhp07DwL+cUZN8rwa1N_PHQ1KstOB+Gw_mCWFzm5rSVrQ@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CALHCpMhp07DwL+cUZN8rwa1N_PHQ1KstOB+Gw_mCWFzm5rSVrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/05/2023 14:59, Maxim Kiselev wrote:
>> Should this not be set up as a fallback compatible, per Samuel's
>> suggestion here:
> 
> Ok, I'll do it in the next version.
> 
>> I wonder what is the difference of DBI compatible. You refer to "helper
>> functions", which sounds like driver... do you mean some parts of SPI
>> controller?
> 
> According to the D1 datasheet the SPI_DBI controller uses the same
> registers layout as the regular SPI0 controller.
> But also it has an additional DBI mode functionality. Support for this
> mode is not yet implemented.
> So there is no difference between 'sun50i-r329-spi' and
> 'sun50i-r329-spi-dbi' controllers types in the SPI driver.
> 
> Maybe we should drop 'sun50i-r329-spi-dbi' compatible struct from here
> https://lore.kernel.org/lkml/20230506073018.1411583-5-bigunclemax@gmail.com/
> for a while the DBI mode functionality will not be implemented?

You need both compatibles, but keep DBI compatible with regular one.

Best regards,
Krzysztof

