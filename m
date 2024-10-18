Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3998188731
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Oct 2024 07:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729235561; cv=none; b=HDFmZqj5/DHAe615b4DwfW3w7E8ZeyhLSaLp62C2GsIggVE1/9XDVc7T1SjemXmssnUFxj4VSoQHq4ygs5qQrqF7zYREutbW4nFyTK/U2z+A1iiQ11/xjwwnzVrDEPzDxNqfi47huKnLATsFAc/gzcN/jq8wT07cKGgQCj01epI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729235561; c=relaxed/simple;
	bh=vb8oIaYLrkChvTiQ7lAwK5qR//i7LHngNg+MF6ingmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U49ZdiLiIause6zK2paEmt8SGkoXo3TEDUQbwdp8jAHHoQ9TdRIhDdEVhGtx5nLNRwmrlW25vdO89zCwwoENWwLv/WIvcFSpy06duV5oY/g+wbZ1S8YHnmGCd/TysDfTgAouc0RNjb5ekFbfETXf8weLsBZWvkV2LkrU8rjTgWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DMIKy7pr; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DMIKy7pr"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso1616249e87.1
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Oct 2024 00:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729235558; x=1729840358; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZPCNCSETXt2syd1J4HTXcd16+mHxXzHdYO5ObT5uNg=;
        b=DMIKy7prc3eD5Ivr1kxSMwLTVprDBdQR+uE0PhjTdjv1K8Y9xBWiCvYBX3DqPi9Onh
         5AofBfwgHq18qZ5IXoIl56tHGlYq9y1edCKEU9MP//lp8JGLD01JfPa3re7C3Y9WGihi
         OE7hwtdKaflCJUi/DfmO/xQ3eCjMxKZGxXF6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729235558; x=1729840358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZPCNCSETXt2syd1J4HTXcd16+mHxXzHdYO5ObT5uNg=;
        b=wMzNB4Rh5XCgEo+OxVdavo0P5QyPUDyIXpm6j/PvyW//B0o1tThKpOzdLE6zG+BzK+
         LMPsdEKrcwG6IdqYpWvO1EmhkF7THEgZuGwUR0cofpNx7Y8BtygMQBqVVk9CP/RI508i
         qg1S8MtjNLbGFhxwmaDoXQBCZGVjtaV50vcJaeQkFFnupB3iDzX8K1+009b7p6HBWqjq
         WEgQlGixzU+PRHnOKry1WW+dkZX7fHopQ0LBudg0Q5r33/h9g9Y/cQY8tRXPrJslXJSe
         WLVY9klt4lH/3MkvuYkNACJgAlixFok/jZ2UDxn8Ra5sUsO3Cf64UklAoySL8NTz+sF8
         TUEw==
X-Forwarded-Encrypted: i=1; AJvYcCX/XVGLEZ7g1fCU1Dok40gbJf3piaU7p7htxq99FhlYSqtems2XYcSHgklFnThsYo+nXVJvwijTBDARdw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzS62OH6H7Ow5fJnEylFVpcwlDeVg7uqE1bb1BXNDyC7BGQLSzC
	/+8pAUi4Y06O3DD2H6sUdG7N4C+coatxS3mrPH6EbXScXV02FM9SbaFLIh79lqHha+E0HyUVeLY
	PY/5VDNbouN4TgMkO4vQyVkcmzB6O8OxdLLB9
X-Google-Smtp-Source: AGHT+IE6eZ6vMbHdaGPEnNj70kEPv6a2gjgjR2D+6CB2n0l4ygZ/aDv/gJaSaUaHq3xqXN2ItXKkaL5FM7pHHECf99U=
X-Received: by 2002:a05:6512:691:b0:53a:bb7:ed77 with SMTP id
 2adb3069b0e04-53a1545339amr791354e87.14.1729235557654; Fri, 18 Oct 2024
 00:12:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241017090503.1006068-1-wenst@chromium.org> <CAJZ5v0hZUzubeLt2OBcG=F5QKFh-0V8yqYRoQL0iHK+y+zeZFg@mail.gmail.com>
In-Reply-To: <CAJZ5v0hZUzubeLt2OBcG=F5QKFh-0V8yqYRoQL0iHK+y+zeZFg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 18 Oct 2024 15:12:26 +0800
Message-ID: <CAGXv+5GToNr=6D_j3A-HzmCQJNx-fm+A=KgxhqhtSES1CRMvJQ@mail.gmail.com>
Subject: Re: [PATCH v3] thermal/of: support thermal zones w/o trips subnode
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Icenowy Zheng <uwu@icenowy.me>, Mark Brown <broonie@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
	Hsin-Te Yuan <yuanhsinte@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 6:57=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
