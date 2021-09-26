Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3615A3FC7
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Sep 2021 15:15:10 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id k10so15287303vsp.12
        for <linux-sunxi@lists.linux.dev>; Sun, 26 Sep 2021 08:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=9+6BHA6Y+Mug0Ury7azxLzdId08mKmMxUAPT+ZvUUdA=;
        b=5MiN3XNH9T4xh/LCi1l5KOTl64CoOXJkj4mJZifTuFtf46CjUYG0Ua7qv239vM9HN3
         eBnIBQzRtwQmNqdDLzfj2GCKiNBLpAc8e7k5oWHpapUZ4u81H7a8/A3PwYdPukRJY37P
         cBOP+bz2H2yk6tqHNvFiGYVFLsZxfRV2cAEmJLmkjA0ch9xh78nzbbJTAddGSIT97GM6
         C+nbD9GxZogvJOvtlPzsJVFTQIpaQlZSyJUnCUOv9S7/nj8kCfhoEo1EuW5OiZ4xIE9/
         mrvQbPCYwT4wG77cfStG2skfkTD3rcYtWuZPOLsxB9/aBxlpDGCHE/vu1W8rN4sPtJL7
         zmqA==
X-Gm-Message-State: AOAM531YiHmrW7MesCXgt+vVTdNgrx/etzBIfoJnaUFlvU0n//Sog9G/
	PK1VSLGpxh9Vfpe5+Lk/zeceLADb1qitOA==
X-Google-Smtp-Source: ABdhPJzAy+TxGN9YwSP27Lael4Es2ePB7pijvP+pLNsJn37ALAU+Itrb9e0Lh49nIQvhuIquAe5ulQ==
X-Received: by 2002:a05:6102:1d4:: with SMTP id s20mr16065897vsq.3.1632669309070;
        Sun, 26 Sep 2021 08:15:09 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id v22sm589806vsd.27.2021.09.26.08.15.08
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Sep 2021 08:15:08 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id f18so15387650vsp.2
        for <linux-sunxi@lists.linux.dev>; Sun, 26 Sep 2021 08:15:08 -0700 (PDT)
X-Received: by 2002:a05:6102:20cf:: with SMTP id i15mr16383760vsr.49.1632669308607;
 Sun, 26 Sep 2021 08:15:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210924071614.868307-1-maxime@cerno.tech> <20210924071614.868307-2-maxime@cerno.tech>
In-Reply-To: <20210924071614.868307-2-maxime@cerno.tech>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 26 Sep 2021 23:14:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v66AiepHO939ZWxxk3F-WpxqTS2TZ4J4pGQVr2gs6N7ZQg@mail.gmail.com>
Message-ID: <CAGb2v66AiepHO939ZWxxk3F-WpxqTS2TZ4J4pGQVr2gs6N7ZQg@mail.gmail.com>
Subject: Re: [RESEND v2 2/3] dt-bindings: mfd: Convert X-Powers AXP binding to
 a schema
To: Maxime Ripard <maxime@cerno.tech>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Lee Jones <lee.jones@linaro.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 24, 2021 at 3:16 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The X-Powers AXP PMICs are supported by Linux thanks to its device tree
> binding.
>
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Chen-Yu Tsai <wens@csie.org>
