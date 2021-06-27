Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E5570
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Jun 2021 23:43:03 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id 65so8228006qko.5
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Jun 2021 16:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YQiNWoSPxUi3KOdr8h9/9tRTdEhHPznsEKGGXAsJZq4=;
        b=Q9zMGDHIwD1nLdh5sLskqCxM0Xka/VN+fNKVyJrqWYOs13H9A2zcbs5NVKCjndqus+
         9eVL90PQXrzvApIQY+rn6xQK7hSVIngbH6+WeFn4X5/qqXW7wT+XDTpfAy0dr+V6NvIT
         ysZ8RrhPMxG3FwaYruqbAdl0odZckYeF7BTCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YQiNWoSPxUi3KOdr8h9/9tRTdEhHPznsEKGGXAsJZq4=;
        b=HJqVdr3SNbcZXz8Ihevu4ouBMWoKEGCZ4wWNsZfwXiC8Uj0zYlUc+dpaF5wmpY738M
         WpbetV4ZWNiJoyWXqasxdoXdgMqoCDt3l7/DkjdkvpnfIm8Cwnx8l3H0Xyl0rZ+8tjxh
         uaOoOrUxW8QOjtgzO5yYWV5xVEFeiOBWVl43Yq7bKQ1VX1v/fTKYZGfOFbRUh02uJz/4
         elap0ySqC/1VmGf2loqLypNyf8iR/zDc8PESQ+Gc5e/nCH3toVPfFHlbrzixSDRZLK3V
         Bqa452j1uypEg7/yGno+wWHWTGxxVnIKNKp/x8RV877ELlLgXhbriLVMv5ESUqVKAJwR
         qCZQ==
X-Gm-Message-State: AOAM533iJirb8fRnb99ADOhnIJb0QY9CfCo2LhbSF9aDrNgzT+oa1L6x
	VrnY30Es6xd8lZpRGSYUpGfJwg==
X-Google-Smtp-Source: ABdhPJx5iMV4B8DGXSCsjn9C8poPKKUe1twyUR0tQoI37U0ND4q6kBaoeLrVp7ncgLiojOkctgEJ6w==
X-Received: by 2002:ae9:ee12:: with SMTP id i18mr21888758qkg.440.1624837382138;
        Sun, 27 Jun 2021 16:43:02 -0700 (PDT)
Received: from bill-the-cat (2603-6081-7b01-cbda-2808-537e-3f88-1d98.res6.spectrum.com. [2603:6081:7b01:cbda:2808:537e:3f88:1d98])
        by smtp.gmail.com with ESMTPSA id b8sm7601354qtr.77.2021.06.27.16.43.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Jun 2021 16:43:01 -0700 (PDT)
Date: Sun, 27 Jun 2021 19:42:58 -0400
From: Tom Rini <trini@konsulko.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Simon Glass <sjg@chromium.org>, Andre Przywara <andre.przywara@arm.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Samuel Holland <samuel@sholland.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 1/4] mkimage: add a flag to describe whether -A is
 specified
Message-ID: <20210627234258.GX9516@bill-the-cat>
References: <20210619091838.646779-1-icenowy@aosc.io>
 <20210619091838.646779-2-icenowy@aosc.io>
 <CAPnjgZ3-iAng7Y9d+cjZY95vOeKfJStbVbQWYiUZURhptxZrmQ@mail.gmail.com>
 <b2563810990da9c9ace9cc73bf70e49c4bf6e556.camel@aosc.io>
 <CAPnjgZ0CnSF_sciLCgLBJTzr5nL4qg=sYFnE34-83QMj2q_Z+Q@mail.gmail.com>
 <82e6dcdbb261aad200b58dd22fb776615a3724e4.camel@aosc.io>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IqwIanVNwh6IvsDZ"
Content-Disposition: inline
In-Reply-To: <82e6dcdbb261aad200b58dd22fb776615a3724e4.camel@aosc.io>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)


