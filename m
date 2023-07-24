Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC778EC2
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Jul 2023 04:25:06 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-66c729f5618so3765965b3a.1
        for <linux-sunxi@lists.linux.dev>; Sun, 23 Jul 2023 21:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690172706; x=1690777506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UPd/ArX54wqm/tpIEiEhXcXx1X1EWiF2KSiUxQCQJ7k=;
        b=RvsdkRDPYfr6N/6c8aZGUc/31/ZJGWi5u6uyeM4gRwE6Uozbh5mcN6VfAItdfyjeK8
         lECf7dOHIeA1juGAeWddfBG56wZ1O2BX6TAkwg/4yXUs+OdBGAfqKUpCmR5igdBYHFLy
         i1Dt5V+/H9EaZzEAzzTCA/0ywgyJWmSnyMoBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690172706; x=1690777506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPd/ArX54wqm/tpIEiEhXcXx1X1EWiF2KSiUxQCQJ7k=;
        b=e4x0jOxAtmjdmomHp/D3iQP/Mu4qPcQksSAmVeTgzwu3OGa2pcvUSpM57Khcp6653d
         ke3wCVdatkBy1He/nAgSzkvlmgw0am/i+Co8DYgFzZwEQqx5msDxh4j1SULuN9cBZ4By
         lj+Pt/l8QBwRGdsT4cDC18jwkRVxE1tm0a8rAqe24nNk0a0W71Vj8b7b+j5v6AD8nqbm
         0kRl6NE4n6XRz38wAsiQqXNPoJQkB+ksisFTZIrhiGrXpXt9TWhAgLbc2FqW8xexLUQZ
         LGFD/B/sFFoHhpIUVGbRXKWhN1sSj4KhsoSjQ36YqFSLTUEqIachZUtig22tr779t0yw
         cvhg==
X-Gm-Message-State: ABy/qLbEFEzn4AQdTuN09nUcPpNB2mgQxXJDEj3SxnNJtj6GNV+ICbp5
	i4Sy+DdqtEp5hwPyvEMBAU7j0Q==
X-Google-Smtp-Source: APBJJlH2TXjXyCI+Wm3NdTdlzQ/Md1RTpmdFKaqCFO/is9/DjNxtCBDRl3BbDb8IaKxYTeFcBvfJkw==
X-Received: by 2002:a05:6a00:2196:b0:668:82fe:16f1 with SMTP id h22-20020a056a00219600b0066882fe16f1mr9170529pfi.1.1690172706143;
        Sun, 23 Jul 2023 21:25:06 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:a3b4:a34b:d387:dea5])
        by smtp.gmail.com with ESMTPSA id x48-20020a056a000bf000b00666b012baedsm6636251pfu.158.2023.07.23.21.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 21:25:05 -0700 (PDT)
Date: Mon, 24 Jul 2023 12:25:02 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Mark Brown <broonie@kernel.org>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH RESEND RESEND] thermal/of: support thermal zones w/o
 trips subnode
Message-ID: <20230724042502.GA2403526@google.com>
References: <20230722122534.2279689-1-zhengxingda@iscas.ac.cn>
 <ZLw4CnzLI/QHPGWx@finisterre.sirena.org.uk>
 <6d1c0915-1485-d9d6-9fff-0413fb16bd3f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d1c0915-1485-d9d6-9fff-0413fb16bd3f@linaro.org>

On Sun, Jul 23, 2023 at 12:12:49PM +0200, Daniel Lezcano wrote:
> 
> Hi Mark,
> 
> On 22/07/2023 22:11, Mark Brown wrote:
> > On Sat, Jul 22, 2023 at 08:25:34PM +0800, Icenowy Zheng wrote:
> > > From: Icenowy Zheng <uwu@icenowy.me>
> > > 
> > > Although the current device tree binding of thermal zones require the
> > > trips subnode, the binding in kernel v5.15 does not require it, and many
> > > device trees shipped with the kernel, for example,
> > > allwinner/sun50i-a64.dtsi and mediatek/mt8183-kukui.dtsi in ARM64, still
> > > comply to the old binding and contain no trips subnode.
> > > 
> > > Allow the code to successfully register thermal zones w/o trips subnode
> > > for DT binding compatibility now.
> > > 
> > > Furtherly, the inconsistency between DTs and bindings should be resolved
> > > by either adding empty trips subnode or dropping the trips subnode
> > > requirement.
> > 
> > This makes sense to me - it allows people to see the reported
> > temperature even if there's no trips defined which seems more
> > helpful than refusing to register.
> 
> The binding describes the trip points as required and that since the
> beginning.

Not really. It was made optional in the v5.15 kernel release by commit

    22fc857538c3 dt-bindings: thermal: Make trips node optional

> What changed is now the code reflects the required property while before it
> was permissive, that was an oversight.
> 
> Just a reminder about the thermal framework goals:
> 
>   1. It protects the silicon (thus critical and hot trip points)
> 
>   2. It mitigates the temperature (thus cooling device bound to trip points)
> 
>   3. It notifies the userspace when a trip point is crossed
> 
> So if the thermal zone is described but without any of this goal above, it
> is pointless.
> 
> If the goal is to report the temperature only, then hwmon should be used
> instead.

What about thermal sensors with multiple channels? Some of the channels
are indeed tied to important hardware blocks like the CPU cores and
should be tied into the thermal tripping. However other channels might
only be used for temperature read-out and have no such requirement.

Should we be mixing thermal and hwmon APIs in the driver?

> If the goal is to mitigate by userspace, then the trip point *must* be used
> to prevent the userspace polling the temperature. With the trip point the
> sensor will be set to fire an interrupt at the given trip temperature.
> 
> IOW, trip points are not optional

for measurement points that are used for thermal throttling /
mitigation.

ChenYu
