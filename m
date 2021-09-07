Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CC972
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Sep 2021 19:09:11 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id m7-20020a9d4c87000000b0051875f56b95so385728otf.6
        for <linux-sunxi@lists.linux.dev>; Tue, 07 Sep 2021 12:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y6f0OvD6qMOZIJO8Ax2BSoOx4xel1z8MSZtwDVuqZG4=;
        b=YmDW1LSmpyno7OHdNjDi9I23ZM8VeDgcgV2056OQfDQpXFwbx6mcf8ggchaVzv3U4b
         5hE3FN/PXzN4KVTNNIgpDczgHUta1LxHqIiaqJqyt5fUJdWF37n4Gm1yX5S6kQIavU84
         MHbUjGKpsZ9yfK87saDv/KlIO/D4r+gw73gPpvsu90lSRnA8cgDoE18te4llWrOeIQ4I
         pOEVZtWmS0Y7Z6647X5G43lgzPGJx681tO52rpzGrvpAXea531054ZZFCz76OD8E5FPs
         0UqUhqS1WO7oUa9vRWIq66opwjY0nRo81u/jA+vQ8+sUJwYRQGPGGZ59KUfMDZnqTzya
         kDKA==
X-Gm-Message-State: AOAM531xVSYm7gcOhsqVK2YYvDBVLZkpSpuGBYbO7cfJ8tQvmTWLKGg2
	S4XKYzXagzuDDZmL/UvRow==
X-Google-Smtp-Source: ABdhPJwyWZEq2w/4Mwc8OOnY+ZM6/dWiGZ2obaXegjgzTgjLf0vQ0Va+W9t3AfsRWmBdCHbeme6CZQ==
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr13219426oth.307.1631041750386;
        Tue, 07 Sep 2021 12:09:10 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id u15sm2455443oon.35.2021.09.07.12.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 12:09:09 -0700 (PDT)
Received: (nullmailer pid 174203 invoked by uid 1000);
	Tue, 07 Sep 2021 19:09:08 -0000
Date: Tue, 7 Sep 2021 14:09:08 -0500
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>, linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: watchdog: sunxi: Add compatibles for
 D1
Message-ID: <YTe41ClZvYS/llHF@robh.at.kernel.org>
References: <20210902225750.29313-1-samuel@sholland.org>
 <20210902225750.29313-3-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902225750.29313-3-samuel@sholland.org>

On Thu, 02 Sep 2021 17:57:49 -0500, Samuel Holland wrote:
> D1 keeps the same register layout and clock sources as the R329, but it
> adds a key field which must be set to update the watchdog's "CFG" and
> "MODE" registers. Therefore it is not backward-compatible.
> 
> Similarly to the R329, the D1 has three watchdog instances, and only one
> of them has the "soft reset" registers. So that instance needs an extra
> compatible string.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> Changes v2 to v3:
>  - Add additional allwinner,sun20i-d1-wdt-reset compatible
> Changes v1 to v2:
>  - None
> 
>  .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
