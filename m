Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8432F38
	for <linux-sunxi@lists.linux.dev>; Mon, 30 May 2022 13:46:00 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id 14so11272560qkl.6
        for <linux-sunxi@lists.linux.dev>; Mon, 30 May 2022 06:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8tubySlO9EL1sX7JJbgIYlj3V7gJSLQUkL2tqjiHPYE=;
        b=qGFcst+H2sU9jethczFKj5MxMnXaCOn7OK090+/w4SslVfP0RhOPM+PrM/s6zmntEl
         F0i0jWuXjup30AM1FCFtkmrQsYf603Ww0X7DlWH4G1X8DXidwxDvsLuIyOSA46WT96pb
         gk/ByJ8wJJ6VG89vBxpWS4sT4viGby0Q7/aGVZjueV2Ol45MU6QR/kGUMziF9kEKL5jr
         Vq5IvoXl5vRQyKgPRCK8sxmINhmRSQBk+B7MLNnt8CZ+4eyNendacm1T2oVMcG8QIJLi
         JWs9iipRsPWjnyyw+uAEIr8g/Vhe0bmPXgyg2Sg9dqgZeemBHQFV9hvvB+/wubuuBXQ7
         z3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8tubySlO9EL1sX7JJbgIYlj3V7gJSLQUkL2tqjiHPYE=;
        b=MTUaW+u8A464BRH7ljHrykx3LTDxryc3ejQkajry6R50oyZ60H87PFCPl2NnrUKfLM
         +8G7mQEIO/FxbdTUOWOi9/y0TfuMCecwCpp0rWLHpS/cPcfXHwYQH8TszZsiT+dVsquI
         OoHkVGSyPWLKrvFhAT+CRiI/8v7PqBrHFezYGBAJ91OPx3p2eOyuJJfq/h43LMs1IvkE
         qvduly9qCclVWUZcN0MNFOTjg94T7KkusUWkLcxbQtMg+IrDoSdYTuabiSc+VBl6+bzH
         QOmujAUqeohlzG/CAAAy8r2JCtsvIpDsc2RL2O222C6w6lEvkJb0uu11EYa+SFiefGMs
         2HoQ==
X-Gm-Message-State: AOAM5320TzToorSNIjFiFlBCOiJ6YUb62IPRLuRXqKmY2kwhjxTSL+uQ
	QP4QMpNop0AaZ7mEzF1re9889ielqEMOCz6Vyy0=
X-Google-Smtp-Source: ABdhPJw9o/+WDde4Jga387TqM8IY0EJdHUkX7NWLrzCofs5w6vulQVu5Xs2CiFpqzcOEIKw7lNGA0rRWaL1NB5GNp1o=
X-Received: by 2002:a05:620a:40d1:b0:6a5:b4a3:dfbe with SMTP id
 g17-20020a05620a40d100b006a5b4a3dfbemr14550181qko.340.1653918359158; Mon, 30
 May 2022 06:45:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220525115445.93500-1-roman.o.stratiienko@globallogic.com> <20220530132232.himfp7ubiacbmkpx@penduick>
In-Reply-To: <20220530132232.himfp7ubiacbmkpx@penduick>
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Mon, 30 May 2022 16:45:48 +0300
Message-ID: <CAGphcdnPnFeafky=8-vyd_wKgbuTJc+MOb9UsM_0P-hVL_oiMQ@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: Fix blend route/enable register corruption for DE2.0/DE3.0
To: Maxime Ripard <maxime@cerno.tech>
Cc: wens@csie.org, =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	airlied@linux.ie, Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, megi@xff.cz, 
	Roman Stratiienko <roman.o.stratiienko@globallogic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

=D0=BF=D0=BD, 30 =D0=BC=D0=B0=D1=8F 2022 =D0=B3. =D0=B2 16:22, Maxime Ripar=
d <maxime@cerno.tech>:
>
> Hi Roman,
>
> On Wed, May 25, 2022 at 11:54:45AM +0000, Roman Stratiienko wrote:
> > By this commit 2 related issues are solved:
> >
> >   Issue #1. Corruption in blend route/enable register:
> >
> > Register corruption happens after using old_state->zpos to disable laye=
r
> > state. Blend route/enable registers are shared with other layers
> > and other layers may have already assigned this PIPE to valid value.
> >
> > Solution: Do not use old_state->zpos to disable the plane pipe in
> > blend registers.
> >
> >   Issue #2. Remove disabled layer from blend route/enable registers:
> >
> > Since sun4i/drm are using normalized_zpos, .atomic_update() will setup
> > blend route/enable pipes starting from PIPE0 to PIPEX, where X+1 is a
> > number of layers used by the CRTC in this frame.
> >
> > Remaining pipes (PIPE[X+1] - PIPE[MAX]) can have old data that MUST be
> > updated.
> >
> > new_state->normalized_zpos can't be used, since drm helpers won't updat=
e
> > it for disabled planes.
> >
> > Solution:
> >
> > 1. Track the number of total used planes for crtc.
> > 2. Use this number instead of zpos to disable unused blend pipes.
> >
> > Signed-off-by: Roman Stratiienko <roman.o.stratiienko@globallogic.com>
>
> If there's two issues, and two solutions, it should be two patches.

I would say.. It's a single complex issue.
Solving one part without solving another will make things only worse.

>
> Maxime
