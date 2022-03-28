Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C095118D;
	Mon, 28 Mar 2022 10:47:50 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id r13so19723627wrr.9;
        Mon, 28 Mar 2022 03:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to
         :references:from:subject:in-reply-to:content-transfer-encoding;
        bh=S4BUcd6hJObrfpqKxdRcJRoKACX0pcH5PLnHV9ghRjU=;
        b=B9rhYXNFCJG8FVrCwa5K+POuffvNj9XzTQKCajpz8pCCAe58zDB/aU9DL5fqtqJWAI
         ky54WS/d9TWKJ7aQI2ZqzXMkcPHxKAbOnYADOVDTZRl4K4EZ6nKuXHMRMOUlTa3pZvcK
         Y8cetVauSkzbUxvUnWzmQRJ7x7hfdMpVLYHTE3/Ae2k2izID9wHS/jw5EaXtUzwHEHAR
         K1L5smUPkm9azb41ja7r0hy1dRp/X4/xrOgLDr5HfLY+yO2hJuHnUmcoNrEBPPoA5ZAp
         n8/SKRsojeJxYPxX0tjb6jEnopKhJ1kNHYloxuyu3SfO3NpPdbAhGWlCkOMUqOnXfwdd
         bWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=S4BUcd6hJObrfpqKxdRcJRoKACX0pcH5PLnHV9ghRjU=;
        b=ZLnsr0gnozHk5OF5Fjb3z9pWQp8I7Zru8RniPfZQsaJv9b6ToS2djEN3nB2N3hsvhQ
         /AgaC8M4YFyHjOfUrUMhEJBtmiKeBrIloyTNCTsyyfltbDif5kdd1OUcQJ/KYeSYTO+F
         6PSkwWBWX/JJXyiDMoPJP1lWkIyOT12qBJRxcgt8I+UMGglL219hR8glucIBOe8fsb+Y
         jl5s76MvL8P2d8RwhwJseQNOoEGtLdjN362CuxbIzJbqPWK5YN2QsNFnBV/cRKE9Lasc
         3GDh1mOYUVlDOkBuWNx+nFi7r+1lUI31PYcD5MBu82zcbxbbLl7WpWV6SLwlxuPu7ct3
         V5LA==
X-Gm-Message-State: AOAM531ZJ8KoV3ZdzIEd89Ec/nHqPqEpWLU4jIGXxFQnij6Gfw6bhwiN
	hS4dNrl2TWOGECNLNC6lFQU=
X-Google-Smtp-Source: ABdhPJxpNsUPF4FVDfJw3TgkeBx1g5iROwUOuCmVKrZ2Kp8QiOuC95uyQZ19znx7Kf29FzrQ8qx3og==
X-Received: by 2002:a5d:404c:0:b0:203:ea4e:3c07 with SMTP id w12-20020a5d404c000000b00203ea4e3c07mr22646484wrp.597.1648464468913;
        Mon, 28 Mar 2022 03:47:48 -0700 (PDT)
Received: from [192.168.0.32] ([137.101.87.65])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b0038cb924c3d7sm11665275wmq.45.2022.03.28.03.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Mar 2022 03:47:48 -0700 (PDT)
Message-ID: <c5eeca79-38b6-eb9f-1d78-1685aa1cca6c@gmail.com>
Date: Mon, 28 Mar 2022 12:47:46 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Ansuel Smith <ansuelsmth@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel@dh-electronics.com, linux-mediatek@lists.infradead.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-oxnas@groups.io, linux-arm-msm@vger.kernel.org,
 linux-unisoc@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-realtek-soc@lists.infradead.org
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <20220328000915.15041-2-ansuelsmth@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [RFC PATCH 1/1] ARM/arm64: categorize dts in arm dir and fix
 dependency in arm64
In-Reply-To: <20220328000915.15041-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/03/2022 02:09, Ansuel Smith wrote:
> - Categorize every dts in arm directory in subdirectory
> - Fix Makefile to address for the arm subdirectory
> - Fix any arm64 dependency
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
[...]
>   arch/arm/boot/dts/mediatek/Makefile           |   14 +
>   .../boot/dts/{ => mediatek}/mt2701-evb.dts    |    0
>   .../boot/dts/{ => mediatek}/mt2701-pinfunc.h  |    0
>   arch/arm/boot/dts/{ => mediatek}/mt2701.dtsi  |    0
>   arch/arm/boot/dts/{ => mediatek}/mt6323.dtsi  |    0
>   .../boot/dts/{ => mediatek}/mt6580-evbp1.dts  |    0
>   arch/arm/boot/dts/{ => mediatek}/mt6580.dtsi  |    0
>   .../mt6582-prestigio-pmt5008-3g.dts           |    0
>   arch/arm/boot/dts/{ => mediatek}/mt6582.dtsi  |    0
>   .../dts/{ => mediatek}/mt6589-aquaris5.dts    |    0
>   .../{ => mediatek}/mt6589-fairphone-fp1.dts   |    0
>   arch/arm/boot/dts/{ => mediatek}/mt6589.dtsi  |    0
>   .../boot/dts/{ => mediatek}/mt6592-evb.dts    |    0
>   arch/arm/boot/dts/{ => mediatek}/mt6592.dtsi  |    0
>   arch/arm/boot/dts/{ => mediatek}/mt7623.dtsi  |    0
>   .../dts/{ => mediatek}/mt7623a-rfb-emmc.dts   |    0
>   .../dts/{ => mediatek}/mt7623a-rfb-nand.dts   |    0
>   arch/arm/boot/dts/{ => mediatek}/mt7623a.dtsi |    0
>   .../mt7623n-bananapi-bpi-r2.dts               |    0
>   .../dts/{ => mediatek}/mt7623n-rfb-emmc.dts   |    0
>   arch/arm/boot/dts/{ => mediatek}/mt7623n.dtsi |    0
>   .../boot/dts/{ => mediatek}/mt7629-rfb.dts    |    0
>   arch/arm/boot/dts/{ => mediatek}/mt7629.dtsi  |    0
>   .../boot/dts/{ => mediatek}/mt8127-moose.dts  |    0
>   arch/arm/boot/dts/{ => mediatek}/mt8127.dtsi  |    0
>   .../boot/dts/{ => mediatek}/mt8135-evbp1.dts  |    0
>   arch/arm/boot/dts/{ => mediatek}/mt8135.dtsi  |    0

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Would it be possible to also script a fix for the MAINTAINERS file?

$ git grep "arch\/arm\/boot\/dts" MAINTAINERS |wc -l

101


Regards,
Matthias
