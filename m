Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09363CE496
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Mar 2026 18:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773858029; cv=pass; b=XspLwrkJMdflkVP4VpefpvIfqEPCEy2u+WrkURENQJ8nZEwoaakKLdR1jIytybcqs+I5sy+U31boXx+Go9wLxlszqWxOH/Vny/8aM7KBYChI0mMkPebyq2Dyd0M9osJkEuSxUgXZ+hQ9Gu+vfG1QWRROb8G78PtiZ3K8sCN+ptM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773858029; c=relaxed/simple;
	bh=o2AlAnMddYyM3GRUlR6Czl0IFVIjXXrBXoY3tjJ2NCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oobB32ytZz3c7BYjyIvtIu8QIlbC2/I1wv3nLblhYDYffv2i7pLD6fYfUTPFz9Ia9sDgD7nQqbnAHtjBi6vgyyYkHwHaQ0/Wexd9DUYqykUzZw3xL/ZZ/ftt367uIvdUvDAUVujrWMAYMjMv1OzuRqhHHThG45QMhtLt/n9gqig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gHypWOc9; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gHypWOc9"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a12c310e8aso150342e87.3
        for <linux-sunxi@lists.linux.dev>; Wed, 18 Mar 2026 11:20:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773858026; cv=none;
        d=google.com; s=arc-20240605;
        b=go1gvlE2XFJVIstnua6j1Sw/ZiwkUfdhQ1tKb1Fu7NQJAFd/2QD1AtXv3KLHkXHwNd
         xzbJutQkPYu7CxC1ABlN86nG3m8dnEAPnw5eL5ryOMy0FMEmWJFtPFElxvTTbm4p33Ua
         zTm0GiwawleTnNQib4fyUdo7nLLTFoZ3Ez8loaBlJe/eib7ljKTWIEzoYa9pyMIv6c2b
         HIXPvefQ+tA8qitg2F/qTSSpksPIlnC1CoNEYELeetmWB1clMrEtVyMesO/35dgv4N/G
         LXv9zUNZvvM2dSgE4nBK43n/NR31h7zwYVo5N6udLKs4YhUoO7XKsiRZv0R4RIfQbUdk
         DKfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iQ1x2ihDMnnywua4CVQQdfzwfLUYhJP99revvTgTk0o=;
        fh=eJ1AojcqfK0OXqtNzneKcc1u+j677jEKF1oQs/W3yDY=;
        b=RSalI8jGQM71QojuilqaLRE9IsBlDwliJ8OcpkLctsTGez1sN+aU8N+Y4E+Dp3GzuK
         y3+V0WgIL842rnDIYHAngXJUBZ30gJjgbTfF9ChAoB7UAF0b0vPqZyz5trERPBqT8DFA
         ecJa5lAWR5DaPX1QP4Kn+pAhUuUuZXZY5hshuWm8LTX7MS8KWckJsBs7IdDCqrxSjzmT
         T2egV4OprjZ6R2ieXMophZPeIwkNWJqnT+bOTCAKc9VxPm+oGXKYHCmlyzokQ8SAJVvB
         RIy15eCRNIF+zrhYE7YotvM3FHR+XEqZZB7ZdrhKeMY362sM1pmt+GA/kRiDNExSEjy2
         qtkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773858026; x=1774462826; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iQ1x2ihDMnnywua4CVQQdfzwfLUYhJP99revvTgTk0o=;
        b=gHypWOc9U1TSbg2OIuMqMg5Ic/IlmJWyjfPTCxtTZDqnayavVpIqF5wDTbU89jbg59
         fHe3T8yTDZoR+t0KKa793ol2w3OUTL+PDAK0YPioQGdwI612jAEmHeFx+ZHhsy23ltT9
         t99n/AaWd0ulPGj4fGAFUwLD8mDGLQZJgSas+GN9FRIykju+KSUaqTyS2rVpVdgntGo+
         kt6Rei653vSecLvdDo5pMoiZh2lvDCNd8oKUf9jqOD2d408NjQG7h8MTWhVR8Y8hSzKM
         fe2+lrHN6hhVKeycwjftL9tzeVynYZxvN+JiRP0BJxeTZjW03YQOrw/zx0KofN67afFH
         D5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773858026; x=1774462826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQ1x2ihDMnnywua4CVQQdfzwfLUYhJP99revvTgTk0o=;
        b=ntL5TaunZms+yYJsq/tTxcdnAJsguIaaw5hnWA7akSpvLIcalmSXCWozCIYRZvFBof
         9SjH9+N0HFPw6alRk2NDR72D8YtlYJbYaSYPj3jL6YafIt+pT3vdDWlMynOoGKOrIUok
         PboKmJBcRtEXVdypbcPutO5G8jaiZOqHGcAb7BHN3Gmo98sCkJPeIQYNIWybad9lNBAW
         qg9HcJmGdBfBb9KwH8Ud+NiNSCEDeEwwnAs7Iqied5MJrzRfX/ID9c29G5DUH4wa/jiJ
         F3ffBdFjZ0t/AQoNs3VnIunQHf8A0y93qPL1EZZL0ZefUhpsa/C6O4PDN1GRNx7boitR
         Z9mw==
