Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A7CC2F0
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Mar 2023 10:01:56 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id g17so15724764vst.10
        for <linux-sunxi@lists.linux.dev>; Thu, 30 Mar 2023 03:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1680170515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFVAdu6ppZ2JJ0TB7WygDJ/QOjrOvH1MnFVC2V2mdcA=;
        b=SLK2Fsr5J+chOEjLHu6pgOT5N4tBFXWbEdTWXkZBvjkQhZrVVs5KwGymk/wbts3orC
         5qVCnJQBF48SXipRZnnQr6nprWp3qWUQfZx3abwBym0T+qoTcMiU3vM93gjyvZPhNp++
         13RSdLmLOmb62ycr2x75NX/szItoJTUtncZFkX9MnW5AoIsSw/RpoUVHrGczcoIvuROt
         31FKaLnFj4qCKAN0a0VnBOZk3J6+xjlyfxwnlG5vI4AXuy4eQuDB5nZLEBiD4AEdyCTP
         l+A/WGKM3e4CB+niRKFu/zQTPUGh8MFnjwCj+SgglODI9BOTifypbPXg44QUow+TtSyy
         1npA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680170515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zFVAdu6ppZ2JJ0TB7WygDJ/QOjrOvH1MnFVC2V2mdcA=;
        b=YBVD1BHjXlscBQWOy0lc9rtZn6l5Itbuaujm7HDtDXNBMIphXSSKtt2Y/bTqCTfG/s
         qoPgswru8+FN3dM5tyfTXuqcHQFHFAY8O9yNeZIq4ijmJGCt70Ae6LRw6E9QQH0OXZQ8
         02LSXdfsmqha65fqKtao/F0rXvz2KOIVqfFDfTEaEt8J/Rt3O+6bI52kLCMOXpMfbD+z
         EfnNfC1vRtmekUWuTCILY9An/B54ULUp2mOwvqWhf9qoCuL5AQRxH+pXiCfLoP9/2IWY
         hPBvfXQgjMuGzyAm9acxENuTbOXdqw3ejYBs7SkMDOD5hOGdf1W9iHjyJpVbAhkE6nDr
         7d8w==
X-Gm-Message-State: AAQBX9c2eunBBApnRuBZbhlq9VDxu8fvN6RJQpjbj2455ALLPhBF5YVB
	ATam+YP9uQtGznpXoMKaspJITP/jn6eSTqKIz5DX9w==
X-Google-Smtp-Source: AKy350aZQmuN6Txd8qgiZLf4NMU2jGzKPkOBh2iY9wyo2i8nkHVk5yOPF47moMqKzLQxdN2ql3qLD6zv7wi79iemBp4=
X-Received: by 2002:a67:e053:0:b0:425:d52d:f5cb with SMTP id
 n19-20020a67e053000000b00425d52df5cbmr12001780vsl.1.1680170515307; Thu, 30
 Mar 2023 03:01:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230329131929.1328612-1-jagan@amarulasolutions.com>
 <CAPY8ntCJP53uiGNQHUZqma08Vsxfwm7KvAkgMzK=hn4AxJLS3A@mail.gmail.com>
 <20230329164638.v43la4l7rxut6hk6@penduick> <CAMty3ZCsn6OR1-TvqFXP48iamG-k5sPU1_CH2fNLBQP3Ofb0QA@mail.gmail.com>
In-Reply-To: <CAMty3ZCsn6OR1-TvqFXP48iamG-k5sPU1_CH2fNLBQP3Ofb0QA@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 30 Mar 2023 11:01:39 +0100
Message-ID: <CAPY8ntCpmKPzPVjRWS7Pf1Fat9V_JqGD4BaMo8P8_o+74DeDiQ@mail.gmail.com>
Subject: Re: [PATCH v7 10/12] drm/bridge: Implement enable_next_first to alter
 bridge init order
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime@cerno.tech>, 
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

Hi Jagan

