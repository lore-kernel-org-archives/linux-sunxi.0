Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613A0171A9
	for <linux-sunxi@lists.linux.dev>; Mon, 22 May 2023 19:55:42 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-3f4e01eb845so34972421cf.2
        for <linux-sunxi@lists.linux.dev>; Mon, 22 May 2023 12:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684785341; x=1687377341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rberg4bwUy07oOUWgD6JRy5t/SGEkLBqBr8AY1Hm/Hc=;
        b=MumOKtVbvpYF1URRoME2u4hs0ePmWNGRKdF+QL2FppqL4wIKBlUcban31t6elfsMgl
         I+WU+t3+ytTSHYQrK9IaeB5DU6axO+euarW8HA4CD0k6oztaOFFWymdJ2fSfsb6atvne
         mNhaKnbk4g38Fb9HEFT8fmJuz1hGFPzn2xjY48Ls1+3/qhTdfUsel+j0LEQEaqSJRZxT
         YQP+N1h77ATSyxlNztyABc7TeNhpvfBKES452+ccTGhjFHHIuKsF+kPi1SoyFTGYwxbJ
         FNhfhzOBqeM5a+U0jIEmHpYjoVZ81boF1oHo3RCgAouaBM1QlB/K1IvQPk6+ZIJEX65X
         DCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684785341; x=1687377341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rberg4bwUy07oOUWgD6JRy5t/SGEkLBqBr8AY1Hm/Hc=;
        b=bcRDH68B43sNrkYuWAzo9iXfalFVMTGhm1TdM1jhGDB97i0MTIf5v48l+dPI3K87DI
         Xn1uawohefcnJa7oZruR9kEjrJzDT4x3x2nh4/ag77s8zj+tZseJVyruKZr7n7g4duOj
         73TXZMlq71ztw2dSUAFZ8v7nm0ZhffkTKoNBwbF5T85Zz5yoQskuKhbKF4lNCsZI6Yzy
         ZFY/CJvwR002Knaxo7iYskfC8Xak8iKVi7LzGZq56crRpbkr9/+B8lsvtANKHSQSTBBq
         zn5XTrTkKvWTI2goAU8XHEbHbMzAKzptg/QV8iL568p5v9eMxG2364g70Yf8ZkwYXqp7
         5+Eg==
X-Gm-Message-State: AC+VfDyQwgdeENrZEw0tpETDJPQUl8zlHmNGYk6lYT2NIS0vX8Y+dWRG
	otgEonsVdrZd4aZ2Yr4JjWBRyLj8T61mSXHmyKqChA==
X-Google-Smtp-Source: ACHHUZ7yl3BpjhOWiGRIS/IB9MYPFWRYgFp7KBYS80lpTZrk+qUlmN4Cx8Y2/Q3JYL5nEEPZ/nnEvCXWUqUopr9Zah0=
X-Received: by 2002:a05:622a:1213:b0:3f2:a58:7a7a with SMTP id
 y19-20020a05622a121300b003f20a587a7amr19555223qtx.58.1684785341122; Mon, 22
 May 2023 12:55:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230516-sunxi-v1-1-ac4b9651a8c1@google.com> <f099e6e0-d1c6-9d72-0d16-2712286be67d@gmail.com>
In-Reply-To: <f099e6e0-d1c6-9d72-0d16-2712286be67d@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 22 May 2023 12:55:30 -0700
Message-ID: <CAKwvOdngn_v3oW4iTFZ1rBKOtWNUAk_-qc+u3V+UhM5wmwzSdg@mail.gmail.com>
Subject: Re: [PATCH] ARM: sunxi: fix return code check of of_property_match_string
To: "William (Zhenghao) Zhang" <william.zhang@broadcom.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 16, 2023 at 11:34=E2=80=AFAM Florian Fainelli <f.fainelli@gmail=
.com> wrote:
>
> +William,
>
> On 5/16/23 09:35, ndesaulniers@google.com wrote:
> > of_property_match_string returns an int; either an index from 0 or
> > greater if successful or negative on failure.
> >
> > Fixes the following splat observed with UBSAN:
> > [    0.166489][    T1] UBSAN: array-index-out-of-bounds in arch/arm/mac=
h-sunxi/mc_smp.c:810:29
> > [    0.166934][    T1] index 2 is out of range for type 'sunxi_mc_smp_d=
ata [2]'
> > [    0.167206][    T1] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        =
W          6.4.0-rc2 #1
> > [    0.167515][    T1] Hardware name: Generic DT based system
> > [    0.167727][    T1]  unwind_backtrace from show_stack+0x18/0x1c
> > [    0.167979][    T1]  show_stack from dump_stack_lvl+0x68/0x90
> > [    0.168226][    T1]  dump_stack_lvl from ubsan_epilogue+0x8/0x34
> > [    0.168474][    T1]  ubsan_epilogue from __ubsan_handle_out_of_bound=
s+0x78/0x80
> > [    0.168760][    T1]  __ubsan_handle_out_of_bounds from sunxi_mc_smp_=
init+0xe8/0x574
> > [    0.169100][    T1]  sunxi_mc_smp_init from do_one_initcall+0x178/0x=
9c8
> > [    0.169364][    T1]  do_one_initcall from kernel_init_freeable+0x1dc=
/0x28c
> > [    0.169661][    T1]  kernel_init_freeable from kernel_init+0x20/0x16=
4
> > [    0.169912][    T1]  kernel_init from ret_from_fork+0x14/0x2c
> >
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> William had a similar fix submitted back in September of last year, but
> I do not believe it got applied either:
>
> https://lore.kernel.org/r/20220929012944.454613-1-william.zhang@broadcom.=
com
>
> lore was not able to find it, but above is the message ID, and attached
> is his original patch.

Hi William,
How would you like to proceed here? I don't want to step on any toes
if there's an existing patch.

> --
> Florian



--=20
Thanks,
~Nick Desaulniers
