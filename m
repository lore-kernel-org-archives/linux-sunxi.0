Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B001E26AA9A
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Apr 2025 12:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114667; cv=none; b=P8Yaih2xMxz8wWBkTOIx5tUmWY+6gLIFsPpFMs5zrCbxPVdkF2+qTg4gemSZujNsFPp/rkta6uaaGZWJkXLqWyzMaSeepHRik0pEcilhZEf/blTWMZNeW7bz9XvFnWVWcT6rekePRPPMPdv5jWtRIQGOEcfsvJ6AAminsFvgrzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114667; c=relaxed/simple;
	bh=zrTv3Igv/b40jizFm6EQbXgK0TIclob8WTp61FIgQrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SQhjYgz08s/6NJTaq9ziL0piaBWGRblhPtTDWyipLKCJEKiebqX1/ZHsRkYyaDc9kYbqgTOKSNvmLX7j0iP5Y2Nz8rDvWGMkYF9SgjI18JjHfvuNFVHJOP+MJxzdzPP0m8GCY43uPKUFoL9dOaIz0mahFzJNZaBQt7UzA7OqFtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QEGx/DgW; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QEGx/DgW"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6feab7c5f96so52625317b3.3
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Apr 2025 05:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744114663; x=1744719463; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgQfANebtdqnI5c6U+NPo92x9wLAySpUrYEpuKhqRpM=;
        b=QEGx/DgWq/A1ZGoe6kie7fK+witqNnSFLKrF4Nh+8fE4EUKpTk6bdf156OBA1mzJp5
         rQNRh4ZtjCufwXJMG2pbhqhWW82MzYtJGzAn2XgHo98Qne5mWGe8lacJJQ3lxM8Nxj3s
         PKVFy0wldxgzxq7RwYHTSzKfPZ8oK286f+eRxtUqP4N3id0US/TLXZ+k+Xo1whMCmnd2
         WWKfgwbMj3cbgiDBQ3lMPaqusbPDabPNjK5qRz8CyGHhMdFbF6PWTHaTYHIyYZZfH8VW
         sYhD0UJzHfpUziZUCEaBhaD6ovmULci5LDtVi9yobFrhU+8enL1ne9SzyIPcHjgAVoh0
         /e2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744114663; x=1744719463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgQfANebtdqnI5c6U+NPo92x9wLAySpUrYEpuKhqRpM=;
        b=dO+DZ442va/2zgfMfpzTNOc5TsGLxFLz0iWttKmYdG61mGS4h0l/et5HyF6/xp1sEc
         9/6m8B88No5IB05Y5BWBUbigIbgwcWYeFv9kWiQTQnBULSHb0BRp8zrxJPyEcVpDQHGt
         t7rX1jWbWGkL0pMXxSOZTWMszpm6JhtW/zEvHQTdQI5Lm73+aurXeu/xF4+9NvmyiwWY
         XWV9hhIaQn/+3LzBcSUDSKcndclOLqFQhDUfHSfAfOxZ8VmGkAAjfK+joufP2tUF5hbc
         SvhYH/kjK66oR7t79d3XC6K5ZY2ebhcUHegG399Arjg6AGNE9EtTIV0VwOy6/qaLa/ZW
         b+cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWReeqz5CQZmrTqGsxb1tiRAFcefs3ZtUKosqTXAnPWiST/XNbZsfFA45antITsPTOFrbdzR/TbqeiTIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMNsEI+NrBpR37P15HdwsMn6hvYfmG1/hXFz4H3U+/A1OSNNHS
	EpumvERbTCfPHb1wDMAHU3hKj5T8nN5iy0EmoPD7LhvsOuYqlhIWXrxtyXwRm6+oBT05Nxuq7nt
	rIwi5HYhx4ktbPtd/PdNFnGJLwhIdeyVtRQod6g==
X-Gm-Gg: ASbGncufZY7U0KW67tDcWLL5d3a5KsEvqlOhGDjYzq1k1i/dt4fVfvxR208xHENNbVz
	GizRs7SjcmtzL0+Tx2B18F1XmajyiBvicvnV+IDKeJZnyZNpf+tdIp2gHIia1+Ia9X8XJQth/m1
	yGtEGM1XzXSgsdyOdL15Nt+Gck28I=
