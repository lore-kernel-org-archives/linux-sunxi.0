Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EFD2C82
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Nov 2021 01:46:33 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso28079222otf.12
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Nov 2021 17:46:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0Y0Ve3+w1/v8OIasi6sMLAYERw+SuVuH131zI0dfnUM=;
        b=Iz5ala7eKRNICLz6u9XK7m3WDQHBZlu1CE53ZJVyu/locxD9MDUmEQf71AETYOFzTd
         +Rbp3idz3m5WbLQQvjk0TpSveMyQDnUYzfeTcjGPUlB3qXVuUTsm4MQWYJOYUtvH6jxL
         AgokOuRBkNI8v7RpUyZEnY8GRAVTyuCg4mVGOmn01v1qT/SxOjFzfQIfzKyPfQVAcWI1
         oIMdN08TkhuB8/ArlU8EACbmdhW7/zgrZZ43dQ6W/yPBZmn/PGbrU70YQIF951dI7UHP
         xhCBpqqDpRhhrrlRHLjOFpXoLqG6l8GvKRG1cwTgrLPQMSX3IaV4pSaSXFldA2dnyHrN
         jvOA==
X-Gm-Message-State: AOAM530N/K+62aMUbJXkSjj9WPSOQEwurTKXmNLYgKP0y3JFX79Jij3A
	0PnjoRt3HXWoP4QoBYle5w==
X-Google-Smtp-Source: ABdhPJzFTSwrVuFQ1f7Iti++9Y2Q1+dDskMru9IhMwUujaRP6S2Gl4M4uXaKnzq4V0tjd+YozDUnxA==
X-Received: by 2002:a05:6830:442a:: with SMTP id q42mr48952359otv.385.1638236792392;
        Mon, 29 Nov 2021 17:46:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id n22sm2542990oop.29.2021.11.29.17.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 17:46:31 -0800 (PST)
Received: (nullmailer pid 1000370 invoked by uid 1000);
	Tue, 30 Nov 2021 01:46:31 -0000
Date: Mon, 29 Nov 2021 19:46:31 -0600
From: Rob Herring <robh@kernel.org>
To: Evgeny Boger <boger@wirenboard.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/3] dt-bindings: iio: adc: new compatible for Allwinner
 R40 RTP controller
Message-ID: <YaWCdyOLRIvu9T+F@robh.at.kernel.org>
References: <20211119191456.510435-1-boger@wirenboard.com>
 <20211119191456.510435-3-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119191456.510435-3-boger@wirenboard.com>

On Fri, 19 Nov 2021 22:14:55 +0300, Evgeny Boger wrote:
> R40 SoC has touchscreen controller also serving as general-purpose ADC.
> The hardware is very similar to A31, except that R40 has separate
> calibrated thermal sensor IP, so temperature sensing channel in RTP is
> not documented and is not to be used.
> 
> Signed-off-by: Evgeny Boger <boger@wirenboard.com>
> ---
>  .../devicetree/bindings/mfd/allwinner,sun4i-a10-ts.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
