Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDE6AFFC
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 15:30:35 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-54606036bb3so134186187b3.6
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 08:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1680103834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFZ20rC2XtnWx2HPxJbX0F+YnJR7fgxQcGGmQBwVb7Q=;
        b=JvMTJc1Gv8vCqVajFRwN5it4gJaKbPCwOgEwFVRfrdnXBaViUYZsElkwGN4srbsCWm
         gsZfz98f+UB7t9jFdKcTwUfnCNnxIJtdiXlh7MW7KtqKekPhBX9lUbZ7q3Wl0j7mTzEE
         OcLqTJEyEkBSuD+GbeP4ew9U247+o/1zLS7yE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680103834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFZ20rC2XtnWx2HPxJbX0F+YnJR7fgxQcGGmQBwVb7Q=;
        b=hEsutw/mVUVtEYrCwtzg1eUZviVZ2kbgc+xo6fXOESz3l5eBihO+SgVM9zqBAOftuu
         hcr1jUdKzO/Ot5NAAkJuhuZOto3fMdKnXhc6cJrQTKRFPZElEbzTNCPY+RzRhkidI7bu
         qhwwIwnlA2O6R0oiMVQSLncR7JWGcERRcf/0VWO+cSmiCUWI+t/CdMMhHIv97yz0C0SW
         idHGGCODdprPhNP2eEVlJE/aH+ZlegftK9DYoPdHJ5HtYhW37qCa/Dgp0o++d8K1I17e
         6/wL+vT4VbApz6YtGF6ahCjf0GEjkDwmdUc1sRZP4woeD/y2JRtBzLY7xnRl9HU+pTRt
         Mt4w==
X-Gm-Message-State: AAQBX9eaqFuB2d39GYjzhAzD3Zl7GdyOihNVAvmsU0RONdkiFng5bSzX
	IPZNY0k+1ltE+Sgt6OSk9E7xt86uam3WpsMeoLvMzg==
X-Google-Smtp-Source: AKy350aQ+SY5iF10evSeqAQo9VWn7eGBRSp/ouP2R83fRpmRIP36Pn+KT/+JT62aHAr/p3uHoViPy/s3Xmq1TTNqhWs=
X-Received: by 2002:a81:ae23:0:b0:541:7237:6e6b with SMTP id
 m35-20020a81ae23000000b0054172376e6bmr9262438ywh.0.1680103833995; Wed, 29 Mar
 2023 08:30:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230329131615.1328366-1-jagan@amarulasolutions.com>
 <20230329131615.1328366-10-jagan@amarulasolutions.com> <20230329150202.3rbjrq6iqum5ybjh@penduick>
In-Reply-To: <20230329150202.3rbjrq6iqum5ybjh@penduick>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 29 Mar 2023 21:00:22 +0530
Message-ID: <CAMty3ZDXWw2ajF5DsYCMy0XCa348y8XKKUzAfrU=2iUG23yVow@mail.gmail.com>
Subject: Re: [PATCH v7 09/12] arm64: dts: rockchip: a64: Add endpoint@0 to dsi_in_tcon0
To: Maxime Ripard <maxime@cerno.tech>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>, 
	linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 8:32=E2=80=AFPM Maxime Ripard <maxime@cerno.tech> w=
rote:
>
> The commit title is wrong, it's not a rockchip device.

Thanks for the note, I will fix it in the next version.

>
> On Wed, Mar 29, 2023 at 06:46:15PM +0530, Jagan Teki wrote:
> > The DSI downstream devices are likely to be Panel, Bridge and
> > I2C-Configured Bridge.
> >
> > It is possible to connect all three devices using upstream OF-graph por=
t
> > or ports node however only Panel and Bridge are possible to connect via
> > child node but not possible to connect I2C-Configured Bridge via child
> > node since I2C-Configure bridges are child of I2C not upstream DSI host=
s
> > and it must represent them via port or ports with endpoint linking.
> >
> > Allwinner A64 DSI node already has a port so add endpoint 0 for input
> > tcon so that the downstream DSI devices can use endpoint 1 to connect
> > Panel or Bridge or I2C-Configured Bridge.
> >
> > An example of the I2C-Configured downstream bridge representation is,
> >
> > i2c1 {
> >        bridge@1b {
> >            compatible =3D "ti,dlpc3433";
> >
> >              ports {
> >                   port@0 {
> >                          reg =3D <0>;
> >
> >                          bridge_in_dsi: endpoint {
> >                                 remote-endpoint =3D <&dsi_out_bridge>;
> >                                 data-lanes =3D <1 2 3 4>;
> >                          };
> >                   };
> >
> >                 port@2 {
> >                        reg =3D <2>;
> >
> >                          bridge_out_dmd: endpoint {
> >                                 remote-endpoint =3D <&dmd_out_bridge>;
> >                          };
> >                   };
> >              };
> >        };
> > };
> >
> > dsi {
> >        compatible =3D "allwinner,sun50i-a64-mipi-dsi";
> >
> >        port {
> >              dsi_in_tcon0: endpoint@0 {
> >                 reg =3D <0>;
> >                 remote-endpoint =3D <tcon0_out_dsi>;
> >            };
> >
> >            dsi_out_bridge: endpoint@1 {
> >                 reg =3D <1>;
> >                 remote-endpoint =3D <&bridge_in_dsi>;
> >            };
> >       };
> > };
> >
> > Note that existing device bindings are untouched and still represent
> > the downstream devices via child nodes since the sun6i-mipi-dsi host
> > will migrate to a standardized single helper to lookup for a
> > downstream device via child or OF-graph port or port node.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v7:
> > - new patch
> >
> >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64=
/boot/dts/allwinner/sun50i-a64.dtsi
> > index 77b5349f6087..3ed566dc2172 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > @@ -1189,7 +1189,11 @@ dsi: dsi@1ca0000 {
> >                       #size-cells =3D <0>;
> >
> >                       port {
> > -                             dsi_in_tcon0: endpoint {
> > +                             #address-cells =3D <1>;
> > +                             #size-cells =3D <0>;
> > +
> > +                             dsi_in_tcon0: endpoint@0 {
> > +                                     reg =3D <0>;
> >                                       remote-endpoint =3D <&tcon0_out_d=
si>;
> >                               };
>
> That doesn't match the DT binding anymore, and why can't we add endpoint@=
1 there too?

Do you mean add endpoint@1 without any remote-endpoint like this?

dsi_out_bridge: endpoint@1 {
         reg =3D <1>;
};

I was supposed to add this, since dtbs_check doesn't give any error. I
have skipped this, as I thought it wouldn't be needed.

Thanks,
agan.
