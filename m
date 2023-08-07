Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0D4443A
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Aug 2023 14:28:21 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-686f8614ce5so4549244b3a.3
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Aug 2023 07:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691418500; x=1692023300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oe/CN6/jCuhHF6++Sm5t23zpKw7bQYwVaG0CyMWDU64=;
        b=ZtYPyL2znIB+Q4N8CGTvTGsMvjv5SjYBhD36/wsxmioRmqTzelk0i2jZI3PL4Qdjab
         qzWBgydStqSnJos8pIej0M0LrU0++IwtQoimmWHpBh+YjuGZhxwcALoCqwUm3NPx1VkB
         ke0TfiKDuGYS0yMeZH3IsXuIr7nxbJF3M8eFb4MXMsrpSKV3qSMT25Alys6MTjsfDd6l
         dv/+JklHRuMaOwHSEKH489JTWbWxM0vOfzT0ypBVOM7gyvs5QbT0EC3L34J1nOZtZ12C
         X4spQQ6fl8U/rx8jSZTzKhpYiXbvkAe1TJPXqHX5IVXMMlcKPmfUKpiDHoLXSon5a9BQ
         QQJg==
X-Gm-Message-State: AOJu0YwbIJsylGcU9okO7vkhS5/tPKaapSfN3JhU3xn12kzmrRxlxdbm
	CZ3gMJlmbpxHpgZpe9cwg/0fnpRmYSQYsQ==
X-Google-Smtp-Source: AGHT+IE6wxCUnHzxA5xTTUj6LV7m+kZPNXXi7VsuOEmZiBTcAasqnp1ntyBQA8taMe4KVA0mB5pJpg==
X-Received: by 2002:a05:6a00:80f:b0:687:5723:a9d5 with SMTP id m15-20020a056a00080f00b006875723a9d5mr12416444pfk.21.1691418500066;
        Mon, 07 Aug 2023 07:28:20 -0700 (PDT)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com. [209.85.215.174])
        by smtp.gmail.com with ESMTPSA id j5-20020aa78d05000000b0065e154bac6dsm6226902pfe.133.2023.08.07.07.28.19
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 07:28:19 -0700 (PDT)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-55bac17b442so3314246a12.3
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Aug 2023 07:28:19 -0700 (PDT)
X-Received: by 2002:a17:90a:ce96:b0:268:5bca:3bdf with SMTP id
 g22-20020a17090ace9600b002685bca3bdfmr8841244pju.40.1691418499602; Mon, 07
 Aug 2023 07:28:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230807-pll-mipi_set_rate_parent-v6-0-f173239a4b59@oltmanns.dev> <20230807-pll-mipi_set_rate_parent-v6-2-f173239a4b59@oltmanns.dev>
In-Reply-To: <20230807-pll-mipi_set_rate_parent-v6-2-f173239a4b59@oltmanns.dev>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 7 Aug 2023 22:28:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v67YWKbit+F1gOuZ2KFNjcD7NzwwKKpue=f8R2Se8Fg1ag@mail.gmail.com>
Message-ID: <CAGb2v67YWKbit+F1gOuZ2KFNjcD7NzwwKKpue=f8R2Se8Fg1ag@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] clk: sunxi-ng: nkm: consider alternative parent
 rates when determining rate
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, Roman Beranek <me@crly.cz>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 7, 2023 at 8:44=E2=80=AFPM Frank Oltmanns <frank@oltmanns.dev> =
wrote:
>
> In case the CLK_SET_RATE_PARENT flag is set, consider using a different
> parent rate when determining a new rate.
>
> To find the best match for the requested rate, perform the following
> steps for each NKM combination:
>  - calculate the optimal parent rate,
>  - find the best parent rate that the parent clock actually supports
>  - use that parent rate to calculate the effective rate.
>
> In case the clk does not support setting the parent rate, use the same
> algorithm as before.
>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
