Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DA233C1
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Jun 2022 16:03:09 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id cs6so5183464qvb.6
        for <linux-sunxi@lists.linux.dev>; Fri, 24 Jun 2022 09:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SBE9n5bGZ9cO/7ddF81VomsNSmDsYLBMVF6+JlcQP5Y=;
        b=Okf0LwyFXel8HnbQTlKZwj/wcWPBUlfmsdmkf0xTLuI/8q/xA5uNgDKdvVmXM3xC9P
         f4jTkJm2BhhVzrOMHPxzNB2hvvh913MXK+63KX4dfC8OJVS5dCmv8LvAvAkzS0V0QkJj
         7bOKAZjbDAK0ZkpNh8W8lcu+3bO35DmqGW4Es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SBE9n5bGZ9cO/7ddF81VomsNSmDsYLBMVF6+JlcQP5Y=;
        b=q8ows60uJk4ayTn38y0prQlhJgJArk2BvKG6zUnotd0Bg3jQd7qy7DQzn3xOGo08xm
         zJaOqrm/pWb7/B54mV+uFYV3/7KfX4kKcDPZxAyroPMP9WbxvqyKJbsEUC7HLRHm2QY/
         R4xZTNbb6kmxoCldyzN7pAxqwig72K6sG+aTHmMmB4cjFsjWaQk9DpBzZCQZssKcFn7q
         3Tg0j32YKwKq5ET5mpEcJDHWc1sEUnj3v4+QfSUpyDPUw0VLWBJBN6Hzbx3pX+aKc9Th
         yFwdhgxgF2JvYuHgj9C4BqoyCMHx3pNhxLXbddTBgheLyoHnGf+gFVwiaUdQWuTivL4b
         M6mw==
X-Gm-Message-State: AJIora9Ppad9i70tWaYupY8HrItVNrsPjoiE8p98bBq3QgWu5Zl6T9gU
	PVNzfmUHJzWnS2VUOHkBwHGbeg==
X-Google-Smtp-Source: AGRyM1sySlar7KlLa+xEHgMxRq4qQ8ip0RZ2w5F2y74fBJmu3qAQtMGMNHavVFKVuM8Cytkb9as2Ug==
X-Received: by 2002:a05:6214:961:b0:470:3e2c:764f with SMTP id do1-20020a056214096100b004703e2c764fmr24893531qvb.20.1656086588648;
        Fri, 24 Jun 2022 09:03:08 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com. [65.184.195.139])
        by smtp.gmail.com with ESMTPSA id t2-20020ac85302000000b00317cdc1b15bsm356792qtn.27.2022.06.24.09.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 09:03:07 -0700 (PDT)
Date: Fri, 24 Jun 2022 12:03:05 -0400
From: Tom Rini <trini@konsulko.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH] sunxi: fix initial environment loading without MMC
Message-ID: <20220624160305.GO2484912@bill-the-cat>
References: <20220421003448.4517-1-andre.przywara@arm.com>
 <bed703d6-1820-8df4-747a-6114877dedee@sholland.org>
 <20220426152556.4a3ba3fb@donnerap.cambridge.arm.com>
 <20220624020040.3992190c@slackpad.lan>
 <ce039fde-bd88-f484-54d1-b079d82f62a1@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z5aBa8vtwHf6z68M"
Content-Disposition: inline
In-Reply-To: <ce039fde-bd88-f484-54d1-b079d82f62a1@sholland.org>
X-Clacks-Overhead: GNU Terry Pratchett


