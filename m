Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEA43C30
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 16:45:46 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id h5so4907361ile.13
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 09:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678812346;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jlTXumnsAyLju3X5wGhezp0gUrPj0Pftji9EY7hYkTE=;
        b=IMbOhb4nSM3i5CqrZuMYQyk4mi0FlTaUhqJ10ufd3Zycg2LInMrGQEru5ClVhMfZiY
         MBTA8wkxYs3c2KYTMoxKnrJ5Kdaoet53INo+0KJbWWMYRADfafbmB+FTNxreih/UUxFP
         sljADlzOvgFOuWq2vKJgWRE6/WfqMDh3/2rgEloxv7hXosmfx0f7oG5pDnBP+HE83aF/
         7QL1yXV2X8K2JtjI8IdwWJtckGXIUdEMPXKHAnfeJSzVfdVsGJdrKJ3b056R+slPWYAZ
         ZiycbkXMVD6nIUVxupHIdiUR4K+B4czNcaiRn6zXjSxrW1ZoSF2r8ENe7PRUrZDJB9Ih
         j9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678812346;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jlTXumnsAyLju3X5wGhezp0gUrPj0Pftji9EY7hYkTE=;
        b=cRQ0hIu6rvok7upP81V+3h5p3haRT2xtPZ1FsDaevXT73cfQ/UzuxtzrAcZmNuZ0Tr
         y9b39L5XVihIufCiys2Kp5iqsfKa8MnzaauL2G9cWwo2/HwyXXjigq2dUiNCq9E+DBSd
         7Q9QGO90M/+qybsHX3GeL3X4unEY6jE2/rCnQozyDCpO3uhfUL3MgwxbunfPk/HcIFIQ
         PFUAHsrvXuLkRy1JJWZ4kVasE4uiWXix8JifWf0t3L7qvClQ6Z6aWYufdpUnklUGQqkw
         W6EUDvGJzAMvb0fLIdljsp6aZ4TYc1choyAmE6T4JR/4meVZpfHmBXdkoqMY1oB9Iguu
         eKOQ==
X-Gm-Message-State: AO0yUKWKSKjLir5Fk+O/ukxD517SEqY0mVebWhTvW8kfqYC+2Py5L3Z8
	oxoYtUfhSH0e/nHP4uu4vv4=
X-Google-Smtp-Source: AK7set9fbVlYa4wCf6eJNIaNXA3YZoUWFsU4AD/JnVhm0i9hauk9yIMD83SJ3S82/ISaFKioIftPGQ==
X-Received: by 2002:a05:6e02:60e:b0:318:aa8a:6455 with SMTP id t14-20020a056e02060e00b00318aa8a6455mr2655484ils.19.1678812345622;
        Tue, 14 Mar 2023 09:45:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c22-20020a02c9d6000000b0040380d7c768sm903996jap.106.2023.03.14.09.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 09:45:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4a4e0ef5-30f8-39ce-28cf-ade2122e2aa2@roeck-us.net>
Date: Tue, 14 Mar 2023 09:45:39 -0700
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 01/28] media: cec: ch7322: drop of_match_ptr for ID table
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Joe Tessler <jrt@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
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
 <b83d6b81-c4ec-4fb8-b626-84af80d1c4a3@roeck-us.net>
 <74ae8afe-c537-1714-77ec-8a80d8ddad69@xs4all.nl>
 <bafa692c-f3a3-d317-278d-2dd3b5ff8af3@linaro.org>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <bafa692c-f3a3-d317-278d-2dd3b5ff8af3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/14/23 09:32, Krzysztof Kozlowski wrote:
> On 14/03/2023 09:34, Hans Verkuil wrote:
>> On 13/03/2023 23:01, Guenter Roeck wrote:
>>> On Sun, Mar 12, 2023 at 02:12:51PM +0100, Krzysztof Kozlowski wrote:
>>>> The driver can match only via the DT table so the table should be always
>>>> used and the of_match_ptr does not have any sense (this also allows ACPI
>>>> matching via PRP0001, even though it might not be relevant here).
>>>>
>>>>    drivers/media/cec/i2c/ch7322.c:583:34: error: ‘ch7322_of_match’ defined but not used [-Werror=unused-const-variable=]
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>>
>>> FWIW: There is also
>>> https://patches.linaro.org/project/linux-media/patch/20230215214724.3798917-1-linux@roeck-us.net/
>>
>> I superseded that patch in patchwork in favor of this patch since this is part of
>> a larger series.
> 
> I am personally fan of FIFO, so Guenter's patch should go in.
> 

FWIW, I do not care either way, I just wanted to point out that this patch
_is_ both relevant and needed, and that it (or, rather, the original version)
has been reviewed and tested.

Thanks,
Guenter

