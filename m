Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE68173
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Jun 2021 21:35:09 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id r12so10099655ioa.7
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Jun 2021 14:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ssSkZmcRFIuWVzrZF3p+ms6WDNX9rtUCDy4iiIHPjac=;
        b=S67W845W0oBujwLVpa/wgGgwjYEhl2YxdnSpLUHfuP9nU3dYSHPLQTY/Fo+JIfQcrf
         10t1PzEIQmN7eKaSeqhONmMIeRyNnCHrMwSlDzeV1n6RylLcxTuhek9ATNQRYHGvYlnD
         4+RLBse7OFyWsM0yyBuMOsXmHTD7aCKtic/B4ebNsZJg5Hu8h1tx/CHVs3JvGpDFcmSf
         bG9vvzsrQH7bGBibjN14myZ9YLYBXKFdvrZbOn9vg7obdSKuwgkUP6uab/a2ej/QM8hm
         o/wd4shN5VZ5d5DdjVWNyEYT2MBRHSMXMpkRer/v8GOGc2HmESreiyr5E6N9a4NsVDuR
         ebeg==
X-Gm-Message-State: AOAM530+m4fqj6mbfTvlJFnf093MQntRd/DEz66zk5PqSjohaRiFKOjW
	he181XFbxpuj8eeh6mUHnQ==
X-Google-Smtp-Source: ABdhPJxLG5mS/R5Kp70cqPpAfemerqR8JG+XdsktURkXgw56B3TqFTUh2d7/TUWZeX6qNuzTikAyeA==
X-Received: by 2002:a05:6638:3048:: with SMTP id u8mr6388166jak.91.1624570508746;
        Thu, 24 Jun 2021 14:35:08 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id m13sm1985143iob.35.2021.06.24.14.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 14:35:06 -0700 (PDT)
Received: (nullmailer pid 2025804 invoked by uid 1000);
	Thu, 24 Jun 2021 21:35:03 -0000
Date: Thu, 24 Jun 2021 15:35:03 -0600
From: Rob Herring <robh@kernel.org>
To: Ban Tao <fengzheng923@gmail.com>
Cc: mripard@kernel.org, wens@csie.org, lgirdwood@gmail.com, jernej.skrabec@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, robh+dt@kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings
 for DMIC controller
Message-ID: <20210624213503.GA2025774@robh.at.kernel.org>
References: <20210618060644.2830-1-fengzheng923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618060644.2830-1-fengzheng923@gmail.com>

On Fri, 18 Jun 2021 14:06:44 +0800, Ban Tao wrote:
> DT binding documentation for this new ASoC driver.
> 
> Signed-off-by: Ban Tao <fengzheng923@gmail.com>
> 
> ---
> v1->v2:
> 1.Fix some build errors.
> ---
> v2->v3:
> 1.Fix some build errors.
> ---
>  .../sound/allwinner,sun50i-h6-dmic.yaml       | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