X-Google-Smtp-Source: AGHT+IE9ys53OzSUdrwDVzPrCpJ3j0rVw9UiRXdXpPHOiJneCGTZtJTMxzg8Xq2rdR9GYtx0ZTNP05CFJHjGpzcayc8=
X-Received: by 2002:a05:690c:67c4:b0:6ff:28b2:50e1 with SMTP id
 00721157ae682-703e14ffd3dmr297170407b3.2.1744114663553; Tue, 08 Apr 2025
 05:17:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-18-076be7171a85@kernel.org> <CAPDyKFrFRrPVJ_t0JrAE1VTbS02hwr=L-EHtqb7CQiWzB1MnQg@mail.gmail.com>
 <CAL_JsqKygxhcQ=PZW84sfiW7BVXKF839vfNyxS9GwAXuqmN=8g@mail.gmail.com>
 <CAPDyKFoHQdHED0hHUR7VKin0XG6SVnYXuvPjB=Xe+1o2hpiPJA@mail.gmail.com> <CAL_Jsq+Oa7MvVO7Y-RG+qrY2e86B_q0XGq1LWoy5Mq+G72ZHzQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+Oa7MvVO7Y-RG+qrY2e86B_q0XGq1LWoy5Mq+G72ZHzQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Apr 2025 14:17:07 +0200
X-Gm-Features: ATxdqUE7frfhfuxoKUlf3DinAq4W783EiniruawsYcgTKF9-ms73Ag05S_dZWTY
Message-ID: <CAPDyKFoKdj-Y4-dCwYRG7TLdS1HcSH=i9EN-b9Cpyo50kMmC5Q@mail.gmail.com>
Subject: Re: [PATCH 18/19] dt-bindings: arm/cpus: Add power-domains constraints
To: Rob Herring <robh@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
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

+ Stephan Gerhold

On Mon, 7 Apr 2025 at 18:50, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Apr 7, 2025 at 11:23=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.o=
rg> wrote:
> >
> > On Fri, 4 Apr 2025 at 15:09, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Fri, Apr 4, 2025 at 5:37=E2=80=AFAM Ulf Hansson <ulf.hansson@linar=
o.org> wrote:
> > > >
> > > > On Fri, 4 Apr 2025 at 05:06, Rob Herring (Arm) <robh@kernel.org> wr=
ote:
> > > > >
> > > > > The "power-domains" and "power-domains-names" properties are miss=
ing any
> > > > > constraints. Add the constraints and drop the generic description=
s.
> > > > >
> > > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/arm/cpus.yaml | 8 ++------
> > > > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Do=
cumentation/devicetree/bindings/arm/cpus.yaml
> > > > > index 6f74ebfd38df..5bd5822db8af 100644
> > > > > --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> > > > > +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> > > > > @@ -313,19 +313,15 @@ properties:
> > > > >      maxItems: 1
> > > > >
> > > > >    power-domains:
> > > > > -    description:
> > > > > -      List of phandles and PM domain specifiers, as defined by b=
indings of the
> > > > > -      PM domain provider (see also ../power_domain.txt).
> > > > > +    maxItems: 1
> > > >
> > > > There are more than one in some cases. The most is probably three, =
I think.
> > >
> > > Unless I missed it, testing says otherwise. What would the names be i=
f
> > > more than 1 entry?
> >
> > "psci", "perf", "cpr", etc
> >
> > The "psci" is always for CPU power management, the other is for CPU
> > performance scaling (which may be more than one power-domain in some
> > cases).
> >
> > I would suggest changing this to "maxItems: 3". That should be
> > sufficient I think.
>
> Again, my testing says 1 is enough. So where is a .dts file with 3 or 2?

Right! I assume those with 3 or 2 just haven't made it upstream yet,
but sure they are cases. If you prefer to update the binding later,
that's fine by me, but I just wanted to avoid unnecessary churns for
you.

For example, msm8916 seems to be one case that already uses "psci",
but requires an additional two power-domains for performance-scaling.
At least according to earlier discussions [1] with Stephan Gerhold.

Moreover, it's perfectly fine to also describe CPU's idle-states by
using the power-domains/domain-idle-states DT bindings, according to
the bindings for PSCI [2] (no matter of PSCI OSI/PC mode). In other
words, for all those that only have a "perf" or "cpr" power-domain
today (or whatever name is used for the performance-scaling domain),
those could easily add a "psci" power-domain too, depending on how
they choose to describe things in DT.

Kind regards
Uffe

[1]
https://lore.kernel.org/all/ZRcC2IRRv6dtKY65@gerhold.net/
[2]
Documentation/devicetree/bindings/arm/psci.yaml
