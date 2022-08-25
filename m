Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F0F7B
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 06:13:13 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id s8so958133ljj.5
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Aug 2022 23:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=wXqYQNt6cQwwovEWaPctQuIwu12r6o/ryFEQHXvmidw=;
        b=Z8V/D1iHr+3qt3pSFcQ5ZOeH0iO4G/pHn+XoNotaIYjxtt+oIh0RJD9YL3fzn6NmF2
         keRguEOY+JCT3rPJ4clH8kP1+xBJEQvelpo2RA91EyugRKUr7jACpJxh49EkA75pYy+R
         4u1FzXdV5fEX3vnN7Uuu1Tcxfrs4J3riE0OLKIGGS8Wuio93l6VtWFG3NUMbWDRZ2XIj
         m3cArYVlka9n7JbWg2A0+Pbrvx+Afr3ku+XlfM8+eqZ6HURCFjdxteLrXE0IuPmQJzai
         lUJDfZtzcC0W0+lYdbZeAgdnRKGwUbTbD/6hq31m3HOs5yzAyK5n0yqIel30J6Tw8bSs
         OHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=wXqYQNt6cQwwovEWaPctQuIwu12r6o/ryFEQHXvmidw=;
        b=UDP5xsEabnTdAw6aNsFNcU3cFqihapxK0DTveS5KFtXo+JpEJw/3fueNZ16JvjOErh
         JBAPkevJOkaDgRdXrevL8onAfOqR9zi4VUQjyUueajctKrnwcXqEvhTG7h7vlpXfTQxe
         2ZYqHMBNdMVZUoJ9Y+7m/+lZlK80j/asWWCDVQ0XeVmYV4E5ntegYM7FdbnB6BO3Xa+2
         n3rCncRGnLP8JTTfI70U49rpxaHdKEt4U6F9DRjaKMqMplbNpklAySMR3NCNhrdqx6qu
         iroTYo9M4HcT7mO078Dn94y5J5wqPrf4+dTU1RGgizHzOosUzmplb1bEYeVPN3/nhdyx
         Hb+g==
X-Gm-Message-State: ACgBeo1oEnh+eXXPcvdIZEitZLBvw9RemcZRk9B9Ia9By9qwdXYiQ0jV
	zJ0x09iOme9TU+GCrtrzqMzyCA==
X-Google-Smtp-Source: AA6agR4m4Z9GwEQ+k4jSc0Z8Nk2/b5GFxRJY/8LmssR1LVZFSvwsKEH0v/tzq4so1SvajWcwWWcQxw==
X-Received: by 2002:a2e:9913:0:b0:261:ccfa:da6d with SMTP id v19-20020a2e9913000000b00261ccfada6dmr580559lji.269.1661407991448;
        Wed, 24 Aug 2022 23:13:11 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id p3-20020ac24ec3000000b00492b494c4e8sm301859lfr.298.2022.08.24.23.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 23:13:10 -0700 (PDT)
Message-ID: <9f293197-b4f9-c53c-ead4-08e2113d9c8d@linaro.org>
Date: Thu, 25 Aug 2022 09:13:09 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dt-bindings: mfd: Add missing
 (unevaluated|additional)Properties on child nodes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Tim Harvey <tharvey@gateworks.com>, Robert Jones <rjones@gateworks.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, - <patches@opensource.cirrus.com>,
 Steve Twiss <stwiss.opensource@diasemi.com>, Chris Zhong
 <zyw@rock-chips.com>, Zhang Qing <zhangqing@rock-chips.com>,
 Alistair Francis <alistair@alistair23.me>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Renner Berthing <kernel@esmil.dk>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20220823145649.3118479-4-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823145649.3118479-4-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/08/2022 17:56, Rob Herring wrote:
> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
