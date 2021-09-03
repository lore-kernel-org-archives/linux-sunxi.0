Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863C33FC1
	for <linux-sunxi@lists.linux.dev>; Fri,  3 Sep 2021 16:07:49 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id v33-20020a0568300921b0290517cd06302dso7096808ott.13
        for <linux-sunxi@lists.linux.dev>; Fri, 03 Sep 2021 09:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X9EoctdCi61dxF0sN3RYUh7Sq1ZZ1hgqyk+aajCi77E=;
        b=L/Ejkoo9uUq0YbY45bt6O59bQm5b2RPiEkU7kpJoevaAkMBlteyEjEFFLsdmex7Ybj
         6e4UpP3rTF96gFUE/xcDJSqz2LjTmmGn5MYTvP8WICppavIVRfpFu14qIhUbZQVgMtPz
         rNFPwiI6WJJnu44l3OXwSiU/bnZI2LsSgLARSAYvT3GT5F5rftHdf3pY30GRa5cU/0+A
         UGmcXibT4mmeBssqCQm4Pz5UMfD+5oXiCbeQelhWzgHHmZrZgCGSaWCr9ki8S1F1kmT7
         Z9A1PRH6IcT1JoXxFhAPXgR/oYE3sJBdrpz3MpxhHQAiM1hTqjRiEHTR9hmafaHi+m8C
         sOug==
X-Gm-Message-State: AOAM533B0oGLWcrV1Xmgc8MVxKyorK3nhuzMdgHtNiXax327bKl1aaTb
	rvj5FGZQe98QisRg4ZdR3Q==
X-Google-Smtp-Source: ABdhPJx6fVy45NUm19V4s1kfkPU3oDPESzTSfZcum5Yriq84uuncy+0f+/TnPB6bRmWPuRaP4J69Ew==
X-Received: by 2002:a9d:7006:: with SMTP id k6mr3874778otj.181.1630685268668;
        Fri, 03 Sep 2021 09:07:48 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e11sm1090605oiw.18.2021.09.03.09.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 09:07:47 -0700 (PDT)
Received: (nullmailer pid 3026291 invoked by uid 1000);
	Fri, 03 Sep 2021 16:07:46 -0000
Date: Fri, 3 Sep 2021 11:07:46 -0500
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Icenowy Zheng <icenowy@aosc.io>, linux-watchdog@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: watchdog: sunxi: Add compatibles for
 R329
Message-ID: <YTJIUocojn3h4R25@robh.at.kernel.org>
References: <20210902225750.29313-1-samuel@sholland.org>
 <20210902225750.29313-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902225750.29313-2-samuel@sholland.org>

On Thu, 02 Sep 2021 17:57:48 -0500, Samuel Holland wrote:
> On existing SoCs, the watchdog has a single clock input: HOSC (OSC24M)
> divided by 750.  However, starting with R329, LOSC (OSC32k) is added as
> an alternative clock source, with a bit to switch between them.
> 
> Since 24 MHz / 750 == 32 kHz, not 32.768 kHz, the hardware adjusts the
> cycle counts to keep the timeouts independent of the clock source. This
> keeps the programming interface backward-compatible.
> 
> Furthermore, the R329 has two watchdogs: one for use by the ARM CPUs
> at 0x20000a0, and a second one for use by the DSPs at 0x7020400. The
> first of these adds two more new registers, to allow software to
> immediately assert the SoC reset signal. Add an additional "-reset"
> suffix to signify the presence of this feature.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> Changes v2 to v3:
>  - Add else case
>  - Add additional allwinner,sun50i-r329-wdt-reset compatible
> Changes v1 to v2:
>  - Switch clock-names from enum to const
>  - Add descriptions to "clocks" items
> 
>  .../watchdog/allwinner,sun4i-a10-wdt.yaml     | 42 ++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
