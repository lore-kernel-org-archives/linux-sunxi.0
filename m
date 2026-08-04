Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B7948122C
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Aug 2026 17:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785866334; cv=none; b=Ne1/UAUE84GKtWpkl73ZX8Qn7C6kkf9HCwFomXUs+EcgDJCNfgo44MPQKSGnkCu1qBdHZoj9oS30zHfEDYki9vDRTj6mguKljfj1/7MUhEsxpIzONoROPVEl93+D6gdakO0sGrnALPaTcScfVRbNuQRr66K7zmUu4Ll8OlofoAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785866334; c=relaxed/simple;
	bh=3ovUgqGXbw4shedhWjwDIdCUgRK5uIxplUPMFpCaGjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TnM1HghcUVCE9IrQxitIUP+/Kez3tWIITnEVRbUuON6q2JSN2csKCEtmgM4RmcvMQt4FZukslMcMIrADaR4tvEHJaXmzL5WNUnv3U74ejFG37IXruMNvHQ0PL+VbMjFbuaXZqh63nHRsVLI1N/qX2dV8lAS3fxbs7NL7i0/s7y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbjB6erk; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbjB6erk"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954d29264cso413695e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Aug 2026 10:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785866328; x=1786471128; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8FfIalmLeScOxNe/jU0URjsOVpQ536KPeXddNb2Qzuk=;
        b=dbjB6erk2+iMY6f/Vaw1xqnDVXRin2qCCp9s1Gn+fgv3uPsJM3eRfDkJVPNOOFqjlV
         0cum/ZGqD/qVuNuTgFe3gRlciTqwCZwwkjxnraWl0EYEFEkwnixvXofar72Rfqr7gi9V
         bL1C2JsJUvg+onGMwFH+65pRClFmNVeMpDLUGBkR9C+ibEHF1ZyEv20EcHPPB4iAkR2s
         ZdH971HxidBmyNnO8u9YXZ5b42BSM4tvK5jgFutsvvv0KguQhnaldIxkKuP5iFPEnvOx
         JHLxv2NiDzu1xVe3P25kZbsl8V4y7xuZvOi5RHDX7yyB1z1VEAilSXptQDSP7l5kQpYt
         Dauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785866328; x=1786471128;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8FfIalmLeScOxNe/jU0URjsOVpQ536KPeXddNb2Qzuk=;
        b=bx/l/zfqDhkufdIV0KHprwnTUdiA2TTePC8n++A8boTFNaJNJnLH0DMiLg4ClcF5dT
         3mc+ZU5TJ6w1y3eFILfft8lS/WQzQdigvSk4Uju/1heACAwuGYGA+kqB+e4Ux6DujH03
         /sQqtPapfYttjs2JviTzLJkn1Sii9tINbL0cQfednG7iKH2IvGn7ctzrrFsQUwviKF4K
         ScFTcYlxNbh5c8bgZrd+k0zc1kTE0V2EkTpHMruTHQQCvQXRudhN6Z+cu3iKArSQvKAn
         2oO5T6zqA3Bn0afG3n7z5ZY3u1m2robudNsvbtIQMPyafX+eQOsgfnZfjoIZxL8Up3qc
         HX1w==
X-Forwarded-Encrypted: i=1; AHgh+RqyzVuoHe9SQGZ9AAG3EXIFD3Va0bEmwpr/QWK9CYf5Kw+rrrR+q4pK5JAQVSavVlSRTn92DtLCFcj/Ig==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhJV8SR2bO7Cazh/3/PqBPLj/CSNJs75QNd22oxqb3CKgwuHM6
	N6W71idCHrEXO4QRbuiHIfm46y6HLoBb/+2tlsguY9M1SjbdMSSFpXGA
