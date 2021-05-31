Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E31372
	for <linux-sunxi@lists.linux.dev>; Mon, 31 May 2021 20:02:09 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id v22so13295469oic.2
        for <linux-sunxi@lists.linux.dev>; Mon, 31 May 2021 13:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=I7ZVjQKCgK+4UFooHKAFCEi55VrTc406tTQzGXEeJTk=;
        b=q07wdJ0xREl5MkFF6QVAILlDkdz91LhUnxKxNGSYl7rcKS5nFEayPRNyidEhIOmCIW
         d+czKBRtcHuMvypio7ZLvL2nMOWcS5PNYTNlIw7JRIKsZC/My9OhAxjOQ9LODZKoYlgF
         7VIzSy/zeLGJS6hcmxjoGsZD2mlJmUMGpx6hi8C8PX7Lxig2mXBbc1Ws/CRnhS+oqT6q
         d2nJe0wvYcFJXNd9jFKgR/eU0AP41U3V2VaTQ32oOZNzkgQJ9J6NPDVEXQl2Lqmz2tSN
         dsjNfBN4lrwzUIdwTzeVMfmqEvL6Ye/4fv/AwLp0eusNxgCNLPMLFBN8IUOHgi++mZVF
         94Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=I7ZVjQKCgK+4UFooHKAFCEi55VrTc406tTQzGXEeJTk=;
        b=sbD8tLnDdo+NP4UbVROQCQG8SXWGoyWQPrc7lmJE4f5b4PJzT44Be0WCosJrChO7Z6
         J3SyX194jwEeaFdh83ce7lZFJ9+y8Q75U/Jtdrz3PXcRlpqpslkHUouetasZ1lmPKcCz
         kSXcMY0qecpxBxdZCZoZzamRPBj+MqtdpsLXP6fqBDSEinRrQeN2cn4tyH1Xr1rutLBE
         /lGHllylKmBfATBGnF7LlGZ4ZSm8l1nzrm0izZet4lyBITo6S6ixzRcPSIx8X98g8X4D
         a1KPx5h9GP3No/Hd3ro+2nG2+ROQiOVLAiyzqygKQFdgYxY8gJ5JPuy2G4DdF+WXnl8i
         a+QA==
X-Gm-Message-State: AOAM530+4rKsxjNURb10O0/bC7TeBMf3C/H/uuMv6v3647C9rqt0Oup2
	EpgiUZcwEOe6i6qdGDHF8QwFjt8UsJK4FSuVgTY=
X-Google-Smtp-Source: ABdhPJw290AduVSp8fXWZ980pxKbz4g2vEZhewrvqFUa6smmD62gychXZVdT8ypkdTb4TSk79JZ2rv8DFD6m1OgTF7c=
X-Received: by 2002:aca:d88a:: with SMTP id p132mr15020969oig.144.1622491328477;
 Mon, 31 May 2021 13:02:08 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210531044608.1006024-1-roman.beranek@prusa3d.com> <e63e2b31c63bb9e227ed9ec04a8af54e@pascalroeleven.nl>
In-Reply-To: <e63e2b31c63bb9e227ed9ec04a8af54e@pascalroeleven.nl>
From: Emil Lenngren <emil.lenngren@gmail.com>
Date: Mon, 31 May 2021 22:01:58 +0200
Message-ID: <CAO1O6sdBX8D13tNKFAUynC2AcOX_Oo7tBEJi1vPPueSSQLfJOg@mail.gmail.com>
Subject: Re: [PATCH 0/6] pwm: sun4i: only wait 2 cycles prior to disabling
To: Pascal Roeleven <dev@pascalroeleven.nl>
Cc: Roman Beranek <roman.beranek@prusa3d.cz>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-pwm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-sunxi@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Den m=C3=A5n 31 maj 2021 kl 21:07 skrev Pascal Roeleven <dev@pascalroeleven=
.nl>:
>
> On 2021-05-31 06:46, Roman Beranek wrote:
> > As Emil Lenngren has previously shown [1], actually only 1-2 cycles of
> > the prescaler-divided clock are necessary to pass before the PWM turns
> > off, not a full period.
> >
> > To avoid having the PWM re-enabled from another thread while asleep,
> > ctrl_lock spinlock was converted to a mutex so that it can be released
> > only after the clock gate has finally been turned on.
> >
> > [1] https://linux-sunxi.org/PWM_Controller_Register_Guide
> >
> > Roman Beranek (6):
> >   pwm: sun4i: enable clk prior to getting its rate
> >   pwm: sun4i: disable EN bit prior to the delay
> >   pwm: sun4i: replace spinlock with a mutex
> >   pwm: sun4i: simplify calculation of the delay time
> >   pwm: sun4i: shorten the delay to 2 cycles
> >   pwm: sun4i: don't delay if the PWM is already off
> >
> >  drivers/pwm/pwm-sun4i.c | 56 +++++++++++++++++++----------------------
> >  1 file changed, 26 insertions(+), 30 deletions(-)
>
> Hi Roman,
>
> Thanks for your attempt to fix this.
>
> Unfortunately on my A10 device (Topwise A721), the controller still gets
> stuck in an unrecoverable state after disabling and re-enabling the PWM
> when it was already on (set in U-Boot), or when enabling it when it was
> off. In this state, any changes to the period register (using devmem)
> don't seem to have any effect. It seems to be stuck in the state it was
> before disabling. The only thing which still works is enabling and
> disabling.
>
> I can't reproduce this behavior manually so I'm not sure what is causing
> this.
>
> Regarding the amount of cycles of sleep; Using a prescaler of 72000 the
> PWM clock is 3 ms. Although timing tests using devmem seem unreliable
> (too much overhead?), in U-Boot I need to 'sleep' for at least 7 ms
> between the commands to make sure the output doesn't sometimes get stuck
> in the enabled state. So in my case it seems to be at least 3 cycles. I
> am not sure how reliable this method is. However even if I can get it
> stuck in the enabled state using a shorter time, it doesn't cause the
> behavior I mentioned before. I was always able to recover it manually.
> Increasing the number of cycles to sleep therefore also doesn't solve my
> problem. Until we can solve that I cannot confirm nor deny if 2 cycles
> is enough.
>
> Regards,
> Pascal

You could look at the devmem source code, and in C write a script that
writes to pwm register to disable the pwm, insert a usleep, then
disable the gating. This can be done for various sleep values, then
retrying with same sleep value multiple times. Assuming the overhead
is low (you can check the overhead by checking the current timestamp
at the beginning and at the end of the program, take the diff and then
subtract the sleep time), you will get one range where it never works,
one range where it works sometimes, and one range where it always
works. The uncertain range's condition for succeeding will depend on
when in the cycle you run the code.
Assuming we believe 3 cycles are enough on A10 and prescaler is 72000,
the thresholds for these ranges are 0-6 ms, 6-9 ms and 9+ ms.

About "being stuck", I'm not sure exactly what you mean but it's
expected that writes to the period register won't be visible (if you
read it after a write) when the clock gating is disabled. Three full
cycles (with the gating is on) must take place before the change is
visible (i.e. need to wait four cycles to be sure). At least on >=3DA13.
I documented that here:
https://linux-sunxi.org/PWM_Controller_Register_Guide.

/Emil
