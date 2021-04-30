Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F11F71
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Apr 2021 02:19:44 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id m13so68544774oiw.13
        for <linux-sunxi@lists.linux.dev>; Thu, 29 Apr 2021 19:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=prusa3d-cz.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4Gd0MgVT7NAzqGz0SDOQvL7OUfBTs+7oH+VCnAx8ZJM=;
        b=eujPtfaw2j4KXyTeMdxTfp6MhS/Pl/g3nL1hdwYUpHTqTI9nIuM6+IRroqYCIZ6s6x
         q5KIBw/Eby424UCTE9tG0cy1negKGKVEMrUYVxZHCMa7y14qrjsxQoK6WVoNtWYEmyop
         B7+6TWD0Zlir7O6UfKoyj8/Np+kYJfpdH4THi8zF5BZ5CUIX20HwFVhNzTg/M6CZfsjC
         Mns8KmQCk4NrnLLxYSkwaTVRsIcVzQlc8MgckD8jUaAdWWM13+z5lxjDU6XZZtT+sy05
         Ft1/iQf45YKwqP0tt0185F/l8mbPOFg2lTLq/eRbhfMXQecIPrjGYDVh0hpOv+gXjTwb
         Xkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4Gd0MgVT7NAzqGz0SDOQvL7OUfBTs+7oH+VCnAx8ZJM=;
        b=ap+5v9NKfvQ0OD1dfLm2+kNLgBSGFr94dBqvKiMuQ8XUnnNJJdE80EoEo8sQ8AlxQd
         X3SgJzfjHZzk3JYNQmC/qVL7c/iAQnHJCpKilbWij2lIb5pnsvVYKgy9soR/W6p5jWbH
         rYP6WjI02osOetkMNC13DQTFvkmtKu+nSUdw6GKTQjbldu1MZQ2Ky9bjvzIEKXLdfdcC
         pdHzBfw9TZN4S0PESFtsq9HWATuWGpSb4ugS2nO87Y4QLxlXrWPsbAryI3wDqutnELQI
         GedSfudyDwYC7L25NLtBsVsn+3DXARIE2B8rMeBIr2dB5/2wiUnzkovERkomnAC0K0H3
         YmLg==
X-Gm-Message-State: AOAM532y2Jwnfx4INoEAvhxyB3WnQ6p4sORo2VR3tB4jtSGuBYnqT+gJ
	SZg0EyX6QtJQ3+X/x8lbh4Z28JLOctwDADDWrEYWvQ==
X-Google-Smtp-Source: ABdhPJyLapc7Q/siTJmrN9S201JP7kswLoySQiqh0gf/H2JFPFIIQYMDXvGJSIaSjO2m/5tsaHv8f6R2K8KS3gD5se0=
X-Received: by 2002:aca:dd86:: with SMTP id u128mr2226013oig.155.1619749184117;
 Thu, 29 Apr 2021 19:19:44 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210428001946.1059426-1-roman.beranek@prusa3d.com>
 <20210428061357.725m72aikc52n4gg@pengutronix.de> <CAL8eAtpuAQUiesC-gxSQENDXrw44qQQvp5UqEjdfz1hX5CLHnQ@mail.gmail.com>
 <20210429120416.5ba7rq5fvhcfebzz@pengutronix.de>
In-Reply-To: <20210429120416.5ba7rq5fvhcfebzz@pengutronix.de>
From: =?UTF-8?Q?Roman_Ber=C3=A1nek?= <roman.beranek@prusa3d.cz>
Date: Fri, 30 Apr 2021 04:19:32 +0200
Message-ID: <CAL8eAtqBzUt6fP2nr-Ppg+qwhvKWk13A0P3+hoe07F+9VXCvmA@mail.gmail.com>
Subject: Re: [PATCH] pwm: sun4i: Round delay time up to a nearest jiffy
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@siol.net>, linux-pwm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-sunxi@googlegroups.com, Roman Beranek <roman.beranek@prusa3d.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Uwe,

On Thu, Apr 29, 2021 at 2:04 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello Roman,
>
> On Wed, Apr 28, 2021 at 02:14:31PM +0200, Roman Ber=C3=A1nek wrote:
> > Correct, the output may stay in an active state. I only discovered this
> > bug as I investigated a report of unreliable screen timeout. The period
> > we use the PWM with is 50 us.
>
> What I don't like here is that the delay is quite coarse and might still
> be too short. (Maybe I miss something, but consider the current period
> is quite long, then you configure a short one and then disable. In this
> case the inital long setting might still be active.)

The delay is calculated from the original period (cstate.period),
not the one that was just written into PWM_CHx_PRD 2 lines above.

> > Note: my apologies for the previous HTML message
>
> I didn't notice (because the message also contained a txt part). Another
> thing to improve is to reply inline instead of top posting :-)

Yeah, learning the conventions one reply at a time :-)

Cheers,
Roman
