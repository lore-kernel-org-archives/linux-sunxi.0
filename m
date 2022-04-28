Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03160EA6
	for <linux-sunxi@lists.linux.dev>; Thu, 28 Apr 2022 08:09:40 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id y21so4606008edo.2
        for <linux-sunxi@lists.linux.dev>; Thu, 28 Apr 2022 01:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6jNeearvH+hhGDjLkKRhMtvv9bKx6EoH/x/e7DTa8KY=;
        b=o56ujL31V7wnkN7VUd9hMJAvi4RE+WM7gseNBy/zWj3rLUkXCUQPYEz9oPUeqUUdKy
         VhMAAOL7HzhILMEpRyn3EoXNBVUpONutknkQVIk2ZvqE68qZQO/EGedE+xpx7oyJlcAh
         wnZBOqi8SjCB9pK1dnDZsspnaqhZnYIe10Fl7eMD8JQqLYGsmFDJRajprTllxjEjTl0v
         rpQ58PfZQXK/y8efND2yLShSuFuIbVFJRNE7Iyb0jwlkova0ywmF1vfSNju8MQiYT1TT
         byiLiHdCk1OkS0l1/V2fx+Jb/frp/dE8x3NJpTWDAzHztDB4HNABOkTYhTjcd0TArHU3
         aY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6jNeearvH+hhGDjLkKRhMtvv9bKx6EoH/x/e7DTa8KY=;
        b=TxJ4INlaDkDEyHpvMmi+bn858Pup1iSEEhMxgazk8UkGYGjBSfMJkBBDpqgDM/katz
         eQPNx5LwTs65Wjd5b94fskY382uUvHvNj4suNfWeYdFlCwpATDJJt08rp83nWe9nenMx
         F6yKRFA16qjaE/orHADxqtzK5YCjgfw0ukfGInRdM+m6o8qusnIZV7GrxSXXyQsEqh52
         XWR2B6JN/BMmsvXSeMSk5wWDpq/fWEGF3Rp4lyhVNCyrlbDNvKvW/Qqmu/4IXl9N1Apz
         FZs7cIXKpmM5Qw4yrBktijhbk02lAQePyewBYFs/Y97rt0j+tEaV5PKJTmnwD2dnOlBb
         XPZw==
X-Gm-Message-State: AOAM5320av4E62wQVr9DCo+gQEEwqLa41QpNvhiJwcn54WCEvlrDepV9
	pL2VnhQXcDo6sOGRT6PSioQ=
X-Google-Smtp-Source: ABdhPJztZ8+oV4qu6hJupS3cSC9OJkpEoajvHWbIk6ZrA7gAfI5DNOsmUdXa9+0qvACKdhuKUqf1SA==
X-Received: by 2002:a05:6402:298b:b0:41d:675f:8b44 with SMTP id eq11-20020a056402298b00b0041d675f8b44mr34705939edb.377.1651133379069;
        Thu, 28 Apr 2022 01:09:39 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id g2-20020a056402114200b0042617ba637fsm1130681edw.9.2022.04.28.01.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 01:09:38 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 43/45] media: sun6i-csi: Detect the availability of the ISP