X-Forwarded-Encrypted: i=1; AJvYcCUK3aBG+cobc1qmWGzh6n9lOfvOym5fH1V1kBum75srEk/3qVxKGCnxCtF36M79G0LHvlHPbNpuEdi9sA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxpn3+UZenpQeI8hJ0fUehlvy3rvXLseMTdegCjh5CTWR+iE6ev
	FTvqPnMOVIHubsyid4LASo62hg61g2KmAw0r01mv/KkOnxxV3P4ZKVAuDFQrd/4uJJ6wH55kzjK
	P2s0cDfgDgg3KDWLJlBfLDpPteiTsuR7gSKh/cq/mUA==
X-Gm-Gg: ATEYQzxXA5pXNWNHmEAF97Ip/l7a4J+EVo2Gt/Uo3QQQxjjdBseth9YeOlOssbR3fg+
	373zSYuJJeIWUFgUiBDf9/F93GdGq7w8VIIoBzwykKv7AWHnup1l2D7HQzNUOvOzhXkOglmVP/I
	y4kzs25l5v1bA1aoPMlSWShAzCvhOcziZcxVTiYb9uPKFbTwMBRT8QfBbzl4bH2D/fTbm7mcz1K
	DdEqcgcZQQEsPHk6pHh/usi63Y0Fp7aSfIaS4k2xujP4jPCqCd2FR/i4qDGmxsDCtF1JeeDQFbt
	cDAahqYY
X-Received: by 2002:a05:6512:24c5:20b0:5a1:37cd:7f10 with SMTP id
 2adb3069b0e04-5a2795903dcmr1158473e87.10.1773858026058; Wed, 18 Mar 2026
 11:20:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260305-b4-pck600-a733-v2-0-ba6bbed7d253@gmail.com>
In-Reply-To: <20260305-b4-pck600-a733-v2-0-ba6bbed7d253@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Mar 2026 19:19:50 +0100
X-Gm-Features: AaiRm50uzOde_q8t8Y3YJeSNhx4Hb7KPrmeaUA5JiLmoBH5vpeZt6VfvtJkYLuo
Message-ID: <CAPDyKFoo7HXuS1OQtt6Ku4O23pvFOvaG3g1_N7SPV8uB+ckt-Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] allwinner: a733: Add A733 PCK600 Power Domain
 Controller Support
To: Yuanshen Cao <alex.caoys@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Mar 2026 at 04:34, Yuanshen Cao <alex.caoys@gmail.com> wrote:
>
> Hi everyone,
>
> This series is to introduce Allwinner A733 PCK600 Power Domain
> Controller.
>
> Allwinner A733 has this one power domain controller, PCK600, which
> shares the same BSP drivers according to the package provided by
> Radxa[1]. Unlike A523, A733 does not require the resets, and it also has
> different delay values. Apart from these, driver wise, everything else
> is the same.
>
> Add support for A733 power domain controller by making resets optional
> on sun55i-pck600 driver, adding A733 sunxi_pck600_desc and dt-bindings
> definitions.
> Tested on Radxa Cubie A7Z.
>
> [1] https://github.com/radxa/allwinner-bsp
>
> Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
> ---
> Changes in v2:
> - Fit the pd_names into two lines
> - Link to v1: https://lore.kernel.org/r/20260304-b4-pck600-a733-v1-0-2f54efdb8cc2@gmail.com
>
> ---
> Yuanshen Cao (2):
>       dt-bindings: power: Add Support for Allwinner A733 PCK600 Power Domain Controller
>       pmdomain: sunxi: Add support for A733 to Allwinner PCK600 driver
>
>  .../bindings/power/allwinner,sun20i-d1-ppu.yaml    | 17 ++++++++++-
>  drivers/pmdomain/sunxi/sun55i-pck600.c             | 35 +++++++++++++++++++---
>  .../power/allwinner,sun60i-a733-pck-600.h          | 18 +++++++++++
>  3 files changed, 65 insertions(+), 5 deletions(-)
> ---
> base-commit: 0031c06807cfa8aa51a759ff8aa09e1aa48149af
> change-id: 20260304-b4-pck600-a733-1790e0e48d49
>
> Best regards,
> --
> Yuanshen Cao <alex.caoys@gmail.com>
>

The series applied for next, thanks!

Kind regards
Uffe