X-Gm-Gg: AR+sD138ia9EUetH3DsK5dAfcb2IfawQU/DGc21YCeubU/u6MgY1hfYFPusebecumtb
	FjmZ637AJMw21X78bZVQj6r9z6QE3ugpX0zJPVBrkUdQ7fSFRXBvrXSzRvsRG7QLkU4Rk+EM5bQ
	gyf7u9gnPdumSLWw8E5JzuYOp0W8bKUMGdnkmDwIL+dGbtr92L9vPMMm0zNoQIHjpRKc98k2oOl
	PRgit45viGhmwTMQO9B5NkIWHhhpZdGyaDwNRI8d2QIToRkpp5tjamAE9QqbGuLoX735/+7rqhl
	H7Q850i80o6qfLwtTnQ5BH/xC+YXdJiY/v4yd7l1l4KOqdAvEoy+PD3qSHn1YiC+raaqN0AKtND
	kG5P6C+Vex3RMc4LQNm9YZ6UFqp251aKgqMug5cGVZwdMsx3aXQgo84OSVYSOxkbMShYHylfwVA
	Vdf1XZaLuTX4/X41bOhdc//vnLcZgS/h8xs+Zfvpj8Vt/E1g6zv1dOAxTviW3Tyy3fFuwrk/EaK
	F3TTuW3nj5p76QE+6uPdlLY/pThVnlVasiDTTGBURJpqffoZDYzvGQsizDTzIwFzn8iIPDpzdPq
	LBV6t0M8G8AMrNhQpn3sLLFx+w+kjtt/QaEsToVaHzUWXGJ4I87Ft82tER0500Nc/HuhObr/Waw
	vPukMCPa7bNMWKCujhDAKmOqLiV9Tn5G8wqUEfGMexz1CfQ6ZkXAjbvZzoemGp5MwEnuXEXQRdL
	cTpnNEwCeRy36OTg==
X-Received: by 2002:a05:600c:8b51:b0:495:6b55:f938 with SMTP id 5b1f17b1804b1-4994e7ba99emr39395e9.10.1785866328394;
        Tue, 04 Aug 2026 10:58:48 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-122-102-118-gprs.simobil.net. [46.122.102.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994dfe8973sm19187475e9.7.2026.08.04.10.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:58:47 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 13/13] drm/sun4i: Align VI buffer addresses for subsampled formats
Date: Tue, 04 Aug 2026 19:58:45 +0200
Message-ID: <58Gvon3UR1Sy7a6nLT6bDw@gmail.com>
In-Reply-To:
 <CAGb2v67mTzB+R7XDasSNhpmdzu5ikdoO0QwiHR432pdt_v7A_Q@mail.gmail.com>
References:
 <cover.1785772659.git.jernej.skrabec@gmail.com>
 <ugAWjG4QTtSgFVIbk0BoGg@gmail.com>
 <CAGb2v67mTzB+R7XDasSNhpmdzu5ikdoO0QwiHR432pdt_v7A_Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 4. avgust 2026 ob 19:04:10 Srednjeevropski poletni =C4=8Das je C=
hen-Yu Tsai napisal(a):
> On Wed, Aug 5, 2026 at 12:25=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrab=
ec@gmail.com> wrote:
> >
> > Dne torek, 4. avgust 2026 ob 13:14:38 Srednjeevropski poletni =C4=8Das =
je Chen-Yu Tsai napisal(a):
> > > On Tue, Aug 4, 2026 at 1:25=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org>=
 wrote:
