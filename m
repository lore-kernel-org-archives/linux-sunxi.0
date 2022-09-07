Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF125CA6
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Sep 2022 15:09:08 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id dv25so1800135ejb.12
        for <linux-sunxi@lists.linux.dev>; Wed, 07 Sep 2022 08:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=q+70v53buIxQaWBchIFk8shCKU1WJV1DdLwWTP+ddeI=;
        b=PsSk7c5ChVk3DJTul0PslXYL3Ii3rxu7S+9k3ZdWO7J5+Rg3SJKW/GHR+l1IdCcqbD
         QzOSg+X20xKhDWwzVNp1EVZBeuM2og/eiCkM9VRatVBVuKtFUtC1IFd6TnphWbjqABrV
         lPI8ekc2MCGq7SaNBqXRHV/YntEXs/I2px8KM7Uiih87ZHZU+6OWWEzoS4qPY0Dysev9
         Kf1PW1ximX/Nir+q+GFzRH9fkY+Yz9NccxBJ97dIkXFYKX6Fbwdx2rSEm5fgP9TwN8TP
         Yn0/K6m8BPkKDGCZQYLjYFkzq7AqD2/EwCvermdk+S+d7m7gCF9XDJd4z+oxXRFK59CM
         CsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=q+70v53buIxQaWBchIFk8shCKU1WJV1DdLwWTP+ddeI=;
        b=KQ3vjnx6AaXqDQZ4gxJHAfXn5bBXRCK1385HBRv1FMYfKLHim/nfyypsg2cXTrszRX
         f+A5aufrJV6Mw2Sa1TXTsRb90/n6yrQD7mf0hLRfHxKDB2SYd6os4W0Ff0HafQDuzNiQ
         TQge7wgIc1gUpD4p8etu+1j+XA+PaosT1sNOBu622HDRlUjNhJsNzI0vRV4PJnGOtlnm
         dMMkzw6jZ921MCTXo+yhnb/A1w8s7EcKil7dTx2FkdGsTQxGQum90P908SDZ4eeBn/My
         Q22lqbTa9WSViTi60yFviaS/rUxio5LPtboMsRgpkxuDoTjdPd8O6ZVAPiR4bw6CZaU5
         dXVA==
X-Gm-Message-State: ACgBeo2PwIgYG5r1tpZckd9Xsn/gLxJvKbphQPrBpuYFWSyQmXfdWfti
	rbraRiNfUtO5zhCbmOz4Nfc=
X-Google-Smtp-Source: AA6agR7+yo4NVJ1b3xBSrgRyiVKs02kmJQtjtA3mve9GOkmdtQU6KrWKBuLTC8Uj3eslmjookwi2Eg==
X-Received: by 2002:a17:907:7d8e:b0:742:8ea0:686c with SMTP id oz14-20020a1709077d8e00b007428ea0686cmr2603244ejc.591.1662563347199;
        Wed, 07 Sep 2022 08:09:07 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id p23-20020a056402501700b0043ba7df7a42sm10858179eda.26.2022.09.07.08.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 08:09:06 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Lyude Paul <lyude@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Samuel Holland <samuel@sholland.org>, 
	Karol Herbst <kherbst@redhat.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
	Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>, 
	intel-gfx@lists.freedesktop.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
	Dom Cobley <dom@raspberrypi.com>, linux-kernel@vger.kernel.org, 
	nouveau@lists.freedesktop.org, linux-sunxi@lists.linux.dev, 
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Re: [PATCH v2 36/41] drm/sun4i: tv: Merge mode_set into atomic_enable
Date: Wed, 07 Sep 2022 17:09:04 +0200
Message-ID: <4210281.ejJDZkT8p0@kista>
In-Reply-To: <20220907074134.36yysxrnnpty4ngw@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech> <10138422.nUPlyArG6x@kista> <20220907074134.36yysxrnnpty4ngw@houat>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne sreda, 07. september 2022 ob 09:41:34 CEST je Maxime Ripard napisal(a):
> On Tue, Sep 06, 2022 at 10:04:32PM +0200, Jernej =C5=A0krabec wrote:
> > Dne ponedeljek, 29. avgust 2022 ob 15:11:50 CEST je Maxime Ripard=20
napisal(a):
> > > Our mode_set implementation can be merged into our atomic_enable
> > > implementation to simplify things, so let's do this.
> >=20
> > Are you sure this is a good thing in long term? What if user wants to
> > change mode? Unlikely, but why not.
>=20
> It doesn't change anything feature-wise: whenever the mode is changed on
> the CRTC, the encoder is going to be disabled and enabled.
>=20
> It's disabled here:
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_atomic=
_he
> lper.c#L1064
>=20
> And enabled here:
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_atomic=
_he
> lper.c#L1403
>=20
> With drm_atomic_crtc_needs_modeset() being defined here:
> https://elixir.bootlin.com/linux/latest/source/include/drm/drm_atomic.h#L=
104
> 9

Right.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


