Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FF812E45
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Nov 2023 07:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1cfc34b6890so17593345ad.1
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Nov 2023 23:51:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701157863; x=1701762663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nZTbUDFfHVLDwriMDujX8TewNkfqrMRUeFStaGwrzB8=;
        b=m4xZ7ZfJ/ifY1rvsWaXSoaa7UMtXaEZIti3uC4JWhV4fGmV1+WkWKruoBEIDNOoIXj
         hbiE7Yj8KE4H0OXE2uptv4xIvuWuTQKnJvRXCsdTet0hGvEq+7pHmaOEO9d0fnCSwWPf
         We8SrP7PNuFHnm1NWPiohAA2GkOGpt9SRk2BWaCVmQgb62g8v8moFosYLpYEnj3npjTZ
         UlLv63tcZd3p8w9SrmcINhpVAj2pp8PRyXhL5kAxsGQAdXREGIFVAoS2ReBzknrSBlx7
         pC4oRnMFhItpEqLNJt/agTPaWlPTXJazjDfJLp/Q16NqyFXsf8qGw0VDsgnmL/lipIbt
         yBiQ==
X-Gm-Message-State: AOJu0YzSG6qCvq1Kjb6H2zqTDnR6x6TkcRvF4KQGGk9EeZir1I/O/aWf
	sFpCyez3lRwjC48sVa//BYOGUYskNCXL4A==
X-Google-Smtp-Source: AGHT+IGVU5hVe0fb4hfcv0pmSepzsPSA7zG6RKUdHMne1iMLKZ62AeyYD8sR5x3nKR7UQXEQqMU8nw==
X-Received: by 2002:a17:902:ec92:b0:1cf:bf7b:adf2 with SMTP id x18-20020a170902ec9200b001cfbf7badf2mr12270314plg.32.1701157863231;
        Mon, 27 Nov 2023 23:51:03 -0800 (PST)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com. [209.85.215.180])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902e9cc00b001cfb4d36eb1sm5888389plk.215.2023.11.27.23.51.02
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 23:51:02 -0800 (PST)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5c1acc1fa98so4506665a12.0
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Nov 2023 23:51:02 -0800 (PST)
X-Received: by 2002:a17:90a:ca08:b0:283:967c:4e6 with SMTP id
 x8-20020a17090aca0800b00283967c04e6mr25448690pjt.12.1701157862365; Mon, 27
 Nov 2023 23:51:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231128005849.19044-1-andre.przywara@arm.com>
 <20231128005849.19044-5-andre.przywara@arm.com> <ddceb30f-1778-4312-af91-97813fe3c6fb@linaro.org>
In-Reply-To: <ddceb30f-1778-4312-af91-97813fe3c6fb@linaro.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 28 Nov 2023 15:50:51 +0800
X-Gmail-Original-Message-ID: <CAGb2v66YpYBS78C7H-O3zef2NTs+7=ec3A7jrZ+DxjYEyBmWxQ@mail.gmail.com>
Message-ID: <CAGb2v66YpYBS78C7H-O3zef2NTs+7=ec3A7jrZ+DxjYEyBmWxQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] thermal: sun8i: add syscon register access code
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Vasily Khoruzhick <anarsoul@gmail.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Martin Botka <martin.botka@somainline.org>, Bob McChesney <bob@electricworry.net>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 3:43=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/11/2023 01:58, Andre Przywara wrote:
> >
> > +static struct regmap *sun8i_ths_get_syscon_regmap(struct device_node *=
node)
> > +{
> > +     struct device_node *syscon_node;
> > +     struct platform_device *syscon_pdev;
> > +     struct regmap *regmap =3D NULL;
> > +
> > +     syscon_node =3D of_parse_phandle(node, "syscon", 0);
>
> Nope. For the 100th time, this cannot be generic.
>
> > +     if (!syscon_node)
> > +             return ERR_PTR(-ENODEV);
> > +
> > +     syscon_pdev =3D of_find_device_by_node(syscon_node);
> > +     if (!syscon_pdev) {
> > +             /* platform device might not be probed yet */
> > +             regmap =3D ERR_PTR(-EPROBE_DEFER);
> > +             goto out_put_node;
> > +     }
> > +
> > +     /* If no regmap is found then the other device driver is at fault=
 */
> > +     regmap =3D dev_get_regmap(&syscon_pdev->dev, NULL);
> > +     if (!regmap)
> > +             regmap =3D ERR_PTR(-EINVAL);
>
> Aren't you open-coding existing API to get regmap from syscon?

Not really. This is to get a regmap exported by the device. Syscon's regmap
is not tied to the device at all.

With this scheme a device to could export just enough registers for the
consumer to use, instead of the whole address range.

We do this in the R40 clock controller as well, which has some bits that
tweak the ethernet controllers RGMII delay...


ChenYu
