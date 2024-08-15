Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6218824211
	for <linux-sunxi@lists.linux.dev>; Thu, 15 Aug 2024 04:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723697124; cv=none; b=PLUoDvxZ6TXAKRrmEzaWeyW0SfOkjyu2wjOGKt7C9WhKQ/xhyfpSfRqF+vAf7lq2Y9wnP+soFl+/P2gtUecHEQgPzl6k1uNOxxR/8RLH90eaFiJuxdLI6La71Z/EtwxNLv3F656Q7znOP9hj8S13xedNY5owsIrLRAdd8f03CN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723697124; c=relaxed/simple;
	bh=JkdoOGgPP6inJk2z4l4GoXRUjTrMLXdiFgyShXtRHmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ErS1YZFatE4IQ/9jhG4TW5cB88u3Y34iO/4oh3oD9XQZwGYzpsoYRLaFe6The7ZZyX/pe7aA2L3HfGm9etfcbVjW89DVHVbJSuvwiWZirYDT1HEIHuVN9/MoamzFPkdee6yOIvvcQXR43TuRisf7U4kfTg4KdAzmj6WvuQX4yAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nQQGjS8u; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nQQGjS8u"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52f04c29588so748618e87.3
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Aug 2024 21:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723697119; x=1724301919; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1T1veMt9WGefVzxV61hQN46s0M2ozLoU6sDsGtd5rg0=;
        b=nQQGjS8uHvxwjNt1oQ4XbTO03SelNXmIKYOneQuMTcJSEZ8jLVp+gwkWpSR1g+PcpN
         qhkiZRMK51SFV9vQFlz0e+v+UDFaBRN576mDm9Y9ARAki92hJ6dE9ssurP9IULr4mLau
         5l/lIZcvTGUbRMSnHQLvhBRYO/L8CC0XWO39s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723697119; x=1724301919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1T1veMt9WGefVzxV61hQN46s0M2ozLoU6sDsGtd5rg0=;
        b=QPOxYt2hJYLo7nD/2sQO3pOmI/w9AzIu8AGa9HrNNIbIdoCBuw8dn0+aTUoqnAy2x9
         R66GcCwoCrcpDYxDaGtmD/j9fCmPkLnX3KXYWqP+nvwcVda09r1RATPCKfSug+dPdZnx
         JwnuzG1vByHSdK59uS+ElHr5KiQwAWAgV0OR2JnbuD3yAlTER5jQKXX14+hzUneY0WnO
         WceRbMS7VgiQNKkKybwpXCj2n8FY7qQo5Q9q/zajOriCTklt5hFWToW7vlCBdOucYVyC
         8ejlj6Zd6WAWNENBcSTc7npHQDt8ZGs4mBo5lCNoqV1PyAR17prmOVAE2OHU8z2HztPt
         srPw==
X-Forwarded-Encrypted: i=1; AJvYcCViAt00n2oLbVl4xIoqk8aLXyTsBsmz2j8zO7fJU00PXYu7SiwETZtMj1PSz0u83Yxacil+QhW1xU6e/YQXKY0eXSGh0olmmFY1zVw=
X-Gm-Message-State: AOJu0Yw7aB+IQNipl3X7DBH6Y4ysYoslBxzVI7A2CN+UYqwoC42bdul3
	5vQE7nb+Ui0CGG2YPt3mXZh6oAOnPehUUCCWAa1jdERgOGdiYGq6MjQQnMcr2jHuZaRpVCk/JFv
	0vyZqNsDowrnuwarwM1P6jzclu63gw9e8ad8A
X-Google-Smtp-Source: AGHT+IE0yv+XOrbSGJIzzzRVJje3yinlPEAf+QPJIrtQzzafv5gyr4BXZK+TLc3EfZzK62nIdXUHueYK0wWEpSky5y0=
X-Received: by 2002:a05:6512:3b2b:b0:52c:fd46:bf07 with SMTP id
 2adb3069b0e04-532edbbe468mr2990731e87.49.1723697119152; Wed, 14 Aug 2024
 21:45:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240809070822.2835371-1-wenst@chromium.org> <b00273d65dfc4b48cca474784184c62b@manjaro.org>
 <CAGXv+5ERoH=jQGzo=mo2K-r3Meh2-5Kgvjf9Eh7bfNgcQYfWoA@mail.gmail.com>
In-Reply-To: <CAGXv+5ERoH=jQGzo=mo2K-r3Meh2-5Kgvjf9Eh7bfNgcQYfWoA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 15 Aug 2024 12:45:07 +0800
Message-ID: <CAGXv+5GQixa389nudKk=U3Rh2jN8VuWQGKb9rsixhvj3KGFQDg@mail.gmail.com>
Subject: Re: [PATCH v2] thermal/of: support thermal zones w/o trips subnode
To: Dragan Simic <dsimic@manjaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Icenowy Zheng <uwu@icenowy.me>, Mark Brown <broonie@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
	Hsin-Te Yuan <yuanhsinte@chromium.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 12:46=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> On Mon, Aug 12, 2024 at 9:22=E2=80=AFAM Dragan Simic <dsimic@manjaro.org>=
 wrote:
