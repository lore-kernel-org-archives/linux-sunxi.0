Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3569B5C8B
	for <linux-sunxi@lists.linux.dev>; Sun, 31 Jul 2022 18:45:05 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id m13so7670144wrq.6
        for <linux-sunxi@lists.linux.dev>; Sun, 31 Jul 2022 11:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linexp-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=tvOif7D7GjSlYLteSKiLH6y+AMJJ8XB36nHdth7eJaI=;
        b=ySCIVB22C5KydntWmrTt/vJ+FXw3SCt7Qq0EHU4Wsdg2oo0gWbj6Yxwz8cwyy/4I5K
         HENmHYrPnicHJz+eux7lA0koBsdcES1krsyeu6Rz+rpBZiPHb+TTCTlfP/FVQyqR6qlH
         5OJ6yYriM4M95Hd8HA0AuUQsxGPJ+0hVqFFGfywDb5BY/8pSvl7qolw0J915JkE4QIwO
         fnABpzC687Y+xnV6RlQ4Cg59hcz7RyikQg5/y0fj2bZcBDZUCbQ1gXSTOdOIdEaGoROf
         XhtdFr+Y2uKEu0TfDrNYUt4MEK4yGM5Ls4OYoOkxR0Qq8Z3BQwFArZaBCSHXWUawg5Tt
         IADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=tvOif7D7GjSlYLteSKiLH6y+AMJJ8XB36nHdth7eJaI=;
        b=f78X5mkFYuLel1aNpeT6tJQow8DZs+XUwT7cUBhLjmTLF6Z8I/GTSVQAvhZOqR26si
         zbhKe5EGtj34uRJO35Mzc/7GKQQPr984SsQRe2gJIBWIvVDQ+8+ISl32ub0hBqPcMxPC
         KwAWR1zh8Tt2Zf7gEumYYdSRkU6IHurmDBk8x0kPFNw2ynNzis0XVYW68iasES+M81jB
         99L7JPSodfLJdRG/ZeKBJBBlI6R6pJ80apLCuT/vGM2HcMH8JPR1hgNuC/xPYpwHJ91N
         CmNUOaFZMmQYe8PX9fuufeFrYIWIp6BFeBd9muFl+e3GiQNcOGeygGJKlENbOW2G44Iv
         /qBw==
X-Gm-Message-State: ACgBeo0cbm2woo7V4kvxpf8gGte6c6j9dJRnIhoj/sHzTCEst7KWBhan
	YG7FoRd7gAKGlqVOe2dy8n+GKA==
X-Google-Smtp-Source: AA6agR63ZHLK7NohlWD4N34eOOAHK775S7u5BEkmukp5cqJ2trsqg6paOiu8M/xH8+DhuG6l8q2scg==
X-Received: by 2002:a5d:6d0c:0:b0:21f:ba0:ff7f with SMTP id e12-20020a5d6d0c000000b0021f0ba0ff7fmr8841442wrq.76.1659293103468;
        Sun, 31 Jul 2022 11:45:03 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b04a:b59f:f2d8:e65c? ([2a05:6e02:1041:c10:b04a:b59f:f2d8:e65c])
        by smtp.gmail.com with ESMTPSA id h1-20020a05600c2ca100b003a3253b706esm17534135wmc.34.2022.07.31.11.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Jul 2022 11:45:03 -0700 (PDT)
Message-ID: <eee44dc0-9717-9ed0-42b0-713ad9fbe688@linexp.org>
Date: Sun, 31 Jul 2022 20:45:00 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 27/32] iio/drivers/sun4i_gpadc: Switch to new of
 thermal API
Content-Language: en-US
To: Jonathan Cameron <jic23@kernel.org>
Cc: daniel.lezcano@linaro.org, rafael@kernel.org, rui.zhang@intel.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, abailon@baylibre.com, lukasz.luba@arm.com,
 broonie@kernel.org, damien.lemoal@opensource.wdc.com, heiko@sntech.de,
 hayashi.kunihiko@socionext.com, mhiramat@kernel.org, talel@amazon.com,
 thierry.reding@gmail.com, digetx@gmail.com, jonathanh@nvidia.com,
 anarsoul@gmail.com, tiny.windzz@gmail.com, baolin.wang7@gmail.com,
 f.fainelli@gmail.com, bjorn.andersson@linaro.org, mcoquelin.stm32@gmail.com,
 glaroque@baylibre.com, miquel.raynal@bootlin.com, shawnguo@kernel.org,
 niklas.soderlund@ragnatech.se, matthias.bgg@gmail.com, j-keerthy@ti.com,
 Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>
References: <20220727210253.3794069-1-daniel.lezcano@linexp.org>
 <20220727210253.3794069-28-daniel.lezcano@linexp.org>
 <20220731131328.7301de32@jic23-huawei>
From: Daniel Lezcano <daniel.lezcano@linexp.org>
In-Reply-To: <20220731131328.7301de32@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/07/2022 14:13, Jonathan Cameron wrote:
> On Wed, 27 Jul 2022 23:02:48 +0200
> Daniel Lezcano <daniel.lezcano@linexp.org> wrote:
>
>> The thermal OF code has a new API allowing to migrate the OF
>> initialization to a simpler approach. The ops are no longer device
>> tree specific and are the generic ones provided by the core code.
>>
>> Convert the ops to the thermal_zone_device_ops format and use the new
>> API to register the thermal zone with these generic ops.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linexp.org>
> Whilst making no pretence at having checked what the new calls do, I'm fine with this
> patch affecting the driver in IIO and going through appropriate thermal tree.
>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Thanks for reviewing the patch

