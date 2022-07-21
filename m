Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E364680
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 15:38:25 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id m12so2306972lfj.4
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 08:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UqCa+wJI049j4zTLACQna4vEDfj2rqaLjlldqQdrtbc=;
        b=Hr4EUI+tJ5IR28Fd9rlLrL2Jhdl6y04tFTZ7SiEj8y1JW0oLBxnYtIiAxp4fV/1ml3
         XNc2IHUMggG0rlz1xVNCcB8Ij7GdlfZJng1lvQzRta+lFGgEuqvRcPk1VAyXG6/rz6L3
         24N7v/a2z6VqnTCmtZRoxq9+R94zChXy64OuJ+ofzweytxFPcsC18NRkN0F/inqmx65G
         8EtBrYyOKrnRMNd1zVShLukQdFrlhcWvnBxH1Skm/pMFhtK5dIa0hnnAVck4MmS80fWc
         O4GIa+aNN+YT4KPfVRPywl0b25PpIhaAQOpzc4dspd4HUkTiGvC7Qox4l+D4eMYzliSj
         M93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UqCa+wJI049j4zTLACQna4vEDfj2rqaLjlldqQdrtbc=;
        b=bjEAho2VcmCsOfBbtWdh4QVXF+lTClD450617i+5TcG+XRj/aWtnngrqsOqL20RPMK
         SSsZxLWeCqiXlRhPdLCwrnjiEK+kMevcpt5VVCZW/+xrDDboWzxCdNiQLRd+aiPv0xqz
         +dOXB8Mc0Kgs1l9eFt2Xl7BJCvdJa798VTK/Qh5Gk09yS+11hHfrdu9MjFaFWN66rXLD
         bKC86ZFhTsoYrB1OvIAEa8HuEIkMf2zlk+ufq+aH8kGjQioc3+QzsVhqc1j8ebdQxk0X
         xD4P7kghkhP+PEuaFOqH3pgJZlCIDqAjyiidACzvL/E6t5osLG6nWyDtcJ2NWETlVdrK
         UnBg==
X-Gm-Message-State: AJIora8ItvuXZaB2XJNiajOb7PXTIyUeU1yQsvxtcF4SAau1N1T9y+fi
	46jQzZ7PSqvNKxjPpbCSt/qU2Q==
X-Google-Smtp-Source: AGRyM1u+XAg5Gfu+MlpMWaQN3hIuyfigsjR8EO3U+oTkp4M+3abIhECXSY47lzIOdxD8vuPZLJkGzA==
X-Received: by 2002:a05:6512:108d:b0:489:e640:df8c with SMTP id j13-20020a056512108d00b00489e640df8cmr22708209lfg.332.1658417903698;
        Thu, 21 Jul 2022 08:38:23 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id 8-20020a05651c12c800b0025de7126bf1sm448863lje.89.2022.07.21.08.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 08:38:23 -0700 (PDT)
Message-ID: <6468e7b1-b253-53bc-c81f-2fa6b75194ae@linaro.org>
Date: Thu, 21 Jul 2022 17:38:20 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/6] ARM: refresh defconfig files
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Alexander Shiyan <shc_work@mail.ru>,
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-oxnas@groups.io, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-sh@vger.kernel.org
References: <20220721141325.2413920-1-arnd@kernel.org>
 <20220721141325.2413920-2-arnd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220721141325.2413920-2-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/07/2022 16:13, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A lot of Kconfig options have changed over the years, and we tend
> to not do a blind 'make defconfig' to refresh the files, to ensure
> we catch options that should not have gone away.
> 
> I used some a bit of scripting to only rework the bits where an
> option moved around in any of the defconfig files, without also
> dropping any of the other lines, to make it clearer which options
> we no longer have.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Samsung bits (s3c, s5p, exynos, mini2440, tct_hammer) look good:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> # Samsung

(I did not review the rest, though)

Best regards,
Krzysztof
