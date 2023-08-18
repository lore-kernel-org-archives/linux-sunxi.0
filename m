Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1811663B4
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Aug 2023 10:19:57 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4fe27849e6aso1052145e87.1
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Aug 2023 03:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692353996; x=1692958796;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pb0pctZb8QtUfFQr+rA7AG4CHO5Qtd4k3pKgwlh5qck=;
        b=Pa05IZmzxUof/JTX5sYgmbso85hDS8hYULdKoqRJ9pa7oEJj3KKPJvlp8aKsu7BkWe
         7LZCZAAJkdeFzE8FevvQGusqrJtgmxn63kAVxmqmD8CfifcwAxo4VH35MPrbg9GbhWMM
         4Pw0oOpcSQ1TqydswzrxSNGG6n0QblyYXklq1LMn07Tim5a8r7oIQu4TBSHlU18VTiTy
         sBll8RKZRHt1X3nHO72Gp4owtRF1Gac+qGE0ZG+H+wdJvjIc12gGSim0WTlF1kEbpD4M
         /2t9f30R9G0Ku/t4SGWRcIvvtXOz0qNl7O68eEhByuz5Q9l7b+4Asm6TdNGwsKlLpIQ7
         EULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692353996; x=1692958796;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pb0pctZb8QtUfFQr+rA7AG4CHO5Qtd4k3pKgwlh5qck=;
        b=RRo9KI2xw9+WOnNVrp9RasHFUgJL5o5I656iw0YnCJ157wd52/UqWSJ+9mIIPVr++G
         F5+JCSNOyANJB0Z4ktm55ARtlJtILf7QJEYNzO/EFiftPuW3m5bUiZ7j3Lf4+RQSCCZX
         wybgIIM1dPRJW6hx5FiOqPtBJMB0Loc4wZL0rBugQTBJfrGPy7Ft/b0v208rEkPNtA4W
         k88F60s5i9iE71cS0KiDbjqhfiBiPIcO2z3jg8tRZ1gBLdklLTTDY59njtok9C3n4f1b
         R2BWz3lp9+TVPzb9Fonvwc6Gz3llKWuu0jaOyFd7YQvurQDXIT6baSqvSytoniBpACU0
         J7+w==
X-Gm-Message-State: AOJu0YyXFfNXdxLcC/5H4GCiqKy6dLE7ncc+eYUOBCM1bwSE5KGWEPCu
	H0pKqUYIDidf+broiSbreslHRQ==
X-Google-Smtp-Source: AGHT+IGRjpQiG6m5okW2Rjffn2dFFyB2X81OzXUKgZV+AmI+W2jGdx/QNJfEpqKmEPeD398d/xB9VQ==
X-Received: by 2002:a05:6512:3d08:b0:4ff:727e:9e67 with SMTP id d8-20020a0565123d0800b004ff727e9e67mr2032630lfv.40.1692353995812;
        Fri, 18 Aug 2023 03:19:55 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.195])
        by smtp.gmail.com with ESMTPSA id k12-20020adfe3cc000000b0031ad5470f89sm2306468wrm.18.2023.08.18.03.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Aug 2023 03:19:55 -0700 (PDT)
Message-ID: <04f7f779-e92e-ec7a-994d-19e555e5c460@linaro.org>
Date: Fri, 18 Aug 2023 13:19:52 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next v2 11/12] mtd: spi-nor: nxp-spifi: Use helper
 function devm_clk_get_enabled()
Content-Language: en-US
To: Li Zetao <lizetao1@huawei.com>
Cc: alexandre.torgue@foss.st.com, angelogioacchino.delregno@collabora.com,
 christophe.kerello@foss.st.com, christophe.leroy@csgroup.eu,
 dmitry.torokhov@gmail.com, frank.li@vivo.com, geert+renesas@glider.be,
 heiko@sntech.de, jernej.skrabec@gmail.com, jinpu.wang@ionos.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, martin.blumenstingl@googlemail.com,
 matthias.bgg@gmail.com, mcoquelin.stm32@gmail.com, michael@walle.cc,
 michal.simek@amd.com, miquel.raynal@bootlin.com,
 nicolas.ferre@microchip.com, paul@crapouillou.net, philmd@linaro.org,
 pratyush@kernel.org, richard@nod.at, robh@kernel.org, rogerq@kernel.org,
 samuel@sholland.org, stefan@agner.ch, u.kleine-koenig@pengutronix.de,
 vigneshr@ti.com, vz@mleia.com, wens@csie.org, yangyingliang@huawei.com
References: <20230817024509.3951629-1-lizetao1@huawei.com>
 <20230818074642.308166-1-lizetao1@huawei.com>
 <20230818074642.308166-12-lizetao1@huawei.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230818074642.308166-12-lizetao1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Just a reminder that for the owners of the driver that we'd like to move
all the SPI NOR controller drivers to drivers/spi and that until then
we'll no longer queue features for the controllers, but just fixes or
cosmetics patches like this one.

Cheers,
ta
