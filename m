Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D202370
	for <linux-sunxi@lists.linux.dev>; Tue, 18 May 2021 01:29:28 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id x15so8238026oic.13
        for <linux-sunxi@lists.linux.dev>; Mon, 17 May 2021 18:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AtUJefJLoHgziahUui2+8nbwoSw2tOAjyBNrIem7eVQ=;
        b=rzuL9RJx3lg/fg/xM+KxJ5/8akxZjn6wuD8fEMYqrBdlyJuLoKTZ3fQUqWJp7TP/rG
         GW0ass3qPQ5DxWI/2bZalzHw76ccGhoE9rz93klXa28xFtcusIXalkwFVLSwT+x+vr2p
         W1oSNg6jQWUADE2F0mnhtrawgn4zuDDTJo53jGTur9dlQBuLkaFo9rrY6Tm5DxEx3yC7
         /vumE+5+DyjBtUqp6eBNFZSZe+vd6L5Zbw6AcJECcjYXnCNMKZbpGFC9V3JyE8k4+tu1
         zxinY212AdeTBXxNkNX7DCdPsQ00znGcuEVdrWaofdqikW1RZ+6aC1MLkvEzLOqcX8lm
         nmWA==
X-Gm-Message-State: AOAM530WE9nESpEZOV2juMR8OsACSTG3nfjVVk5zNzAMfxJDlT4YgPbL
	9es73wNvT1zSI+djIq+iag==
X-Google-Smtp-Source: ABdhPJx6wOdBI4b10WjHGBkCm+4XJjD+7Eoy6luPwoehX+SKk7fVDkEOGjYJKKVlExHXMyl4rVR+yQ==
X-Received: by 2002:a05:6808:8cd:: with SMTP id k13mr2036279oij.156.1621301368098;
        Mon, 17 May 2021 18:29:28 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c17sm3605051otn.45.2021.05.17.18.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 18:29:27 -0700 (PDT)
Received: (nullmailer pid 3603310 invoked by uid 1000);
	Tue, 18 May 2021 01:29:26 -0000
Date: Mon, 17 May 2021 20:29:26 -0500
From: Rob Herring <robh@kernel.org>
To: Tobias Schramm <t.schramm@manjaro.org>
Cc: linux-kernel@vger.kernel.org, Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v3 6/7] dt-bindings: sound: sun4i-i2s: add Allwinner V3
 I2S compatible
Message-ID: <20210518012926.GA3603252@robh.at.kernel.org>
References: <20210514134405.2097464-1-t.schramm@manjaro.org>
 <20210514134405.2097464-7-t.schramm@manjaro.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514134405.2097464-7-t.schramm@manjaro.org>

On Fri, 14 May 2021 15:44:04 +0200, Tobias Schramm wrote:
> The I2S peripheral of the Allwinner V3 SoC is compatible with the one
> found in the Allwinner H3 SoC.
> This patch adds a compatible string for it.
> 
> Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
> ---
>  .../devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml     | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
