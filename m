Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E159AEB18
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Jan 2023 22:24:00 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id x7so18385548qtv.13
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Jan 2023 14:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0v5s496emZAXbIaBdn2ul9GjPyOJfInHtnhhs8Qhd/c=;
        b=RAYBj54/QGRMz9Zo9lAfOysAnnpnPoil13BFWDAB9km/RF7KPnQCx6nIpB9GGvSr+Y
         wCAQ0VBXQxW2RrHl8OAnrCm0PcaPxsgvcEJO/pe8ji4Zqiatx5n/tji0OKyvjR+hNoNK
         lgv5B0AhG/1K62U8yMcIP10gfaWuXMQ9pYTKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0v5s496emZAXbIaBdn2ul9GjPyOJfInHtnhhs8Qhd/c=;
        b=hv9roS9cXIAjcNZw6NfitgdOUW8xE8YO0jC3pvrfdSse3eUzxqY9Mxebbmyg9ab3XD
         5YlammH0OQzt5fGSzxfbd9CBz2EsEQ89eiTBC8ZF2eCq8jV47rzCDIw44Cskmanknti7
         c73gOFQVT6qjdKghjUdxedrrvgkg+irioJ6fWy40B/HMGqiHG/aL3m0MHb/e8xPhImPS
         As8IMe9YU0nJNk4KwJXajA1CoYjFNzvctsKKEmSyb5OvCSkuUvTDW7ocLZSsYhg9DvXA
         +zWoZdBEEWwg68zCwYCp2EeFPmhlhY3ESChEXh0GcSV3vUSXo0lGM3lpvZJfPLYH70vn
         xi2Q==
X-Gm-Message-State: AFqh2koTpfgQ8BGba0aEpWNEwD+5ynNzZH7+vVVWf3Nfj5HzFmJZQsv6
	VD4+Ubzwb/sz591ZqQrRgwd0ig==
X-Google-Smtp-Source: AMrXdXtiQjv1OezlwbvbZ/OORJWRyGb4BURqmr/Qo53j77IEWxLKSuKohHO9gnTOaQj0TMfiMi821A==
X-Received: by 2002:ac8:6892:0:b0:3b6:316c:d38d with SMTP id m18-20020ac86892000000b003b6316cd38dmr6175214qtq.55.1673994239743;
        Tue, 17 Jan 2023 14:23:59 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-6400-3487-94a5-6d7e-19f3.res6.spectrum.com. [2603:6081:7b00:6400:3487:94a5:6d7e:19f3])
        by smtp.gmail.com with ESMTPSA id j9-20020ac806c9000000b003ab5d6cd6c5sm16621763qth.16.2023.01.17.14.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 14:23:59 -0800 (PST)
Date: Tue, 17 Jan 2023 17:23:57 -0500
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] ns16550: Fix DM serial operation with non-DM SPL
Message-ID: <20230117222357.GA631605@bill-the-cat>
References: <20230117120938.818180-1-andre.przywara@arm.com>
 <20230117131518.GW3880571@bill-the-cat>
 <20230117160914.7c2ba373@donnerap.cambridge.arm.com>
 <20230117161435.GF3880571@bill-the-cat>
 <20230117221546.447775bd@slackpad.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline
