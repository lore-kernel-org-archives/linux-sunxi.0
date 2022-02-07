Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B1D2F25
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Feb 2022 21:45:58 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id v17-20020a4ac911000000b002eac41bb3f4so15250030ooq.10
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Feb 2022 13:45:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QOxTpsiItYIgn973R83OB/6cA8BtGbALp2vvEgGAMiM=;
        b=lZ39RtvTfXaXup/nbHjn1aWUkfhCp3FEeAz+AL0xD/AbnEPN1ooAsw/m/12uA+5wfb
         C5+1orVFMj8o9vCqYHBC7fkUGMxGNhJVgWFBFy5qb7tMd4HQxRKawdj/eslv2CRzHdcy
         8EfwGC7WaQFxnMile1MxTsitQ39R8p7hrm94PE/cVmv1vg4HaI9ROGa07VpQ0+Xc7+MK
         7P7z8/MWswZNJ9JmbNPOt7P/uVTPDA3TbU08RTA1NWe8DvHDNo++b9gg7AZEo2I+2DOj
         Uhtonec1hQtq0OI1HdHb6IcW6ATyxHTwVZgo2kXWzAbPU0yKg8uXmwL7KXiccjgENvwg
         966Q==
X-Gm-Message-State: AOAM5311qfRE1yU9DLsOREJjh4LrqVtsmMsmDoLZLCgA1hdqUd99fz3J
	TpPCCS/DhzWifVELKhu5NQ==
X-Google-Smtp-Source: ABdhPJxjjb8hTz7JrQNc/dwzSDalOZbNtl/l3u7RMYurH9/W708famAbJ2Dk4CF7ZuFBAkYyOEv59Q==
X-Received: by 2002:a05:6870:3896:: with SMTP id y22mr323481oan.171.1644270357696;
        Mon, 07 Feb 2022 13:45:57 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id i1sm1419831ood.32.2022.02.07.13.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 13:45:56 -0800 (PST)
Received: (nullmailer pid 978810 invoked by uid 1000);
	Mon, 07 Feb 2022 21:45:55 -0000
Date: Mon, 7 Feb 2022 15:45:55 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, Alessandro Zummo <a.zummo@towertech.it>, linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 2/6] dt-bindings: rtc: sun6i: Add H616, R329, and D1
 support
Message-ID: <YgGTE/vLUBctPo17@robh.at.kernel.org>
References: <20220203021736.13434-1-samuel@sholland.org>
 <20220203021736.13434-3-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203021736.13434-3-samuel@sholland.org>

On Wed, 02 Feb 2022 20:17:32 -0600, Samuel Holland wrote:
> These new RTC variants all have a single alarm, like the R40 variant.
> 
> For the new SoCs, start requiring a complete list of input clocks. The
> H616 has three required clocks. The R329 also has three required clocks
> (but one is different), plus an optional crystal oscillator input. The
> D1 RTC is identical to the one in the R329.
> 
> And since these new SoCs will have a well-defined output clock order as
> well, they do not need the clock-output-names property.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
> Changes in v3:
>  - Add/fix several maxItems attributes for clocks and clock-items
> 
> Changes in v2:
>  - Properly update the DT binding clocks and clock-names properties.
> 
>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 76 ++++++++++++++++++-
>  include/dt-bindings/clock/sun6i-rtc.h         | 10 +++
>  2 files changed, 83 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/clock/sun6i-rtc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
