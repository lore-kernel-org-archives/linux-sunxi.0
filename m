Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0BA1D7E26
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Apr 2025 10:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743763034; cv=none; b=qUgu9EvvowDwVeV8yivw9+8de4sEwH313Mzd1qY1/ydSHpH0OEa0D4f6fc7HJ65QxvyhpzyPovjpY63CzAWOA/o0t+UJDaysaQyxSe/usW3WVHGZASD/Gr0Sp4ZXYEBMN86C17W7ybs8k4IB8dRu5fhOFXi+Lm1z7F65uEmm02o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743763034; c=relaxed/simple;
	bh=XpFbSVqvEDgZgwyFUE/9ri5Zlpd76Q27/crMcE9fE2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Otv2rXLR2Pfy6TEAiIQ6BT1j+02GisHFXGcr/2Hl9farWnCKCUWV5/Y83bvEE3gZeAyYNdaOHX+ARuZlfZefxuNgunah6VkuZ5fR2XJw0w6krt5Gw82WhSTJNJQDerBZ6A5HIrva+2ROb2VCr9okOydYB5X3BHqF7XChxfVDXbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QRSrddEa; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QRSrddEa"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7023843e467so18677007b3.2
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Apr 2025 03:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743763030; x=1744367830; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s85N6LbGyDvlbfm+7fjpbjUdhdaXcYheIAW+0EJPQoQ=;
        b=QRSrddEasfKMjhFBrOVTNz/1wpp2vb3yBYDAF/eKPNkJe19VJnzcPxi6whF9/48Z7u
         Bef6vF0WPVDSScM2gjKde5ERZcxpxBroQ0PkN5Rf3Vpu75pzgYaLpsJ+l071w2qJ8dUx
         IXbHDz8t0e8t6iTf/sQqJ6CbGOYtuHyXM6vgrHOEdsTOdJyUC0a5AHJOq7Be1Ij6kjDq
         6yTLNN3OjF6Oimz/hA7emC1Q8WuxnbRf1Bf7Y7+NW8HBG3xtbJmKRU9EmLXK8sD34Weh
         5eH41OPMJ9LeoLerw7CGdNjqC7pXxRoAxoIdIt/NqQdvtdVtXYE/2Tfo/3JctQ4B+ayp
         0LKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743763030; x=1744367830;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s85N6LbGyDvlbfm+7fjpbjUdhdaXcYheIAW+0EJPQoQ=;
        b=vJCO1eWJ73yVEgVAxpaNQSz/LM3Op+GxTWtEf7xr3t/HXb/W2/8WR49yGj/r04P9KC
         FBvl3e1XCQHL+DfbekvgLnnAfQpUoYYRGya4jWV2xxUKv3aARDXjELOXhZr4I6fBXZzB
         U9HEVlr9NzpQJL7OoVLQws5M5TV/8IPNPMBfIVz1QQQiYrYf0U3zWi6pBDj3vS5bQG28
         QYSSwztXVOrO0Juvy8DTzkNPjza/PUWAqgb1sZa3J5DcKFd/tJOfeNLe0Ac41b5gHkgx
         VpcLHDaqHvAGZ5gOeO0l1N7AGs2jq51ST+9u9QJbRsdjt8xnMxW/g+PvQUHnbT3km0mH
         Vxdw==
X-Forwarded-Encrypted: i=1; AJvYcCX1cYytdCvFJTZcWC33jFqAdKkHMDCaG/GD85zL+9ZsKS3xijbAnd90Becyk63c6UN40gbkdzfTisevTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyuRFkOTHdOimWQpEw1sUOKmq+nfBD2ngbHJePCa4Ko9e+Cna33
	j58K5xd5FNLlondYbg6zImGipOmJ7TcJwRQwq5bbYU1DF/p3ees94xvmU+15BI+6Pnaxz7v8bo4
	qTUwMjjcw9YRjyWVchTrsJfchoIcWQSF86ue9LA==
X-Gm-Gg: ASbGnctP9qqc/XmAQB0lqtqj5VpJDNnNrRqDSdKGA3H5k5VbtZdrj6mFjNYV/S+7Uoa
	HN0udOS0/8WRzZfX8erMy5w7W4Us87BssKhu3o2ElDOsDZGotb/CtmEOXOipmygm7r6w8VrFouG
	lhy7A0p6n48zJ24HPkK0evh71NnOc=
X-Google-Smtp-Source: AGHT+IGuuSb2kyra+w2zQGcM5KZ+95CLnIjAJJ+ZAGPbM9ApbFO7sbm4a8zwJjSrMRu7/2gU0ViAtYbSOKTRdRXJ4YY=
X-Received: by 2002:a05:690c:4c11:b0:702:5689:356e with SMTP id
 00721157ae682-703e1546003mr46207307b3.12.1743763029893; Fri, 04 Apr 2025
 03:37:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org> <20250403-dt-cpu-schema-v1-18-076be7171a85@kernel.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-18-076be7171a85@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 4 Apr 2025 12:36:33 +0200
X-Gm-Features: AQ5f1JqCiMQtdQdQn1tCIXwltI0szojsJGdKxwputYjFQK19pJwwJrC7p_ihypo
Message-ID: <CAPDyKFrFRrPVJ_t0JrAE1VTbS02hwr=L-EHtqb7CQiWzB1MnQg@mail.gmail.com>
Subject: Re: [PATCH 18/19] dt-bindings: arm/cpus: Add power-domains constraints
To: "Rob Herring (Arm)" <robh@kernel.org>
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

On Fri, 4 Apr 2025 at 05:06, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> The "power-domains" and "power-domains-names" properties are missing any
> constraints. Add the constraints and drop the generic descriptions.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index 6f74ebfd38df..5bd5822db8af 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -313,19 +313,15 @@ properties:
>      maxItems: 1
>
>    power-domains:
> -    description:
> -      List of phandles and PM domain specifiers, as defined by bindings of the
> -      PM domain provider (see also ../power_domain.txt).
> +    maxItems: 1

There are more than one in some cases. The most is probably three, I think.

>
>    power-domain-names:
>      description:
> -      A list of power domain name strings sorted in the same order as the
> -      power-domains property.
> -
>        For PSCI based platforms, the name corresponding to the index of the PSCI
>        PM domain provider, must be "psci". For SCMI based platforms, the name
>        corresponding to the index of an SCMI performance domain provider, must be
>        "perf".
> +    enum: [ psci, perf, cpr ]
>
>    resets:
>      maxItems: 1
>
> --
> 2.47.2
>
>

Other than above, feel free to add:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
