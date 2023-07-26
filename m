Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3BD4C99
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Jul 2023 08:21:01 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-99b78fda9a8so749825966b.1
        for <linux-sunxi@lists.linux.dev>; Wed, 26 Jul 2023 01:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690359660; x=1690964460;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JiHG1lqfKtIgSn5nDbZ/v9AonJn+0BEDVLcqcbo9VMw=;
        b=eM07wKpFCUyvyGxNYzYTzgCpEijzkJf7hJHDQc+i/xA/jNEnvHA977kYSn0v/43e+H
         175ADqTKdLFh5yltdkjKiAQquGfKNC7khbSd6pR+Xsx4eMx2/MN2VZeQmwXbsE+avszl
         GhG4wA39gGhGrK9uymQluTkRgUAZDzHXgwPVmxCwfmXs210k8gYsiols3HHWcv9aT4Ds
         B5Z2BDhHLmBoPo9mYXDsSY6eOvwzWjtb7mPc02HjZIqeRrsVSMGcDpKgRM69mg01yyna
         m4onL4BptrTSDHkWGcFMJzCDBAurZ4qUl1eo6zPwT4oPh7wG6VIDUrbWXF86GIUFk+gH
         ct3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690359660; x=1690964460;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JiHG1lqfKtIgSn5nDbZ/v9AonJn+0BEDVLcqcbo9VMw=;
        b=NUKOP8NCfG9lHGFhEjaf940YtI5ul9lgfAt9qKUPnNO/BJqGTjnLW6tmvOnEFcjTc6
         gu2PoCRSvCb/k33T3FA2Kw6YzHHIiIqOKFX44d4xWXIYj5kt1yXRCe8yvMVz2AA0+fjs
         jh5hOOQK6uKYzQROSr8q1oUCcLOX0dEQ4G6IUyUDzFChgSabtEgjGkEFgQ2KKiqWqiFt
         8HHRhirMbrmQP9wT5pweUiI7jVP323NxeDvKDNs6XXw0psqVnVQf4knfqLSnJbCrQydB
         /Rcg/X/cfxVA74nQC1vNDd1EgbGufhgw94LxI2UIy3DnyJDtlFEhj8TW6QSwD8hCViap
         ilDg==
X-Gm-Message-State: ABy/qLYMgu0o7L5YNZjN9VSsY/QpZZ+GDpmRkx7VrYAOSoychhkt83t9
	DyghZt0OiNfDAUe3NlkQ5FgpUA==
X-Google-Smtp-Source: APBJJlFSv4sPrPVpORIAoXVWqnWYXffFs8Rj+rBO6g/J3M8WgKWJdW/mDG62LCvhpl6DqK28klacEQ==
X-Received: by 2002:a17:907:7851:b0:982:21a1:c4e0 with SMTP id lb17-20020a170907785100b0098221a1c4e0mr1067754ejc.56.1690359660018;
        Wed, 26 Jul 2023 01:21:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id x10-20020a170906804a00b009893b06e9e3sm9301463ejw.225.2023.07.26.01.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 01:20:59 -0700 (PDT)
Message-ID: <f24f29e9-ff06-5d96-df44-7632a933e4c5@linaro.org>
Date: Wed, 26 Jul 2023 10:20:49 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 01/28] media: cec: ch7322: drop of_match_ptr for ID table
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Joe Tessler <jrt@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Wenyou Yang
 <wenyou.yang@microchip.com>, Bin Liu <bin.liu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Yong Deng <yong.deng@magewell.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
 <98a77653-ec58-56c4-9893-3b424f67c87e@linaro.org>
 <5afcec8b-b8f6-35b0-278a-5de185e4a7a2@xs4all.nl>
 <ZG9XJCD98VWjGjTN@valkosipuli.retiisi.eu>
 <ZG9ger4WE2VWoVEF@valkosipuli.retiisi.eu>
 <158425ec-86e8-ca3e-eed8-e14b37c42730@linaro.org>
 <ce217ae6-6dd5-26ea-2ce7-95d97ef791c4@linaro.org>
 <ZL+pNUYymeXv5EoU@valkosipuli.retiisi.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZL+pNUYymeXv5EoU@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/07/2023 12:51, Sakari Ailus wrote:
>>
>> I don't think this was merged in v6.5-rc1. It's not in linux-next,
>> either. Another month passed...
> 
> These are now in the media-stage tree
> <URL:https://git.linuxtv.org/media_stage.git/log/>. Assuming nothing goes
> wrong, these should end up in Linus's tree for 6.6.

Great, thank you!

Best regards,
Krzysztof

