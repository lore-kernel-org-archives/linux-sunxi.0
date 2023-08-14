Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB327AD43
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Aug 2023 10:10:51 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fe4cdb72b9so37421955e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Aug 2023 03:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692007850; x=1692612650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESVhtHoMLjpXOh7/9of5EXSKLVqOfUmeEpUAt6YEbDk=;
        b=ugbzJGCHzCqnyNCVJ9AEJgSO4wFcS2K/tJY0TUtVVrrYd1YFLE3qXOv0MlLIgXTZVB
         QSyJ7RSa+r8S4kW3SkekG9EWAPUz/FTqQkJXJ32FVR5hTHmA5m4iXN/4HeZf3B67JJGU
         j5RKW/uLqbsVY0JTxKCQIUsbSZXqvjHymXYU0ApOjlN09CTtTM7o1EsAq9df40ayR/gL
         NyoWEuibfG0/nbthmkvaWcZLSQrvGVWfMbTn+1E0TTfEyXgjflRUpIUx/CipCOskR7rm
         UZGWZJLHuzQf1sfwS5uxY93zjQt5km0HBE0WuxgosCyk6cdaXvIGV9cFxI0Ko83Xpkbr
         M9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692007850; x=1692612650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESVhtHoMLjpXOh7/9of5EXSKLVqOfUmeEpUAt6YEbDk=;
        b=Y/YYnjpE5tieTXnVsHXTzf6H4mrMFGrgnjajIYrg3s1lbyQbpZ09c+Fdqzq6V/kZyr
         1ZErTQ6nCh+OvKATE1izsRgYyNLvRNaFVK2pT4CJjdGV0UufJi9tm+kZJ2c2zdpBAFlC
         UQrcD5T1SWsAj1erFX7kW4Es/GonIs9xsrP+Ada2FHlU9A8FI+BBNywR6nktCrrWWeSM
         N+C4bKZxaROzWwv+trzN0rovHscHOjmmtm7zneiK5Mj8vwxmM86sXUFTQ7oErjEdWJUn
         dtkb2+wnvPnwLHQqqVL47fLgRV+iDhEydCqUq5fQjTheykeaMc0JyhSrlWm1uq9PUiE2
         NsLQ==
X-Gm-Message-State: AOJu0YxXtiB7mHQafW4BGiAgYkp/CW6HW76KkNwHYgRLGepRdZGkqBKZ
	VOmB+KxGtn4pYBSv03MyHl73Lw==
X-Google-Smtp-Source: AGHT+IHr7ubyVfhrrz0Cla5qo9gl0Y6s4v7dNlJWWF2mrQmHybIpVpMUq2sIq64MgDp9YflZck6Fzw==
X-Received: by 2002:a1c:7717:0:b0:3fb:dbd0:a7ea with SMTP id t23-20020a1c7717000000b003fbdbd0a7eamr7212142wmi.37.1692007849752;
        Mon, 14 Aug 2023 03:10:49 -0700 (PDT)
Received: from hackbox.lan ([84.232.191.92])
        by smtp.gmail.com with ESMTPSA id n5-20020a05600c294500b003fbaade0735sm16750396wmd.19.2023.08.14.03.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 03:10:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yangtao Li <frank.li@vivo.com>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/13] clk: sunxi: sun9i-mmc: Use devm_platform_get_and_ioremap_resource()
Date: Mon, 14 Aug 2023 13:09:58 +0300
Message-Id: <169200755842.527063.8434968913073327760.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705065313.67043-1-frank.li@vivo.com>
References: <20230705065313.67043-1-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 05 Jul 2023 14:53:01 +0800, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> 

Applied, thanks!

[08/13] clk: imx: clk-imx8qxp-lpcg: Convert to devm_platform_ioremap_resource()
        commit: 94945b23133db0b698ffe764d8a82593906d1e74

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
