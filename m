Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 789A42376E4
	for <linux-sunxi@lists.linux.dev>; Fri,  9 May 2025 16:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808308; cv=none; b=OaPz+8dzeaPzYiN5eMQrYDgzSLpu8sZBnNsUA+SH++kXovg2VjBGCILhBShz8WqXhvb/ML7MDAGS4DzXc9BbNKef282iGeNKTCbnJNby6+eR5M9q4YoIqxioo+uo3Lfgi3BVN7fWfTghvDz+zTE5TJGe7kgu//6z69QbUmpHNuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808308; c=relaxed/simple;
	bh=IPNirIHSpDjovwxznpY6ihSgBAanz/C90tFNC4q9MaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LOKgYcgurMawxeWS9a8KiPgCFki9p972IOPaYXWlI2urq2P61bYgiglZG/5EKtXlOz40pyq/ndQ547d2qTgaP5HgzX3k6splHqIHzZ4nS2DxqqkwAEtvS+LlQUi8pcc8+ZU26XjN9/lVkDDw6/4qwKuMgBt4sBPwL+cKxw9VjCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E2B6175D;
	Fri,  9 May 2025 09:31:34 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54A303F5A1;
	Fri,  9 May 2025 09:31:43 -0700 (PDT)
Date: Fri, 9 May 2025 17:31:40 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Chris Morgan <macroalpha82@gmail.com>, <linux-sunxi@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <ryan@testtoast.com>, <macromorgan@hotmail.com>, <p.zabel@pengutronix.de>,
 <tzimmermann@suse.de>, <maarten.lankhorst@linux.intel.com>,
 <simona@ffwll.ch>, <airlied@gmail.com>, <mripard@kernel.org>,
 <samuel@sholland.org>, <jernej.skrabec@gmail.com>, <conor+dt@kernel.org>,
 <krzk+dt@kernel.org>, <robh@kernel.org>
Subject: Re: [PATCH V9 02/24] clk: sunxi-ng: h616: Add LVDS reset for LCD
 TCON
Message-ID: <20250509173140.26611141@donnerap.manchester.arm.com>
In-Reply-To: <CAGb2v65ZhA3_pdgbq9aVdy-0rQcTNfrHoE_AvJxOvin0a6tnMA@mail.gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
	<20250507201943.330111-3-macroalpha82@gmail.com>
	<20250509151448.3191a3d8@donnerap.manchester.arm.com>
	<CAGb2v65ZhA3_pdgbq9aVdy-0rQcTNfrHoE_AvJxOvin0a6tnMA@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 9 May 2025 23:29:50 +0900
Chen-Yu Tsai <wens@csie.org> wrote:

> On Fri, May 9, 2025 at 11:14=E2=80=AFPM Andre Przywara <andre.przywara@ar=
m.com> wrote:
> >
> > On Wed,  7 May 2025 15:19:21 -0500
> > Chris Morgan <macroalpha82@gmail.com> wrote:
> >
> > Hi,
> >
> > despite the slightly ill fate of this series, I was wondering if we cou=
ld
> > get the non-controversial clock parts for instance already merged, to
> > reduce the number of patches and mitigate the churn with dependencies? =
=20
>=20
> Sure. Are we expecting any of the DT bits to go in this cycle?
> If not I won't have to split the DT header patch on a separate
> branch.

I don't think so, the DT wouldn't make much sense on its own anyway. But
I guess it would help if the bindings / binding headers would go in
already?

Cheers,
Andre

>=20
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > >
> > > Add the required LVDS reset for the LCD TCON. Note that while this
> > > reset is exposed for the T507, H616, and H700 only the H700 has
> > > an LCD controller.
> > >
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > Signed-off-by: Ryan Walklin <ryan@testtoast.com> =20
> >
> > Matches the T507 manual:
> >
> > Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> >
> > Cheers,
> > Andre
> > =20
> > > ---
> > >  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sun=
xi-ng/ccu-sun50i-h616.c
> > > index daa462c7d477..955c614830fa 100644
> > > --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > > @@ -1094,6 +1094,7 @@ static const struct ccu_reset_map sun50i_h616_c=
cu_resets[] =3D {
> > >       [RST_BUS_TCON_LCD1]     =3D { 0xb7c, BIT(17) },
> > >       [RST_BUS_TCON_TV0]      =3D { 0xb9c, BIT(16) },
> > >       [RST_BUS_TCON_TV1]      =3D { 0xb9c, BIT(17) },
> > > +     [RST_BUS_LVDS]          =3D { 0xbac, BIT(16) },
> > >       [RST_BUS_TVE_TOP]       =3D { 0xbbc, BIT(16) },
> > >       [RST_BUS_TVE0]          =3D { 0xbbc, BIT(17) },
> > >       [RST_BUS_HDCP]          =3D { 0xc4c, BIT(16) }, =20
> >
> > =20
>=20

