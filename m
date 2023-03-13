Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54492F45
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Mar 2023 17:08:46 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id b10so13395791ljr.0
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Mar 2023 10:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678727325; x=1681319325;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nWFcn3N7fdkggfCAU6N3AWS2AJpujTNFZCDcDG29DDU=;
        b=e6YN891exTz6RBgawDES0963ZDWFQA9+8aQ63Im7BP5Fy9eEvzBxMIuHAuqWbCZeLw
         xA2sSa6/cZiN6mHF3/+fIb3pnqq2MewlfLzR48koCbD8whXbKfA8Zs0+dFs89Cfy5m36
         ROVsAU6bQljGOx/ykPtOQO0r6I8XBemOEF326xWZ5gIBuu5RpWt0wZITremU5bdqxJ5e
         fWUkITbc/MzS3k5YZE74vlNgxyJd3l+n9CkKH1MRvz0jG8OdZSEUnRN+n0e89kMgUyKp
         rroBKHNdNE45XtTz8XbWd27Z63Nu8HES9mhzKxEJUTEcdgqTB5zYtiSB6fEQbd4byozN
         7IwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678727325; x=1681319325;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWFcn3N7fdkggfCAU6N3AWS2AJpujTNFZCDcDG29DDU=;
        b=XTglxOt3OpfGgh0SiRDG6DVkdpeb8dstWfXS/A/IZ41nAxjO/sW4LqLzuLQDdJVjUj
         4K5yMSQv4rzHBXS95d1GUu/i5Cu4xZPt7DJ9Qhw+QoMTPQxAEdDo3i26PxHUdjrmEYyS
         3hk4X8D6o4szPjQW3B+5jFdTOptwrMumkgoVChy7G1xDJP8qrEbQiFDo/xVpECz5AJKx
         mAEUYKqXkVmMXcjze3mT6fz+WHliDFHH/47qZ/wbZKRTWeOn+y/JJ9Rn60DADdsqAv7X
         6jFqYTJY+I0jiea/Ga/TKa4lGEqyI1G0kEUv5vrXbvtJ7lEN0RsRddLM3Y2BGymNoFMj
         clVQ==
X-Gm-Message-State: AO0yUKVkG+d7Bxs8eXHj9HWmAupRlQqiFpHtvhabsJNofNAVl7GG5QD/
	KHX8pv7CYQQB7B0m929BlDA=
X-Google-Smtp-Source: AK7set9A23LXz84FY4nbulp8BmwRuZb6BzjELqJTA00c9/JbdQSh2qRKdHRdbHkxYlALuU7kCLrMgg==
X-Received: by 2002:a05:651c:222b:b0:294:7422:479e with SMTP id y43-20020a05651c222b00b002947422479emr6188608ljq.1.1678727324631;
        Mon, 13 Mar 2023 10:08:44 -0700 (PDT)
Received: from [192.168.0.192] ([194.146.248.75])
        by smtp.gmail.com with ESMTPSA id e2-20020a2e9302000000b0029571d505a1sm69136ljh.80.2023.03.13.10.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 10:08:44 -0700 (PDT)
Message-ID: <66b78cd3-0d0d-cee8-6a93-996ade3a07a9@gmail.com>
Date: Mon, 13 Mar 2023 18:08:42 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 09/28] media: platform: samsung: s5p-jpeg: drop
 of_match_ptr for ID table
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Joe Tessler <jrt@google.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
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
 <20230312131318.351173-9-krzysztof.kozlowski@linaro.org>
From: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
In-Reply-To: <20230312131318.351173-9-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,


W dniu 12.03.2023 o 14:12, Krzysztof Kozlowski pisze:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).  This
> also fixes !CONFIG_OF error:
> 
>    drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c:3124:34: error: ‘samsung_jpeg_match’ defined but not used [-Werror=unused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>

> ---
>   drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> index 55814041b8d8..8be8e3596e07 100644
> --- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> +++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> @@ -3166,7 +3166,7 @@ static struct platform_driver s5p_jpeg_driver = {
>   	.probe = s5p_jpeg_probe,
>   	.remove = s5p_jpeg_remove,
>   	.driver = {
> -		.of_match_table	= of_match_ptr(samsung_jpeg_match),
> +		.of_match_table	= samsung_jpeg_match,
>   		.name		= S5P_JPEG_M2M_NAME,
>   		.pm		= &s5p_jpeg_pm_ops,
>   	},