On Thu, 30 Mar 2023 at 07:56, Jagan Teki <jagan@amarulasolutions.com> wrote=
:
>
> On Wed, Mar 29, 2023 at 10:16=E2=80=AFPM Maxime Ripard <maxime@cerno.tech=
> wrote:
> >
> > On Wed, Mar 29, 2023 at 05:28:28PM +0100, Dave Stevenson wrote:
> > > On Wed, 29 Mar 2023 at 14:19, Jagan Teki <jagan@amarulasolutions.com>=
 wrote:
> > > >
> > > > DSI sink devices typically send the MIPI-DCS commands to the DSI ho=
st
> > > > via general MIPI_DSI_DCS read and write API.
> > > >
> > > > The classical DSI sequence mentioned that the DSI host receives MIP=
I-DCS
> > > > commands from the DSI sink first in order to switch HS mode properl=
y.
> > > > Once the DSI host switches to HS mode any MIPI-DCS commands from th=
e
> > > > DSI sink are unfunctional.
> > >
> > > That statement contradicts the spec.
> > > The DSI spec section 8.11.1 Transmission Packet Sequences says that
> > > during any BLLP (Blanking or Low Power) period the host can do any of=
:
> > > - remain in LP-11
> > > - transmit one or more non-video packets from host to peripheral in e=
scape mode
> > > - transmit one or more non-video packets from host to peripheral in
> > > using HS mode
> > > - receive one or more packets from peripheral to host using escape mo=
de
> > > - transmit data on a different virtual channel.
> > >
> > > Indeed if the sink doesn't set MIPI_DSI_MODE_LPM /
> > > MIPI_DSI_MSG_USE_LPM, then the expectation is that any data transfer
> > > will be in HS mode.
> > >
> > > That makes me confused as to the need for this patch.
> >
> > Yeah, and it looks like that would break the expectation that, in
> > enable, a bridge can expect its controller to be in HS mode.
> >
> > I think that was Jagan is trying to do is to work around an issue with
> > the Allwinner DSI driver:
> > https://elixir.bootlin.com/linux/v6.3-rc4/source/drivers/gpu/drm/sun4i/=
sun6i_mipi_dsi.c#L775
>
> Correct and I can see it seems to be a classic DSI sequence observed
> in dw-mipi-dsi as well - based on Neil's comments.
> https://lore.kernel.org/all/9aa3d19d-4378-aaf3-6857-c40be5d252c7@baylibre=
.com/

Neil's comments are from 2021, and his response would appear to be
with regard the PHY power up sequence issues that
pre_enable_prev_first should solve. The DSI host pre_enable can now be
called before the sink's pre_enable, therefore allowing the PHY to be
configured in pre_enable. Hacking the PHY init into mode_set is
therefore not required.

I don't see any restriction in dw-mipi-dsi over when transfer can be
called (as long as it is between pre_enable and post_disable), and it
supports MIPI_DSI_MSG_USE_LPM for requesting the command be sent in
either LP or HS mode.

> In fact, I did follow and initialize the command-mode mode_set which
> set low-speed DCS and switch back to video-mode @enable and switch to
> HS but could see the same issue as the host cannot accept DCS as
> before (I might implement improper sequence, but not sure due to lack
> of documentation). But this sequence has issues with calling
> post_disable twice even on dw-mipi-dsi.

Calling up/down the bridge chain from within other bridge elements is
going to have issues and shouldn't be necessary.

The comment in dw-mipi-dsi post_disable[1]
* TODO Only way found to call panel-bridge post_disable &
* panel unprepare before the dsi "final" disable...
* This needs to be fixed in the drm_bridge framework and the API
* needs to be updated to manage our own call chains...

It has now been fixed up with pre_enable_prev_first.

I seem to recall seeing a patchset for one of the DSI hosts (other
than vc4) that was moving the init from mode_set to pre_enable - I
think it is probably [2] for msm.

Cheers
  Dave

[1] https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/bridge/sy=
nopsys/dw-mipi-dsi.c#L862-L867
[2] https://github.com/torvalds/linux/commit/ec7981e6c614254937b37ce0af9eac=
09901c05c5

> May be Neill, can comment here?
>
> Thanks,
> Jagan.