In-Reply-To: <20230117221546.447775bd@slackpad.lan>
X-Clacks-Overhead: GNU Terry Pratchett


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2023 at 10:15:46PM +0000, Andre Przywara wrote:
> On Tue, 17 Jan 2023 11:14:35 -0500
> Tom Rini <trini@konsulko.com> wrote:
>=20
> > On Tue, Jan 17, 2023 at 04:09:14PM +0000, Andre Przywara wrote:
> > > On Tue, 17 Jan 2023 08:15:18 -0500
> > > Tom Rini <trini@konsulko.com> wrote:
> > >=20
> > > Hi Tom,
> > >  =20
> > > > On Tue, Jan 17, 2023 at 12:09:38PM +0000, Andre Przywara wrote:
> > > >  =20
> > > > > Commit 9591b63531fa ("Convert CONFIG_SYS_NS16550_MEM32 et al to K=
config")
> > > > > moved some NS16550 configuration variables into Kconfig.
> > > > > Among those there is CONFIG_SYS_NS16550_REG_SIZE, which used to b=
e only
> > > > > defined for SPL build runs, but now is always set (thanks for Kco=
nfig).
> > > > > However this breaks the gating logic in ns16550.h, where we *over=
ride*
> > > > > this variable for DM build, as we learn this setting from the DT =
instead.
> > > > >=20
> > > > > As a consequence, we did the register shift twice: once when buil=
ding
> > > > > the register struct (as required for non-DM SPL builds), but then=
 also
> > > > > again in the driver after we parsed the reg-shift DT property.
> > > > >=20
> > > > > Change the logic to match what the comment says: only observe
> > > > > CONFIG_SYS_NS16550_REG_SIZE when not using DM, and ignore it othe=
rwise.
> > > > >=20
> > > > > This fixes U-Boot proper for all sunxi boards, since they are rel=
ying
> > > > > on this driver being build non-DM for the SPL, but DM for U-Boot =
proper.
> > > > >=20
> > > > > Fixes: 9591b63531fa ("Convert CONFIG_SYS_NS16550_MEM32 et al to K=
config")
> > > > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > > > ---
> > > > > Hi,
> > > > >=20
> > > > > this is admittedly a quick fix, to get sunxi booting again. This =
whole
> > > > > code around the register access looks somewhat bonkers, to be hon=
est,
> > > > > but at the moment I don't have time to rework this.
> > > > > Another possible "quicker fix" would be use a separate variable f=
or the
> > > > > register shift, so that we don't have to redefine a Kconfig varia=
ble.
> > > > > Another idea would be to get rid of the struct for the registers
> > > > > altogether, to remove the hacks about when to shift.
> > > > >=20
> > > > > Cheers,
> > > > > Andre
> > > > >=20
> > > > >  include/ns16550.h | 3 ++-
> > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/include/ns16550.h b/include/ns16550.h
> > > > > index 243226fc3d9..e9e2aeedd16 100644
> > > > > --- a/include/ns16550.h
> > > > > +++ b/include/ns16550.h
> > > > > @@ -26,11 +26,12 @@
> > > > > =20
> > > > >  #include <linux/types.h>
> > > > > =20
> > > > > -#if CONFIG_IS_ENABLED(DM_SERIAL) && !defined(CONFIG_SYS_NS16550_=
REG_SIZE)
> > > > > +#if CONFIG_IS_ENABLED(DM_SERIAL)
> > > > >  /*
> > > > >   * For driver model we always use one byte per register, and sor=
t out the
> > > > >   * differences in the driver
> > > > >   */
> > > > > +#undef CONFIG_SYS_NS16550_REG_SIZE
> > > > >  #define CONFIG_SYS_NS16550_REG_SIZE (-1)
> > > > >  #endif   =20
> > > >=20
> > > > Does:
> > > > https://patchwork.ozlabs.org/project/uboot/patch/20230110161946.381=
6866-5-trini@konsulko.com/
> > > > work for you as well? =20
> > >=20
> > > Unfortunately not. This changed condition there does not trigger for
> > > sunxi. If I hack it that it applies, but only to the proper build, it
> > > works, though. But I don't feel like adding to this #if even more ;-)=
 =20
> >=20
> > I've got a version that does work, now, on my pine64 plus, and I've
> > asked Quentin to test his Rockchip platform that was also broken, before
> > I post a new version there.
>=20
> Is it something like this:
>=20
> diff --git a/include/ns16550.h b/include/ns16550.h
> index 243226fc3d9..74e619e0614 100644
> --- a/include/ns16550.h
> +++ b/include/ns16550.h
> @@ -26,15 +26,12 @@
> =20
>  #include <linux/types.h>
> =20
> -#if CONFIG_IS_ENABLED(DM_SERIAL) &&
> !defined(CONFIG_SYS_NS16550_REG_SIZE) /*
>   * For driver model we always use one byte per register, and sort out
> the
>   * differences in the driver
>   */
> -#define CONFIG_SYS_NS16550_REG_SIZE (-1)
> -#endif
> -
> -#if defined(CONFIG_NS16550_DYNAMIC) || defined(CONFIG_DEBUG_UART)
> +#if CONFIG_IS_ENABLED(DM_SERIAL) || defined(CONFIG_NS16550_DYNAMIC)
> ||	\
> +    defined(CONFIG_DEBUG_UART)
>  #define UART_REG(x)	unsigned char x
>  #else
>  #if !defined(CONFIG_SYS_NS16550_REG_SIZE) ||
> (CONFIG_SYS_NS16550_REG_SIZE =3D=3D 0)

Yes, I just cc'd you on it (crossed messages I do believe) with a
comment.

--=20
Tom

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmPHH/cACgkQFHw5/5Y0
tyxLVAv8De3bysK4aFyqjRSJaMitNxGqOPFTmrASvb4uOcBFvhs5j1b/Ehn9uRMq
cqHc/mdX5bhTP8+VsdSZN7xZoSkV5xPw7GpKqHx+sMxSUHk8Q392fcKK476rm1Xv
BLnvY+P3zU1yXqgrHv0ccYs50IU+eSpZbqe0CFk5t5UGkBe7Ig2jhsSJG6LBeUl2
M8tD6wiHOKv4TCinZJG2gHj+RCn1E3A97MALWgcvm8J/jKIqMU0u1zD602muhmd/
0yF48zkJEorL87vbScQpsusPjBCyfcTXDgq1A4URfcvLHiXMZOfoxRKomi7Cq99M
U3BbLAMf2Qam4sWZPqfbr79RYnCSDnvYuy/kNwfo0ahCtgz3bVkT522zSdglErkA
GL062ixkEODthR08rf+rcEtXJ6XwoFmWppYFH0phxhRI2/eeyMqRAwXNtnvlmwNB
BNUOOdDoJyaHnqMXbFQLe3A2hw94z+JlX7IykyswlFwkhyWGqQ6yjlHVqqU/YS0Y
ykhyje0a
=cr7n
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