--IqwIanVNwh6IvsDZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 28, 2021 at 06:17:27AM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2021-06-27=E6=98=9F=E6=9C=9F=E6=97=A5=E7=9A=84 13:32 -0600=EF=
=BC=8CSimon Glass=E5=86=99=E9=81=93=EF=BC=9A
> > Hi Icenowy,
> >=20
> > On Sat, 26 Jun 2021 at 17:57, Icenowy Zheng <icenowy@aosc.io> wrote:
> > >=20
> > > =E5=9C=A8 2021-06-26=E6=98=9F=E6=9C=9F=E5=85=AD=E7=9A=84 12:31 -0600=
=EF=BC=8CSimon Glass=E5=86=99=E9=81=93=EF=BC=9A
> > > > Hi Icenowy,
> > > >=20
> > > > On Sat, 19 Jun 2021 at 03:19, Icenowy Zheng <icenowy@aosc.io>
> > > > wrote:
> > > > >=20
> > > > > The sunxi_egon type used to take no -A argument (because we
> > > > > assume
> > > > > sunxi
> > > > > targets are all ARM). However, as Allwinner D1 appears as the
> > > > > first
> > > > > RISC-V sunxi target, we need to support -A; in addition, as
> > > > > external
> > > > > projects rely on U-Boot mkimage to generate sunxi eGON.BT0
> > > > > header,
> > > > > we
> > > > > need to keep compatibility with command line without -A.
> > > > >=20
> > > > > As the default value of arch in mkimage is not proper
> > > > > (IH_ARCH_PPC
> > > > > instead of IH_ARCH_INVALID), to keep more compatibility, add an
> > > > > Aflag
> > > > > field to image parameters to describe whether an architecture
> > > > > is
> > > > > explicitly specified.
> > > > >=20
> > > > > Reviewed-by: Tom Rini <trini@konsulko.com>
> > > > > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > > > > ---
> > > > > Changes in v2:
> > > > > - Added Tom Rini's Review tag.
> > > >=20
> > > > This is not actually a change so should not appear in the log.
> > > >=20
> > > > Also note 'patman status' can be used to automatically collect
> > > > these.
> > > >=20
> > > > >=20
> > > > > =C2=A0tools/imagetool.h | 1 +
> > > > > =C2=A0tools/mkimage.c=C2=A0=C2=A0 | 1 +
> > > > > =C2=A02 files changed, 2 insertions(+)
> > > > >=20
> > > > > diff --git a/tools/imagetool.h b/tools/imagetool.h
> > > > > index e229a34ffc..5dc28312c2 100644
> > > > > --- a/tools/imagetool.h
> > > > > +++ b/tools/imagetool.h
> > > > > @@ -51,6 +51,7 @@ struct image_tool_params {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int pflag;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int vflag;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int xflag;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int Aflag;
> > > >=20
> > > > aflag
> > >=20
> > > I think a problem is that -a is a different flag than -A.
> > >=20
> > > -a is addr, -A is architecture.
> >=20
> > Yes OK, but the code style doesn't allow capital letters, as I
> > understand it.
> >=20
> > How about addr_flag ?
>=20
> maybe we just call -a aflag, and -A arch_flag?

Frankly I think Aflag is the most readable option here.  They're all
literally ${FLAG_USE}flag variables, yes?  CamelCase isn't great, but
there's times where the most readable thing isn't always what we use
everywhere else.

--=20
Tom

--IqwIanVNwh6IvsDZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmDZDP8ACgkQFHw5/5Y0
tyxs3gwAt4YedzF0k/sMRChNGPF2jeuiKKt/C7XWaRKK76cPcLHgcVIHrFDf818r
+Aeot5AFkEfVWYc6kEnhWKaNDfBFvC7IgmKpp66zxvduOJPekC93zsk/EY7/7MF5
i16+7VVIxYglNvzswK4+lb/u3ACrtoau+BoLoc2jhabQyt7I490FuZlvLXw2gL7j
7iApuyx51wDd7l4uvee70IByp+kvzV9Kw1jfKobWza8auF08EhFa3DDny98amnOB
aLtUuE6Ule6NIQCf6w1eq1ruh73jbdwlCeNN/6d79n0qS9tJbv7KsPeSNlBHGP2O
8xHv/Xh1YEKfuFf88qKhzbee0/qrux9Ug/y0ZishC0gFXgWZNTcqb5FJjvloN+E4
8vkFtGfX5RJK7YYSvFkJHUmbguGCD8i05dC85uzVNt7bZJmdSpEtzv3RQ2ulc0ak
9llSRSB2D+L5KESGvipXvwt4ydCgbGWG9k4zQckS1iKBu3kNCimgSu4niX/VXw2n
DbiQNJhg
=wbpd
-----END PGP SIGNATURE-----

--IqwIanVNwh6IvsDZ--
