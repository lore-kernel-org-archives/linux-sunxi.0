Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0287F
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Nov 2022 07:27:09 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id z18so13139018edb.9
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Nov 2022 00:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IROVbIAZSiNgsjOrkFZVszYAH6NeUz0SB/Lxz/gnWYk=;
        b=AlHJvusiZCNmYhpWBye25rroKa+XRWqHeqH1CS5Vafri4JuPPwymRYS/qOrEbE1nH3
         Os6XDGAENokhLj4k1Jp9Vtvc688DcnqNhTeKCAaBuxHTm9nlCmaQrcR2voJ0CNWIGLpF
         5owNbqhMuZuupjMHjuAPIrNHjusl2cbB+M08FcI9obSMEteWE39VHQ06FlOF9eOThLGG
         r+uuPbqtDFdUQ7cz5ExxWfK632Z0SdOKB7WDxr1B0CWI9OTCz4qcPBZnEKvTXxAq0ikl
         tmPQtU1/0GoYirodC3NCBZ8rdqDDDbaeA0AHED0i++KfNYzv1+QqjP8y1NNnKx3Ejetf
         BGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IROVbIAZSiNgsjOrkFZVszYAH6NeUz0SB/Lxz/gnWYk=;
        b=hzmQvCVqUGSnAiKVavQ+SYL23Va0S/3Z/RO6X8kXvCXX8R9TJjdPNLxoMl4pb4Z6Hy
         z1sAvC0QQF3N9HoQQT1g8zTLTr0+afaIP1DsKMkKf7koOsM6Zle7t6V73JYNB5JLvg3x
         yiqW5P5rTDWWum2kPWXjAZm9VDpodoy8ooQDkFggMVDSI9eFVKeNd2zc2O7zDsNtycyd
         bqir97sBkqROczzn3fmriQMOBtP9eDE27MaKQ6nh1eCECsBqCFIdV/zPD0aB1Dc1Uhit
         6RnRYX0Ju8TjFIMhUvLvCdCM6miQRePSSq8UF2cBBjA1Eoox2gv8ot4esSzxsFx1DLpY
         78gg==
X-Gm-Message-State: ACrzQf2ENhc9lZkDt2RtHlDYcB+/qfnTzlW3Gd/YwI9NWVwTcE56Dw4p
	q5m5TG5QFCkg21c3z+aXx6M=
X-Google-Smtp-Source: AMsMyM5am214MT/mQpW/M/XHjbQrIGbgAkQxBRCA59Ln8kyo7ajGE3nNgn579cPwlP1/zhvsn76WgA==
X-Received: by 2002:a05:6402:550c:b0:443:7d15:d57f with SMTP id fi12-20020a056402550c00b004437d15d57fmr44166139edb.147.1667719627818;
        Sun, 06 Nov 2022 00:27:07 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id q9-20020a170906360900b00795bb7d64d8sm1803744ejb.217.2022.11.06.00.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 00:27:07 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: mripard@kernel.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Merlijn Wajer <merlijn@wizzup.org>, wens@csie.org