Date: Thu, 28 Apr 2022 10:09:37 +0200
Message-ID: <5794263.alqRGMn8q6@jernej-laptop>
In-Reply-To: <YmpIjPe8pw+yvGyL@aptenodytes>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com> <2029179.KlZ2vcFHjT@jernej-laptop> <YmpIjPe8pw+yvGyL@aptenodytes>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 28. april 2022 ob 09:55:56 CEST je Paul Kocialkowski napi=
sal(a):
> Hi Jernej,
>=20
> Thanks a lot for all your reviews!
>=20
> On Wed 27 Apr 22, 22:07, Jernej =C5=A0krabec wrote:
> > Dne petek, 15. april 2022 ob 17:28:09 CEST je Paul Kocialkowski=20
napisal(a):
> > > Add a helper to detect whether the ISP is available and connected
> > > and store the indication in a driver-wide variable.
> > >=20
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > ---
> > >=20
> > >  .../platform/sunxi/sun6i-csi/sun6i_csi.c      | 33 +++++++++++++++++=
++
> > >  .../platform/sunxi/sun6i-csi/sun6i_csi.h      |  3 ++
> > >  2 files changed, 36 insertions(+)
> > >=20
> > > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > > b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c index
> > > a88deb8ba1e7..f185cbd113c7 100644
> > > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > > @@ -25,6 +25,35 @@
> > >=20
> > >  #include "sun6i_csi_capture.h"
> > >  #include "sun6i_csi_reg.h"
> > >=20
> > > +/* ISP */
> > > +
> > > +static bool sun6i_csi_isp_detect(struct sun6i_csi_device *csi_dev)
> > > +{
> > > +	struct device *dev =3D csi_dev->dev;
> > > +	struct fwnode_handle *handle =3D NULL;
> > > +
> > > +	/* ISP is not available if disabled in kernel config. */
> > > +	if (!IS_ENABLED(CONFIG_VIDEO_SUN6I_ISP))
> >=20
> > Where is this symbol defined?
>=20
> That is defined through Kconfig's auto-generated header, from the associa=
ted
> option for the ISP driver. It is defined in the ISP support series so this
> will effectively always be false for now.

Well, then, that driver should be merged before this patch. While I underst=
and=20
that it's likely that ISP driver with such name will eventually materialize=
 in=20
kernel, I don't want to rely on things that are not set in stone, e.g. alre=
ady=20
merged.

Best regards,
Jernej

>=20
> > Best regards,
> > Jernej
> >=20
> > > +		return 0;
> > > +
> > > +	/*
> > > +	 * ISP is not available if not connected via fwnode graph.
> > > +	 * This weill also check that the remote parent node is available.
> > > +	 */
> > > +	handle =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
> > > +
> >=20
> > SUN6I_CSI_PORT_ISP, 0,
> >=20
> > > +
> >=20
> > FWNODE_GRAPH_ENDPOINT_NEXT);
> >=20
> > > +	if (!handle)
> > > +		return 0;
> > > +
> > > +	fwnode_handle_put(handle);
> > > +
> > > +	dev_info(dev, "ISP link is available\n");
> > > +	csi_dev->isp_available =3D true;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >=20
> > >  /* Media */
> > > =20
> > >  static const struct media_device_ops sun6i_csi_media_ops =3D {
> > >=20
> > > @@ -306,6 +335,10 @@ static int sun6i_csi_probe(struct platform_device
> > > *platform_dev) if (ret)
> > >=20
> > >  		return ret;
> > >=20
> > > +	ret =3D sun6i_csi_isp_detect(csi_dev);
> > > +	if (ret)
> > > +		goto error_resources;
> > > +
> > >=20
> > >  	ret =3D sun6i_csi_v4l2_setup(csi_dev);
> > >  	if (ret)
> > >  =09
> > >  		goto error_resources;
> > >=20
> > > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> > > b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h index
> > > 6aa83dd11684..9b105c341047 100644
> > > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> > > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> > > @@ -22,6 +22,7 @@
> > >=20
> > >  enum sun6i_csi_port {
> > > =20
> > >  	SUN6I_CSI_PORT_PARALLEL		=3D 0,
> > >  	SUN6I_CSI_PORT_MIPI_CSI2	=3D 1,
> > >=20
> > > +	SUN6I_CSI_PORT_ISP		=3D 2,
> > >=20
> > >  };
> > > =20
> > >  struct sun6i_csi_buffer {
> > >=20
> > > @@ -46,6 +47,8 @@ struct sun6i_csi_device {
> > >=20
> > >  	struct clk			*clock_mod;
> > >  	struct clk			*clock_ram;
> > >  	struct reset_control		*reset;
> > >=20
> > > +
> > > +	bool				isp_available;
> > >=20
> > >  };
> > > =20
> > >  struct sun6i_csi_variant {




