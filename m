Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329C43FC9
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Sep 2021 18:36:48 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id s11so7609446yba.11
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Sep 2021 11:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RjLq7TrCbJWT1eylQTm5AMEy6dDs/tdUh8lvvHeG7DA=;
        b=KWcQSJvgQ9mFAt//CtNqNypVgQxZuab5j8wbBDDssbhFQX9wD28nWEZ/pvZuDTxQFj
         wB00cVa2bJMbZ8h0gAKSc/W06rzxQZOoStFVF1Miav6ck617gdhLesInUYOehEOrt0hD
         jh/Zufy6FVO/uel0IAuARuFzkC6B5eXFEQDUZEomD5E9sTyreF+qIuKyB5hmhDJa/ju0
         aTIJvX5ZVWE6y4QsUzdEOPGog28zO9r6tK8o/jiSG/tkG2OsqLJpA1grAJCqEqtyVkXJ
         ZdhaPw2SKMMUUA74KdkEG5zTjImC1q2X+gJEYntYvznCtVizwCvpJqKUoyl5mICQkZbF
         rwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RjLq7TrCbJWT1eylQTm5AMEy6dDs/tdUh8lvvHeG7DA=;
        b=kQLS62wL7cyZcubBkMwpR+dY7xoKN6pYrXm/STjOCMYsOnR4xpyCCI/tJ0P+dUyDGr
         nl+JyLIUlD769VV8Kz1+NKUxRls/Uct8OSr49xQOPGzaO0wXuYitkmLEqE5azTYpuPaE
         euu5YgxL6XDoR82eo+whC4HdmDR278xKVuRAJOCFXHUkn/i2ZQTpQUxh1nCtpbXITpXx
         LATykC9pA9RKY74cNl/f3WkaBrH5gT+aJnVbs6Jy3AkSnQOTtW31+9lWiB3AgwbOBsOm
         fiJmXszUHvOQljh6tdG4t5bqEltk62qnZGHaFjth1S4gbKS9bfIzJgBV/KU4XjNk3VfH
         tGHg==
X-Gm-Message-State: AOAM530VCGMN4FuvglLK5K5qPmXYZw2OWYuTr9IJY/NQR/Hfdt8gaZTF
	oAAhRHkNcnlUZEt4AD8p+PyOzjhl6jspEnG0XkwnRg==
X-Google-Smtp-Source: ABdhPJyvdEyzmZWVJsEVP7oeClUpWuDtmLp6RHrkbRhr+wM25nY5jCL0OuDt1Xhw7HX1QaYL9hROJVM5OCm8hmA0dRY=
X-Received: by 2002:a25:5606:: with SMTP id k6mr1795607ybb.476.1631731006971;
 Wed, 15 Sep 2021 11:36:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5570111.f9yF5Hohu3@kista> <CAGETcx9_dy4qdmZ-+X+WLsezPKWfZzmRU8QmhKOu6FdZcysWDA@mail.gmail.com>
In-Reply-To: <CAGETcx9_dy4qdmZ-+X+WLsezPKWfZzmRU8QmhKOu6FdZcysWDA@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 15 Sep 2021 11:36:11 -0700
Message-ID: <CAGETcx_6muHgmDAviMf-UBvriePwc+o5408nDeNd_v3zR_x9TQ@mail.gmail.com>
Subject: Re: Issue with fw_devlink=on on 5.14
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 15, 2021 at 11:23 AM Saravana Kannan <saravanak@google.com> wro=
te:
>
> On Wed, Sep 15, 2021 at 11:07 AM Jernej =C5=A0krabec
> <jernej.skrabec@gmail.com> wrote:
> >
> > Hi Saravana!
> >
> > I noticed that in kernel 5.14, at least on Allwinner H3, deinterlace dr=
iver
> > doesn't load anymore if fw_devlink is set to on. If I set it to off, dr=
iver
> > loads and works without problems. If I remove interconnects property in=
 DT
> > node and use driver hack instead, it also loads and work ok.
> >
> > For reference, I speak about this node:
> > https://elixir.bootlin.com/linux/v5.14/source/arch/arm/boot/dts/sun8i-h=
3.dtsi#L153

Oh the dts file please. Not dtsi. I need the full picture of dependencies.

-Saravana

> >
> > Do you have any clue why it doesn't work?
>
> Kinda busy today and I'll take a close look later, but if you delete
> "interconnect" but it works, then it seems like you have no driver for
> your "mbus" interconnect? Is that expected?
>
> If you have a driver, then make it use the proper driver model (probe
> a platform device).
>
> If you don't have a driver for it, I'm assuming you have
> CONFIG_MODULES enabled. Otherwise, fw_devlink=3Don is smart enough to
> know not to block on devices that'll never be probed.
>
> If you do need CONFIG_MODULES enabled, then use
> deferred_probe_timeout=3Dxxx so that fw_devlink doesn't wait for more
> modules to be loaded past xxx seconds.
>
> Also I like to look up emails on lore, so when emailing me about
> fw_devlink (or any Linux stuff in general I suppose), it'd be nice if
> you can cc LKML.
>
> Thanks,
> Saravana