Subject: Re: [BISECTED] Allwinner A33 tablet does not fully power off
Date: Sun, 06 Nov 2022 08:27:06 +0100
Message-ID: <1909131.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <f02930c0-e471-b3ee-8a3c-6bb745c3ad06@gmail.com>
References: <9f8a0fc3-1d9a-b271-3c26-4f7373b8a3e9@gmail.com> <c1e8a25e-3fd0-ba28-67a5-6775c6ce2d6d@sholland.org> <f02930c0-e471-b3ee-8a3c-6bb745c3ad06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne nedelja, 06. november 2022 ob 08:15:40 CET je Ivaylo Dimitrov napisal(a=
):
> On 5.11.22 =D0=B3. 21:18 =D1=87., Samuel Holland wrote:
> > On 11/5/22 03:23, Ivaylo Dimitrov wrote:
> >> Hi Samuel,
> >>=20
> >> On 5.11.22 =D0=B3. 4:21 =D1=87., Samuel Holland wrote:
> >>> Hi Ivo,
> >>>=20
> >>> On 10/29/22 10:23, Ivaylo Dimitrov wrote:
> >>>> After commit 843107498f91e57d1d4b22cd8787112726fdaeb4 (bus: sunxi-rs=
b:
> >>>> Implement suspend/resume/shutdown callbacks) Q8 A33 tablet I have he=
re
> >>>> cannot be powered-on after power-off, it needs press-and-hold of the
> >>>> power button for 10 seconds (I guess some HW assisted power down
> >>>> happens) before it can be powered-on again.
> >>>>=20
> >>>> The following patch makes it behave correctly:
> >>>>=20
> >>>> diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
> >>>> index 60b082fe2ed0..30016d62044c 100644
> >>>> --- a/drivers/bus/sunxi-rsb.c
> >>>> +++ b/drivers/bus/sunxi-rsb.c
> >>>> @@ -818,10 +818,7 @@ static int sunxi_rsb_remove(struct platform_dev=
ice
> >>>> *pdev)
> >>>>=20
> >>>>    static void sunxi_rsb_shutdown(struct platform_device *pdev)
> >>>>    {
> >>>>=20
> >>>> -       struct sunxi_rsb *rsb =3D platform_get_drvdata(pdev);
> >>>> -
> >>>>=20
> >>>>           pm_runtime_disable(&pdev->dev);
> >>>>=20
> >>>> -       sunxi_rsb_hw_exit(rsb);
> >>>>=20
> >>>>    }
> >>>> =20
> >>>>    static const struct dev_pm_ops sunxi_rsb_dev_pm_ops =3D {
> >>>>=20
> >>>> I guess the issue comes from the fact that by the time 'power off'
> >>>> command to the power management IC has to be send, the bus it lives =
on
> >>>> is already down, so the device is left in semi-powered down state. O=
fc
> >>>> this is a wild guess, however, preventing the bus being turned off on
> >>>> shutdown fixes the issue.
> >>>=20
> >>> Your guess is correct. The controller gets shut down in
> >>>=20
> >>>     kernel_power_off()
> >>>       kernel_shutdown_prepare()
> >>>         device_shutdown()
> >>>=20
> >>> but the PMIC communication needs to happen later in
> >>>=20
> >>>     kernel_power_off()
> >>>       machine_power_off()
> >>>         pm_power_off()
> >>> =20
> >>>> Please LMK if the above is the correct approach so I will send a pro=
per
> >>>> patch or something else shall be fixed.
> >>>=20
> >>> Yes, this is exactly the right approach. The whole sunxi_rsb_shutdown=
()
> >>=20
> >> Don't we need pm_runtime_disable() on shutdown? As IIUC, the controller
> >> might be suspended and we have to resume it to put it in state to acce=
pt
> >> commands later on(in pm_power_off()).
> >=20
> > sunxi_rsb_write() takes care of resuming the controller, so the
> > controller being suspended prior to pm_power_off() is fine.
> > pm_runtime_disable() would actually prevent resuming the controller
> > later in sunxi_rsb_write().
>=20
> I see.
>=20
> >>> function should be removed. When you send a patch, please add a Fixes:
> >>> tag referencing the commit that you bisected to.
> >=20
> > I found a couple of other issues as well, so I'll send out some fixes
> > with you CC'd.
>=20
> Ok, thanks. What about stable kernels, poweroff is broken since
> 843107498f91e57d1d4b22cd8787112726fdaeb4?

All changes must first hit latest development branch. If they are marked wi=
th=20
fixes tag, they get automatically backported in all currently maintained=20
kernels (mostly LTS) if applicable. But this will take a while.

Best regards,
Jernej

>=20
> Regards,
> Ivo
>=20
> > Regards,
> > Samuel




