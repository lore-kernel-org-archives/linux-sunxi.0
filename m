Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D503239
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Sep 2022 19:39:42 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id b16so12493785edd.4
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Sep 2022 12:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=7sK3Pxg5lI33PaTu+416/SIw+tV3vaPUu4gPNzWPobI=;
        b=NH4qlg6QZbeqoZj2Tm2AcMxa8dQt6DIOCmBbcpO/afGOmdkHJcxG6jxB6WcHA2zgZr
         idzdlVtYYBmnO5OjykgPHGjqJguRfUJ8AJ6wuCKJwhP2kPNBb1vbriSXXdqvRGzgOK+x
         7QRwxQ2ZxFvWz+99M7MaMNy07R4c5Fk1fLBQ8J5h2tTPuIU5HkUIND5fT2SzEfFizdj0
         j1qedhwfOykL7oofHK38q0xsLgxlDMDSkanFA5SzEGZZX56RhDeE3JT8Cv1cMeoPxYbE
         wwtggQukF1Vi9dumdIfhYW5DEjfh+LWhGrMoQIBATY0KhSzp73lDSRCb714AKRbHeeMJ
         09+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7sK3Pxg5lI33PaTu+416/SIw+tV3vaPUu4gPNzWPobI=;
        b=fCLWl9jdjYHkawmunFWY9Utur5MTFQ4d/ZxxaP5MKdWlm5SIfa6ul9c+kOsNbYbr4j
         gOmVVUluJt6wZvQBdL+JHowjlwyrS/PKkKQXZcJhgj+9uf+bOv2GVqgVCC86jRXGiqlw
         iwO/nmBkE+ZKc4xRB7NHRFsvY79JwGc4NakVL6ZAzFEL0y0FcMR/VWMiD3XnRQscVrum
         6bFgA9Svv0dwpPfssOgb3LMVtUY8EGN6se1cKuD4FnZmKUoQhmP/+UqTN8rjmXkDw+NO
         /pDVoZwtUY6LNgTxSihE/Gp4gJhl4ueaFHinpriL9yVUDT2pnYGAylelmvyJTblwAads
         JVuQ==
X-Gm-Message-State: ACgBeo0OdVAPcn/LNGT+K4ngOMB9dIP2UszT+qzDNYEwSP+mMxF93p9T
	h+QgkfiVaKD5jfhoID+IVnWPJ8ZxJ3oK9as8RxE=
X-Google-Smtp-Source: AA6agR6gCIxLGxghgPAj+EP0DXZOoyA9fExHCpxZBIF9zuDXx572eXiJijGmbmWkD3eqAnsSwuyri4I9kFJQughdEyU=
X-Received: by 2002:aa7:c610:0:b0:44e:9a0f:753a with SMTP id
 h16-20020aa7c610000000b0044e9a0f753amr3781906edq.140.1662406781082; Mon, 05
 Sep 2022 12:39:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220905171601.79284-1-peron.clem@gmail.com> <20220905171601.79284-5-peron.clem@gmail.com>
 <OS0PR01MB5922142861E78A1DD81AD1C9867F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922142861E78A1DD81AD1C9867F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 5 Sep 2022 21:39:29 +0200
Message-ID: <CAJiuCceGZJr24hVjpP0ptOkG8bMFKr=QLj0LcyDX4fUy7Rr2xA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] drm/panfrost: devfreq: set opp to the recommended
 one to configure and enable regulator
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>, 
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>, 
	Marcel Ziswiler <marcel.ziswiler@toradex.com>, Vinod Koul <vkoul@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Herring <robh@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 5 Sept 2022 at 20:17, Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Hi,
>
> Thanks for the patch.
>
> > Subject: [PATCH v3 4/5] drm/panfrost: devfreq: set opp to the recommend=
ed
> > one to configure and enable regulator
> >
> > devm_pm_opp_set_regulators() doesn't enable regulator, which make
> > regulator framework switching it off during regulator_late_cleanup().
>
> In that case, why not regulator_get()for
> Dynamic regulator(non fixed regulator)??

Sorry I don't understand, what do you mean?

>
> >
> > Call dev_pm_opp_set_opp() with the recommend OPP in
> > panfrost_devfreq_init() to enable the regulator and avoid any switch of=
f
> > by regulator_late_cleanup().
> >
> > Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > index 5110cd9b2425..67b242407156 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > @@ -131,6 +131,14 @@ int panfrost_devfreq_init(struct panfrost_device
> > *pfdev)
> >               return PTR_ERR(opp);
> >
> >       panfrost_devfreq_profile.initial_freq =3D cur_freq;
> > +
> > +     /* Setup and enable regulator */
> > +     ret =3D dev_pm_opp_set_opp(dev, opp);
> > +     if (ret) {
> > +             DRM_DEV_ERROR(dev, "Couldn't set recommended OPP\n");
> > +             return ret;
> > +     }
>
>
> FYI,
> On RZ/G2L mali gpu, we have fixed regulator and
> I was able to do GPU OPP transition without any issues previously.

rzg2l-smarc-som.dtsi uses regulator reg_1p1v;
which is marked as regulator-always-on; that's why
regulator_late_cleanup() doesn't switch it off.

Regards,
Clement

>
> root@smarc-rzg2l:~# cat /sys/class/devfreq/11840000.gpu/trans_stat
>      From  :   To
>            :  50000000  62500000 100000000 125000000 200000000 250000000 =
400000000 500000000   time(ms)
> *  50000000:         0         0         0         0         0         0 =
        0         1       144
>    62500000:         0         0         0         0         0         0 =
        0         0         0
>   100000000:         0         0         0         0         0         0 =
        0         9       524
>   125000000:         0         0         9         0         0         0 =
        0         3      2544
>   200000000:         0         0         0        11         0         0 =
        0        46      3304
>   250000000:         1         0         0         0        33         0 =
        0         0      7496
>   400000000:         0         0         0         0        16        19 =
        0         0      2024
>   500000000:         1         0         0         1         8        15 =
       35         0      4032
> Total transition : 208
>
> Cheers,
> Biju
>
