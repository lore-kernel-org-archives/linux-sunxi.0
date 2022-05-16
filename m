Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0F110E0
	for <linux-sunxi@lists.linux.dev>; Mon, 16 May 2022 15:39:39 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id z144so15892640vsz.13
        for <linux-sunxi@lists.linux.dev>; Mon, 16 May 2022 08:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=v4AO4TvHBXHTDE7cylsD4nuz6SSH2GMvFgLvHL67nzg=;
        b=HVxXNl/0POwR/9IYYuqWk78455Zd8NyQigzncvkU8bK63XhIVqPbS2/TrOye0oDesj
         85nc035mF03zqHEtceDvEJLu71a62Z0dbRCH3L2CzG/JExH/jN+J1curqncB1iZbIU9G
         5rL8SpfhbyPGqVejWWNce+217vdLSFfWnSpuobUA4yoSGaZyashxaRQ7CyCcHIUKxCko
         p/pAwVePpRZUWzDiwamIMGrhbT3MeZ9ZNlnK5yCM88SMCjqLr419soT3fn84Gi3X8V6D
         ZilKrm/sme5ms3lnhDBZT31NCjM4AFjhcWl3yKcko/gJtmIZ68H8szJvAppSKW5GoF6J
         tMeg==
X-Gm-Message-State: AOAM531nv6gy4MWRW+i/g50PsZYdlkXL47VKZOZR6vsj1gI+c5mKg3xn
	Yt15fMYmaV475AA6nRKle4joAOPZ/ad9ew==
X-Google-Smtp-Source: ABdhPJzeWXq9ghiRtr9CL4LdIX12HSR91hzO3mFJXuVEtK/xObDwW2tUNGa7HQDkmOiBQVhXYY/hUA==
X-Received: by 2002:a05:6102:538:b0:32c:bb2d:ddce with SMTP id m24-20020a056102053800b0032cbb2dddcemr6287097vsa.6.1652715578490;
        Mon, 16 May 2022 08:39:38 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id i8-20020a056122058800b00356956152a5sm846511vko.17.2022.05.16.08.39.37
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 08:39:38 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id z144so15892571vsz.13
        for <linux-sunxi@lists.linux.dev>; Mon, 16 May 2022 08:39:37 -0700 (PDT)
X-Received: by 2002:a67:b304:0:b0:32c:fb41:9f43 with SMTP id
 a4-20020a67b304000000b0032cfb419f43mr6526925vsm.83.1652715577451; Mon, 16 May
 2022 08:39:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220512071858.10805-1-qianfanguijin@163.com> <20220512071858.10805-2-qianfanguijin@163.com>
 <20220513073849.cu4jzykefat2sepg@houat> <1352b9d7-5219-af09-948b-6462def39ea5@163.com>
 <20220513081556.knd3tf6pangfblh3@houat> <666ead08-af1e-81f5-6fe1-e5e3370e6d6f@163.com>
 <20220516075326.hccburhu743t7p6r@houat>
In-Reply-To: <20220516075326.hccburhu743t7p6r@houat>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 16 May 2022 23:39:26 +0800
X-Gmail-Original-Message-ID: <CAGb2v65xifgy4dXciron4yxiUQtHb-2ZRGTqOiSjLrdbFtqQEA@mail.gmail.com>
Message-ID: <CAGb2v65xifgy4dXciron4yxiUQtHb-2ZRGTqOiSjLrdbFtqQEA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: sun8i-r40: Add "cpu-supply" node for
 sun8i-r40 based board
To: qianfan <qianfanguijin@163.com>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:THERMAL" <linux-pm@vger.kernel.org>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 16, 2022 at 3:53 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Fri, May 13, 2022 at 04:23:20PM +0800, qianfan wrote:
> > > > > There's a similar issue for all the boards that don't have a regulator
> > > > > in the first place.
> > > > >
> > > > > The way we worked around this for the other SoCs is to have a DTSI with
> > > > > the OPPs with a frequency higher than what U-Boot boots with (1008MHz?),
> > > > > and only include that DTSI on boards that have a CPU regulator hooked in.
> > > > Is this really necessary? It seems like every board based on sun8i-r40
> > > > have a cpu regulator.
> > > This probably won't be the case whenever someone starts a new design,
> > > and then they'll face random crashes for no apparent reason, and waste a
> > > lot of time in the process.
> > >
> > > Whereas the alternative is that you would be missing some OPPs,
> > > something that is fairly easy to figure out.
> >
> > How about remove the OPPs which greate that 1.08G in sun8i-r40.dtsi,
> > If some boards want to run at a higher frequency, can add them byself
> > in the board's file.
>
> You did all the work to support and test them already. It's a bit of a
> waste to do that and not include it.
>
> Just do a DTSI like we did for the A64 for example.

There's also no guarantee that the board boots up at 1.08G. The board
may be set to boot up at a slightly lower frequency / voltage combination.
Or maybe the board's supply voltage simply isn't stable enough for sustained
high CPU usage at 1.08G.

Letting the kernel assume that it is OK to run at some OPP is not a good
idea. The boards should explicitly include the default OPP table, or define
their own, while adding a proper CPU supply at the same time.


Regards
ChenYu