>
> On Thu, Oct 17, 2024 at 11:05=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
> > From: Icenowy Zheng <uwu@icenowy.me>
> >
> > Although the current device tree binding of thermal zones require the
> > trips subnode, the binding in kernel v5.15 does not require it, and man=
y
> > device trees shipped with the kernel, for example,
> > allwinner/sun50i-a64.dtsi and mediatek/mt8183-kukui.dtsi in ARM64, stil=
l
> > comply to the old binding and contain no trips subnode.
> >
> > Allow the code to successfully register thermal zones w/o trips subnode
> > for DT binding compatibility now.
> >
> > Furtherly, the inconsistency between DTs and bindings should be resolve=
d
> > by either adding empty trips subnode or dropping the trips subnode
> > requirement.
> >
> > Fixes: d0c75fa2c17f ("thermal/of: Initialize trip points separately")
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > Reviewed-by: Mark Brown <broonie@kernel.org>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v2:
> > - Stacked on top of Krzysztof's cleanup patches
> >   - thermal: of: Use scoped memory and OF handling to simplify thermal_=
of_trips_init() [1]
> > - Adjusted to account for eliminated error path
> >
> > [1] https://lore.kernel.org/all/20241010-b4-cleanup-h-of-node-put-therm=
al-v4-2-bfbe29ad81f4@linaro.org/
> >
> > Changes since v1:
> > - set *ntrips at beginning of thermal_of_trips_init()
> > - Keep goto out_of_node_put in of_get_child_count(trips) =3D=3D 0 branc=
h
> > - Check return value of thermal_of_trips_init(), if it is -ENXIO, print
> >   warning and clear |trips| pointer
> > - Drop |mask| change, as the variable was removed
> >
> > I kept Mark's reviewed-by since the changes are more stylish than
> > functional.
> > ---
> >  drivers/thermal/thermal_of.c | 20 +++++++++++++-------
> >  1 file changed, 13 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.=
c
> > index 93f7c6f8d06d..be1fa6478c21 100644
> > --- a/drivers/thermal/thermal_of.c
> > +++ b/drivers/thermal/thermal_of.c
> > @@ -99,14 +99,14 @@ static struct thermal_trip *thermal_of_trips_init(s=
truct device_node *np, int *n
> >
> >         struct device_node *trips __free(device_node) =3D of_get_child_=
by_name(np, "trips");
> >         if (!trips) {
> > -               pr_err("Failed to find 'trips' node\n");
> > -               return ERR_PTR(-EINVAL);
> > +               pr_debug("Failed to find 'trips' node\n");
> > +               return ERR_PTR(-ENXIO);
>
> Why not
>
> *ntrips =3D 0;
> return NULL;

That indeed seems cleaner.

> >         }
> >
> >         count =3D of_get_child_count(trips);
> >         if (!count) {
> > -               pr_err("No trip point defined\n");
> > -               return ERR_PTR(-EINVAL);
> > +               pr_debug("No trip point defined\n");
> > +               return ERR_PTR(-ENXIO);
>
> Is this based on the current mainline code?

This is based on Krzysztof's scoped memory patch:

  thermal: of: Use scoped memory and OF handling to simplify
thermal_of_trips_init()
  https://lore.kernel.org/all/20241010-b4-cleanup-h-of-node-put-thermal-v4-=
2-bfbe29ad81f4@linaro.org/

I should have made it more obvious in the footer.

> >         }
> >
> >         struct thermal_trip *tt __free(kfree) =3D kzalloc(sizeof(*tt) *=
 count, GFP_KERNEL);
> > @@ -386,9 +386,15 @@ static struct thermal_zone_device *thermal_of_zone=
_register(struct device_node *
> >
> >         trips =3D thermal_of_trips_init(np, &ntrips);
> >         if (IS_ERR(trips)) {
> > -               pr_err("Failed to find trip points for %pOFn id=3D%d\n"=
, sensor, id);
> > -               ret =3D PTR_ERR(trips);
> > -               goto out_of_node_put;
> > +               if (PTR_ERR(trips) !=3D -ENXIO) {
> > +                       pr_err("Failed to find trip points for %pOFn id=
=3D%d\n", sensor, id);
> > +                       ret =3D PTR_ERR(trips);
> > +                       goto out_of_node_put;
> > +               }
> > +
> > +               pr_warn("Failed to find trip points for %pOFn id=3D%d\n=
", sensor, id);
>
> Wouldn't pr_info() be sufficient for this?

Works for me. I should also reword this and the existing error message
to be less confusing.


Thanks
ChenYu


> > +               trips =3D NULL;
> > +               ntrips =3D 0;
> >         }
> >
> >         ret =3D thermal_of_monitor_init(np, &delay, &pdelay);
> > --
