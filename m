Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A1911CAF
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Jul 2023 18:51:31 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1bb4277a715so31870fac.1
        for <linux-sunxi@lists.linux.dev>; Wed, 26 Jul 2023 11:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690397491; x=1691002291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRGsH1Jfr6RATHY+BbPInolEKd5y3/mX+qRWdn1CGUY=;
        b=NC+iIsUc/W0n2qSTPiJEghXvCX9OJHaBrW7fb6Ap7RAt/NhD7pu//xsQr85ylCQPwS
         Sklmk5DkbbUQsdUt0FjhRpsc9NGrfE0KbACKjig0hXc9cn35mFoy8v4Y1ecIWJppOLs8
         14bPgKFf23WJZJ7RYjm2RAm3jD1TqkwDru9m1TGulSZ/37ixTEwuOgW7x/MNwe+EIPBx
         is+enhvwmVjfnxm9y19feRON4qS6Yb2aXJVub7bOEfRbQa6/d0CrNjZDF5M5jEart6/f
         y7213o2F3es77+LWL1VJpLLZNc80VA58csR1bUkEX57iv6aaAfL67mJKoeSIfmwxxlYe
         l9HA==
X-Gm-Message-State: ABy/qLYZjeuHcWhv5bfAy274+NBcsZ/IBKDaKkKChWkgrmiwzoit56V7
	o43SzhUzdkUwZzMUdA0QVLGWXW4zjSY4gS/VBJg=
X-Google-Smtp-Source: APBJJlFVCfzLFBWJ9nKz6/tyw2MPzkkpGTF3nE0WwxgFcOp8SstqNkXH4ER+l035s5VdMt4zisZ9NDaLmuRaMGBsFqE=
X-Received: by 2002:a05:6870:1693:b0:1bb:81a1:f44e with SMTP id
 j19-20020a056870169300b001bb81a1f44emr3091322oae.3.1690397491100; Wed, 26 Jul
 2023 11:51:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230723-thermal-fix-of-memory-corruption-v1-1-ed4fa16d199d@kernel.org>
 <f559a614-93d5-121a-8ff3-0da77bc85f44@linaro.org> <ZL054LHAZv8VmIk3@finisterre.sirena.org.uk>
 <CAJZ5v0jJ+YM=7LUEKB_b5GUsGopLTT0eyPmomYV0OcGQp2gvig@mail.gmail.com> <a72ca5e0-556a-4d16-9c5e-2b342bb074c1@sirena.org.uk>
In-Reply-To: <a72ca5e0-556a-4d16-9c5e-2b342bb074c1@sirena.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 26 Jul 2023 20:51:20 +0200
Message-ID: <CAJZ5v0jybAspzV2sWduERaMhBWPSYN_USiUcO_=eRUBB6vB6GQ@mail.gmail.com>
Subject: Re: [PATCH] thermal/of: Fix double free of params during unregistration
To: Mark Brown <broonie@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Hugh Dickins <hughd@google.com>, 
	Will Deacon <will@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 8:47=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Jul 26, 2023 at 08:42:39PM +0200, Rafael J. Wysocki wrote:
> > On Sun, Jul 23, 2023 at 4:32=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
>
> > > There was a message on the thread saying the patches have been applie=
d
> > > for v6.5 but I can't see them in either mainline or -next.
>
> > They should be there in linux-next (as of today).
>
> Yes, they're there now.  They weren't at time of writing the above (on
> Sunday).
>
> > Surely, they are present in my linux-next branch.
>
> Are they queued as fixes?

They are.

>  It'd be really good to get these into v6.5,
> they're rendering the Allwinner platforms I have unusable.

I'm going to send a pull request with them tomorrow or on Friday.
