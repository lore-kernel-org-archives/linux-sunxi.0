Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085B0814
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jun 2022 13:52:33 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-f2cbceefb8so6773948fac.11
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jun 2022 06:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Cwrty3bkHypAjRxPwNA1vccjhwmtNX2VQaw293iyBPY=;
        b=LiK1PXq3XsHNlyWB/MmFosaXWnVMpYgZ3HD52CBgJwpzLnlibFbUXputE9eqsyxOr4
         kyrObuDbhP6DQCMJKMuNAgKNyAGFOJNcXlrIEVTzkrseLnrQziJ5c5HMVDjBG4s8GPLl
         dErKwBdjxzFoCCVdMGMKOGAdHOO7LOQ0CqkVhsExpfcn4vXX7oXIEP5HAYncKMoDZ3uH
         bYR8OigkGAGOoxiTeGpNtmvVfzq8tX0cyLIhUHOAAcUM176fvap7/cYikV4z8DbSSZpG
         Hkkvg8TPaie+ItDRLD+kqHVL6guQLKfwHx15n7YxR6m300xuUv2QTb2sRL4BaksU/Vc1
         caEw==
X-Gm-Message-State: AOAM532AGJtiNiQH485LlX7c+EqRu2mYuTNCcRc7jHW5mKXas1++ENIL
	KnqPq2bsg8fTfFmeYaOetg==
X-Google-Smtp-Source: ABdhPJycRtrCYcM7mCLAprLiOP0DJCpEHKtrncX2BqebZtxrrIK1XXfbFfz7x6eAIxs0AQH1vzuMhQ==
X-Received: by 2002:a05:6870:d784:b0:f1:5d2e:146a with SMTP id bd4-20020a056870d78400b000f15d2e146amr2933668oab.110.1654177953147;
        Thu, 02 Jun 2022 06:52:33 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k6-20020a9d1986000000b0060603221268sm2197510otk.56.2022.06.02.06.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 06:52:32 -0700 (PDT)
Received: (nullmailer pid 2190724 invoked by uid 1000);
	Thu, 02 Jun 2022 13:52:32 -0000
Date: Thu, 2 Jun 2022 08:52:32 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v4 2/7] clk: sunxi-ng: v3s: Export MBUS and DRAM clocks
 to the public header
Message-ID: <20220602135232.GA2190690-robh@kernel.org>
References: <20220525185853.695931-1-paul.kocialkowski@bootlin.com>
 <20220525185853.695931-3-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525185853.695931-3-paul.kocialkowski@bootlin.com>

On Wed, 25 May 2022 20:58:48 +0200, Paul Kocialkowski wrote:
> In order to declare a mbus node for the v3s, expose its associated
> clocks to the public header.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-v3s.h      | 4 ----
>  include/dt-bindings/clock/sun8i-v3s-ccu.h | 4 ++--
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
