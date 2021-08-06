Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC31072
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Aug 2021 21:39:39 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id n19so14298819ioz.0
        for <linux-sunxi@lists.linux.dev>; Fri, 06 Aug 2021 14:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LFUiDTXxmqI19QFlwHJPxtb+BipTCydsira5/f1jjM8=;
        b=tedHNqfSt8ZSNjIMoIaIO1ool0zMKlir2cSDWpVmYutX+gER+Z2pDDhl5JnANhr9w4
         RkaeiprvCVk8o1HgNc1ENWkGQv32VNvrerK5HPuvxxdqMyRuM4ZlEmT2AYRWcGGXKX1R
         9FBnqYU40joeSizvlgxxDY4IKmujFgQK5zdPRXH1vnpVsn8/Rq3V7nE96QPSBLLo37yC
         NBBvplsTzejnBwD7yuvCmNh8CyX3OVTFhFW5j1zY7gF+mMMvY/sVC6LP4RWCsM70SvFi
         6qD/ZLJVl5IMYVvTspcrE3Edk+ICJE2opMRljE+oieWyp4QxJzoP10UyIQRx4a350A7L
         v0pg==
X-Gm-Message-State: AOAM532TLB02wBpPzj5wsFAqaLOw2c14jctFPn2UpsV+/SNaDdomeFZP
	+w6hibCFZ4V/KdF6ceBSmA==
X-Google-Smtp-Source: ABdhPJwIhWbZiov4Z+/Tf+BcwVYV4SkW2FbrmW76/c1CJtFwoThzkfW69ygmMoVvW2ARJ5u7jWgISw==
X-Received: by 2002:a5d:9808:: with SMTP id a8mr180089iol.1.1628285979063;
        Fri, 06 Aug 2021 14:39:39 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b23sm4582799iof.8.2021.08.06.14.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 14:39:38 -0700 (PDT)
Received: (nullmailer pid 1849291 invoked by uid 1000);
	Fri, 06 Aug 2021 21:39:36 -0000
Date: Fri, 6 Aug 2021 15:39:36 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@sipeed.com>
Cc: devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ulf Hansson <ulf.hansson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/17] dt-bindings: rtc: sun6i: add compatible string for
 R329 RTC
Message-ID: <YQ2sGGFqmDLroBtI@robh.at.kernel.org>
References: <20210802062212.73220-1-icenowy@sipeed.com>
 <20210802062212.73220-5-icenowy@sipeed.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802062212.73220-5-icenowy@sipeed.com>

On Mon, 02 Aug 2021 14:21:59 +0800, Icenowy Zheng wrote:
> Allwinner R329 has a RTC similar to previous ones, capable of
> controlling LOSC and IOSC and with only one alarm.
> 
> Add a compatible string for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
> ---
>  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml    | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
