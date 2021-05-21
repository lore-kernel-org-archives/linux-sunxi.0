Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A683270
	for <linux-sunxi@lists.linux.dev>; Fri, 21 May 2021 01:39:47 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id t22-20020a4ad0b60000b029020fe239e804so1429186oor.4
        for <linux-sunxi@lists.linux.dev>; Thu, 20 May 2021 18:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=twIIkTMnAszhUEiU17DepvUWRNVDKbFl4+4yGD34k5k=;
        b=fuD9KsxNNEZpq/rHgtg2HpJmQ+m8C2BQ61PBotqH6f8SAoOHMS32dnMjJlqn6wS9XY
         M76Ss3KC5z5SkQ2tVR0NbGJiCYkkv0F/iKUQ1LcVvXmMtmM/RIyefXaVgUWHa8N5dkam
         xpyg4y6qfXxqoFl18Q5+03UbrLZRGt1QEEBC5wlPuK1u4qvpbRLmZq3xHcsCmMgk4Fao
         fgUOfgFSe9ggunOUR+mDyOWeJsJazLaHGgaZUJn4eibLSA74KjSbBUWIbn0RxRb7GP/2
         wGi2+IfzL+zyiVJQY9EemHAvVlqa7p+Jp1aneGA+4+wk7Y+exbXqWr62oQ3ApjqEbMQR
         tUhg==
X-Gm-Message-State: AOAM5323SmamQZnREsgZTeuwR4A6yIM/5H84mogRnTvYR9x/To6F6zNj
	TKANuO++pHUGaYy5AOCRgA==
X-Google-Smtp-Source: ABdhPJywIEAjV6PJzo8otOaFuoJTJP8F5lzBvqeWyHUM5mp/ztXEA4AwjUCsGAT4m4e2e6pn3Bu5gQ==
X-Received: by 2002:a4a:88f2:: with SMTP id q47mr5943925ooh.30.1621561186891;
        Thu, 20 May 2021 18:39:46 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n11sm615941oom.1.2021.05.20.18.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 18:39:46 -0700 (PDT)
Received: (nullmailer pid 2460455 invoked by uid 1000);
	Fri, 21 May 2021 01:39:45 -0000
Date: Thu, 20 May 2021 20:39:45 -0500
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>, Alessandro Zummo <a.zummo@towertech.it>, Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v6 03/17] dt-bindings: rtc: sun6i: Add H616 compatible
 string
Message-ID: <20210521013945.GA2460400@robh.at.kernel.org>
References: <20210519104152.21119-1-andre.przywara@arm.com>
 <20210519104152.21119-4-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519104152.21119-4-andre.przywara@arm.com>

On Wed, 19 May 2021 11:41:38 +0100, Andre Przywara wrote:
> Add the obvious compatible name to the existing RTC binding.
> The actual RTC part of the device uses a different day/month/year
> storage scheme, so it's not compatible with the previous devices.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml     | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
