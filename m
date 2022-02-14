Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54007C8A
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:03:12 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 467923F1B6
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644872586;
	bh=2bp2Rosxu6+8ZhH/EAY6coxFH5lGR8Dxl8BwV5vJAno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=GyBG5qnie5SYEK6t+mzBwe6I+QC3QBsorZzTpJy741H0Px8qrnxVpeA4TzMgJ+l4J
	 u2KwdmVIOARsCHYbIG4KHaVYON+soBEfR1WROzxUbshV8cCy3ox7XhAKqPxesQuiUo
	 pmbIOwGoC5I1TrkX68d3osnFbDbRutE1EjumwQhBeAbAV4b4SyjuBKOVpsJEMllP8/
	 2o5DNKNUbAVb4vMOJVnhiw2aGOLXJuLuCkXst/n741ahbScziWtLnCJQTBG1LCoM7W
	 KjvKjYYoED4JI0CvxcIdQn2DiZ+4wdnGg20W+j9B98az8ySbF9hmqKduhCj52aEtsD
	 I4V7EFAc5YZ5g==
Received: by mail-ed1-f72.google.com with SMTP id j10-20020a05640211ca00b004090fd8a936so6409641edw.23
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 13:03:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2bp2Rosxu6+8ZhH/EAY6coxFH5lGR8Dxl8BwV5vJAno=;
        b=kqEaaOk4mI+ueAgi71lwPzaTek0EYVzjPoE7zlefLJAutXTSbB50f4gDg6bzQfbwah
         PljNPvgBEcCN5OYEw4tkFPBBfEJC2uNIESsY9xGBg/+DQGchwI+ijjtXT9GtJbwlGLmG
         y5H9yHdJ0PnziZ4KFQbmS3nMC3ioeSp4VaEvmqGyaOs4fy86SpKEyZhRw9qJdToWJMFm
         napk7Hg1J7nP+f/sIL6eI/PQeD6q/VTnrd4kdfJPNEAOAn3peTtWY572uQ+zaJDPda8f
         SiouS8w7xxr/JbyVGdWhIZCvVWAfppvh5xeQUYqtP7BxLl0+0qxEHmqohUI3b3nsshLY
         X3CQ==
X-Gm-Message-State: AOAM532PBVfZqOnfrcUokSRRj9ehToZ4iv/9PIi6+0v8kbD2awb51jb2
	nSfQJxvq2HWGr3Et5z5Juv9MtV6sBnHHu8Pt1/p/UvIHpV9JPqJJ0jlaP4VGv7yaVPhelpXvn2X
	hVdmWI8zW6J0+gIeliH+nTl4zQBrtTFda1V/iJuWv
X-Received: by 2002:aa7:c3da:: with SMTP id l26mr727084edr.294.1644872586069;
        Mon, 14 Feb 2022 13:03:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2FJZ3WFrmr3yKtdBu95hKE7kW2/adNT3dVxtT4u/B6q+4CQFvbOXViM594Gt5SL7EJZdGvA==
X-Received: by 2002:aa7:c3da:: with SMTP id l26mr727056edr.294.1644872585884;
        Mon, 14 Feb 2022 13:03:05 -0800 (PST)
Received: from [192.168.0.106] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id j21sm1153464ejj.193.2022.02.14.13.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 13:03:05 -0800 (PST)
Message-ID: <f9cdef5e-a52b-03ba-a069-e0bc16ccd595@canonical.com>
Date: Mon, 14 Feb 2022 22:03:04 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 11/15] dt-bindings: pwm: intel, keembay: do not require
 pwm-cells
Content-Language: en-US
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
 Philipp Zabel <p.zabel@pengutronix.de>, Anson Huang <anson.huang@nxp.com>,
 Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>,
 Rahul Tanwar <rtanwar@maxlinear.com>, Jeff LaBundy <jeff@labundy.com>,
 Yash Shah <yash.shah@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Vignesh R <vigneshr@ti.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
 <20220214081605.161394-11-krzysztof.kozlowski@canonical.com>
 <20220214182824.gevtqbtv4qrddjqb@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220214182824.gevtqbtv4qrddjqb@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/02/2022 19:28, Uwe Kleine-König wrote:
> Hello Krzysztof,
> 
> when I read the subject line I thought the patch intention to be wrong.
> Maybe make that:
> 
> 	dt-bindings: intel,keembay-pwm: Don't require #pwm-cells twice
> 
> ?

Ah, yes, this sounds better. I'll send a v2.


Best regards,
Krzysztof