> > > >
> > > > On Tue, Aug 4, 2026 at 12:11=E2=80=AFAM Jernej Skrabec <jernej.skra=
bec@gmail.com> wrote:
> > > > >
> > > > > This is a partial revert of commit 79ac1c945ab8 ("drm/sun4i: laye=
rs:
> > > > > Use drm_fb_dma_get_gem_addr() to get display memory").
> > > > >
> > > > > Chroma must start at the beginning of a subsampling block, for ex=
ample
> > > > > chroma start address for NV12 must be aligned to 2 pixels.
> > > > > drm_fb_dma_get_gem_addr() offsets luma by the exact source coordi=
nates
> > > > > and chroma by the coordinates divided by the subsampling factor, =
so for
> > > > > odd offsets both planes no longer describe the same pixel, which =
the
> > > > > Display Engine scaler can't handle.
> > > > >
> > > > > Align source coordinates down for all planes instead. Remaining s=
hift
> > > > > of one pixel is already compensated with scaler phase shift in
> > > > > sun8i_vi_layer_update_coord().
> > > >
> > > > Well I think this applies to the format in general, and probably sh=
ould
> > > > be fixed in drm_fb_dma_get_gem_addr() instead?
> > > >
> > > > > Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_a=
ddr() to get display memory")
> > > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > > ---
> > > > >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 20 ++++++++++++++++++--
> > > > >  1 file changed, 18 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu=
/drm/sun4i/sun8i_vi_layer.c
> > > > > index 09f668c8af24..ad036cb9d88e 100644
> > > > > --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > > > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > > > @@ -197,15 +197,31 @@ static void sun8i_vi_layer_update_buffer(st=
ruct sun8i_layer *layer,
> > > > >         struct drm_plane_state *state =3D plane->state;
> > > > >         struct drm_framebuffer *fb =3D state->fb;
> > > > >         const struct drm_format_info *format =3D fb->format;
> > > > > +       struct drm_gem_dma_object *gem;
> > > > > +       u32 dx, dy, src_x, src_y;
> > > > >         dma_addr_t dma_addr;
> > > > >         u32 ch_base;
> > > > >         int i;
> > > > >
> > > > >         ch_base =3D sun8i_channel_base(layer);
> > > > >
> > > > > +       /* Adjust x and y to be divisible by subsampling factor */
> > > > > +       src_x =3D (state->src.x1 >> 16) & ~(format->hsub - 1);
> > > > > +       src_y =3D (state->src.y1 >> 16) & ~(format->vsub - 1);
> > > >
> > > > AFAICT the only difference compared to drm_fb_dma_get_gem_addr()
> > > > is the masking here, i.e. round_down().
> > > >
> > > > > +
> > > > >         for (i =3D 0; i < format->num_planes; i++) {
> > > > > -               /* Get the start of the displayed memory */
> > > > > -               dma_addr =3D drm_fb_dma_get_gem_addr(fb, state, i=
);
> > > > > +               gem =3D drm_fb_dma_get_gem_obj(fb, i);
> > > > > +               dma_addr =3D gem->dma_addr + fb->offsets[i];
> > > > > +
> > > > > +               dx =3D src_x;
> > > > > +               dy =3D src_y;
> > > > > +               if (i > 0) {
> > > > > +                       dx /=3D format->hsub;
> > > > > +                       dy /=3D format->vsub;
> > > > > +               }
> > > > > +
> > > > > +               dma_addr +=3D dx * format->cpp[i];
> > > > > +               dma_addr +=3D dy * fb->pitches[i];
> > > >
> > > >
> > > > Where as the helper has (or used to have before the blocksize stuff=
):
> > > >
> > > >     paddr +=3D (format->cpp[plane] * (state->src_x >> 16)) / fb->fo=
rmat->hsub;
> > > >     paddr +=3D (fb->pitches[plane] * (state->src_y >> 16)) / fb->fo=
rmat->vsub;
> > > >
> > > > Am I missing something?
> > >
> > > After some headbanging on my end I see that the offset for the Y plane
> > > needs to be rounded down.
> > >
> > > But instead of reverting the whole thing and open-coding the helper
> > > again, could you adjust the address returned by the helper for odd
> > > offsets?
> >
> > Yes, that's also an option. I'll do it in v2.
> >
> > >
> > > And just a heads up, this also needs a clipped version of
> > > drm_fb_dma_get_gem_addr() as sun8i_ui_layer_update_coord() uses the
> > > clipped dimensions. I am currently working on this part.
> >
> > Can you explain a bit more? I don't see why it needs any adjustement.
>=20
> My understanding is that drm_atomic_helper_check_plane_state() calculates
> the "clipped" rectangles for the plane using values from userspace in
> state->src_[xywh] and state->crtc_[xywh] and puts them in state->src
> and state->dst, respectively. If the overlay is moved partially outside
> the screen, the overlay is "clipped".
>=20
>=20
> Say we have a screen of 1920x1080, with an overlay buffer that is 1280x72=
0.
> Say state->src_x and state->src_y are (-50, 0), given by userspace.
> drm_atomic_helper_check_plane_state() will calculate the clipped & scaled
> rectangles and put them in state->src. This latter rectangle is what is
> used sun8i_ui_layer_update_coord().
>=20
> So we would have:
>=20
>     (src_x, src_y) =3D (-50, 0), (src_w, src_h) =3D (1280, 720)
>=20
> The clipped numbers are
>=20
>     (src.x1, src.y1) =3D (0, 0), (src.x2, src.y2) =3D (1230, 720)
>=20
> src, not src_[xywh], is what sun8i layers uses to program the coordinates,
> and prior to the drm_fb_dma_get_gem_addr() conversion, also to calculate
> the buffer start address. drm_fb_dma_get_gem_addr() however uses src_[xy]
> to calculate the address.
>=20
>=20
> Essentially, when overlaying a clipped plane, the start address needs to
> be adjusted if the source (top left) offset is outside the screen.
> clipping =3D=3D automatic cropping to fit the screen.
>=20
> I don't know if userspace applications routinely do this, but I think this
> needs to be restored to the prior behavior.

Uh, it would be nice if this is fixed. But I think it's not too common
for app to use negative coordinates.

Best regards,
Jernej


