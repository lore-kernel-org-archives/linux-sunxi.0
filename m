Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BE21365
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Feb 2022 08:02:29 +0000 (UTC)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 84BCA4033A
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Feb 2022 08:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644912147;
	bh=p0wXUzG9Qlg9XGpXItbSdQyLJQ63vtplPmOBRka8DjY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type;
	b=ueKf470uZr8T0mLy4tJiDdp0uY5I+EwSMNPr5nEw8DH0H6ISVKVWNkPkQRDsxs2O2
	 w+KO8UVV7okZVYigPBYXydBSXjiNDtFRTgiBD4ypYT+Y0cDTsRW4hDFD5ZWVNFcYSP
	 Xkq90TQHyw2aQdC6t5GQUQrJtl3D4ig4zndZ/KF0Kkb4FbSeOebaEqbk6ofSgepvyE
	 jPbiixd6uchtzuw46P3P2/sBhBZfFc+p5TrcjC4pL/iS4NxupC7yoqKhEQ2ubq2+9m
	 L6xhNbCbUS9sPsXAHs1fEehegEM1LQDQqxDSG1o2mIIF8W+Vy7VXroqijwxdEDlI4o
	 StIaEnVbRWkxA==
Received: by mail-ej1-f70.google.com with SMTP id la22-20020a170907781600b006a7884de505so6935338ejc.7
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Feb 2022 00:02:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=p0wXUzG9Qlg9XGpXItbSdQyLJQ63vtplPmOBRka8DjY=;
        b=HlAkwO1PqFuCGWT1PqadX7KiO/GX5NbIFt8/UgBrpICa8y+GnpjuhbMp0IC2U5ypEX
         YMpofNhNraniYteiRyLkspKCPqZIDmrPysQeg60kxWcnh6kHkuvJcS1MyWutVts/C9Mw
         vHtJMeQxIjjeJnRECLfTDDPOiBUB+pk5H36MMxxNVIa91Uxoes80UgljFMLWVgOOsqWo
         wQHkiXOQyHwPah0eebighrkE+GyS/C2dtLKJTRDMBUukGdTYMQWiQP6hs4PqLz2CG0lH
         fsWYjTw8Qrxb4ZvdStZOynkvomtfKwyybazJ5UPhKSLio3L3AZZ21dvldAvuGUkcOuo3
         tDPw==
X-Gm-Message-State: AOAM530PJznSh5Aut7zvIdRSakwX/Gxg49Ve8JGDSgho+VSSjLXK+6Ax
	4vkDVU+J2DQ2bmNW58S19xLYRGVBF30g7Vz8+ZeycaeTWF0vOp4GV86zLQUhY3Z78fyT74/rStP
	j6fg0jFYFjLkWHq1yk9v9n2mW9SGBLgo6msDtSaGi
X-Received: by 2002:a05:6402:424f:: with SMTP id g15mr2757489edb.158.1644912147060;
        Tue, 15 Feb 2022 00:02:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJL82lo1kjPeRqjS+9jNzssv8tXjpHeHazeL4p0HZJxneIppz7pU1JsXMs2O9NT8eS3yVbFg==
X-Received: by 2002:a05:6402:424f:: with SMTP id g15mr2757450edb.158.1644912146878;
        Tue, 15 Feb 2022 00:02:26 -0800 (PST)
Received: from [192.168.0.106] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id jz17sm11534425ejb.195.2022.02.15.00.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 00:02:26 -0800 (PST)
Message-ID: <7df71f8d-cdc3-4b2e-cf0a-7112eff28142@canonical.com>
Date: Tue, 15 Feb 2022 09:02:25 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 00/15] pwm: dt-bindings: Include generic pwm schema
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>,
 Rahul Tanwar <rtanwar@maxlinear.com>, Jeff LaBundy <jeff@labundy.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Vignesh R <vigneshr@ti.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
 <20220215074030.3nugwproxjh3lwhl@pengutronix.de>
 <CA+Eumj42Hojp1m4deuWnqMOaaNaupTSkzPaNbL_0eyBL-aDi_g@mail.gmail.com>
In-Reply-To: <CA+Eumj42Hojp1m4deuWnqMOaaNaupTSkzPaNbL_0eyBL-aDi_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/02/2022 08:59, Krzysztof Kozlowski wrote:
> On Tue, 15 Feb 2022 at 08:40, Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
>>
>> Hello,
>>
>> [dropped Anson Huang and Yash Shah from Cc: which were not reachable for
>> my last mail]
>>
>> On Mon, Feb 14, 2022 at 10:21:39PM +0100, Krzysztof Kozlowski wrote:
>>> Hi,
>>>
>>> Changes since v1:
>>> 1. Add tags.
>>> 2. Adjust subject (Uwe).
>>
>> However you only took a part of my suggestion ...
>>
>>> Krzysztof Kozlowski (15):
>>>   dt-bindings: pwm: allwinner,sun4i-a10: Include generic pwm schema
>>>   dt-bindings: pwm: imx: Include generic pwm schema
>>>   dt-bindings: pwm: intel,lgm: Include generic pwm schema
>>>   dt-bindings: pwm: iqs620a: Include generic pwm schema
>>>   dt-bindings: pwm: mxs: Include generic pwm schema
>>>   dt-bindings: pwm: rockchip: Include generic pwm schema
>>>   dt-bindings: pwm: sifive: Include generic pwm schema
>>>   dt-bindings: pwm: renesas,pwm: Include generic pwm schema
>>>   dt-bindings: pwm: toshiba,visconti: Include generic pwm schema
>>>   dt-bindings: pwm: brcm,bcm7038: Do not require pwm-cells twice
>>>   dt-bindings: pwm: intel,keembay: Do not require pwm-cells twice
>>
>> ... The actual patch has a space after the comma, I like this variant
>> without comma better as this is a compatible string.
> 
> I am confused. My patch does not have comma after space. Your reply
> had such in the subject, but not in the proposed new subject you wrote
> in msg, so I left it as is. Without comma. If you still see comma, it
> is something with your mail client.
> 
> See:
> https://lore.kernel.org/linux-devicetree/20220214212154.8853-12-krzysztof.kozlowski@canonical.com/T/#u
> 
> Also reply from Vijayakannan does not have comma:
> https://lore.kernel.org/linux-devicetree/20220214081605.161394-11-krzysztof.kozlowski@canonical.com/T/#m80af695f2c751341bc971114aefa00ccc929a3ec
> 
>> Also a # before
>> pwm-cells would be nice.
> 
> I can add this.

Just one more clarification - you proposed also to remove "pwm:"
middle-prefix. Shall I remove it from every patch and use instead full
file name?


Best regards,
Krzysztof
