Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7258931B824
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 18:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761588106; cv=none; b=Grs4i1Ab3VH9a0jNrJov5BwXjYUN8JILz4SDN9V9+HaspIBqwdVIBuCJioJDq5kXbZKStWD5MzQLSmzXMVsOj5vqFyUCJQWEcAxraFz3NcNI9b4lk3Mr9SoVzeLXkMzd2tgLbaXAe0GOuz2MI9ox1GuXsYTzVYPyym+8WQqw2wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761588106; c=relaxed/simple;
	bh=LmXKYxgq5l0W1tOnLSE425z4xENAzicgJcfmXTzUxfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bExx4DvFm8W7EV5FswuXKAp5xjfhUMwkH9dyugiTYtevu/XpXjBMI8NQPxyjabMDOq4gz7Bv2tfr+WBt0wavklo4HOpgawtclXUnXIz1DxWfmmpKVZsYYWHY3SF6gc7mmcsGZ5iYvSW5qSSJY5a+DA1b1mD/JvHVu9nGdFMaI7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=by0Oa5Hv; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="by0Oa5Hv"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so5172276f8f.3
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 11:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761588103; x=1762192903; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aYSYqxdTQx1adiba7waOFSEBjrwgCAPGP21S/4z0WQ=;
        b=by0Oa5HvVK2H5wq0tTn3B10wTv03vRmI7ibxyhwYrXyP/HhUHxcAIhaokd/C7TBWxs
         rFJUKgjMeeUSk7LTJM68snVssUyR+stFkwbnfY5CiPT3SG7XllbJZqGpitVIYnPDWbm0
         ddtRrSEGdkK8yNEYXNHeSilHnCKexo1zqktfM7JJoKxzFZAb0heEpBYA6SeDbx4qTQNU
         EAoPGHn4nB6Kp90/I38ZtOwryB7KWu17ACHmStaApo68v630GjqzLRVtxs+m4FiAIIA+
         ayYF8NiG5H6RAxugu2Lw/bE+6ousP+BI+ySXg9/XkbeeGrV98J+aAWMmpxMiSzL5mJ5B
         3opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761588103; x=1762192903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aYSYqxdTQx1adiba7waOFSEBjrwgCAPGP21S/4z0WQ=;
        b=rd4h+6ct9J4STsYuqZB43CCRLsrl6a3xYgJ3qsnq2MiWHnmA24Hovz7T6jY4y/gKwC
         IEUuhMkTuOTSktKjysCzlfVFHllQy+v6pK7NK+1pnlNzsZE7KGyaCK53m1KKYaH1obDu
         mWlB+dIiYr6OogC16qQGwWNeltIYneZ5WcxGrjX80WHL1C+l4e+zZ2vZy7oTdoSboY9h
         L8FAmNMXx7zUQOkyrcMvsKHP7uOH7VEg8CRFbrCCPzcCz2IAdQnJOo09gXJK8aXRNqt1
         hghFTueRXlOKVdm2q3GG5cYuf+/nyrSvIpirYpm/b+pDyphEWP5G3uUPDXFI4BHP//MW
         fLog==
X-Forwarded-Encrypted: i=1; AJvYcCXXbUMLuyuEC4riA+utYgW+qUt08+/5ZGS4JxvJ8s7weHk7TABxuZzIhQXphIpEjdbys4lyYPvOyhXrlg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5IN9WDWM03v8wbffClZlJlzLcOkvCJD3906+Z5Yn1n34Vef2t
	vy93N/egH/NpKTtvaahCuLIT8mafzqQt28BbcWWAt8rpu/6hwZQP2uNc
