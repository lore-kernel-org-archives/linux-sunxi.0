Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DFF71
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Apr 2021 08:47:52 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id w3so104121945ejc.4
        for <linux-sunxi@lists.linux.dev>; Fri, 30 Apr 2021 01:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=prusa3d-cz.20150623.gappssmtp.com; s=20150623;
        h=mime-version:content-transfer-encoding:cc:subject:from:to:date
         :message-id:in-reply-to;
        bh=ix10HKl4Ji6QvrIhi2BCp+LJFNaL/wGngqRsoRAXrcw=;
        b=qnXj4HI03B4usnHFixzqm+1A77XNUTnUhCdyrDYv/KkmDCNT7krP3Sji70SjV9YsxN
         BzSmnnPPltZ6X5GBtHSUBLRGC2ae1ITVpbJznYSh2kT5/9lkl50v1HO+1++ZLeRuqBDd
         lwW49APmr5oMSYEYMpLZPwqiEXi9GJtJPwRlgdysZTzhBAcJ/gECj3nJpz6RY91pP3Tv
         j6R2yNajDuns9TNFmJRUZhYjMCTpdBjnGZq/QTDXKy5ZODGw1ZsAMnuVhK2W6zr09p42
         nmZbXvDpMdUiHwQwpOSaPlXEvD/vp8B4jbC5Dk592yZ3fk6GqSEuSzKzuKxjZ59at1ms
         wBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:cc
         :subject:from:to:date:message-id:in-reply-to;
        bh=ix10HKl4Ji6QvrIhi2BCp+LJFNaL/wGngqRsoRAXrcw=;
        b=jmAj/ePlIWYtM/k10DpwdZIfyEJnSXgGTvTpllJwtWjTY5OaQscUHOacCmBByJaRFE
         yWkfkSWrpeHoC+4KvvqeWeYYf7WcuXDHIncExNAARH8rvSHd/zLz+PA6Tb/EfV7I6WZr
         NAWLgw2x4yPSMapBK+SktBso5yheYXy4WG7xYPkX4agcUpcdvnqh4jqf1JJh7EfvG/X/
         +9FNtZ9A9UvT/yOMYgOyx1PZymEcWL1StkYJ/TlFLsmuxkvfRoVUlSQwxcME+JiVZM6M
         HNmDW3FCCNK+6AjZSuI9KkEjRkMcDRHjS2hfKR/gtH46As3HCA8BeDLSRVnqeTV7tH2/
         Alow==
X-Gm-Message-State: AOAM5329SJbMhJRFPWpYNwZ9Q97xz9xtkPVH3xXVBbnaVXbSHwaHu8KU
	x+Q2hU381+lyLOjKyI7phGkY8Q==
X-Google-Smtp-Source: ABdhPJydNhoRcU4F9++M7+BFSAGysOcXhyO8/MEtoORm2Fzk3Ykujk6hiDy48VdoeeQHgRWdM6RLbA==
X-Received: by 2002:a17:906:7257:: with SMTP id n23mr3146650ejk.412.1619772471402;
        Fri, 30 Apr 2021 01:47:51 -0700 (PDT)
Received: from localhost (ip-213-220-236-33.net.upcbroadband.cz. [213.220.236.33])
        by smtp.gmail.com with ESMTPSA id s20sm751262edu.93.2021.04.30.01.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Apr 2021 01:47:50 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Cc: "Thierry Reding" <thierry.reding@gmail.com>, "Lee Jones"
 <lee.jones@linaro.org>, "Maxime Ripard" <mripard@kernel.org>, "Chen-Yu
 Tsai" <wens@csie.org>, "Jernej Skrabec" <jernej.skrabec@siol.net>,
 <linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-sunxi@googlegroups.com>, "Roman
 Beranek" <roman.beranek@prusa3d.com>
Subject: Re: [PATCH] pwm: sun4i: Round delay time up to a nearest jiffy
From: "Roman Beranek" <roman.beranek@prusa3d.cz>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Fri, 30 Apr 2021 09:17:49 +0200
Message-Id: <CB0VI785HYEE.3PXPB7BDOUPFC@zen.local>
In-Reply-To: <20210430064145.nzlcw3lpayzapnbx@pengutronix.de>

Hello Uwe,

On Fri Apr 30, 2021 at 8:41 AM CEST, Uwe Kleine-K=C3=B6nig wrote:
> On Fri, Apr 30, 2021 at 04:19:32AM +0200, Roman Ber=C3=A1nek wrote:
> > On Thu, Apr 29, 2021 at 2:04 PM Uwe Kleine-K=C3=B6nig wrote:
> > > On Wed, Apr 28, 2021 at 02:14:31PM +0200, Roman Ber=C3=A1nek wrote:
> > > > Correct, the output may stay in an active state. I only discovered =
this
> > > > bug as I investigated a report of unreliable screen timeout. The pe=
riod
> > > > we use the PWM with is 50 us.
> > >
> > > What I don't like here is that the delay is quite coarse and might st=
ill
> > > be too short. (Maybe I miss something, but consider the current perio=
d
> > > is quite long, then you configure a short one and then disable. In th=
is
> > > case the inital long setting might still be active.)
> >=20
> > The delay is calculated from the original period (cstate.period),
> > not the one that was just written into PWM_CHx_PRD 2 lines above.
>
> Yes, but that's not good enough. Consider the PWM is running with a
> period of 4s and the period just started. Then you call
>
> pwm_apply_state(mypwm, &(struct pwm_state){
> .period =3D 20,
> .enabled =3D 1,
> ...
> })
>
> This doesn't result into the waiting code being run, because
> .enabled =3D 1. Then immidiately after that call:
>
> pwm_apply_state(mypwm, &(struct pwm_state){
> .period =3D 20,
> .enabled =3D 0,
> ...
> })
>
> which triggers the waiting but only based on a period of 20 ns while the
> 4s period is still active.

OK, now I see what you mean. To remedy this, the delay shall occur
regardless of state->enabled.

In my view, this lies beneath the scope of the patch though and would be
better served as a follow-up.

Cheers,
Roman
