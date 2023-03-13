Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58158C17
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Mar 2023 21:41:47 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id j7so2697245ybg.4
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Mar 2023 14:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678743706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aln1hEdgcCcgANtA4QqHK4LEQZjmm0gs9rDgqPgUYnk=;
        b=obeFtHVsVUapqop3MZKJozH3FqvKkagKehW9wH8Kk5Z2q53GUYuOTYQwDJfe0rD8GW
         VpTxDa9EKaUb3LWfiQoMqGQSCyEpNI4+b7GzmK3XkQWXoUv7H4WEm+kgX282GUGaLcRR
         oGw49ywWS7ZvrQu5Q27+vM/J3wsgjMJyc2aw94wUqS/O+xhj7nfPqMcBIzeH6DX+m0Tu
         U9ONMmuiYC1sfpAyBk/IEs7gHez697aQhir78i9oLtd/P/vN7M2cqeAND8s7hBro5uge
         sz8dQISn4LMWOjeQoS+p40Jax/AQFpfz+RS+w4EF14NUdwHYe3NrEHORt1Qkv0DcvvHm
         AErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678743707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aln1hEdgcCcgANtA4QqHK4LEQZjmm0gs9rDgqPgUYnk=;
        b=FNwivSf34eMTwEsAuuzyHybjbZwOp1tnmCH56umovgdcKAhA+sHHB/T8b2voUpKOAn
         iYN1HzrBXfPF4O378808h25JggMMZ7StTO2mFJ2oODU7KTtMeba/R2CcQVdahIaR6S33
         dMiFuC6mvJU/jbKPyRCrmYys2M5mQK0cR8PP9daZGiiHJbUtN49t0zrLG7lPMWS4S2kr
         i7BhyxolYlDfihDJ8NwSnJCd4sLKZ8j+ujF5+2qbRymJ0HMl8rc9Qa5/p/3nWdBWJdzu
         1I8457q+GGVt01cE8yLMnj6/gPT2m0JintlQ81EFncUPcLb93xr3gSadrpRcsFbZklVe
         SY8g==
X-Gm-Message-State: AO0yUKWmj96y5nuTf4BJ/ohVo9NdQuWSRLmz9+VP2euXGfGf1wK3JEhI
	q+Be2xzBT8PHFW/PcXVE03TKYxS5CH/SYG5tIq/vRNAHRUVLYvHh
X-Google-Smtp-Source: AK7set+R+YI9Nnas+5qiv6+jEi0Hs0zRL5Bqz75GQxapnR9lrv+JhLm/gXYEZWElQkVJe81BR8KBAxDNduDAH7eUSZY=
X-Received: by 2002:a5b:c48:0:b0:b1a:64ba:9cac with SMTP id
 d8-20020a5b0c48000000b00b1a64ba9cacmr3361726ybr.4.1678743706748; Mon, 13 Mar
 2023 14:41:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230313155138.20584-1-tzimmermann@suse.de> <20230313155138.20584-26-tzimmermann@suse.de>
In-Reply-To: <20230313155138.20584-26-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Mar 2023 22:41:34 +0100
Message-ID: <CACRpkdYDpvpvURPCsdAMEd6s4_uU3UCpWoVLYkM8jh+wBM0ACg@mail.gmail.com>
Subject: Re: [PATCH v2 25/25] drm/pl111: Use GEM DMA fbdev emulation
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, daniel@ffwll.ch, linux-aspeed@lists.ozlabs.org, 
	dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 13, 2023 at 4:51=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:

> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
>
> Reported-by: Linus Walleij <linus.walleij@linaro.org>
> Link: https://lore.kernel.org/dri-devel/CACRpkdawSQsNqKJkSSoSw3HmMHyNXFUy=
wxkdszpTC-a_uZA+tQ@mail.gmail.com/
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
