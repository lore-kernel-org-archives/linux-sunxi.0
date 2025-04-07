Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85CF20DD50
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Apr 2025 16:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744043023; cv=none; b=p7F7RxrRg4vgpamLr4H9NDEHo6nNySxd5xBAd+9A6hZJGb+FmlrWyIl9TEjKUyeprUELysT6oMdGGhEKNe6brTFC3Fo6OtKTfLow70FypjQGveJDU62ld+3KmvOVzEE7jTICuzJc3pGWQ+o07zf0Psk4iPs8xF29f6O2lHM1Cfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744043023; c=relaxed/simple;
	bh=xK3zdpugWS3t3I7XRyKqSkoBwBn9VFb6ajzBDZzEiQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mn6nr19BUtuK4i0w+82U9zPN2H3OC1BtQJSF7eHV9u9rzVwGZqvgfpeNMfQE7u4Z9KRtCZKuwVT/DOXpe8vqq5ijl9ljQVHb9zzbYTLDHArYeJsFSoxdc2EwctOfbHLzv0mKGK4EiyCuCt/DdBdcQvCKX1aGpLkGdx4f2NRmnl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tYNtJr11; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tYNtJr11"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6f74b78df93so55914647b3.0
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Apr 2025 09:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744043019; x=1744647819; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdLI4xLdMKIk5+aH2ShC4YXmxar43nmBcEhmGz0osts=;
        b=tYNtJr11xsIPMgLCiobDug2hQge3FKQp/JDa+vC2uwp9+29BIcgoS3jEdMTIJZo4l5
         dfPGeW9yu7+g5wlER0zsu9Nm8f1wfI/Sing4c1RCbEpgUqMIXAxbfK59Z5iQmYQvnQkI
         w6dHPBI6a3p0JAAejIg4xxfSIQu9DeuuhluN7m1Amc9tgNt16xPTmNSkKvg0a5ks9qVV
         kikYF3ZReULHsG8d9nMaqz08lbK6aqbE3oVqrdONaLRLRCdTlrZvUWs1NpSREvpMVofz
         JXsvdTPtucKrFToFF/M9BpaiigFdX/4amkwGjQPzMUaBN2SogcmeQX7NRGtQjY5We/4K
         3K0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744043019; x=1744647819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdLI4xLdMKIk5+aH2ShC4YXmxar43nmBcEhmGz0osts=;
        b=QAANHixrfESJp9/nbfLAZ/7gHPyGCyhC5oGxtUdTb8iKkkUs20Sg4Vb9ImNKtizkzj
         RaN5SOyKrznHRFcKIvEY2HGtfYDrdEKkgWq7iM+SXISiYoTBWnwp9bCxR9xRkKN9nvLh
         H33aNtxvQVIgCrirjLT/BVUozhCBrmhDFubfWCkMv62BEw9FnvG6a0CZqQ9QVrXK46T6
         K/NtWON+uanArT8jIFW1a6uATh5Ih5/KPTc/Qsr0C0ZYlYPBsGyuyirvkeDhiN46RLyg
         cgCdZu3Rn2IxNmDf99H6maXYqLKJh9PzKyojwnlDcW9MoBzQxTm7gUfF2qBu5Q3Y3y+o
         5TBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEPvUwdNPcZ2v6mkRHxmG+LWgaxYHM9H8+7q6dYKR+/4ia9ZpiIqrt1KZT+CBZLrWDGt1sJe4hBRqY7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRT3o7QhwVJVmxknVCxsWNPVr3eh5SiVRJMuJLWBeC9/A20s5N
	AmxDabMPl5wW7K1zipFqFRtSkz6rG+XjU6kXNrsao46KzutZFlqmsVdWl6m0IqeKr+YDq4e4t1p
	jN0tRFCpukkhefk0k1jioeYdap9QUu124aYq0Fg==
X-Gm-Gg: ASbGncuClgbJo6O9Xd6rXzC4L/OLsK2Vp+dtvZQ1riXSJBcYu/pRjfKqOvsoKd+z/Z2
	rHeO94fan/5BlhScbeGe+gRtJmjNfsscBhWGtk4ZLmgda5HJDgbkZy7XDyBGHlbjEljxo2f0mJN
	JS5V6FFgp/Eo62H0mThBWvJAlWMtA=
X-Google-Smtp-Source: AGHT+IEvCyoULSP8GtunUj7XByE2xLEZApny/EX5BI9r2HNnS7M/lF2l9CVPZCF8J2YyYgCczjPfSOPcnUbnSfgNgFc=
X-Received: by 2002:a05:690c:6481:b0:702:627c:94ec with SMTP id
 00721157ae682-703e3357786mr243332367b3.35.1744043018812; Mon, 07 Apr 2025
 09:23:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-18-076be7171a85@kernel.org> <CAPDyKFrFRrPVJ_t0JrAE1VTbS02hwr=L-EHtqb7CQiWzB1MnQg@mail.gmail.com>
 <CAL_JsqKygxhcQ=PZW84sfiW7BVXKF839vfNyxS9GwAXuqmN=8g@mail.gmail.com>
In-Reply-To: <CAL_JsqKygxhcQ=PZW84sfiW7BVXKF839vfNyxS9GwAXuqmN=8g@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Apr 2025 18:23:02 +0200
X-Gm-Features: ATxdqUG4iYRDoX1uSepWjxp_lc67AACZn0NdIUwL4_627lSdYio0uG7PYHZfOMA
Message-ID: <CAPDyKFoHQdHED0hHUR7VKin0XG6SVnYXuvPjB=Xe+1o2hpiPJA@mail.gmail.com>
Subject: Re: [PATCH 18/19] dt-bindings: arm/cpus: Add power-domains constraints
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
	Conor Dooley <conor@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 4 Apr 2025 at 15:09, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Apr 4, 2025 at 5:37=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.or=
g> wrote:
> >
> > On Fri, 4 Apr 2025 at 05:06, Rob Herring (Arm) <robh@kernel.org> wrote:
> > >
> > > The "power-domains" and "power-domains-names" properties are missing =
any
> > > constraints. Add the constraints and drop the generic descriptions.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/arm/cpus.yaml | 8 ++------
> > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Docume=
ntation/devicetree/bindings/arm/cpus.yaml
> > > index 6f74ebfd38df..5bd5822db8af 100644
> > > --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> > > @@ -313,19 +313,15 @@ properties:
> > >      maxItems: 1
> > >
> > >    power-domains:
> > > -    description:
> > > -      List of phandles and PM domain specifiers, as defined by bindi=
ngs of the
> > > -      PM domain provider (see also ../power_domain.txt).
> > > +    maxItems: 1
> >
> > There are more than one in some cases. The most is probably three, I th=
ink.
>
> Unless I missed it, testing says otherwise. What would the names be if
> more than 1 entry?

"psci", "perf", "cpr", etc

The "psci" is always for CPU power management, the other is for CPU
performance scaling (which may be more than one power-domain in some
cases).

I would suggest changing this to "maxItems: 3". That should be
sufficient I think.

Kind regards
Uffe
