Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECA47C
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Jul 2023 09:57:55 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3fc02a92dcfso26346205e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 23 Jul 2023 02:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690106274; x=1690711074;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wc6+ATb+qVfVkW0Ae346Tifz/LFJPnNALhIho4FW5hg=;
        b=DDxcsAlsx37U+kaffhuM55XUaGeVs96s3crQetRLHW8PnIZeZMAype1m3wK/+V+dh7
         dg8WphG8Q+EsnsO604DAfGkdJPjtYafULGQ3aGMxofj4YoJnSkECofLtCbu66mHca9Ft
         UMWzRG/g3DM28zTIT+KFSyrxefMTlDGNVNdSaiJZGU3FlXQqzuyOk8ARRrnt1wQt+u2z
         gLnqtNEtD7NE17dsybBGEwe99S5/KLmWmmvZRo9a5IOVE3HnvXUghmn653iFbJKJ2fKT
         8+JmTfzHq2jk68syX11MiPjDruT5vPBe/6fSbW3wZdRDJcQQSX2eR2YSVpuhPBNlGCSE
         vZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690106274; x=1690711074;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wc6+ATb+qVfVkW0Ae346Tifz/LFJPnNALhIho4FW5hg=;
        b=alWSA8elp2pLniRGyMYVpoEy9jAYk0yxHn/5/Wg4PA6+n67MRTfuHO84H/Xxz/KQGl
         v7ODrH6U3o9JcKfAHL2nMzERLCwZYEqT83m4b2//GOugiwX6HBIu05QGA1sGLjp6EM2T
         7cNc/XYO1peBdYCyj0/lPK/ywlDPgRB9/eyhVeSuW9hm548nCmF3ciJ9mlxnqYRkL1rX
         8UydMZayyclDfy98kqHCvDE0+YV5l4xULghz7Apd/tVWEmp4aGI5xi78Ka6zgERXPSb1
         E/vI+PbceuKDOnnszjZVizybjjLHbrKFinlWlJUfTwBVedEARd7Bb2zCCW9UFCICsijI
         +1Lg==
X-Gm-Message-State: ABy/qLbED2krYMLzlU6Iy+4sVMQA8I+jiOA9NeXeFmOon+mm/MzleMIz
	4AbleaWGt/G+tD1Qg3DfUyic2Q==
X-Google-Smtp-Source: APBJJlHqy6wlA4DBzHx+V/jAXNo0ijXmnpA3LwNMOd9yV4i1dyEIxJgB1p8SDUDoWJd51ru85W2pGQ==
X-Received: by 2002:a05:600c:2316:b0:3fc:5a3:367c with SMTP id 22-20020a05600c231600b003fc05a3367cmr5448263wmo.32.1690106273887;
        Sun, 23 Jul 2023 02:57:53 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id bh17-20020a05600c3d1100b003fbb1ce274fsm25819673wmb.0.2023.07.23.02.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jul 2023 02:57:53 -0700 (PDT)
Message-ID: <f559a614-93d5-121a-8ff3-0da77bc85f44@linaro.org>
Date: Sun, 23 Jul 2023 11:57:52 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] thermal/of: Fix double free of params during
 unregistration
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>
Cc: Hugh Dickins <hughd@google.com>, Will Deacon <will@kernel.org>,
 Icenowy Zheng <uwu@icenowy.me>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20230723-thermal-fix-of-memory-corruption-v1-1-ed4fa16d199d@kernel.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230723-thermal-fix-of-memory-corruption-v1-1-ed4fa16d199d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Mark,

On 23/07/2023 01:26, Mark Brown wrote:
> Unlike the other data structures provided during registration the
> thermal core takes a copy of the thermal_zone_params provided to it and
> stores that copy in the thermal_zone_device, taking care to free it on
> unregistration.  This is done because the parameters will be modified at
> runtime.
> 
> Unfortunately the thermal_of code assumes that the params structure it
> provides will be used throughout the lifetime of the device and since
> the params are dynamically allocated based on the bindings it attempts
> to free it on unregistration.  This results in not only leaking the
> original params but also double freeing the copy the core made, leading
> to memory corruption.
> 
> Fix this by instead freeing the params parsed from the DT during
> registration.
> 
> This issue causing instability on systems where thermal zones are
> unregistered, especially visble on those systems where some zones
> provided by a device have no trip points such as Allwinner systems.
> For example with current mainline an arm64 defconfig is unbootable on
> Pine64 Plus and LibreTech Tritium is massively unstable.  These issues
> have been there for a while and have been made more prominent by recent
> memory management changes.
> 
> Fixes: 3fd6d6e2b4e80 ("thermal/of: Rework the thermal device tree initialization")
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Cc: stable@vger.kernel.org

I think this issue has been fixed by:

https://lore.kernel.org/all/20230708112720.2897484-2-a.fatoum@pengutronix.de/

Rafael ? Did you pick it up ?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

