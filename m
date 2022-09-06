Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474B87E
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Sep 2022 07:58:59 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id og21so21356227ejc.2
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Sep 2022 00:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=G5xMT6aDNv4kW7DoRuL08vNOs1PAIlSGM76dCe+/XnA=;
        b=IqR3y18Cx1qIwYw4UCiCTVh/G1F5irxJGmeXs1tScFvtbsL6xEpJxG2G/X6Gl4lhIj
         +2KrmUt+oRnZv2in1enq/dW/oGz8TuVY6qP7kLHjRjLDgIUAJy0ndbbIiaJi6ZNadtxI
         y5EvFZkZuwL0e0v6pQC5u87gcLh52hNoFtGTG4s+x9NTpfmdykE+j8OluBNOTg5w6EEb
         CAj9vrObxn37Woc0hrBx34RCimwLSIK7kEqX+b1ptJmgvYmBXXMYLYD3rfzCmNogiGEn
         rbepDzapjt3YfkGRcTXwVovnVtdeUw/Avi2dszJ13t45IfJeQ+Am19GtI6oJjAoPrywZ
         o8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=G5xMT6aDNv4kW7DoRuL08vNOs1PAIlSGM76dCe+/XnA=;
        b=aRr/NDx5YdVbFQbrBlzCuE1IdfSMTVqQDm3mgGqjawRI5VQDD+n9D8xfkQ7StDV2xE
         XtGUfKuzpkzufc8d6R7x841rpTu59mhZGDyo58B4jst0c0Gwb4mYRmHTO9gNW4midVkZ
         nR0G+MRYL6wz53tvc7BKKhRhegjbgozAz6Pp3C6z9xJcu0xACl4q0/L5Ce231lMqMLgu
         TpWe+sFamnmy0Gl1qyp4Agkip9F8qCzkNP3+Mm4cff1xJIIf9Z52swFuTG2PbjMPh4t/
         coXQJJ10X27MxZvIM7/Yt0L60NEj2Fx3lxfQNoxUWZvFSs3oEQPiTHFzYpwgHpXKayUM
         GEiA==
X-Gm-Message-State: ACgBeo3O0hGQ9Dbwvmrn1LPCCJR95SBS+T9z6wly+k++rEOIcVMEb2Z9
	CfbbH4Fzip3sgU+v7twmZdcPECmMSZumzHRAtLQ=
X-Google-Smtp-Source: AA6agR5YnY0EzdQxo8Pq6IyzStk5Of82NqC2kb+QzscEVqwyjmybojqR67VAd+bpi6dSl5otBltC+plapAULeuYVO+o=
X-Received: by 2002:a17:907:7dac:b0:739:8df9:3c16 with SMTP id
 oz44-20020a1709077dac00b007398df93c16mr37890355ejc.9.1662451137307; Tue, 06
 Sep 2022 00:58:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220905171601.79284-1-peron.clem@gmail.com> <20220905171601.79284-5-peron.clem@gmail.com>
 <OS0PR01MB5922142861E78A1DD81AD1C9867F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAJiuCceGZJr24hVjpP0ptOkG8bMFKr=QLj0LcyDX4fUy7Rr2xA@mail.gmail.com> <OS0PR01MB5922EE3F6CDD827919A7763E867E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922EE3F6CDD827919A7763E867E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 6 Sep 2022 09:58:45 +0200
Message-ID: <CAJiuCcd7upgT6vQWHos-X1-89+Z-5xxDe2SMCdC2=_LgZaVMiw@mail.gmail.com>
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

Hi Biju,

On Tue, 6 Sept 2022 at 08:42, Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Hi Clement,
>
> >
> > Hi,
> >
> > On Mon, 5 Sept 2022 at 20:17, Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > >
> > > Hi,
> > >
> > > Thanks for the patch.
> > >
> > > > Subject: [PATCH v3 4/5] drm/panfrost: devfreq: set opp to the
> > > > recommended one to configure and enable regulator
> > > >
> > > > devm_pm_opp_set_regulators() doesn't enable regulator, which make
> > > > regulator framework switching it off during regulator_late_cleanup(=
).
> > >
> > > In that case, why not regulator_get()for Dynamic regulator(non fixed
> > > regulator)??
> >
> > Sorry I don't understand, what do you mean?
>
> Normally we need to turn on regulator and clock only when needed.
> I am not sure with your new code, will make it always on and
> drains the power unnecessarily and does it set lower opp or higher
> opp at the start??

The code doesn't make it always on, it makes it how it should be at
the recommended OPP which is the "start point".

If the recommended OPP says to switch off the regulator then it will.

>
> Compared to the fixed regulator, you have voltage regulator to
> control that is the difference between my environment and
> Your environment.
>
> I am not sure any other SoC is using voltage regulator??
> If yes, thenthere should be some bug or some difference in HW
> which is giving different behaviour??
>
> If you are the first one using voltage regulator with mali gpu,
> Then Your implementation may be correct, as you have proper
> HW to check.

The issue is that my regulator is not marked as "always-on", if no OPP
is called before regulator_late_cleanup() then nobody sets the
regulator_enable() and the regulator is switched off, which makes my
board hang.

Like Viresh recommends I will send an update with more details in the
commit log.

Regards,
Clement


>
> >
> > >
> > > >
> > > > Call dev_pm_opp_set_opp() with the recommend OPP in
> > > > panfrost_devfreq_init() to enable the regulator and avoid any switc=
h
> > > > off by regulator_late_cleanup().
> > > >
> > > > Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>
> > > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > > > b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > > > index 5110cd9b2425..67b242407156 100644
> > > > --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > > > +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > > > @@ -131,6 +131,14 @@ int panfrost_devfreq_init(struct
> > > > panfrost_device
> > > > *pfdev)
> > > >               return PTR_ERR(opp);
> > > >
> > > >       panfrost_devfreq_profile.initial_freq =3D cur_freq;
> > > > +
> > > > +     /* Setup and enable regulator */
> > > > +     ret =3D dev_pm_opp_set_opp(dev, opp);
> > > > +     if (ret) {
> > > > +             DRM_DEV_ERROR(dev, "Couldn't set recommended OPP\n");
> > > > +             return ret;
> > > > +     }
> > >
> > >
> > > FYI,
> > > On RZ/G2L mali gpu, we have fixed regulator and I was able to do GPU
> > > OPP transition without any issues previously.
> >
> > rzg2l-smarc-som.dtsi uses regulator reg_1p1v; which is marked as
> > regulator-always-on; that's why
> > regulator_late_cleanup() doesn't switch it off.
>
> Yes that is correct. It is fixed regulator and always on.
> We control only frequency.
>
> Cheers,
> Biju
>
> >
> > >
> > > root@smarc-rzg2l:~# cat /sys/class/devfreq/11840000.gpu/trans_stat
> > >      From  :   To
> > >            :  50000000  62500000 100000000 125000000 200000000
> > 250000000 400000000 500000000   time(ms)
> > > *  50000000:         0         0         0         0         0
> > 0         0         1       144
> > >    62500000:         0         0         0         0         0
> > 0         0         0         0
> > >   100000000:         0         0         0         0         0
> > 0         0         9       524
> > >   125000000:         0         0         9         0         0
> > 0         0         3      2544
> > >   200000000:         0         0         0        11         0
> > 0         0        46      3304
> > >   250000000:         1         0         0         0        33
> > 0         0         0      7496
> > >   400000000:         0         0         0         0        16
> > 19         0         0      2024
> > >   500000000:         1         0         0         1         8
> > 15        35         0      4032
> > > Total transition : 208
> > >
> > > Cheers,
> > > Biju
> > >
