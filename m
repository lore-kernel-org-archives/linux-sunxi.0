Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DC72C80
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Oct 2021 16:33:41 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id p6-20020a9d7446000000b0054e6bb223f3so9027333otk.3
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Oct 2021 09:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wbyg5/ZHCP6iv8scvAQY2n2pP40B3OluO2DV9x0j5u4=;
        b=kVk4nSTjWBA0s7FmQ+k6PcQk74h33FPkZiwrQ9D23aVTBeT5RZw/17fuLyVHrIuD8W
         xaPElrqnQZ2Eg3NDrhvbXAOFxC0Src9xmU3R2VkDN/tP/N6wyKAHKkO0C+WdgHD3rHdx
         Md/GwUWEvt+RMmFzppptFfQ8qUSaGt97026xHSZkV1YbJQ5+YRcSTwK8TRO0tOyTU9QC
         Zvukm+JBT0DYfQsylqCiXiBrq0c75l5pKMFAWOoKehNHTVMoiuPXMOZIrIY8JISWb+5G
         AcaYADeppVCK5N5Ux6YRTiTuQwrOCy5PrV0317/+ffhY+Xz+YreUWnP/e7ElAaesFSof
         +EZQ==
X-Gm-Message-State: AOAM533Gq2MzBgxSsu3VZMmCYyWi9bON0PhzxoPX6YndwLsU2BPbXvri
	VedscljBTwS3HmY5EWW7LA==
X-Google-Smtp-Source: ABdhPJz377Q3GSNcm3sjaJvTeT55d12kei7sdBCTz5v8aRBkdARJ5enXHLd7xmjfqtxVxvxDgzPvdw==
X-Received: by 2002:a9d:1b41:: with SMTP id l59mr3338165otl.283.1634229221053;
        Thu, 14 Oct 2021 09:33:41 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e9sm527185oos.39.2021.10.14.09.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 09:33:40 -0700 (PDT)
Received: (nullmailer pid 3496466 invoked by uid 1000);
	Thu, 14 Oct 2021 16:33:39 -0000
Date: Thu, 14 Oct 2021 11:33:39 -0500
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-pm@vger.kernel.org, linux-sunxi@lists.linux.dev, Kyungmin Park <kyungmin.park@samsung.com>, Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 3/6] dt-bindings: arm: sunxi: Add H5 MBUS compatible
Message-ID: <YWhb46PfBcKDyAdP@robh.at.kernel.org>
References: <20211004012739.39053-1-samuel@sholland.org>
 <20211004012739.39053-4-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004012739.39053-4-samuel@sholland.org>

On Sun, 03 Oct 2021 20:27:36 -0500, Samuel Holland wrote:
> The H5 SoC has a MBUS very similar to the H3 SoC, but it has a smaller
> MDFS divider range (1-4 instead of 1-16). Add a separate compatible for
> this variant.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
