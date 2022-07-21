Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDFC4680
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 15:39:36 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id o12so2295840ljc.3
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 08:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oqVQwNQbcwLQWg6kfm6rj9WKvgY4OIEgQOzUXlpBlmg=;
        b=bUbA0eHhlHZLz/7ERfxE+ujHsrXIi/1BLF0UUgCTGD2Op4a9uPqxE8PfjDUnh0vkrM
         NoiNYlMDhoMOEIMth1a4LodxokvPtNEiBNqvhrTtMsiqk5AvOOTWVvtkX0vcdar+TZ9P
         cuHmDRDRj/iCTgpFnlWFwejofmUcNLUdW+0FeB/h2HYA1p1jGTJseRZ/c1Dk0fKehi12
         XzY95w37ZgrMXEVRmU96gkg5e/DspC1gFPZ/ekbdgflGdDWjEXquopvsQwGp1I4qEgn7
         d7QKdgpNbpN8vahcEQWCFuFNkozJDOmGqU5v/udTFpQ1oOJ+f117PzP28vOHlt71WwUc
         35AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oqVQwNQbcwLQWg6kfm6rj9WKvgY4OIEgQOzUXlpBlmg=;
        b=EAXJaVHx4iDfwpokiZJdHHagIl5tjvVtYKDs2RT1A4QFWHyxuaLXAG4YCxJap6y2v4
         jNb9RKT8sg742NA7B8srsx4+QtWatxYRPnvKMtcTReQtWWuz8mkAiK7JmBlw/mSoahiq
         ZptagV+mF8oG05Akfa/NfKZ7ChKW70eBXArENrHljfTrbMNKmSTDMoZlMm+pBxtz8K/x
         fWpylgfN4ajbPquyq6+LBxBozr3vScg8UT8vNbNkSoBeQuuK6Tc5N2v4Ogx8OEUO4X/g
         anb48afhspH5Vx5iprNgM87HGbqjQLEa8dyiqWqZE/ZSl0uI1L8aPVyAJ6zFv+Z0csE3
         OmUg==
X-Gm-Message-State: AJIora/diwdfFBRIobk7MHrTK1Z7oSuhjFEsMyg8CCgVkP86ljRViDXF
	81BM7w7tHiERH5QKshVZxi0kAQ==
X-Google-Smtp-Source: AGRyM1u1EiuENGOYTFtFOFvt+gosoK/tppAX7Zpo5TZqB7ckZKOx3LwixuugOACtM48KFq3goni/DQ==
X-Received: by 2002:a2e:953:0:b0:25d:5c20:2265 with SMTP id 80-20020a2e0953000000b0025d5c202265mr18734344ljj.348.1658417974213;
        Thu, 21 Jul 2022 08:39:34 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id o23-20020a05651205d700b0048a35b93b24sm504903lfo.181.2022.07.21.08.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 08:39:33 -0700 (PDT)
Message-ID: <e3b0a57b-e987-9be0-75e5-40c0d7e41310@linaro.org>
Date: Thu, 21 Jul 2022 17:39:31 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/6] ARM: defconfig: remove stale CONFIG_ZBOOT_ROM entries
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
 <20220721141325.2413920-4-arnd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220721141325.2413920-4-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/07/2022 16:13, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The default is always 0x0 after commit 39c3e304567a ("ARM: 8984/1:
> Kconfig: set default ZBOOT_ROM_TEXT/BSS value to 0x0"), so any
> defconfig file that has these two lines can now drop them to reduce
> the diff against the 'make savedefconfig' version.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
