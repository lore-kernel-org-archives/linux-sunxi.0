Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC6F2C82
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Nov 2021 18:19:53 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id i12so6190523wmq.4
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Nov 2021 10:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=00Dxvbq1Fs3MMMpYVcBCoVgT8ZGNOOp9XPEQ3Wpw9v4=;
        b=KORdkzGuQ4IGREFApHAper+Vh5XPk7rpVwouPUAUB4MVXqFc7pAxzZz+W3385+/EDA
         jzayUSZfmsAl3OkuMHAQGtvGRA/xn3grbUUF6Vu8EGoTSHAlsI6Nm5gbxRi36IebRW5o
         pqm+QAi5P5khGWxFstDeBneAaS4KxzdhkKyLqdcg8ns6MJIIC4RUgmMmvz6yIaX0baW+
         WfaQsh+oQxwtp+UwYTyYfuVlCDvl3aXz+fksu0b3D8G+WW+zhDfk6suV/2utSLDUpYO/
         WqgCcIKzodNhfgBUURtyW1E56UyYk94s7MSKreENza6l0w61Xy177Z2nc8bAljfLvM5d
         /X6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=00Dxvbq1Fs3MMMpYVcBCoVgT8ZGNOOp9XPEQ3Wpw9v4=;
        b=y7P/9BZWPhuR/Yrb4s4ac1iGaEKrnnVIsUUvS0JwnKfLMPwNhYxhv7OHGZtPPXEePD
         e4rILFRfAKtppU1tb3HQj/JHX4nBmwngksxRkuGYqSXpwgRpjjW+DayCCOQi2Iw52E+L
         JVg4dVG306KLLuQl6zTHr/8HrZ1uKe6GVJQHEqEQnpc6KvGTZ14ZFa1jzs2YrOTZJTYV
         0u0JZjRAGqhInia17ZQsOZVgwdUfrrgkczhtTCcid8/CkIU63ZyEpVBROTgTV6VYyUlT
         fdBtWI+ZjwMRGlXlVMSNuk67ka7+TGad2BN2+nRR4gSMp+d6GQ4SRi0eyg7JZ8A9gKPl
         fv0Q==
X-Gm-Message-State: AOAM530p7ukAT0tftJVywKwiSYgebrc1esCCrjDqcwQ0Rt6UTKZovego
	xGbZkZYZ62Shp2Zi6qEqgX4=
X-Google-Smtp-Source: ABdhPJzLu0BYPHkuLanReInwXaHXHJCkti9VUlyrNj1um+J2BTGYu6Gl5aTVxGvRpm3vQ8WBoywlGw==
X-Received: by 2002:a7b:cd93:: with SMTP id y19mr11986192wmj.190.1637259592199;
        Thu, 18 Nov 2021 10:19:52 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id az4sm9863463wmb.20.2021.11.18.10.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 10:19:51 -0800 (PST)
Date: Thu, 18 Nov 2021 19:19:49 +0100
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: crypto: Add optional dma properties
Message-ID: <YZaZRdAX1EA0kMP1@Red>
References: <20211116143255.385480-1-maxime@cerno.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211116143255.385480-1-maxime@cerno.tech>

Le Tue, Nov 16, 2021 at 03:32:55PM +0100, Maxime Ripard a écrit :
> Some platforms, like the v3s, have DMA channels assigned to the crypto
> engine, which were in the DTSI but were never documented.
> 
> Let's make sure they are.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Good timing, I started to work on adding DMA to sun4i-ss.

Acked-by: Corentin Labbe <clabbe.montjoie@gmail.com>

Thanks
Regards
