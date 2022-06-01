Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECA42562
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Jun 2022 15:24:22 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id t5so2689463edc.2
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Jun 2022 08:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S2s/uj8WC49ahrReqiF2/cgFexx1dmbjwYjSSVDIU/o=;
        b=DjueV5cqkCLDw2hnrUIX33XWBicHukWnlU8JpsVLUQV/zDlLzVQKBgbMNSS3+8xeOM
         T+iTK4xdP+7tuFtcpK6DOA67QPRsliVi5mURa/cM1Hzm4EdzPGQ/bFWGRfqJyE5NBLNW
         cnIHg9s1YehEYz2oiwdr3U9LAsy0aA+QM3y+opUMH3mwWpDIsDnPDNPv63yg4/zJx5qz
         T7TfUJ4OWBvAyJqWw0nG36keZ+u12AGDfSpAFYmozpdEDdlFSO93QFOvIe68iBNibIe3
         YexlIZ5Z3gBC8iLu1+RwCX+/0c2G4GLXnpsTy6ipBevt7rGKrvvGoeL1dPo5uZWBEmzj
         PvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S2s/uj8WC49ahrReqiF2/cgFexx1dmbjwYjSSVDIU/o=;
        b=wQxccBmqa2gAG1B6nIhIGn2MzwY4kPSm2ApeZ1QhCoHa84gVb4HuDxLavQPFUADtUh
         Jjjh1Mjd0x/JVUW0JEgLG/75T9j+3ccWwOpnfp2xnDyl3sMTEoKEcZOd0vgRyrD9rreA
         NfQp+gK7gjdUgRYvvqkUgv6gzg8rLNAVOmoZJcJvlSxYPOGSHExmjR1UrluJwyorZXXc
         HK90d1RHex9pWw+3hV1msHKlrFKsTjcO64FCC4Qw4xE5/HgAxPngqTJHkDMuFHll3V6p
         9gzAWMdVWg/Hg2BNfJqHiTfLJYq2FxT+BUrAI8AbYDLj7rxtnuogBSSgFMT2InO2zOqL
         XbRA==
X-Gm-Message-State: AOAM533Yt1XxZOg68Ns/8gn+hZfW4r6KrW1P3Dne6Cwcwq5jI65oufVZ
	ArQBNP0i/nZHD9RPuvBKJhI=
X-Google-Smtp-Source: ABdhPJwDn4fYWychN9HWMd5ASr5v4eS7KmbuP60hlN+FSZkXniYTiTP0CoX3vAPP5IkPA4FBXuQgrg==
X-Received: by 2002:a05:6402:2548:b0:42d:dd95:5bfe with SMTP id l8-20020a056402254800b0042ddd955bfemr205534edb.285.1654097060744;
        Wed, 01 Jun 2022 08:24:20 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id bv15-20020a170906b1cf00b006f4c4330c49sm846072ejb.57.2022.06.01.08.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 08:24:20 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Maxime Ripard <mripard@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: Re: [PATCH 0/3] pinctrl: sunxi: Remove non-existent reset line references
Date: Wed, 01 Jun 2022 17:24:08 +0200
Message-ID: <2828716.e9J7NaK4W3@kista>
In-Reply-To: <48570ec3-8159-11ae-8069-7f001081fd56@sholland.org>
References: <20220531053623.43851-1-samuel@sholland.org> <4400164.LvFx2qVVIh@kista> <48570ec3-8159-11ae-8069-7f001081fd56@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne sreda, 01. junij 2022 ob 06:42:34 CEST je Samuel Holland napisal(a):
> Hi Jernej,
>=20
> On 5/31/22 10:22 AM, Jernej =C5=A0krabec wrote:
> > Dne torek, 31. maj 2022 ob 07:36:20 CEST je Samuel Holland napisal(a):
> >> I assume these properties came from a lack of documentation, and the
> >> very reasonable assumption that where there's a clock gate bit in the
> >> CCU, there's a reset bit. But the pin controllers are special and don't
> >> have a module reset line. The only way to reset the pin controller is =
to
> >> reset the whole VDD_SYS power domain.
> >>
> >> This series is preparation for converting the PRCM MFD and legacy clock
> >> drivers to a CCU clock/reset driver like all of the other Allwinner
> >> SoCs. I don't plan to add reset lines that don't actually exist to the
> >> new CCU driver. So we might as well get rid of the references now.
> >> Technically this breaks devicetree compatibility, since the old drivers
> >> expect the reset. But the CCU conversion will be a compatibility break
> >> anyway, so it's a bit of a moot point.
> >=20
> > If I understand correclty, this would cause only DT forward compatibili=
ty=20
> > issue, which happens now and then anyway. Kernel would still be compati=
ble=20
> > with older DTs, it would just ignore that reset, right?
>=20
> Right, this only prevents older kernels from working with newer devicetre=
es.=20
I
> brought it up because I'm generally trying to minimize how much we do tha=
t.

All good then, this series is:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