--z5aBa8vtwHf6z68M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 23, 2022 at 08:21:01PM -0500, Samuel Holland wrote:
> Hi Andre,
>=20
> >>> On 4/20/22 7:34 PM, Andre Przywara wrote: =20
> >>>> Commit e42dad4168fe ("sunxi: use boot source for determining environ=
ment
> >>>> location") changed our implementation of env_get_location() and enab=
led
> >>>> it for every board, even those without MMC support (like the C.H.I.P.
> >>>> boards). However the default fallback location of ENVL_FAT does not =
cope
> >>>> very well without MMC support compiled in, so the board hangs when t=
rying
> >>>> to initially load the environment.
> >>>>
> >>>> Change the default fallback location to be ENVL_FAT only when the FAT
> >>>> environment support is enabled, and use ENVL_NOWHERE and ENVL_UBI as
> >>>> alternative fallbacks, when those sources are enabled.
> >>>>
> >>>> This fixes U-Boot loading on the C.H.I.P. boards.
> >>>>
> >>>> Fixes: e42dad4168fe ("sunxi: use boot source for determining environ=
ment location")
> >>>> Reported-by: Chris Morgan <macroalpha82@gmail.com>
> >>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> >>>> ---
> >>>>  board/sunxi/board.c | 9 ++++++++-
> >>>>  1 file changed, 8 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> >>>> index 89324159d55..befb6076ca6 100644
> >>>> --- a/board/sunxi/board.c
> >>>> +++ b/board/sunxi/board.c
> >>>> @@ -132,7 +132,14 @@ void i2c_init_board(void)
> >>>>   */
> >>>>  enum env_location env_get_location(enum env_operation op, int prio)
> >>>>  {
> >>>> -	enum env_location boot_loc =3D ENVL_FAT;
> >>>> +	enum env_location boot_loc;
> >>>> +
> >>>> +	if (IS_ENABLED(CONFIG_ENV_IS_NOWHERE))
> >>>> +		boot_loc =3D ENVL_NOWHERE;
> >>>> +	else if (IS_ENABLED(CONFIG_ENV_IS_IN_FAT))
> >>>> +		boot_loc =3D ENVL_FAT;
> >>>> +	else if (IS_ENABLED(CONFIG_ENV_IS_IN_UBI))
> >>>> +		boot_loc =3D ENVL_UBI; =20
> >>>
> >>> This could leave boot_loc uninitialized. And there is still an uncond=
itional use
> >>> of ENVL_FAT in the BOOT_DEVICE_MMCx case. =20
> >>
> >> Yeah, it's a mess, and there doesn't seem to be a one-fits-all fallback
> >> value. Returning ENVL_UNKNOWN when prio is 0 definitely hangs, as does
> >> returning some source without having the corresponding driver compiled=
 in,
> >> so getting this right *and* nice-looking is a bit tricky.
> >>
> >>>>  	gd->env_load_prio =3D prio; =20
> >>>
> >>> I don't think the hook is supposed to change this variable. =20
> >>
> >> Yeah, don't remember why I initially put that in, I must have copied t=
hat
> >> from somewhere. All I remember is that this code is touchy (as the bug
> >> report leading to that patch shows), and there are quite some corner c=
ases
> >> to test.
> >>
> >>> I'm still a bit confused on the fallback logic you have in place. Spl=
itting it
> >>> up into three blocks doesn't help. If the goal is to load the environ=
ment from
> >>> the boot device, while preferring filesystems over raw block devices,=
 I propose
> >>> the following: =20
> >>
> >> Admittedly this gets messier, I mainly wanted to fix the regression
> >> quickly, since it already broke the release for the CHIP boards.
> >> I will have a closer look at your suggestion and check for those corner
> >> cases, but will probably go with that instead of piling up more cruft =
on
> >> my previous code ;-)
> >=20
> > So I was about to submit your solution, but this is suffering from the
> > same old problem: we must not return ENVL_UNKNOWN on the first call.
> > FEL booting triggers this: it will lead to env_init() returning a
> > negative error value, which is fatal, as it's part of init_sequence_f[].
> > I think the proper fix is to treat this case the same as the -ENOENT
> > case at the end of env_init(), but I don't dare to do this generic
> > change this late in the cycle.
> > My plan is to hack-fix this for sunxi, for now (see below), then
> > propose the generic change for the next cycle. Does this sound OK?
> > Another solution is to always select ENV_IS_NOWHERE, then return this,
> > but I don't know if this has more side effects, so is also risky at
> > this point.
>=20
> Yes, this sounds reasonable to me.

Also reasonable sounding to me, and sorting out things properly post
v2022.07 with some generic change / behavior fix.

--=20
Tom

--z5aBa8vtwHf6z68M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmK14DMACgkQFHw5/5Y0
tyxzrAv5AdR9WxSSJMIaidpKeNGLlru1wq2gUCQZMyadZEIjriOVRa9C61KuTbpx
tY/dmtkHDrop6yMT8kE/uwoLsj6OZP9qqt/q0MnBYx/62qBrQkLeeRlX3NrrBa7P
QO4cFsnVsW4Ld+g/4meSndfLTAPJrA8ShCARlqYuzTn0Mh3L7lDBecvj1GEfO3LL
qZ7FI032WxgaO4jq2FmhV/E3SDXLI2LYVoJ5ohYLT9sw21ulOq6E/izPWmw9vbBj
bN6QBkvB8vmm0igDowblOSvjdSmllfqLjhbwonWkW3LlYXP7ThpIwAROm717YlVB
t6iqrghtD6uIe5X/Oxq/KrFAp6gnx6xikkSOsrMgEm8RdVrDQobTIDwUFaYSmdyC
+xRIHy/BDSq6Ttqkk2hWds/kRMiQvK1BTSDvLrVSw971BoOrpoksWATMivUBWQKQ
XuYIhmPWyCgI1EqiMrbeTQOY3OaKwEG9jFjEYp31kwiSS8g/KVnJ7czJu38IXbFl
9q3LZ4I5
=BhhX
-----END PGP SIGNATURE-----

--z5aBa8vtwHf6z68M--
