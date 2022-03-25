Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF6A28E0
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Mar 2022 21:10:32 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id t21so4618123oie.11
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Mar 2022 14:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2TNPm4s2d/avyYNyKgm5CxLZb9xC2asaX7pXzx+AArg=;
        b=BRDQKgjViBo8541EogBWvDdhrDbOJSlMhcoB1p+I0BplV01FVOj6WDPavEViuFcg1q
         mSFcNmfbjZUQVELPcagqXZ/3q+A/snPDrFBbqIrB15JYysBPjSnlCaEE6109/kh9nQ2j
         0k1/DZgZWeJMHeX4NPfcUClJIk9Sl9pnyNOuyveW/fMy1khNJLTNZkvuGi/lIoB6vPCE
         Ofw99aJI0Hnp/q3lvpX7I88AWXYtRe098m06axeflRR1PzbBwpmdT2d3omzT6LlYuE32
         3oOkg4O7CMqKCFXWlcd7tfINeJgbiv8CzegcIR9+iDqcyG93ERtbRuVObc47Xq4ebV2S
         AGeg==
X-Gm-Message-State: AOAM532TSRzhd5rzCfBXFDeELFeBTJW4XiqVOvYJFk45Ercc/JMJ7ywi
	3a+qvEQl4Ro6Je5D4VWQLw==
X-Google-Smtp-Source: ABdhPJzcixabbXOwrUOVtS0coroIVjXvK0Wc/6jAmqmd0HOfLzrGJXCVH1qVrBh5a/RGQrQbiaYViw==
X-Received: by 2002:aca:1712:0:b0:2ec:e1a4:1ad1 with SMTP id j18-20020aca1712000000b002ece1a41ad1mr11155141oii.78.1648242632075;
        Fri, 25 Mar 2022 14:10:32 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m13-20020a9d7acd000000b005cda59325e6sm3069602otn.60.2022.03.25.14.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 14:10:31 -0700 (PDT)
Received: (nullmailer pid 459339 invoked by uid 1000);
	Fri, 25 Mar 2022 21:10:30 -0000
Date: Fri, 25 Mar 2022 16:10:30 -0500
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Mesih Kilinc <mesihkilinc@gmail.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, George Hilliard <thirtythreeforty@gmail.com>, Jesse Taube <mr.bossman075@gmail.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>, Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v2 02/12] dt-bindings: watchdog: sunxi: clarify clock
 support
Message-ID: <Yj4vxqRSKR+rcBLO@robh.at.kernel.org>
References: <20220317162349.739636-1-andre.przywara@arm.com>
 <20220317162349.739636-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317162349.739636-3-andre.przywara@arm.com>

On Thu, 17 Mar 2022 16:23:39 +0000, Andre Przywara wrote:
> Most Allwinner SoCs have just one input clock to drive the watchdog
> peripheral. So far this is the 24 MHz "HOSC" oscillator, divided down
> internally to 32 KHz.
> The F1C100 series watchdog however uses the unchanged 32 KHz "LOSC" as
> its only clock input, which has the same effect, but let's the binding
> description mismatch.
> 
> Change the binding description to name the clocks more loosely, so both
> the LOSC and divided HOSC match the description. As the fixed clock names
> now make less sense, drop them from SoCs supporting just one clock
> input, they were not used by any DT anyway.
> 
> For the newer SoCs, supporting a choice of two input clocks, we keep
> both the description and clock-names requirement.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../watchdog/allwinner,sun4i-a10-wdt.yaml     | 20 ++++++++-----------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