> >
> > Hello Chen-Yu,
> >
> > Thanks for the patch.  Please see one comment below.
> >
> > On 2024-08-09 09:08, Chen-Yu Tsai wrote:
> > > From: Icenowy Zheng <uwu@icenowy.me>
> > >
> > > Although the current device tree binding of thermal zones require the
> > > trips subnode, the binding in kernel v5.15 does not require it, and
> > > many
> > > device trees shipped with the kernel, for example,
> > > allwinner/sun50i-a64.dtsi and mediatek/mt8183-kukui.dtsi in ARM64,
> > > still
> > > comply to the old binding and contain no trips subnode.
> > >
> > > Allow the code to successfully register thermal zones w/o trips subno=
de
> > > for DT binding compatibility now.
> > >
> > > Furtherly, the inconsistency between DTs and bindings should be
> > > resolved
> > > by either adding empty trips subnode or dropping the trips subnode
> > > requirement.
> > >
> > > Fixes: d0c75fa2c17f ("thermal/of: Initialize trip points separately")
> > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > Reviewed-by: Mark Brown <broonie@kernel.org>
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > > Resurrecting this patch specifically for MediaTek MT8183 Kukui device=
s.
> > >
> > > Changes since v1:
> > > - set *ntrips at beginning of thermal_of_trips_init()
> > > - Keep goto out_of_node_put in of_get_child_count(trips) =3D=3D 0 bra=
nch
> > > - Check return value of thermal_of_trips_init(), if it is -ENXIO, pri=
nt
> > >   warning and clear |trips| pointer
> > > - Drop |mask| change, as the variable was removed
> > >
> > > I kept Mark's reviewed-by since the changes are more stylish than
> > > functional.
> > > ---
> > >  drivers/thermal/thermal_of.c | 19 ++++++++++++-------
> > >  1 file changed, 12 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/thermal/thermal_of.c
> > > b/drivers/thermal/thermal_of.c
> > > index aa34b6e82e26..f237e74c92fc 100644
> > > --- a/drivers/thermal/thermal_of.c
> > > +++ b/drivers/thermal/thermal_of.c
> > > @@ -128,16 +128,17 @@ static struct thermal_trip
> > > *thermal_of_trips_init(struct device_node *np, int *n
> > >       struct device_node *trips, *trip;
> > >       int ret, count;
> > >
> > > +     *ntrips =3D 0;
> > >       trips =3D of_get_child_by_name(np, "trips");
> > >       if (!trips) {
> > > -             pr_err("Failed to find 'trips' node\n");
> > > -             return ERR_PTR(-EINVAL);
> > > +             pr_debug("Failed to find 'trips' node\n");
> > > +             return ERR_PTR(-ENXIO);
> > >       }
> > >
> > >       count =3D of_get_child_count(trips);
> > >       if (!count) {
> > > -             pr_err("No trip point defined\n");
> > > -             ret =3D -EINVAL;
> > > +             pr_debug("No trip point defined\n");
> > > +             ret =3D -ENXIO;
> > >               goto out_of_node_put;
> > >       }
> > >
> > > @@ -162,7 +163,6 @@ static struct thermal_trip
> > > *thermal_of_trips_init(struct device_node *np, int *n
> > >
> > >  out_kfree:
> > >       kfree(tt);
> > > -     *ntrips =3D 0;
> > >  out_of_node_put:
> > >       of_node_put(trips);
> >
> > It might be a bit cleaner to keep the "*ntrips =3D 0" assignment
> > in the error handling path(s) only, with the positions of the goto
> > labels adjusted a bit, and then assign -ENXIO to "ret" and jump
> > to the right label when of_get_child_by_name(np, "trips") fails,
> > instead of returning from there.
> >
> > If it's unclear what I'm talking about, please let me know and
> > I'll send back the proposed hunk.
>
> I think I understand: move "*ntrips =3D 0" to after of_node_put() in the
> error path, and have the "!trips" branch jump to "out_of_node_put" as
> well. That works since of_node_put() checks the pointer first.
>
> I'll wait a bit and see if there are any more comments.

Actually, Krzysztof (+CC) is cleaning up this function using scoped
variables. So it might actually make more sense to move "*ntrips =3D 0"
to the top once the error path is completely removed.

ChenYu

> ChenYu
>
> > > @@ -490,8 +490,13 @@ static struct thermal_zone_device
> > > *thermal_of_zone_register(struct device_node *
> > >
> > >       trips =3D thermal_of_trips_init(np, &ntrips);
> > >       if (IS_ERR(trips)) {
> > > -             pr_err("Failed to find trip points for %pOFn id=3D%d\n"=
, sensor, id);
> > > -             return ERR_CAST(trips);
> > > +             if (PTR_ERR(trips) !=3D -ENXIO) {
> > > +                     pr_err("Failed to find trip points for %pOFn id=
=3D%d\n", sensor, id);
> > > +                     return ERR_CAST(trips);
> > > +             }
> > > +
> > > +             pr_warn("Failed to find trip points for %pOFn id=3D%d\n=
", sensor, id);
> > > +             trips =3D NULL;
> > >       }
> > >
> > >       ret =3D thermal_of_monitor_init(np, &delay, &pdelay);