X-Gm-Gg: ASbGncvpTTQ885hUj6wbNivnCu8EaOlOY38cj3oqQu+69cbnoorGlx+lmA03TCIX0tg
	4Xgf/qqyO2GPq/lDicJwseRU0GDdSVIsbpCcrgu0yiAIB4uUzVut1D5aM4DnW4kbBi5ghcruMSM
	LvEINCpLLvQI51Iv138ah65n9nIN417MUY4lyGP9zhizxNgyKPbWCIoTj9VA0Byir9gzfItK5yf
	35hYMX+3sXDsYNlmPiASKc8fSQr7epDlmuqSrH03iWUGc1FzpzoBJGRyyKhalv8SJmyfUGNCUq7
	giKripG7He8Yfc9P7xHsC01o2dUzZ6zlMbrYCoV261eBOcuGJThoRxHqVFXsH0Z8pdXqmDtSV/c
	E10jN9drgUaVCGC4gewO2SdFWE9q6QBLQl29ufsyGqKyANn0Otf7b6TcbbzOYqRchyZ8ZFqrq4+
	wFSXYo/RpOwbYjVMAKFbNl5ML9OZxELrV6pvsbQyCK5POWjA9E6KjccTwIRtkHIIFAVH8O
X-Google-Smtp-Source: AGHT+IEqakiIVgvkmH1mzvZg1woizmOdLx0SAbkLPTVvCw4c/LMFkRt84r69g+UhZ/bheKm0gmAdSA==
X-Received: by 2002:a05:6000:25f4:b0:429:a7f1:bdda with SMTP id ffacd0b85a97d-429a7f1bf31mr546028f8f.47.1761588102726;
        Mon, 27 Oct 2025 11:01:42 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b6fsm15648567f8f.1.2025.10.27.11.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 11:01:42 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: iuncuim <iuncuim@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
 Yangtao Li <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v3 1/6] dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
Date: Mon, 27 Oct 2025 19:01:40 +0100
Message-ID: <1935223.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20251026210905.GA2941518-robh@kernel.org>
References:
 <20251025043129.160454-1-iuncuim@gmail.com>
 <20251025043129.160454-2-iuncuim@gmail.com>
 <20251026210905.GA2941518-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Dne nedelja, 26. oktober 2025 ob 22:09:05 Srednjeevropski standardni =C4=8D=
as je Rob Herring napisal(a):
> On Sat, Oct 25, 2025 at 12:31:24PM +0800, iuncuim wrote:
> > From: Mikhail Kalashnikov <iuncuim@gmail.com>
> >=20
> > Add a binding for D1/T113s thermal sensor controller. Add dt-bindings
> > description of the thermal sensors in the A523 processor.
> > The controllers require activation of the additional frequency of the
> > associated gpadc controller, so a new clock property has been added.
> >=20
> > The calibration data is split into two cells that are in different areas
> > of nvmem. Both controllers require access to both memory cell, so a new
> > property nvmem-cells has been added. To maintain backward compatibility,
> > the name of the old cell remains the same and the new nvmem-cell-names =
is
> > called calibration-second-part
> >=20
> > Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> > ---
> >  .../thermal/allwinner,sun8i-a83t-ths.yaml     | 56 ++++++++++++++++++-
> >  1 file changed, 53 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-=
a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a=
83t-ths.yaml
> > index 3e61689f6..b2f750ef2 100644
> > --- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-th=
s.yaml
> > +++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-th=
s.yaml
> > @@ -24,18 +24,23 @@ properties:
> >        - allwinner,sun50i-h5-ths
> >        - allwinner,sun50i-h6-ths
> >        - allwinner,sun50i-h616-ths
> > +      - allwinner,sun55i-a523-ths0
> > +      - allwinner,sun55i-a523-ths1
> > =20
> >    clocks:
> >      minItems: 1
> >      items:
> >        - description: Bus Clock
> >        - description: Module Clock
> > +      - description: GPADC Clock
> > =20
> >    clock-names:
> >      minItems: 1
> > +    maxItems: 2
>=20
> How can the max be both 2 and...
>=20
> >      items:
> >        - const: bus
> >        - const: mod
> > +      - const: gpadc
>=20
> ...3 entries?
>=20

Because old variant uses "bus" and "mod" and new variant uses "bus" and
"gpadc" and none of them uses all 3 entries.

Although, I guess we can simplify and just use "mod" in both cases.

Best regards,
Jernej



