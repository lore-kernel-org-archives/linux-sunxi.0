Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBE928FB
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Jun 2022 16:08:10 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id v7so14557440ilo.3
        for <linux-sunxi@lists.linux.dev>; Tue, 07 Jun 2022 09:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IcVu4WajHv6XPQv1yYvHjVGQzqBrXJ6uvkB7WM1ORUk=;
        b=ghG4HlxCb/r/Ek/WP8KcGjcnedG4mRHTo+yMDN8I3b/wcd7UTLoANXy5u9/rIY+JpP
         3NbcZQb9227wwH8UiB8WkGSeGzVgkpQlQ4O+ApbpYFtEgOEhSoIT+h17x1pYZG4RDlKA
         5JfgclnQ+UqZRvNMqZHjjJxHgOzdAd8m3Kyq2ytr7Pg3ez2QHAflwKFgxNkC8uenlz8+
         F6EgyQkAAo6va2T7WOOlR0u3vrRVzeG7lfKnAk9QWZ+jk3ZIuMRqA4qP/taKBOnjsIRQ
         tq3Z5/e0MicKV9fTXQlAREkk9iHMsZ/bn3hwCzdgvnzJ1CnirIX95CRecmgZWzZlkAki
         0kbQ==
X-Gm-Message-State: AOAM530p+AwmOw1cDsnx0yt0DZGmbL5urfdbxFolxRq5gtqNDuOltQ7I
	YNCNcjLCyc5P59B0uSa8vQ==
X-Google-Smtp-Source: ABdhPJwkB6tWssEJWTfCQGirJEa1uIPrrUEYFGpmaCAPiwN8q4TlO6GszS0vcXmTn6BhoiBisqAo5w==
X-Received: by 2002:a05:6e02:1949:b0:2d3:c0fb:322 with SMTP id x9-20020a056e02194900b002d3c0fb0322mr17090293ilu.242.1654618089339;
        Tue, 07 Jun 2022 09:08:09 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id i11-20020a02b68b000000b0033167715cf9sm5989686jam.27.2022.06.07.09.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 09:08:08 -0700 (PDT)
Received: (nullmailer pid 3350333 invoked by uid 1000);
	Tue, 07 Jun 2022 16:08:07 -0000
Date: Tue, 7 Jun 2022 10:08:07 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, Hu Ziji <huziji@marvell.com>, linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Guenter Roeck <linux@roeck-us.net>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-mmc@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] dt-bindings: Drop more redundant 'maxItems/minItems' in
 if/then schemas
Message-ID: <20220607160807.GA3350189-robh@kernel.org>
References: <20220606225137.1536010-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606225137.1536010-1-robh@kernel.org>

On Mon, 06 Jun 2022 17:51:36 -0500, Rob Herring wrote:
> Another round from new cases in 5.19-rc of removing redundant
> minItems/maxItems when 'items' list is specified. This time it is in
> if/then schemas as the meta-schema was failing to check this case.
> 
> If a property has an 'items' list, then a 'minItems' or 'maxItems' with the
> same size as the list is redundant and can be dropped. Note that is DT
> schema specific behavior and not standard json-schema behavior. The tooling
> will fixup the final schema adding any unspecified minItems/maxItems.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/memory-controllers/nvidia,tegra186-mc.yaml        | 3 ---
>  Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.yaml | 1 -
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml  | 1 -
>  3 files changed, 5 deletions(-)
> 

Applied, thanks!
