Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2422C80
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Oct 2021 01:07:15 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id w10-20020a056830280a00b0054e4e6c85a6so14835674otu.5
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Oct 2021 18:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oNKIkgIeyAhvnUpCpJSDJiW2bX74JtLFJG0XP81iGgs=;
        b=DHDa5Fktb8NVOKOgVqqtlmopW2kTmpR14JlAFwQbjodLsOQFJTRp4cEjt7bZo7144E
         LUAwyNQagH/zUN/cpxXWhCcMe4T2BakqhU85yjDdXd8yhgcdvAbhYBv488rIRFh8lvm/
         QFy+HfaNMVTzeOZcMQEr/bmHsZch3TkkgH0jysVLU1OUQD20LCqj7gGKMYdY0NZw+RPw
         AAsdS0o7tMyhLVH58szTlkih0i46BIxTY8+9tVR4UAi0KH66A6oWwQCoDgfMI+EB9QdT
         IO8v0kuqxvhbNLZyINafsPsV05VFbw5kIukKzRpz3kz8CwQTGOdJLz5SP+i8uV06LCjV
         80Rw==
X-Gm-Message-State: AOAM53244+KUhpdhO6GkIUDFjErz8KwgJNE8deteN5bhmplSU2dvLjFa
	VfM6+Fb748Rxlg0x/WFBsA==
X-Google-Smtp-Source: ABdhPJxZ31PlfFMh6vQNPQjBd9RwWuQtvQ5MQFK70WXxj3fALbzpUEclVT37F2/tAZV+2ZFKR/d83g==
X-Received: by 2002:a05:6830:1c7c:: with SMTP id s28mr22962910otg.345.1634000834737;
        Mon, 11 Oct 2021 18:07:14 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id f61sm2062459otf.73.2021.10.11.18.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 18:07:14 -0700 (PDT)
Received: (nullmailer pid 1514762 invoked by uid 1000);
	Tue, 12 Oct 2021 01:07:13 -0000
Date: Mon, 11 Oct 2021 20:07:13 -0500
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, linux-sunxi@lists.linux.dev, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: sunxi: Export CLK_DRAM for
 devfreq
Message-ID: <YWTfwZXV/Baz+An7@robh.at.kernel.org>
References: <20211004012739.39053-1-samuel@sholland.org>
 <20211004012739.39053-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004012739.39053-2-samuel@sholland.org>

On Sun, 03 Oct 2021 20:27:34 -0500, Samuel Holland wrote:
> The MBUS node needs to reference the CLK_DRAM clock, as the MBUS
> hardware implements memory dynamic frequency scaling using this clock.
> 
> Export this clock for SoCs which will be getting a devfreq driver.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.h      | 2 --
>  drivers/clk/sunxi-ng/ccu-sun8i-h3.h        | 2 --
>  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 +-
>  include/dt-bindings/clock/sun8i-h3-ccu.h   | 2 +-
>  4 files changed, 2 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
