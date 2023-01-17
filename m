Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAF54C9A
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Jan 2023 15:55:30 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id d13so21845098qvj.8
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Jan 2023 07:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XU18+JlPZYHuRI548Ihu5d6T8l7HDy8npIBCrpVktis=;
        b=KQkrss5eymrm/q+eLUNQhfiLS65HGk3ZmkT2qMVzNHK+siiS6idqzUEtzc4JDJPsFX
         HrwpMTJkKRD50kx+hstfe4vwBopAQaZSTSmFbWLtt7hs4JPlgxT02+OhJj+utI8TH4Ut
         ilx9BwHvM2gu4oIEoSmZkBL+4A5FV2uwXjRlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XU18+JlPZYHuRI548Ihu5d6T8l7HDy8npIBCrpVktis=;
        b=rX8y7RT9ciZvn6VwDj4OLE0+v0yVeHjSslDruwh7kBBgfGFq/04hqPJIkgj619oTz2
         YZRv1rxcFBFwvn9k6hT6TPChbxzEclXYC+XRRBSkH3Dki32OII+f61JqQhXUEx5Bm9u2
         RtY/mCwF6/w/ParV2r/0U3/hIwejK+s8YCdxJD5fkR1iokspjMKWH4ci0Lr+qAGxt3tW
         eBHgpM6+8ENXkutPX1O7yPjDrHMWe6vpfYBnFm18wMioXhRdKTnRvoLQPc3Yr/wZq7PH
         1Uryv7ZFE973FKpDJ3aRqekuE+MeS1iq1sh+blcxvIvvbD0vk6bmDCdezzdS76plj5cj
         Vk0A==
X-Gm-Message-State: AFqh2krmn7Rs+CUgwnOGV8Ynt5K9gQcxH36ztbFo7wsXj2GXQCggyylo
	f1Wq8St70aw3GglElC9Nware4g==
X-Google-Smtp-Source: AMrXdXtfTZtCtjJ2W3njl/KuBrMmQ/HM4S4DUshLyFF5oV42RK8hdcktSt82Xgq+l351VvyeHwPqFA==
X-Received: by 2002:a0c:910d:0:b0:535:2730:c922 with SMTP id q13-20020a0c910d000000b005352730c922mr4505247qvq.42.1673970929808;
        Tue, 17 Jan 2023 07:55:29 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-6400-3487-94a5-6d7e-19f3.res6.spectrum.com. [2603:6081:7b00:6400:3487:94a5:6d7e:19f3])
        by smtp.gmail.com with ESMTPSA id q5-20020a05620a0d8500b006eee3a09ff3sm20567795qkl.69.2023.01.17.07.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 07:55:29 -0800 (PST)
Date: Tue, 17 Jan 2023 10:55:27 -0500
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] ns16550: Fix DM serial operation with non-DM SPL
Message-ID: <20230117155527.GE3880571@bill-the-cat>
References: <20230117120938.818180-1-andre.przywara@arm.com>
 <20230117131518.GW3880571@bill-the-cat>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hk/xWDG3xnLTY+FR"
Content-Disposition: inline
In-Reply-To: <20230117131518.GW3880571@bill-the-cat>
X-Clacks-Overhead: GNU Terry Pratchett


--hk/xWDG3xnLTY+FR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2023 at 08:15:18AM -0500, Tom Rini wrote:
> On Tue, Jan 17, 2023 at 12:09:38PM +0000, Andre Przywara wrote:
>=20
> > Commit 9591b63531fa ("Convert CONFIG_SYS_NS16550_MEM32 et al to Kconfig=
")
> > moved some NS16550 configuration variables into Kconfig.
> > Among those there is CONFIG_SYS_NS16550_REG_SIZE, which used to be only
> > defined for SPL build runs, but now is always set (thanks for Kconfig).
> > However this breaks the gating logic in ns16550.h, where we *override*
> > this variable for DM build, as we learn this setting from the DT instea=
d.
> >=20
> > As a consequence, we did the register shift twice: once when building
> > the register struct (as required for non-DM SPL builds), but then also
> > again in the driver after we parsed the reg-shift DT property.
> >=20
> > Change the logic to match what the comment says: only observe
> > CONFIG_SYS_NS16550_REG_SIZE when not using DM, and ignore it otherwise.
> >=20
> > This fixes U-Boot proper for all sunxi boards, since they are relying
> > on this driver being build non-DM for the SPL, but DM for U-Boot proper.
> >=20
> > Fixes: 9591b63531fa ("Convert CONFIG_SYS_NS16550_MEM32 et al to Kconfig=
")
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> > Hi,
> >=20
> > this is admittedly a quick fix, to get sunxi booting again. This whole
> > code around the register access looks somewhat bonkers, to be honest,
> > but at the moment I don't have time to rework this.
> > Another possible "quicker fix" would be use a separate variable for the
> > register shift, so that we don't have to redefine a Kconfig variable.
> > Another idea would be to get rid of the struct for the registers
> > altogether, to remove the hacks about when to shift.
> >=20
> > Cheers,
> > Andre
> >=20
> >  include/ns16550.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/include/ns16550.h b/include/ns16550.h
> > index 243226fc3d9..e9e2aeedd16 100644
> > --- a/include/ns16550.h
> > +++ b/include/ns16550.h
> > @@ -26,11 +26,12 @@
> > =20
> >  #include <linux/types.h>
> > =20
> > -#if CONFIG_IS_ENABLED(DM_SERIAL) && !defined(CONFIG_SYS_NS16550_REG_SI=
ZE)
> > +#if CONFIG_IS_ENABLED(DM_SERIAL)
> >  /*
> >   * For driver model we always use one byte per register, and sort out =
the
> >   * differences in the driver
> >   */
> > +#undef CONFIG_SYS_NS16550_REG_SIZE
> >  #define CONFIG_SYS_NS16550_REG_SIZE (-1)
> >  #endif
>=20
> Does:
> https://patchwork.ozlabs.org/project/uboot/patch/20230110161946.3816866-5=
-trini@konsulko.com/
> work for you as well?

This got me to double check why my pine64 wasn't in CI, again, and now I
see that no, this patch doesn't solve that case.

--=20
Tom

--hk/xWDG3xnLTY+FR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmPGxOsACgkQFHw5/5Y0
tyzXlwv/U3LvyMs2X8qScGQjXZQJjWhZG5bduOkPzsitvrCKVYTIFHzDB8y2iCxq
/Gz85cWDESoQKY9d21q/9CFun3fBIAILz/ZCg9JfkhgzVsTagB4wW4tIWM0ewLZL
0GpqZnSq+s/eEH86tqZiRTTY65C2Su2ivAFxe0JBKX6hFs+Cgh/wEGk1gy0dvHuY
UdUzw6MOWL3rsG1T5cWAAtKteD28AcjlTJT4QL+ygbMM528OBL7eCxuzx+TwV/hD
Oj1zgDpjB/4/Ov4EQZcp53bAZbrvKQFPm42aqCoRSlVfL2V6Gy1cmuQovHxK8Lcf
+d6UtrkBBs1iWwmbWDbu5OfWplAMrBSIxV4Bl6/AYrgp53VYgEqzQItqY8Almbjf
hZaldpIgOAfEOKuw46WfWxBk4k+LDyztFJGc6fgtLmwXz99He11SlSM86kodF6G8
2BOIkgKhF9LUVkcrTAhzQP4wCFy6vScpd79nHzoF51nZFko8fXFmwCTOD9kNNd0k
nEQ9Klkx
=cAab
-----END PGP SIGNATURE-----

--hk/xWDG3xnLTY+FR--
